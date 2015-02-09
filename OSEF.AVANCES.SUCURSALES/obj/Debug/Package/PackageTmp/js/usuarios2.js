var banderaValidate = false;

//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function () {
    Ext.util.Cookies.set('cookieEditarUsuario', 'Nuevo');
    window.parent.App.wEmergente.load('FormaUsuario.aspx');
    window.parent.App.wEmergente.setHeight(425);
    window.parent.App.wEmergente.setWidth(770);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Nuevo usuario');
    window.parent.App.wEmergente.show();
};

//Evento que ocurre al dar clic en imgbtnGuardar
var imgbtnGuardar_Click_Success = function () {
    window.parent.App.wEmergente.hide();
    window.parent.App.pCentro.getBody().App.sUsuarios.reload();
};

//Evento de click del botón Editar
var imgbtnEditar_Click = function () {
    Ext.util.Cookies.set('cookieEditarUsuario', App.gpUsuarios.getSelectionModel().getSelection()[0].get('ID'));
    window.parent.App.wEmergente.load('FormaUsuario.aspx');
    window.parent.App.wEmergente.setHeight(425);
    window.parent.App.wEmergente.setWidth(770);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Editar usuario ' + Ext.util.Cookies.get('cookieEditarUsuario'));
    window.parent.App.wEmergente.show();
};

//Evento que es lanzado despues del DirectEvent
var txtfID_Blur_Success = function (response, result) {
    if (result.extraParamsResponse.repetido) {
        Ext.Msg.show({
            id: 'msgUsuario',
            title: 'Error en Usuario',
            msg: 'El usuario ya existe',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            fn: function (btn) {
                if (btn === 'ok') {
                    App.txtfID.focus(true); App.imgbtnGuardar.setDisabled(true)
                }
            },
            icon: Ext.MessageBox.ERROR
        });
    }
};

//Evento que se lanza antes del Blur de Correo
var txtfCorreo_Blur_Before = function (textfield, tipo, evento) {
    if (Ext.util.Cookies.get('cookieEditarUsuario') != 'Nuevo') {
        if (App.sUsuario.getAt(0).get('Correo') != textfield.getValue()) {
            return true;
        }
        else {
            return false;
        }
    }
};

//Evento que es lanzado despues del DirectEvent
var txtfCorreo_Blur_Success = function (response, result) {
    if (result.extraParamsResponse.repetido) {
        Ext.Msg.show({
            id: 'msgCorreo',
            title: 'Error en Correo',
            msg: 'El correo ya existe',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            fn: function (btn) {
                if (btn === 'ok') {
                    App.txtfCorreo.focus(true); App.imgbtnGuardar.setDisabled(true)
                }
            },
            icon: Ext.MessageBox.ERROR
        });
    }
};

//Validar el TextField de Contraseña
var txtfContrasena_Validator = function (valor) {
    if (App.txtfConfirmarContrasena.getPassword() == '') {
        return true;
    }
    else if (this.getPassword() == App.txtfConfirmarContrasena.getPassword()) {
        if (banderaValidate == false) {
            banderaValidate = true;
            App.txtfConfirmarContrasena.validate();
            banderaValidate = false;
        }
        return true;
    }
    else {
        return 'Las contraseñas no coinciden';
    }
};

//Validar el TextField de Confirmar Contraseña
var txtfConfirmarContrasena_Validator = function (valor) {
    if (App.txtfContrasena.getPassword() == '') {
        return true;
    }
    else if (this.getPassword() == App.txtfContrasena.getPassword()) {
        if (banderaValidate == false) {
            banderaValidate = true;
            App.txtfContrasena.validate();
            banderaValidate = false;
        }
        return true;
    }
    else {
        return 'Las contraseñas no coinciden';
    }
};

//Dar formato a los datos que se mandarán desde el formulario
var sendData = function () {
    var data = App.fpUsuario.getForm().getValues(false, false, false, true);

    data.txtfContrasena = data.txtfContrasena[1];
    data.txtfConfirmarContrasena = data.txtfConfirmarContrasena[1];
    return data;
};

//Evento lanzado al cargar el store de la sucursal
var sUsuario_Load = function () {
    App.direct.sUsuario_Load();
};

