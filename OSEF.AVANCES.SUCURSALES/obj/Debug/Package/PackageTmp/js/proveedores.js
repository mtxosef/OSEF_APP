//Para el botón de eliminar, Eliminar un registro
var click_EliminarRegistro = function () {
    var identificador = App.gpProveedores.getSelectionModel().getSelection()[0].get('ID');
    var indice = App.gpProveedores.getStore().find('ID', identificador);
    var nombre = App.sProveedores.getAt(indice).get('Nombre');
    App.direct.EliminarProveedor(identificador);
    App.gpProveedores.getStore().removeAt(indice);
    Ext.net.Notification.show({
        iconCls: 'icon-delete',
        pinEvent: 'click',
        header: true,
        width: 350,
        html: '<p class="deletePop">ID: ' + identificador + '</p><p class="deletePop">Nombre: ' + nombre + '</p>',
        title: 'Eliminar registro'
    });
};

//Evento que ocurre al dar clic en imgbtnGuardar
var imgbtnGuardar_Click_Success = function () {
    window.parent.App.wEmergente.hide();
    window.parent.App.pCentro.getBody().App.sProveedores.reload();
};

//Cambio en los datos del tablero
var sProveedores_DataChanged = function () {
    if (App.sProveedores.getCount() > 1) {
        App.sbProveedores.setText(App.sProveedores.getCount() + ' ' + 'PROVEEDORES');
    }
    else {
        App.sbProveedores.setText(App.sProveedores.getCount() + ' ' + 'PROVEEDOR');
    }

    //Resize column Description when records are 11
    if (App.sProveedores.getCount() > 10) {
        App.gpProveedores.columns[2].setWidth(363);
    }
    else {
        App.gpProveedores.columns[2].setWidth(378);
    }
};

//Concatenar la columna de contacto
var Contacto_Convert = function (value, record) {
    return record.get('ContactoNombre') + ' ' + record.get('ContactoAPaterno') + ' ' + record.get('ContactoAMaterno');
};

//Acciones al hacer clic en un registro
var itemclick_Habilitar = function () {
    App.imgbtnEditar.setDisabled(false);
    App.imgbtnBorrar.setDisabled(false);
};

//Evento de click del botón Editar
var imgbtnEditar_Click = function () {
    Ext.util.Cookies.set('cookieEditarProveedor', App.gpProveedores.getSelectionModel().getSelection()[0].get('ID'));
    window.parent.App.wEmergente.load('FormaProveedor.aspx');
    window.parent.App.wEmergente.setHeight(430);
    window.parent.App.wEmergente.setWidth(670);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Editar proveedor ' + Ext.util.Cookies.get('cookieEditarProveedor'));
    window.parent.App.wEmergente.show();
};

//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function () {
    Ext.util.Cookies.set('cookieEditarProveedor', 'Nuevo');
    window.parent.App.wEmergente.load('FormaProveedor.aspx');
    window.parent.App.wEmergente.setHeight(430);
    window.parent.App.wEmergente.setWidth(670);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Nuevo proveedor');
    window.parent.App.wEmergente.show();
};

//Evento lanzado al cargar el store de proveedor
var sProveedor_Load = function () {
    App.direct.sProveedor_Load();
};

//Evento lanzado al agregar un registro al store
var sProveedor_Add = function (proveedor, registro) {
    App.txtID.setValue(registro[0].get('ID'));
    App.txtfNombre.setValue(registro[0].get('Nombre'));
    App.txtfRFC.setValue(registro[0].get('RFC'));
    App.txtfContactoNombre.setValue(registro[0].get('ContactoNombre'));
    App.txtfContactoAPaterno.setValue(registro[0].get('ContactoAPaterno'));
    App.txtfContactoAMaterno.setValue(registro[0].get('ContactoAMaterno'));
    App.txtfCorreo.setValue(registro[0].get('Correo'));
    App.txtfCalle.setValue(registro[0].get('Calle'));
    App.txtfEntreCalles.setValue(registro[0].get('EntreCalles'));
    App.txtfNoExterior.setValue(registro[0].get('NoExterior'));
    App.txtfNoInterior.setValue(registro[0].get('NoInterior'));
    App.txtfCodigoPostal.setValue(registro[0].get('CodigoPostal'));
    App.txtColonia.setValue(registro[0].get('Colonia'));
    App.cmbEstado.setValue(registro[0].get('Estado'));
    App.cmbMunicipio.setValue(registro[0].get('Municipio'));
};

//Hacer la busqueda de información
var txtBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sProveedores.clearFilter();
    App.sProveedores.filter([{ filterFn: function (item) {
        if (item.get('ID').toUpperCase().indexOf(newValue.toUpperCase()) > -1 || item.get('Nombre').toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    } 
    }]);
};