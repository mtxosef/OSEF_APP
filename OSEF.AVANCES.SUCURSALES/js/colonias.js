var indice = 0;
var store;

//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function () {
    Ext.util.Cookies.set('cookieEditarColonia', 'Nuevo');
    window.parent.App.wEmergente.load('FormaColonia.aspx');
    window.parent.App.wEmergente.setHeight(280);
    window.parent.App.wEmergente.setWidth(470);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Nuevo colonias');
    window.parent.App.wEmergente.show();
};

//Evento de click del botón Editar
var imgbtnEditar_Click = function () {
    Ext.util.Cookies.set('cookieEditarColonia', App.gpColonias.getSelectionModel().getSelection()[0].get('ID'));
    window.parent.App.wEmergente.load('FormaColonia.aspx');
    window.parent.App.wEmergente.setHeight(280);
    window.parent.App.wEmergente.setWidth(470);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Editar colonia ' + Ext.util.Cookies.get('cookieEditarColonia'));
    window.parent.App.wEmergente.show();
};

//Para el botón de eliminar, Eliminar un registro
var imgbtnBorrar_Click_Success = function (response, result) {
    if (result.extraParamsResponse.existe) {
        Ext.Msg.show({
            id: 'msgColonias',
            title: 'Advertencia Colonia',
            msg: 'La colonia esta siendo utilizada en un registro',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.WARNING
        });
    }
    else {
        var identificador = App.gpColonias.getSelectionModel().getSelection()[0].get('ID');
        var nombre = App.gpColonias.getSelectionModel().getSelection()[0].get('Descripcion');
   
        App.gpColonias.getStore().removeAt(indice);
        Ext.net.Notification.show({
            iconCls: 'icon-delete',
            pinEvent: 'click',
            header: true,
            width: 350,
            html: '<p class="deletePop">ID: ' + identificador + '</p><p class="deletePop">Descripción: ' + nombre + '</p>',
            title: 'Eliminar registro'
        });
        App.gpColonias.getSelectionModel().deselectAll();
        App.imgbtnEditar.setDisabled(true);
        App.imgbtnBorrar.setDisabled(true);

    }
};


//Evento que ocurre al dar clic en imgbtnGuardar
var imgbtnGuardar_Click_Success = function () {
    window.parent.App.wEmergente.hide();
    window.parent.App.pCentro.getBody().App.sColonias.reload();
};


//Asignar la descripción de la colonia a esta columna
var cEstado_Renderer = function (valor, columna, registro) {
    if (valor.length != 0) {
        var Estado = registro.get('REstado');
        return Estado.Descripcion;
    }
};

//Asignar la descripción de la colonia a esta columna
var cMunicipio_Renderer = function (valor, columna, registro) {
    if (valor.length != 0) {
        var Municipio = registro.get('RMunicipio');
        return Municipio.Descripcion;
    }
};

//Acciones al hacer clic en un registro
var gpColonias_ItemClick = function (gridview, registro, gvhtml, index) {
    App.imgbtnEditar.setDisabled(false);
    App.imgbtnBorrar.setDisabled(false);
    indice = index;
};

//Cambio en los datos del tablero
var sColonias_DataChanged = function () {
    if (App.sColonias.getCount() > 1 || App.sColonias.getCount() == 0) {
        App.sbColonias.setText(App.sColonias.getCount() + ' ' + 'COLONIAS');
    }
    else {
        App.sbColonias.setText(App.sColonias.getCount() + ' ' + 'COLONIAS');
    }

    //Resize column Description when records are 11
    if (App.sColonias.getCount() > 10) {
        App.gpColonias.columns[3].setWidth(280);
    }
    else {
        App.gpColonias.columns[3].setWidth(300);
    }
};

//Hacer la busqueda de información
var txtBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sColonias.clearFilter();
    App.sColonias.filter([{ filterFn: function (item) {
        if (item.get('ID').toUpperCase().indexOf(newValue.toUpperCase()) > -1 || item.get('Descripcion').toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
    App.gpColonias.getSelectionModel().deselectAll();
    App.imgbtnEditar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
};


//Evento al cargar el store de Municipios
var sMunicipios_Load = function () {
    if (App.sColonia.getAt(0) != undefined) {
        App.cbMunicipio.setValue(App.sColonia.getAt(0).get('Municipio'));
    }
};

//Evento lanzado al cargar el store de la sucursal
var sColonia_Load = function () {
    App.direct.sColonia_Load();
    store = window.parent.App.pCentro.getBody().App.sColonias;
};

//Evento lanzado al agregar un registro al store
var sColonia_Add = function (concepto, registro) {
    App.txtIDColonia.setValue(registro[0].get('ID'));
    App.txtfColonia.setValue(registro[0].get('Descripcion'));
    App.cmbEstados.setValue(registro[0].get('Estado'));
    App.cbMunicipio.setValue(registro[0].get('Municipio'));
};