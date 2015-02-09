/*Funcion que realiza el fade in y el fade out*/
$(document).ready(function () {
    $("#otroUsuario").click(function (event) {
        parent.App.pCentro.getLoader().load('Menu.aspx');
    });

    $("#avances").click(function (event) {
        $("#contenedor").fadeOut(1000, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Avances.aspx');
        });
    });

    $("#gruposMenu").click(function (event) {
        $("#contenedor").fadeOut(1000, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('GruposMenu.aspx');
        });
    });

    $("#gruposMenu2").click(function (event) {
        $("#contenedor").fadeOut(1000, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('GruposMenu2.aspx');
        });
    });

    $("#usuarios").click(function (event) {
        $("#contenedor").fadeOut(1000, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Usuarios.aspx');
        });
    });

    $("#usuarios2").click(function (event) {
        $("#contenedor").fadeOut(1000, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Usuarios2.aspx');
        });
    });

    $("#menus").click(function (event) {
        $("#contenedor").fadeOut(1000, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Menus.aspx');
        });
    });

    $("#menus2").click(function (event) {
        $("#contenedor").fadeOut(1000, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Menus2.aspx');
        });
    });

    $("#articulos").click(function (event) {
        $("#contenedor").fadeOut(1000, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Articulos.aspx');
        });
    });

    $("#profesiones").click(function (event) {
        $("#contenedor").fadeOut(1000, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Profesiones.aspx');
        });
    });

    $("#finalidades").click(function (event) {
        $("#contenedor").fadeOut(1000, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Finalidades.aspx');
        });
    });

    $("#sucursal").click(function (event) {
        $("#contenedor").fadeOut(1000, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Sucursales.aspx');
        });
    });

    $("#conceptos").click(function (event) {
        $("#contenedor").fadeOut(1000, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Conceptos.aspx');
        });
    });

    $("#conceptos2").click(function (event) {
        $("#contenedor").fadeOut(1000, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Conceptos2.aspx');
        });
    });

    $("#cuentascontables").click(function (event) {
        $("#contenedor").fadeOut(1000, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('CuentasContables.aspx');
        });
    });

    $("#categorias").click(function (event) {
        $("#contenedor").fadeOut(1000, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Categorias.aspx');
        });
    });

    $("#subcategorias").click(function (event) {
        $("#contenedor").fadeOut(1000, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Subcategorias.aspx');
        });
    });

    $("#proveedores").click(function (event) {
        $("#contenedor").fadeOut(1000, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Proveedores.aspx');
        });
    });

    $("#estados").click(function (event) {
        $("#contenedor").fadeOut(1000, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Estados.aspx');
        });
    });

    $("#estados2").click(function (event) {
        $("#contenedor").fadeOut(1000, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Estados2.aspx');
        });
    });

    $("#municipios").click(function (event) {
        $("#contenedor").fadeOut(1000, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Municipios.aspx');
        });
    });

    $("#municipios2").click(function (event) {
        $("#contenedor").fadeOut(1000, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Municipios2.aspx');
        });
    });

    $("#codigospostales").click(function (event) {
        $("#contenedor").fadeOut(1000, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('CodigosPostales.aspx');
        });
    });

    $("#codigospostales2").click(function (event) {
        $("#contenedor").fadeOut(1000, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('CodigosPostales2.aspx');
        });
    });

    $("#socios").click(function (event) {
        $("#contenedor").fadeOut(1000, function () {
            parent.App.imgbtnRegresar.show();
            parent.App.lblRegresar.show();
            parent.App.pCentro.getLoader().load('Clientes.aspx');
        });
    });
});