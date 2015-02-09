var stateNuevo = false;
var repetido = false;

//Insertar un nuevo registro en blanco
var imgbtnNuevo_Click = function () {
    //Get store of gridpanel
    var store = App.gpSubCategorias.getStore();
    //Get the total records
    var total = store.getCount();

    //Insert new record in the final
    store.insert(total, {});
    App.gpSubCategorias.getView().focusRow(total);
    App.gpSubCategorias.editingPlugin.startEdit(store.getAt(total), App.gpSubCategorias.columns[1]);

    //Bandera para indicar que es un nuevo registro
    stateNuevo = true;
};

//Editar el registro en el que se esta posicionado
var imgbtnEditar_Click = function () {
    //Get index of record selection
    var index = App.gpSubCategorias.getSelectionModel().getSelection()[0].index;
    //Get store of GridPanel
    var store = App.gpSubCategorias.getStore();
    //Enabled the edit option
    App.gpSubCategorias.editingPlugin.startEdit(App.gpSubCategorias.getStore().getAt(index), App.gpSubCategorias.columns[1]);
};

//Acciones al hacer clic en un registro
var gpSubCategorias_ItemClick = function () {
    App.imgbtnEditar.setDisabled(false);
    App.imgbtnBorrar.setDisabled(false);
};

//Validar la edición o un nuevo registro
var ceSubCategorias_ValidateEdit = function (editor, context) {
    var store = App.gpSubCategorias.getStore();
    var index = App.gpSubCategorias.getSelectionModel().getSelection()[0].index;

    //Si el campo a validar es la Categoria
    if (context.field == 'Categoria') {
        if (!stateNuevo) {
            App.direct.ActualizarSubCategoria(store.getAt(context.rowIdx).get('ID'), context.value, store.getAt(context.rowIdx).get('Orden'), store.getAt(context.rowIdx).get('Descripcion'));
        }
        App.gpSubCategorias.editingPlugin.startEdit(context.rowIdx, context.colIdx + 1);
    }
    //Si el campo a validar es el Orden
    else if (context.field == 'Orden') {
        //Verificar si el campo esta repetido
        store.findBy(function (record) {
            if (!stateNuevo && index == record.index) {
                return;
            }
            if (context.value == record.data.Orden && record.index != undefined) {
                repetido = true;
            }
        });

        //Si es cero lanzar un error
        if (context.value == '0') {
            Ext.Msg.show({
                id: 'msgOrden',
                title: 'Error',
                msg: 'Debes capturar un orden diferente a 0',
                buttons: Ext.MessageBox.OK,
                onEsc: Ext.emptyFn,
                closable: false,
                fn: function (btn) {
                    if (btn === 'ok') {
                        if (stateNuevo) {
                            App.gpSubCategorias.getStore().removeAt(context.rowIdx);
                        }
                        else {
                            context.record.set(context.field, context.originalValue);
                        }
                        stateNuevo = false;
                        repetido = false;
                    }
                },
                icon: Ext.MessageBox.ERROR
            });
        }
        //Si el Orden esta repetido lanzar un error
        else if (repetido) {
            Ext.Msg.show({
                id: 'msgOrden',
                title: 'Error',
                msg: 'El Orden ya existe',
                buttons: Ext.MessageBox.OK,
                fn: function (btn) {
                    if (btn === 'ok') {
                        if (stateNuevo) {
                            App.gpSubCategorias.getStore().removeAt(context.rowIdx);
                        }
                        else {
                            context.record.set(context.field, context.originalValue);
                        }
                        stateNuevo = false;
                        repetido = false;
                    }
                },
                icon: Ext.MessageBox.ERROR
            });
        }
        else {
            if (stateNuevo) {
                App.direct.InsertarSubCategoria(context.value, store.getAt(store.getCount() - 1).data.Categoria, {
                    success: function (result) {
                        if (result.substr(0, result.indexOf('|')) == "true") {
                            repetido = true;
                            Ext.Msg.show({
                                id: 'msgOrden',
                                title: 'Error',
                                msg: 'El Orden ya existe',
                                buttons: Ext.MessageBox.OK,
                                fn: function (btn) {
                                    if (btn === 'ok') {
                                        if (stateNuevo) {
                                            App.gpSubCategorias.getStore().removeAt(context.rowIdx);
                                        }
                                        else {
                                            context.record.set(context.field, context.originalValue);
                                        }
                                        stateNuevo = false;
                                        repetido = false;
                                    }
                                },
                                icon: Ext.MessageBox.ERROR
                            });
                        }
                        else {
                            //Asignar el ID
                            context.record.set('ID', result.substr(result.indexOf('|') + 1, result.length));
                        }
                    }
                });
            }
            else {
                App.direct.ActualizarSubCategoria(store.getAt(context.rowIdx).get('ID'), store.getAt(context.rowIdx).get('Categoria'), context.value, store.getAt(context.rowIdx).get('Descripcion'));
            }
            //Pasar al siguiente campo
            if (App.gpSubCategorias.enterWasPressed && !repetido) {
                App.gpSubCategorias.editingPlugin.startEdit(context.rowIdx, context.colIdx + 1);
                App.gpSubCategorias.enterWasPressed = false;
            }
            stateNuevo = false;
            repetido = false;
        }
    }
    else if (context.field == 'Descripcion') {
        //Convertir a mayusculas
        context.record.set(context.field, context.value.toUpperCase());
        App.direct.ActualizarSubCategoria(store.getAt(context.rowIdx).get('ID'), store.getAt(context.rowIdx).get('Categoria'), store.getAt(context.rowIdx).get('Orden'), context.value.toUpperCase());
    }
};

//Para el botón de eliminar, Eliminar un registro
var imgbtnBorrar_Click = function () {
    var identificador = App.gpSubCategorias.getSelectionModel().getSelection()[0].get('ID');
    var indice = App.gpSubCategorias.getStore().find('ID', identificador);
    var descripcion = App.sSubCategorias.getAt(indice).get('Descripcion');
    App.direct.EliminarSubCategoria(identificador);
    App.gpSubCategorias.getStore().removeAt(indice);
    Ext.net.Notification.show({
        iconCls: 'icon-delete',
        pinEvent: 'click',
        header: true,
        width: 350,
        html: '<p class="deletePop">ID: ' + identificador + '</p><p class="deletePop">Descripción: ' + descripcion + '</p>',
        title: 'Eliminar registro'
    });
};

//Hacer la busqueda de información
var txtBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sSubCategorias.clearFilter();
    App.sSubCategorias.filter([{ filterFn: function (item) {
        if (item.get('ID').toUpperCase().indexOf(newValue.toUpperCase()) > -1 || item.get('Descripcion').toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
};

//Acciones que se lanzan cada ves que cambia el store
var sSubCategorias_DataChanged = function () {
    if (App.sSubCategorias.getCount() > 1) {
        App.sbSubCategorias.setText(App.sSubCategorias.getCount() + ' ' + 'SUBCATEGORÍAS');
    }
    else {
        App.sbSubCategorias.setText(App.sSubCategorias.getCount() + ' ' + 'SUBCATEGORÍA');
    }

    //Resize column Description when records are 11
    if (App.sSubCategorias.getCount() > 10) {
        App.gpSubCategorias.columns[3].setWidth(483);
    }
    else {
        App.gpSubCategorias.columns[3].setWidth(500);
    }
};