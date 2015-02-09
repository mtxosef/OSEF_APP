//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function () {
    Ext.util.Cookies.set('cookieEditarSucursal', 'Nuevo');
    window.parent.App.wEmergente.load('FormaSucursal.aspx');
    window.parent.App.wEmergente.setHeight(436);
    window.parent.App.wEmergente.setWidth(800);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Nueva sucursal');
    window.parent.App.wEmergente.show();
};

//Evento que ocurre al dar clic en imgbtnGuardar
var imgbtnGuardar_Click_Success = function () {
    window.parent.App.wEmergente.hide();
    window.parent.App.pCentro.getBody().App.sSucursales.reload();
};

//Evento de click del botón Editar
var imgbtnEditar_Click = function () {
    Ext.util.Cookies.set('cookieEditarSucursal', App.gpSucursales.getSelectionModel().getSelection()[0].get('ID'));
    window.parent.App.wEmergente.load('FormaSucursal.aspx');
    window.parent.App.wEmergente.setHeight(436);
    window.parent.App.wEmergente.setWidth(800);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Editar sucursal ' + Ext.util.Cookies.get('cookieEditarSucursal'));
    window.parent.App.wEmergente.show();
};

//Para el botón de eliminar, Eliminar un registro
var imgbtnBorrar_Click_Success = function (response, result) {
    if (result.extraParamsResponse.existe) {
        Ext.Msg.show({
            id: 'msgSucursales',
            title: 'Advertencia Sucursal',
            msg: 'La sucursal esta siendo utilizada en un movimiento',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            icon: Ext.MessageBox.WARNING
        });
    }
    else {
        var identificador = App.gpSucursales.getSelectionModel().getSelection()[0].get('ID');
        var indice = App.gpSucursales.getStore().find('ID', identificador);
        var nombre = App.sSucursales.getAt(indice).get('Nombre');
        App.gpSucursales.getStore().removeAt(indice);
        Ext.net.Notification.show({
            iconCls: 'icon-delete',
            pinEvent: 'click',
            header: true,
            width: 350,
            html: '<p class="deletePop">ID: ' + identificador + '</p><p class="deletePop">Nombre: ' + nombre + '</p>',
            title: 'Eliminar registro'
        });
        App.gpSucursales.getSelectionModel().deselectAll();
        App.imgbtnEditar.setDisabled(true);
        App.imgbtnBorrar.setDisabled(true);
    }
};

//Acciones al hacer clic en un registro
var gpSucursales_ItemClick = function () {
    App.imgbtnEditar.setDisabled(false);
    App.imgbtnBorrar.setDisabled(false);
};

//Hacer la busqueda de información
var txtBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sSucursales.clearFilter();
    App.sSucursales.filter([{ filterFn: function (item) {
        if (item.get('ID').toUpperCase().indexOf(newValue.toUpperCase()) > -1 || item.get('Nombre').toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
};

//Concatenar la columna de contacto
var Gerente_Convert = function (value, record) {
    return record.get('GerenteBBVANombre') + ' ' + record.get('GerenteBBVAAPaterno') + ' ' + record.get('GerenteBBVAAMaterno');
};

//Cambio en los datos del tablero
var sSucursales_DataChanged = function () {
    if (App.sSucursales.getCount() > 1) {
        App.sbSucursales.setText(App.sSucursales.getCount() + ' ' + 'SUCURSALES');
    }
    else {
        App.sbSucursales.setText(App.sSucursales.getCount() + ' ' + 'SUCURSAL');
    }

    //Resize column Description when records are 11
    if (App.sSucursales.getCount() > 10) {
        App.gpSucursales.columns[2].setWidth(260);
    }
    else {
        App.gpSucursales.columns[2].setWidth(280);
    }
};

//Evento lanzado al cargar el store de la sucursal
var sSucursal_Load = function () {
    App.direct.sSucursal_Load();
};

//Evento lanzado al agregar un registro al store
var sSucursal_Add = function (sucursal, registro) {
    App.txtfID.setValue(registro[0].get('ID'));
    App.nfCR.setValue(registro[0].get('CR'));
    App.txtfNombre.setValue(registro[0].get('Nombre'));
    App.txtfGerenteBBVANombre.setValue(registro[0].get('GerenteBBVANombre'));
    App.txtfGerenteBBVAAPaterno.setValue(registro[0].get('GerenteBBVAAPaterno'));
    App.txtfGerenteBBVAAMaterno.setValue(registro[0].get('GerenteBBVAAMaterno'));
    App.txtfSupervisorNombre.setValue(registro[0].get('SupervisorNombre'));
    App.txtfSupervisorAPaterno.setValue(registro[0].get('SupervisorAPaterno'));
    App.txtfSupervisorAMaterno.setValue(registro[0].get('SupervisorAMaterno'));
    App.txtfProveedorEnergia.setValue(registro[0].get('ProveedorEnergia'));
    App.nfSuperficie.setValue(registro[0].get('Superficie'));
    App.txtfCoordinadorNombre.setValue(registro[0].get('CoordinadorNombre'));
    App.txtfCoordinadorAPaterno.setValue(registro[0].get('CoordinadorAPaterno'));
    App.txtfCoordinadorAMaterno.setValue(registro[0].get('CoordinadorAMaterno'));
    App.dfFechaAlta.setValue(registro[0].get('FechaAlta'));
    App.cmbEstatus.setValue(registro[0].get('Estatus'));
    App.txtfCalle.setValue(registro[0].get('Calle'));
    App.txtfEntreCalles.setValue(registro[0].get('EntreCalles'));
    App.txtfNoExterior.setValue(registro[0].get('NoExterior'));
    App.txtfNoInterior.setValue(registro[0].get('NoInterior'));
    App.txtfCodigoPostal.setValue(registro[0].get('CodigoPostal'));
    App.txtfColonia.setValue(registro[0].get('Colonia'));
    App.cmbEstado.setValue(registro[0].get('Estado'));
    App.cmbMunicipio.setValue(registro[0].get('Municipio'));
    App.txtfContratista.setValue(registro[0].get('Contratista'));
    App.dfTerminoContrato.setValue(registro[0].get('TerminoContrato'));
    App.dfInicioObra.setValue(registro[0].get('InicioObra'));
    App.dfFinObra.setValue(registro[0].get('FinObra'));
    App.nfSemanasObra.setValue(registro[0].get('SemanasObra'));
    App.cmbEstatus.setDisabled(false);
};

//Evento al cargar el store de municipios
var sMunicipios_Load = function () {
    if (App.sSucursal.getAt(0) != undefined) {
        App.cmbMunicipio.setValue(App.sSucursal.getAt(0).get('Municipio'));
    }
};