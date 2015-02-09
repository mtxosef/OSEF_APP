var stateNuevo = false;
var repetido = false;
var indice = 0;

//Insertar un nuevo registro en blanco
var imgbtnNuevo_Click = function () {
    //Get store of gridpanel
    var store = App.gpFinalidades.getStore();
    //Get the total records
    var total = store.getCount();

    //Insert new record in the final
    store.insert(total, {});
    App.gpFinalidades.getView().focusRow(total);
    App.gpFinalidades.getSelectionModel().select(total);
    App.gpFinalidades.editingPlugin.startEdit(store.getAt(total), App.gpFinalidades.columns[0]);

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
    var index = App.gpFinalidades.getSelectionModel().getSelection()[0].index;

    //Validar si el indice esta como indefinido
    if (index == undefined) {
        index = indice;
    }

    //Get store of GridPanel
    var store = App.gpFinalidades.getStore();

    //Enabled the edit option
    App.gpFinalidades.editingPlugin.startEdit(App.gpFinalidades.getStore().getAt(index), App.gpFinalidades.columns[1]);
};

//Para el botón de eliminar, Eliminar un registro
var imgbtnBorrar_Click = function () {
    var identificador = App.gpFinalidades.getSelectionModel().getSelection()[0].get('ID');
    var indice = App.gpFinalidades.getStore().find('ID', identificador);
    var descripcion = App.sFinalidades.getAt(indice).get('Descripcion');
    App.direct.EliminarFinalidad(identificador);
    App.gpFinalidades.getStore().removeAt(indice);
    Ext.net.Notification.show({
        iconCls: 'icon-delete',
        pinEvent: 'click',
        header: true,
        width: 200,
        html: '<p class="deletePop">ID: ' + identificador + '</p><p class="deletePop">Descripción: ' + descripcion + '</p>',
        title: 'Eliminar registro'
    });
    App.gpFinalidades.getSelectionModel().deselectAll();
    App.imgbtnEditar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
};

//Hacer la busqueda de información
var txtfBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sFinalidades.clearFilter();
    App.sFinalidades.filter([{ filterFn: function (item) {
        if (item.get('ID').toUpperCase().indexOf(newValue.toUpperCase()) > -1 || item.get('Descripcion').toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
    App.gpFinalidades.getSelectionModel().deselectAll();
    App.imgbtnEditar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
};

//Acciones que se lanzan cada ves que cambia el store
var sFinalidades_DataChanged = function () {
    if (App.sFinalidades.getCount() > 1 || App.sFinalidades.getCount() == 0) {
        App.sbFinalidades.setText(App.sFinalidades.getCount() + ' ' + 'FINALIDADES');
    }
    else {
        App.sbFinalidades.setText(App.sFinalidades.getCount() + ' ' + 'FINALIDAD');
    }

    //Resize column Description when records are 11
    if (App.sFinalidades.getCount() > 10) {
        App.gpFinalidades.columns[1].setWidth(843);
    }
    else {
        App.gpFinalidades.columns[1].setWidth(860);
    }
};

//Validar la edición o un nuevo registro
var ceFinalidades_ValidateEdit = function (editor, context) {
    var store = App.gpFinalidades.getStore();

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
                    fn: function (btn) { if (btn === 'ok') { App.gpFinalidades.getStore().removeAt(context.rowIdx); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true); } },
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
                    fn: function (btn) { if (btn === 'ok') { App.gpFinalidades.getStore().removeAt(context.rowIdx); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true); } },
                    icon: Ext.MessageBox.ERROR
                });
            }
            else {
                App.direct.InsertarFinalidad(context.value.toUpperCase(), {
                    success: function (result) {
                        if (result) {
                            repetido = true;
                            Ext.Msg.show({
                                id: 'msgID',
                                title: 'Error',
                                msg: 'El ID ya existe',
                                buttons: Ext.MessageBox.OK,
                                fn: function (btn) { if (btn === 'ok') { App.gpFinalidad.getStore().removeAt(context.rowIdx); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true); } },
                                icon: Ext.MessageBox.ERROR
                            });
                        }
                        else {
                            //Pasar al siguiente campo
                            if (App.gpFinalidades.enterWasPressed && !repetido) {
                                App.gpFinalidades.editingPlugin.startEdit(context.rowIdx, context.colIdx + 1);
                                App.gpFinalidades.enterWasPressed = false;
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
        App.direct.ActualizarFinalidad(store.getAt(context.rowIdx).get('ID'), context.value.toUpperCase());
    }
};

//Acciones al hacer clic en un registro
var gpFinalidades_ItemClick = function () {
    App.imgbtnEditar.setDisabled(false);
    App.imgbtnBorrar.setDisabled(false);
    indice = index;
};