//Evento lanzado al agregar un registro al store
var sUsuario_Add = function (usuario, registro) {
    App.txtfID.setDisabled(true);
    App.txtfID.setValue(registro[0].get('ID'));
    App.txtfCorreo.setValue(registro[0].get('Correo'));
    App.txtfCorreo.focus();
    App.txtfNombre.setValue(registro[0].get('Nombre'));
    App.txtfAPaterno.setValue(registro[0].get('APaterno'));
    App.txtfAMaterno.setValue(registro[0].get('AMaterno'));
    App.txtfContrasena.setValue('Contrasena');
    App.txtfContrasena.setDisabled(true);
    App.txtfConfirmarContrasena.setValue('Contrasena');
    App.txtfConfirmarContrasena.setDisabled(true);
    App.cmbEstatus.setValue(registro[0].get('Estatus'));
    App.cmbEstatus.setDisabled(false);
    App.chkBloqueado.setValue(registro[0].get('Bloqueado'));
    App.chkEnLinea.setValue(registro[0].get('EnLinea'));
    App.dfFechaAlta.setValue(registro[0].get('FechaAlta'));
    App.dfFechaBloqueo.setValue(registro[0].get('FechaBloqueo'));
    App.dfUltimoAcceso.setValue(registro[0].get('UltimoAcceso'));
    App.dfCambioContrasena.setValue(registro[0].get('CambioContrasena'));
};

//Para el botón de eliminar, Eliminar un registro
var imgbtnBorrar_Click = function () {
    var identificador = App.gpUsuarios.getSelectionModel().getSelection()[0].get('ID');
    var indice = App.gpUsuarios.getStore().find('ID', identificador);
    var nombre = App.sUsuarios.getAt(indice).get('Nombre');
    App.direct.EliminarUsuario(identificador);
    App.gpUsuarios.getStore().removeAt(indice);
    Ext.net.Notification.show({
        iconCls: 'icon-delete',
        pinEvent: 'click',
        header: true,
        width: 350,
        html: '<p class="deletePop">ID: ' + identificador + '</p><p class="deletePop">Nombre: ' + nombre + '</p>',
        title: 'Eliminar registro'
    });
};

//Hacer la busqueda de información
var txtBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sUsuarios.clearFilter();
    App.sUsuarios.filter([{ filterFn: function (item) {
        if (item.get('ID').toUpperCase().indexOf(newValue.toUpperCase()) > -1 || item.get('Nombre').toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
};

//Concatenar la columna de NombreCompleto
var NombreCompleto_Convert = function (value, record) {
    return record.get('Nombre') + ' ' + record.get('APaterno') + ' ' + record.get('AMaterno');
};

//Cambio en los datos del tablero
var sUsuarios_DataChanged = function () {
    if (App.sUsuarios.getCount() > 1) {
        App.sbUsuarios.setText(App.sUsuarios.getCount() + ' ' + 'USUARIOS');
    }
    else {
        App.sbUsuarios.setText(App.sUsuarios.getCount() + ' ' + 'USUARIO');
    }

    //Resize column Nombre when records are 11
    if (App.sUsuarios.getCount() > 10) {
        App.gpUsuarios.columns[2].setWidth(280);
    }
    else {
        App.gpUsuarios.columns[2].setWidth(300);
    }
};

//Acciones al hacer clic en un registro
var gpUsuarios_ItemClick = function () {
    App.imgbtnEditar.setDisabled(false);
    App.imgbtnBorrar.setDisabled(false);
};

//Lanzar algun comando de la lista de opciones
var ccOpciones_Command = function (opciones, comando, registro, indice) {
    if (comando == 'AccesoMenus') {
        window.parent.App.wEmergente.load('FormaAccesoMenus.aspx');
        window.parent.App.wEmergente.setHeight(351);
        window.parent.App.wEmergente.setWidth(520);
        window.parent.App.wEmergente.center();
        window.parent.App.wEmergente.setTitle('Accesos a menus del usuario: ' + registro.data.ID);
        window.parent.App.wEmergente.show();
    }
    else if (comando == 'AccesoSucursales') {
        window.parent.App.wEmergente.load('FormaAccesoSucursales.aspx');
        window.parent.App.wEmergente.setHeight(351);
        window.parent.App.wEmergente.setWidth(520);
        window.parent.App.wEmergente.center();
        window.parent.App.wEmergente.setTitle('Accesos a sucursales del usuario: ' + registro.data.ID);
        window.parent.App.wEmergente.show();
    }
    else if (comando == 'CambiarContrasena') {
        window.parent.App.wEmergente.load('FormaCambiarContrasena.aspx');
        window.parent.App.wEmergente.setHeight(260);
        window.parent.App.wEmergente.setWidth(460);
        window.parent.App.wEmergente.center();
        window.parent.App.wEmergente.setTitle('Cambiar contraseña usuario: ' + registro.data.ID);
        window.parent.App.wEmergente.show();
    }
    else if (comando == 'Bloquear') {
        Ext.net.Notification.show({
            iconCls: 'icon-delete',
            pinEvent: 'click',
            header: true,
            width: 350,
            html: '<p class="deletePop">Usuario ' + registro.data.ID + ' bloqueado</p>',
            title: 'Bloquear'
        });
    }
};