var stateNuevo = false;
var repetido = false;
var indice = 0;

//Insertar un nuevo registro en blanco
var imgbtnNuevo_Click = function () {
    //Get store of gridpanel
    var store = App.gpEstados.getStore();
    //Get the total records
    var total = store.getCount();

    //Insert new record in the final
    store.insert(total, {});
    App.gpEstados.getView().focusRow(total);
    App.gpEstados.getSelectionModel().select(total);
    App.gpEstados.editingPlugin.startEdit(store.getAt(total), App.gpEstados.columns[0]);

    //Bandera para indicar que es un nuevo registro
    stateNuevo = true;
    App.txtID.setReadOnly(false);
    indice = total;
    App.imgbtnEditar.setDisabled(false);
    App.imgbtnBorrar.setDisabled(false);
};

//Editar el registro en el que se esta posicionado
var imgbtnEditar_Click = function () {
    //Get index of record selection
    var index = App.gpEstados.getSelectionModel().getSelection()[0].index;

    //Validar si el indice esta como indefinido
    if (index == undefined) {
        index = indice;
    }

    //Get store of GridPanel
    var store = App.gpEstados.getStore();

    //Enabled the edit option
    App.gpEstados.editingPlugin.startEdit(App.gpEstados.getStore().getAt(index), App.gpEstados.columns[1]);
};

//Para el botón de eliminar, Eliminar un registro
var imgbtnBorrar_Click = function () {
    var identificador = App.gpEstados.getSelectionModel().getSelection()[0].get('ID');
    var indice = App.gpEstados.getStore().find('ID', identificador);
    var abreviatura = App.sEstados.getAt(indice).get('Abreviatura');
    App.direct.EliminarEstado(identificador);
    App.gpEstados.getStore().removeAt(indice);
    Ext.net.Notification.show({
        iconCls: 'icon-delete',
        pinEvent: 'click',
        header: true,
        width: 200,
        html: '<p class="deletePop">ID: ' + identificador + '</p><p class="deletePop">Abreviatura: ' + abreviatura + '</p>',
        title: 'Eliminar registro'
    });
    App.gpEstados.getSelectionModel().deselectAll();
    App.imgbtnEditar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
};

//Hacer la busqueda de información
var txtfBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sEstados.clearFilter();
    App.sEstados.filter([{ filterFn: function (item) {
        if (item.get('ID').toUpperCase().indexOf(newValue.toUpperCase()) > -1 || item.get('Abreviatura').toUpperCase().indexOf(newValue.toUpperCase()) > -1 || item.get('Descripcion').toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
    App.gpEstados.getSelectionModel().deselectAll();
    App.imgbtnEditar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
};

//Acciones que se lanzan cada ves que cambia el store
var sEstados_DataChanged = function () {
    if (App.sEstados.getCount() > 1 || App.sEstados.getCount() == 0) {
        App.sbEstados.setText(App.sEstados.getCount() + ' ' + 'ESTADOS');
    }
    else {
        App.sbEstados.setText(App.sEstados.getCount() + ' ' + 'ESTADO');
    }

    //Resize column Description when records are 11
    if (App.sEstados.getCount() > 10) {
        App.gpEstados.columns[2].setWidth(720);
    }
    else {
        App.gpEstados.columns[2].setWidth(740);
    }
};

//Validar la edición o un nuevo registro
var ceEstados_ValidateEdit = function (editor, context) {
    var store = App.gpEstados.getStore();

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
                    fn: function (btn) { if (btn === 'ok') { App.gpEstados.getStore().removeAt(context.rowIdx); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true); } },
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
                    fn: function (btn) { if (btn === 'ok') { App.gpEstados.getStore().removeAt(context.rowIdx); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true); } },
                    icon: Ext.MessageBox.ERROR
                });
            }
            else {
                App.direct.InsertarEstado(context.value.toUpperCase(), {
                    success: function (result) {
                        if (result) {
                            repetido = true;
                            Ext.Msg.show({
                                id: 'msgID',
                                title: 'Error',
                                msg: 'El ID ya existe',
                                buttons: Ext.MessageBox.OK,
                                fn: function (btn) { if (btn === 'ok') { App.gpEstados.getStore().removeAt(context.rowIdx); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true); } },
                                icon: Ext.MessageBox.ERROR
                            });
                        }
                        else {
                            //Pasar al siguiente campo
                            if (App.gpEstados.enterWasPressed && !repetido) {
                                App.gpEstados.editingPlugin.startEdit(context.rowIdx, context.colIdx + 1);
                                App.gpEstados.enterWasPressed = false;
                            }
                        }
                    }
                });
            }
        }
        App.txtID.setReadOnly(true);
        stateNuevo = false;
        repetido = false;
    }
    else if (context.field == 'Abreviatura') {
        if (App.gpEstados.enterWasPressed) {
            App.gpEstados.editingPlugin.startEdit(context.rowIdx, context.colIdx + 1);
            App.gpEstados.enterWasPressed = false;
        } 
        App.direct.ActualizarEstado(store.getAt(context.rowIdx).get('ID'), context.value.toUpperCase(), store.getAt(context.rowIdx).get('Descripcion'));
    }
    else if (context.field == 'Descripcion') {
        App.direct.ActualizarEstado(store.getAt(context.rowIdx).get('ID'), store.getAt(context.rowIdx).get('Abreviatura'), context.value.toUpperCase());
    }
};

//Acciones al hacer clic en un registro
var gpEstados_ItemClick = function () {
    App.imgbtnEditar.setDisabled(false);
    App.imgbtnBorrar.setDisabled(false);
    indice = index;
};