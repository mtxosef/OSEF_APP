//Boton de nuevo
var imgbtnNuevo_Click = function () {

    //Limpiar controles del encabezado
    App.cmbMov.clearValue();
    App.txtfMovID.setValue(null);
    App.nfSemana.setValue(null);
    App.cmbSucursal.clearValue();
    App.txtfSucursalNombre.setValue(null);
    App.dfFechaEmision.setValue(null);
    App.dfFechaRevision.setValue(null);
    App.txtfObservaciones.setValue(null);
    App.txtfComentarios.setValue(null);

    //Borrar el GridPanel del Detalle y Encabezado
    App.sObraCivil.removeAll();
    App.sRevision.removeAll();
    Ext.util.Cookies.set('cookieEditarRevision', 'Nuevo');
    window.parent.App.wEmergente.setTitle('Nuevo Avance');
};

//Boton de abrir o cerrar
var imgbtnAbrir_Click = function () {
    window.parent.App.wEmergente.hide();
};

//Evento que ocurre al dar clic en imgbtnGuardar
var imgbtnGuardar_Click_Success = function (response, result) {
    window.parent.App.pCentro.getBody().App.sAvances.reload();
    if (result.extraParamsResponse.accion == 'insertar') {
        Ext.Msg.show({
            id: 'msgAvance',
            title: 'Movimiento guardado',
            msg: '<p align="center">Movimiento registrado con ID: <br/>' + App.sRevision.getAt(0).get('ID') + '.</p>',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.INFO
        });
    }
    else {
        Ext.Msg.show({
            id: 'msgAvance',
            title: 'Movimiento actualizado',
            msg: '<p align="center">Movimiento actualizado con ID: <br/>' + App.sRevision.getAt(0).get('ID') + '.</p>',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.INFO
        });
    }
};

//Mostrar información de la sucursal seleccionada
var imgbtnInfo_Click = function () {
    window.parent.App.wEmergenteGraficas.load('FormaInfoGraficas.aspx');
    window.parent.App.wEmergenteGraficas.setHeight(545);
    window.parent.App.wEmergenteGraficas.setWidth(960);
    window.parent.App.wEmergenteGraficas.center();
    window.parent.App.wEmergenteGraficas.setTitle('Gráficas');
    window.parent.App.wEmergenteGraficas.show();
};

//Afectar el movimiento
var imgbtnAfectar_Click = function () {
};

//Para autorizar un movimiento a afectar
var imgbtnAutorizar_Click = function () {
};

//Mandar a imprimir en una vista previa
var imgbtnImprimir_Click = function () {
};

//Borrar un movimiento que no ha sido afectado
var imgbtnBorrar_Click = function () {
};

//Cancelar un movimiento ya afectado
var imgbtnCancelar_Click = function () {
};

//Cuando se abren varios movimientos posicionarse en el primero seleccionado
var imgbtnPrimero_Click = function () {
};

//Cuando se abren varios movimientos posicionarse en el anterior seleccionado
var imgbtnAnterior_Click = function () {
};

//Cuando se abren varios movimientos posicionarse en el siguiente seleccionado
var imgbtnSiguiente_Click = function () {
};

//Cuando se abren varios movimientos posicionarse en el último seleccionado
var imgbtnUltimo_Click = function () {
};

//Evento que se lanza al seleccionar un elemento del ComboBox de Movimiento
var cmbMov_Select = function (combobox, registro) {
    //Asignar Fecha en el control Fecha de emisión
    var d = new Date();
    if (App.dfFechaEmision.getValue() == null) {
        App.dfFechaEmision.setValue(d);
    }

    //Validar si se asigna el primer renglon del detalle
    PrimerRenglonDetalle();
    //Validar si se habilita Guardar
    HabilitarGuardar();
};

//Evento que se lanza al cambiar el valor de la Semana
var nfSemana_Change = function () {
    //Validar si se asigna el primer renglon del detalle
    PrimerRenglonDetalle();
};

//Evento que se lanza al seleccionar algun valor de la sucursal
var cmbSucursal_Select = function (combobox, registro) {
    App.txtfSucursalNombre.setValue(registro[0].data.Nombre);
    //Validar si se asigna el primer renglon del detalle
    PrimerRenglonDetalle();
    //Validar si se habilita Guardar
    HabilitarGuardar();
    //Validar si se habilita Información
    HabilitarInformacion();
};

//Evento que se lanza al poner algun caracter en el control de la Sucursal
var cmbSucursal_Change = function (combobox, valorNuevo, viejoValor) {
    App.sSucursales.clearFilter();
    if (App.cmbSucursal.getValue() != null) {
        App.sSucursales.filter([{ filterFn: function (item) {
            if (item.get('ID').toUpperCase().indexOf(valorNuevo.toUpperCase()) > -1 || item.get('Nombre').toUpperCase().indexOf(valorNuevo.toUpperCase()) > -1) { return true; }
            else { return false; }
        }
        }]);
    }
    else {
        App.txtfSucursalNombre.setValue('');
    }
    //Validar si se habilita Guardar
    HabilitarGuardar();
    //Validar si se habilita Información
    HabilitarInformacion();
};

