var indice = 0;
var store;

//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function () {
    Ext.util.Cookies.set('cookieEditarConcepto', 'Nuevo');
    window.parent.App.wEmergente.load('FormaConcepto2.aspx');
    window.parent.App.wEmergente.setHeight(301.5);
    window.parent.App.wEmergente.setWidth(670);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Nuevo concepto');
    window.parent.App.wEmergente.show();
};

//Acciones al hacer clic en un registro
var gpConceptos_ItemClick = function (gridview, registro, gvhtml, index) {
    App.imgbtnEditar.setDisabled(false);
    App.imgbtnBorrar.setDisabled(false);
    indice = index;
};

//Evento de click del botón Editar
var imgbtnEditar_Click = function () {
    Ext.util.Cookies.set('cookieEditarConcepto', App.gpConceptos.getSelectionModel().getSelection()[0].get('ID'));
    window.parent.App.wEmergente.load('FormaConcepto2.aspx');
    window.parent.App.wEmergente.setHeight(301.5);
    window.parent.App.wEmergente.setWidth(670);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Editar concepto ' + Ext.util.Cookies.get('cookieEditarConcepto'));
    window.parent.App.wEmergente.show();
};

//Para el botón de eliminar, Eliminar un registro
var imgbtnBorrar_Click = function () {
    var identificador = App.gpConceptos.getSelectionModel().getSelection()[0].get('ID');
    var indice = App.gpConceptos.getStore().find('ID', identificador);
    var descripcion = App.sConceptos.getAt(indice).get('Descripcion');
    App.direct.EliminarConcepto(identificador);
    App.gpConceptos.getStore().removeAt(indice);
    Ext.net.Notification.show({
        iconCls: 'icon-delete',
        pinEvent: 'click',
        header: true,
        width: 350,
        html: '<p class="deletePop">ID: ' + identificador + '</p><p class="deletePop">Descripcion: ' + descripcion + '</p>',
        title: 'Eliminar registro'
    });
    App.gpConceptos.getSelectionModel().deselectAll();
    App.imgbtnEditar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
};

//Hacer la busqueda de información
var txtBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sConceptos.clearFilter();
    App.sConceptos.filter([{ filterFn: function (item) {
        if (item.get('ID').toUpperCase().indexOf(newValue.toUpperCase()) > -1 || item.get('Descripcion').toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
    App.gpConceptos.getSelectionModel().deselectAll();
    App.imgbtnEditar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
};

//Cambio en los datos del tablero
var sConceptos_DataChanged = function () {
    if (App.sConceptos.getCount() > 1 || App.sConceptos.getCount() == 0) {
        App.sbConceptos.setText(App.sConceptos.getCount() + ' ' + 'CONCEPTOS');
    }
    else {
        App.sbConceptos.setText(App.sConceptos.getCount() + ' ' + 'CONCEPTO');
    }

    //Resize column Description when records are 11
    if (App.sConceptos.getCount() > 10) {
        App.gpConceptos.columns[3].setWidth(280);
    }
    else {
        App.gpConceptos.columns[3].setWidth(300);
    }
};

//Asignar la descripción de la categoria a esta columna
var cCategoria_Renderer = function (valor, columna, registro) {
    if (valor.length != 0) {
        var categoria = registro.get('RCategoria');
        return categoria.Descripcion;
    }
};

//Asignar la descripción de la subcategoria a esta columna
var cSubcategoria_Renderer = function (valor, columna, registro) {
    if (valor.length != 0) {
        var subcategoria = registro.get('RSubCategoria');
        return subcategoria.Descripcion;
    }
};

//Evento que ocurre al dar clic en imgbtnGuardar
var imgbtnGuardar_Click_Success = function () {
    window.parent.App.wEmergente.hide();
    window.parent.App.pCentro.getBody().App.sConceptos.reload();
};

//Si hay un erro por el Orden repetido lanza esta función
var imgbtnGuardar_Click_Success_Repetido = function () {
    App.nfOrden.focus(true);
};

//Evento lanzado al cargar el store de la sucursal
var sConcepto_Load = function () {
    App.direct.sConcepto_Load();
    store = window.parent.App.pCentro.getBody().App.sConceptos;
};

//Evento lanzado al agregar un registro al store
var sConcepto_Add = function (concepto, registro) {
    App.txtfID.setValue(registro[0].get('ID'));
    App.cmbModulo.setValue(registro[0].get('Modulo'));
    App.nfOrden.setValue(registro[0].get('Orden'));
    App.txtfDescripcion.setValue(registro[0].get('Descripcion'));
    App.cmbCategoria.setValue(registro[0].get('Categoria'));
    App.cmbSubCategoria.setValue(registro[0].get('SubCategoria'));
    App.dfFechaAlta.setValue(registro[0].get('FechaAlta'));
    App.cmbEstatus.setValue(registro[0].get('Estatus'));
    App.cmbEstatus.setDisabled(false);
};

//Evento al cargar el store de SubCategorias
var sSubCategorias_Load = function () {
    if (App.sConcepto.getAt(0) != undefined) {
        App.cmbSubCategoria.setValue(App.sConcepto.getAt(0).get('SubCategoria'));
    }
};

//Evento que se lanza al quitar el enfoque del control
var nfOrden_Blur = function () {
    //1. Obtener el store de Conceptos, Concepto y el ID del concepto
    var storeForma = App.sConcepto;
    var id = Ext.util.Cookies.get('cookieEditarConcepto');

    //2. Buscar si el número de orden es repetido
    if (store.findBy(function (record) {
        if (id != 'Nuevo' && storeForma.getAt(0).get('ID') == record.data.ID) {
            return;
        }
        if (App.nfOrden.getValue() == record.data.Orden) {
            return record;
        }
    }) != -1) {
        Ext.Msg.show({
            title: 'Error',
            msg: 'El número de orden esta repetido',
            buttons: Ext.Msg.OK,
            icon: Ext.Msg.WARNING,
            fn: function (btn) {
                if (btn === 'ok') {
                    App.nfOrden.focus(true);
                }
            }
        });
    }
};