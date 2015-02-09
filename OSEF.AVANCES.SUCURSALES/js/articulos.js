var stateNuevo = false;
var repetido = false;
var indice = 0;

//Insertar un nuevo registro en blanco
var imgbtnNuevo_Click = function () {
    //Get store of gridpanel
    var store = App.gpArticulos.getStore();
    //Get the total records
    var total = store.getCount();

    //Insert new record in the final
    store.insert(total, {});
    App.gpArticulos.getView().focusRow(total);
    App.gpArticulos.getSelectionModel().select(total);
    App.gpArticulos.editingPlugin.startEdit(store.getAt(total), App.gpArticulos.columns[0]);

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
    var index = App.gpArticulos.getSelectionModel().getSelection()[0].index;

    //Validar si el indice esta como indefinido
    if (index == undefined) {
        index = indice;
    }

    //Get store of GridPanel
    var store = App.gpArticulos.getStore();

    //Enabled the edit option
    App.gpArticulos.editingPlugin.startEdit(App.gpArticulos.getStore().getAt(index), App.gpArticulos.columns[1]);
};

//Para el botón de eliminar, Eliminar un registro
var imgbtnBorrar_Click = function () {
    var identificador = App.gpArticulos.getSelectionModel().getSelection()[0].get('ID');
    var indice = App.gpArticulos.getStore().find('ID', identificador);
    var corta = App.sArticulos.getAt(indice).get('Corta');
    App.direct.EliminarArticulo(identificador);
    App.gpArticulos.getStore().removeAt(indice);
    Ext.net.Notification.show({
        iconCls: 'icon-delete',
        pinEvent: 'click',
        header: true,
        width: 200,
        html: '<p class="deletePop">ID: ' + identificador + '</p><p class="deletePop">Descripción corta: ' + corta + '</p>',
        title: 'Eliminar registro'
    });
    App.gpArticulos.getSelectionModel().deselectAll();
    App.imgbtnEditar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
};

//Hacer la busqueda de información
var txtfBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sArticulos.clearFilter();
    App.sArticulos.filter([{ filterFn: function (item) {
        if (item.get('ID').toUpperCase().indexOf(newValue.toUpperCase()) > -1 || item.get('Corta').toUpperCase().indexOf(newValue.toUpperCase()) > -1 || item.get('Descripcion').toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
    App.gpArticulos.getSelectionModel().deselectAll();
    App.imgbtnEditar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
};

//Acciones que se lanzan cada ves que cambia el store
var sArticulos_DataChanged = function () {
    if (App.sArticulos.getCount() > 1 || App.sArticulos.getCount() == 0) {
        App.sbArticulos.setText(App.sArticulos.getCount() + ' ' + 'ARTÍCULOS');
    }
    else {
        App.sbArticulos.setText(App.sArticulos.getCount() + ' ' + 'ARTÍCULO');
    }

    //Resize column Description when records are 11
    if (App.sArticulos.getCount() > 10) {
        App.gpArticulos.columns[2].setWidth(493);
    }
    else {
        App.gpArticulos.columns[2].setWidth(510);
    }
};

//Validar la edición o un nuevo registro
var ceArticulos_ValidateEdit = function (editor, context) {
    var store = App.gpArticulos.getStore();

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
                    fn: function (btn) { if (btn === 'ok') { App.gpArticulos.getStore().removeAt(context.rowIdx); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true); } },
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
                    fn: function (btn) { if (btn === 'ok') { App.gpArticulos.getStore().removeAt(context.rowIdx); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true); } },
                    icon: Ext.MessageBox.ERROR
                });
            }
            else {
                App.direct.InsertarArticulo(context.value.toUpperCase(), {
                    success: function (result) {
                        if (result) {
                            repetido = true;
                            Ext.Msg.show({
                                id: 'msgID',
                                title: 'Error',
                                msg: 'El ID ya existe',
                                buttons: Ext.MessageBox.OK,
                                fn: function (btn) { if (btn === 'ok') { App.gpArticulos.getStore().removeAt(context.rowIdx); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true); } },
                                icon: Ext.MessageBox.ERROR
                            });
                        }
                        else {
                            //Pasar al siguiente campo
                            if (App.gpArticulos.enterWasPressed && !repetido) {
                                App.gpArticulos.editingPlugin.startEdit(context.rowIdx, context.colIdx + 1);
                                App.gpArticulos.enterWasPressed = false;
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
    else if (context.field == 'Corta') {
        if (App.gpArticulos.enterWasPressed) {
            App.gpArticulos.editingPlugin.startEdit(context.rowIdx, context.colIdx + 1);
            App.gpArticulos.enterWasPressed = false;
        }
        App.direct.ActualizarArticulo(store.getAt(context.rowIdx).get('ID'), context.value.toUpperCase(), store.getAt(context.rowIdx).get('Descripcion'));
    }
    else if (context.field == 'Descripcion') {
        App.direct.ActualizarArticulo(store.getAt(context.rowIdx).get('ID'), store.getAt(context.rowIdx).get('Corta'), context.value.toUpperCase());
    }
};

//Acciones al hacer clic en un registro
var gpArticulos_ItemClick = function (gridview, registro, gvhtml, index) {
    App.imgbtnEditar.setDisabled(false);
    App.imgbtnBorrar.setDisabled(false);
    indice = index;
};