//Evento que se lanza al poner alguna fecha valida en el control de FechaRevision
var dfFechaRevision_Change = function () {
    //Validar si se asigna el primer renglon del detalle
    PrimerRenglonDetalle();
};

//Lanzar ventana de la galería de imagenes
var imgbtnGaleria_Click = function () {
    App.wFormaGaleria.load('FormaGaleria.aspx');
    App.wFormaGaleria.setHeight(386);
    App.wFormaGaleria.setWidth(900);
    App.wFormaGaleria.center();
    App.wFormaGaleria.setTitle('Galeria de imágenes');
    App.wFormaGaleria.show();
};

//Evento que muestra el valor de la columna Concepto por su descripción y no por su ID
var cConcepto_Renderer = function (valor) {
    var registro;
    if (valor.length != 0) {
        registro = App.sConceptos.findRecord('ID', valor);
        return registro.get('Descripcion');
    }
};

//Evento que muestra el valor de la columna Proveedor por su nombre y no por su ID
var cProveedor_Renderer = function (valor) {
    var registro;
    if (valor.length != 0) {
        registro = App.sProveedores.findRecord('ID', valor);
        return registro.get('Nombre');
    }
};

//Darle formato a la columna de Programado
var cProgramado_Renderer = function (valor) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(valor, "000.00%");
};

//Darle formato a la columna de Real
var cReal_Renderer = function (valor) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';    
    return F.number(valor, "000.00%");
};

//Evento que se lanza despues de editar una columna en ObraCivil
var ceObraCivil_Edit = function (cellediting, columna) {
    //Verificar si abajo de esta columna existe otra
    if (App.sObraCivil.getAt(columna.rowIdx + 1) == undefined) {
        //Verificar si toda la fila contiene datos
        var registro = App.sObraCivil.getAt(columna.rowIdx);
        if (registro.get('Concepto').length != 0 && registro.get('Proveedor').length != 0 && registro.get('Programado') != 0 && registro.get('Real') != 0) {
            //Obtener el Renglon anterior
            var renglonAnterior = App.sObraCivil.getAt(columna.rowIdx).get('Renglon') + 1;
            //Insertar un nuevo registro
            App.sObraCivil.insert(App.sObraCivil.getCount(), { Renglon: renglonAnterior });
        }
    }
};

//Función que valida si se habilita el primer renlgon en el GridPanel detalle
function PrimerRenglonDetalle()
{
    //Validar si se asigna el primer renglon del concepto
    if (App.cmbMov.getValue() != null && App.nfSemana.getValue() != null && App.cmbSucursal.getValue() != null && App.dfFechaRevision.getValue() != null) {
        if (App.nfSemana.isValid() && App.cmbSucursal.isValid() && App.dfFechaRevision.isValid()) {
            var store = App.gpObraCivil.getStore();
            if (store.getCount() == 0) {
                //Insertar el primer registro
                store.insert(0, { Renglon: 0 });
            }
        }
    }
}

//Función que valida si se habilita el botón de Guardar
function HabilitarGuardar() {
    if (App.cmbMov.getValue() != null && App.cmbSucursal.getValue() != null) {
        App.imgbtnGuardar.setDisabled(false);
    }
    else {
        App.imgbtnGuardar.setDisabled(true);
    }
}

//Validar si se habilita el botón de Información
function HabilitarInformacion() {
    if (App.cmbSucursal.getValue() != null) {
        App.imgbtnInfo.setDisabled(false);
    }
    else {
        App.imgbtnInfo.setDisabled(true);
    }
}

//Evento lanzado al cargar el store de avance encabezado
var sRevision_Load = function () {
    App.direct.sRevision_Load();
    store = window.parent.App.pCentro.getBody().App.sAvances;
};

//Evento lanzado al agregar un registro al store
var sRevision_Add = function (avance, registro) {
    if (Ext.util.Cookies.get('cookieEditarRevision') != 'Nuevo') {
        App.cmbMov.setValue(registro[0].get('Mov'));
        App.txtfMovID.setValue(registro[0].get('MovID'));
        App.nfSemana.setValue(registro[0].get('Semana'));
        App.cmbSucursal.setValue(registro[0].get('Sucursal'));
        App.dfFechaEmision.setValue(registro[0].get('FechaEmision'));
        App.dfFechaRevision.setValue(registro[0].get('FechaRevision'));
        App.txtfObservaciones.setValue(registro[0].get('Observaciones'));
        App.txtfComentarios.setValue(registro[0].get('Comentarios'));
        App.sbFormaAvance.setText(registro[0].get('Estatus'));

        //Agregar una fila para seguir capturando
        var renglonAnterior = App.sObraCivil.getAt(App.sObraCivil.getCount() - 1).get('Renglon') + 1;
        App.sObraCivil.insert(App.sObraCivil.getCount(), { Renglon: renglonAnterior });
    }
};

//Evento de la columna de acciones
var ccAcciones_Command = function (columna, comando, registro, fila, opciones) {
    //Eliminar registro
    App.sObraCivil.removeAt(fila);

    //Asignar renglones
    var renglon = 0;
    App.sObraCivil.each(function (dato) {
        dato.set('Renglon', renglon);
        renglon = renglon + 1;
    });
};