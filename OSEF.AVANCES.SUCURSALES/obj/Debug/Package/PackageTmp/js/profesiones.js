var stateNuevo = false;
var repetido = false;
var indice = 0;

//Insertar un nuevo registro en blanco
var imgbtnNuevo_Click = function () {
    //Get store of gridpanel
    var store = App.gpProfesiones.getStore();
    //Get the total records
    var total = store.getCount();

    //Insert new record in the final
    store.insert(total, {});
    App.gpProfesiones.getView().focusRow(total);
    App.gpProfesiones.getSelectionModel().select(total);
    App.gpProfesiones.editingPlugin.startEdit(store.getAt(total), App.gpProfesiones.columns[0]);

    //Bandera para indicar que es un nuevo registro
    stateNuevo = true;
    App.txtfID.setReadOnly(false);
    indice = total;
    App.imgbtnEditar.setDisabled(false);
    App.imgbtnBorrar.setDisabled(false);
};

//Editar el registro en el que se esta posicionado
var imgbtnEditar_Click = function () {
    //Get index of record selection
    var index = App.gpProfesiones.getSelectionModel().getSelection()[0].index;

    //Validar si el indice esta como indefinido
    if (index == undefined) {
        index = indice;
    }

    //Get store of GridPanel
    var store = App.gpProfesiones.getStore();

    //Enabled the edit option
    App.gpProfesiones.editingPlugin.startEdit(App.gpProfesiones.getStore().getAt(index), App.gpProfesiones.columns[1]);
};

//Para el botón de eliminar, Eliminar un registro
var imgbtnBorrar_Click = function () {
    var identificador = App.gpProfesiones.getSelectionModel().getSelection()[0].get('ID');
    var indice = App.gpProfesiones.getStore().find('ID', identificador);
    var descripcion = App.sProfesiones.getAt(indice).get('Descripcion');
    App.direct.EliminarProfesion(identificador);
    App.gpProfesiones.getStore().removeAt(indice);
    Ext.net.Notification.show({
        iconCls: 'icon-delete',
        pinEvent: 'click',
        header: true,
        width: 200,
        html: '<p class="deletePop">ID: ' + identificador + '</p><p class="deletePop">Descripción: ' + descripcion + '</p>',
        title: 'Eliminar registro'
    });
    App.gpProfesiones.getSelectionModel().deselectAll();
    App.imgbtnEditar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
};

//Hacer la busqueda de información
var txtfBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sProfesiones.clearFilter();
    App.sProfesiones.filter([{ filterFn: function (item) {
        if (item.get('ID').toUpperCase().indexOf(newValue.toUpperCase()) > -1 || item.get('Descripcion').toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
    App.gpProfesiones.getSelectionModel().deselectAll();
    App.imgbtnEditar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
};

//Acciones que se lanzan cada ves que cambia el store
var sProfesiones_DataChanged = function () {
    if (App.sProfesiones.getCount() > 1 || App.sProfesiones.getCount() == 0) {
        App.sbProfesiones.setText(App.sProfesiones.getCount() + ' ' + 'PROFESIONES');
    }
    else {
        App.sbProfesiones.setText(App.sProfesiones.getCount() + ' ' + 'PROFESIÓN');
    }

    //Resize column Description when records are 11
    if (App.sProfesiones.getCount() > 10) {
        App.gpProfesiones.columns[1].setWidth(843);
    }
    else {
        App.gpProfesiones.columns[1].setWidth(860);
    }
};

//Validar la edición o un nuevo registro
var ceProfesiones_ValidateEdit = function (editor, context) {
    var store = App.gpProfesiones.getStore();

    //Convertir a mayusculas
    context.record.set(context.field, context.value.toUpperCase());

    //Si el campo a validar es el ID
    if (context.field == 'ID') {
        if (stateNuevo) {
            //Verificar si el campo esta repetido
            store.findBy(function (record) {
                if (context.value.toUpperCase() == record.data.ID.trim() && record.index != undefined) {
                    repetido = true;
                }
            });

            //Si es vacio lanzar un error
            if (context.value == '') {
                Ext.Msg.show({
                    id: 'msgID',
                    title: 'Error',
                    msg: 'Debes capturar un ID',
                    buttons: Ext.MessageBox.OK,
                    onEsc: Ext.emptyFn,
                    closable: false,
                    fn: function (btn) { if (btn === 'ok') { App.gpProfesiones.getStore().removeAt(context.rowIdx); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true); } },
                    icon: Ext.MessageBox.ERROR
                });
                repetido = true;
            }
            //Si el ID esta repetido lanzar un error
            else if (repetido) {
                Ext.Msg.show({
                    id: 'msgID',
                    title: 'Error',
                    msg: 'El ID ya existe',
                    buttons: Ext.MessageBox.OK,
                    fn: function (btn) { if (btn === 'ok') { App.gpProfesiones.getStore().removeAt(context.rowIdx); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true); } },
                    icon: Ext.MessageBox.ERROR
                });
            }
            else {
                App.direct.InsertarProfesion(context.value.toUpperCase(), {
                    success: function (result) {
                        if (result) {
                            repetido = true;
                            Ext.Msg.show({
                                id: 'msgID',
                                title: 'Error',
                                msg: 'El ID ya existe',
                                buttons: Ext.MessageBox.OK,
                                fn: function (btn) { if (btn === 'ok') { App.gpProfesiones.getStore().removeAt(context.rowIdx); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true); } },
                                icon: Ext.MessageBox.ERROR
                            });
                        }
                        else {
                            //Pasar al siguiente campo
                            if (App.gpProfesiones.enterWasPressed && !repetido) {
                                App.gpProfesiones.editingPlugin.startEdit(context.rowIdx, context.colIdx + 1);
                                App.gpProfesiones.enterWasPressed = false;
                            }
                        }
                    }
                });
            }
        }
        App.txtfID.setReadOnly(true);
        stateNuevo = false;
        repetido = false;
    }
    else if (context.field == 'Descripcion') {
        App.direct.ActualizarProfesion(store.getAt(context.rowIdx).get('ID'), context.value.toUpperCase());
    }
};

//Acciones al hacer clic en un registro
var gpProfesiones_ItemClick = function (gridview, registro, gvhtml, index) {
    App.imgbtnEditar.setDisabled(false);
    App.imgbtnBorrar.setDisabled(false);
    indice = index;
};