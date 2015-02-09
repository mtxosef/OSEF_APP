//Función que es lanzada despues de que se valida el Password
var Password_SpecialKey_Success = function (response, result) {
    if (result.extraParamsResponse.showMask === false) {
        App.cError.setVisible(true);
        App.lblError.setText('Error, usuario/contraseña incorrecto');
    }
    else {
        App.cError.setVisible(false);
    }
};