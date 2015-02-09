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
            title: 'GUARDAR',
            msg: '<p align="center">Movimiento registrado ID: ' + App.sRevision.getAt(0).get('ID') + '.</p>',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.INFO
        });
        App.imgbtnBorrar.setDisabled(false);
    }
    else {
        Ext.Msg.show({
            id: 'msgAvance',
            title: 'ACTUALIZAR',
            msg: '<p align="center">Movimiento actualizado ID: ' + App.sRevision.getAt(0).get('ID') + '.</p>',
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

//Método que se lanza antes de llamar al procedimiento de Afectar
var imgbtnAfectar_Click_Before = function () {
    if (App.sRevision.getCount() != 0) {
        if (App.sRevision.getAt(0).get('Estatus') == 'PENDIENTE') {
            App.wEmergente.load('FormaAvanzarMovimiento.aspx');
            App.wEmergente.setHeight(179);
            App.wEmergente.setWidth(220);
            App.wEmergente.center();
            App.wEmergente.setTitle('Avanzar Movimiento');
            App.wEmergente.show();
            return false;
        }
        else {
            return true;
        }
    }
    else {
        return true;
    }
};

//Afectar el movimiento
var imgbtnAfectar_Click_Success = function (response, result) {
    //1. Actualizar el store del tablero
    window.parent.App.pCentro.getBody().App.sAvances.reload();

    //2. Lanzar ventana de movimiento afectado
    Ext.Msg.show({
        id: 'msgAvance',
        title: 'AFECTAR',
        msg: '<p align="center">Movimiento afectado ID: ' + App.sRevision.getAt(0).get('ID') + '.</p>',
        buttons: Ext.MessageBox.OK,
        onEsc: Ext.emptyFn,
        closable: false,
        icon: Ext.MessageBox.INFO
    });

    //Actualizar campos afetados
    App.txtfMovID.setValue(App.sRevision.getAt(0).get('MovID'));
    App.sbFormaAvance.setText(App.sRevision.getAt(0).get('Estatus'));

    //3. Remover la útima fila
    var ultimoRegistro = App.sObraCivil.getAt(App.sObraCivil.getCount() - 1);
    if (ultimoRegistro.get('Concepto').length == 0 && ultimoRegistro.get('Proveedor').length == 0 && ultimoRegistro.get('Programado') == 0 && ultimoRegistro.get('Real') == 0) {
        App.sObraCivil.removeAt(App.sObraCivil.getCount() - 1);
    }

    //4. Deseleccionar datos del GridPanel y deshabilitar los controles
    App.gpObraCivil.getSelectionModel().deselectAll();
    DeshabilitarControlesAfectar();
    Ext.util.Cookies.set('cookieEditarRevision', App.sRevision.getAt(0).get('ID'));
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
    //Validar si se habilita Afectar
    HabilitarAfectar();
};

//Se lanza por cada elemento agregado al Store de Movimientos
var sMov_Add = function (store, registros, index, eOpts) {
    var d = new Date();

    //Validar si es nuevo, se asigna el movimieno Iniciar Proyecto y Semana número 1
    if (registros[0].get('ID') == 'Iniciar proyecto' && Ext.util.Cookies.get('cookieEditarRevision') == 'Nuevo') {
        App.cmbMov.select(registros[0].get('ID'));
        App.cmbMov.setReadOnly(true);
        App.nfSemana.setValue(1);
        App.nfSemana.setReadOnly(true);
        App.dfFechaEmision.setValue(d);
        App.cmbSucursal.focus();
    }
};

//Evento que se lanza al cambiar el valor de la Semana
var nfSemana_Change = function () {
    //Validar si se asigna el primer renglon del detalle
    PrimerRenglonDetalle();
    //Validar si se habilita Afectar
    HabilitarAfectar();
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
    //Validar si se habilita Afectar
    HabilitarAfectar();
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
    //Validar si se habilita Afectar
    HabilitarAfectar();
};

//Evento que se lanza al poner alguna fecha valida en el control de FechaRevision
var dfFechaRevision_Change = function () {
    //Validar si se asigna el primer renglon del detalle
    PrimerRenglonDetalle();
    //Validar si se habilita Afectar
    HabilitarAfectar();
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
            //Actualiza el renglon anterior pintando el botón de borrar
            App.gpObraCivil.getView().refreshNode(App.sObraCivil.getCount() - 2);
            //Validar si se habilita Afectar
            HabilitarAfectar();
        }
    }
};

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
        App.txtfSucursalNombre.setValue(registro[0].get('RSucursal').Nombre);
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

    //Validar si se habilita Afectar
    HabilitarAfectar();
};

//Ocultar el último renglon
var ccAcciones_PrepareToolbar = function (grid, toolbar, rowIndex, record) {
    if (grid.getStore().getCount() - 1 == rowIndex) {
        toolbar.items.get(0).hide();
    }
};

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

//Validar si se habilita el botón d Afectar
function HabilitarAfectar() {
    if (App.cmbMov.getValue() != null && App.nfSemana.getValue() != null && App.cmbSucursal.getValue() != null && App.dfFechaRevision.getValue() != null && App.dfFechaEmision.getValue() != null) {
        if (App.nfSemana.isValid() && App.cmbSucursal.isValid() && App.dfFechaRevision.isValid()) {
            if (App.gpObraCivil.getStore().getCount() != 0) {
                if (App.sObraCivil.getAt(0).get('Concepto').length != 0 && App.sObraCivil.getAt(0).get('Proveedor').length != 0 && App.sObraCivil.getAt(0).get('Programado') != 0 && App.sObraCivil.getAt(0).get('Real') != 0) {
                    App.imgbtnAfectar.setDisabled(false);
                }
                else {
                    App.imgbtnAfectar.setDisabled(true);
                }
            }
            else {
                App.imgbtnAfectar.setDisabled(true);
            }
        }
        else {
            App.imgbtnAfectar.setDisabled(true);
        }
    }
    else {
        App.imgbtnAfectar.setDisabled(true);
    }
}

//Función que valida si se habilita el primer renlgon en el GridPanel detalle
function PrimerRenglonDetalle() {
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

//Función que deshabilita todos los controles cuando se afecta un movimiento
function DeshabilitarControlesAfectar() {
    App.cmbMov.setDisabled(true);
    App.nfSemana.setDisabled(true);
    App.cmbSucursal.setDisabled(true);
    App.dfFechaEmision.setDisabled(true);
    App.dfFechaRevision.setDisabled(true);
    App.txtfObservaciones.setDisabled(true);
    App.txtfComentarios.setDisabled(true);
    App.gpObraCivil.setDisabled(true);
    App.imgbtnGuardar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
}