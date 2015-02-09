//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function () {
    Ext.util.Cookies.set('cookieEditarMenu', 'Nuevo');
    window.parent.App.wEmergente.load('FormaMenu2.aspx');
    window.parent.App.wEmergente.setHeight(471);
    window.parent.App.wEmergente.setWidth(620);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Nuevo menú');
    window.parent.App.wEmergente.show();
};

//Evento que ocurre al dar clic en imgbtnGuardar
var imgbtnGuardar_Click_Success = function () {
    window.parent.App.wEmergente.hide();
    window.parent.App.pCentro.getBody().App.sMenus.reload();
};

//Evento de click del botón Editar
var imgbtnEditar_Click = function () {
    Ext.util.Cookies.set('cookieEditarMenu', App.gpMenus.getSelectionModel().getSelection()[0].get('ID'));
    window.parent.App.wEmergente.load('FormaMenu2.aspx');
    window.parent.App.wEmergente.setHeight(471);
    window.parent.App.wEmergente.setWidth(620);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Editar menú ' + Ext.util.Cookies.get('cookieEditarMenu'));
    window.parent.App.wEmergente.show();
};

//Para el botón de eliminar, Eliminar un registro
var imgbtnBorrar_Click = function () {
    var identificador = App.gpMenus.getSelectionModel().getSelection()[0].get('ID');
    var indice = App.gpMenus.getStore().find('ID', identificador);
    var descripcion = App.sMenus.getAt(indice).get('Descripcion');
    App.direct.EliminarMenu(identificador);
    App.gpMenus.getStore().removeAt(indice);
    Ext.net.Notification.show({
        iconCls: 'icon-delete',
        pinEvent: 'click',
        header: true,
        width: 350,
        html: '<p class="deletePop">ID: ' + identificador + '</p><p class="deletePop">Descripción: ' + descripcion + '</p>',
        title: 'Eliminar registro'
    });
};

//Acciones al hacer clic en un registro
var gpMenus_ItemClick = function () {
    App.imgbtnEditar.setDisabled(false);
    App.imgbtnBorrar.setDisabled(false);
};

//Hacer la busqueda de información
var txtfBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sMenus.clearFilter();
    App.sMenus.filter([{ filterFn: function (item) {
        if (item.get('ID').toUpperCase().indexOf(newValue.toUpperCase()) > -1 || item.get('Descripcion').toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
};

//Acciones que se lanzan cada ves que cambia el store
var sMenus_DataChanged = function () {
    if (App.sMenus.getCount() > 1) {
        App.sbMenus.setText(App.sMenus.getCount() + ' ' + 'MENÚS');
    }
    else {
        App.sbMenus.setText(App.sMenus.getCount() + ' ' + 'MENÚ');
    }

    //Resize column Description when records are 11
    if (App.sMenus.getCount() > 10) {
        App.gpMenus.columns[1].setWidth(638);
    }
    else {
        App.gpMenus.columns[1].setWidth(658);
    }
};

//Evento lanzado al cargar el store de la sucursal
var sMenu_Load = function () {
    App.direct.sMenu_Load();
};

//Evento lanzado al agregar un registro al store
var sMenu_Add = function (menu, registro) {
    App.txtfID.setDisabled(true);
    App.txtfID.setValue(registro[0].get('ID'));
    App.txtfDescripcion.setValue(registro[0].get('Descripcion'));
    App.cmbGrupoMenu.setValue(registro[0].get('GrupoMenu'));
    App.imgNormal.setImageUrl(registro[0].get('ImagenNormal'));

    App.fufNormal.allowBlank = true;

};

//Imagen Preview Normal
var fufNormal_Change = function (event) {
    App.imgNormal.setImageUrl(URL.createObjectURL(event.target.files[0]));
};

var RGrupoMenuDescripcion_Convert = function (valor, registro) {
    return registro.get('RGrupoMenu').Descripcion;
};