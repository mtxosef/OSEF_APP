var miCambiarContrasena_Click = function () {
    window.parent.App.wEmergente.load('FormaCambiarContrasena.aspx');
    window.parent.App.wEmergente.setHeight(260);
    window.parent.App.wEmergente.setWidth(460);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Cambiar contraseña usuario: ');
    window.parent.App.wEmergente.show();
};