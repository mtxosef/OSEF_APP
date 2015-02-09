var stateNuevo = false;
var repetido = false;
var indice = 0;

//Insertar un nuevo registro en blanco
var imgbtnNuevo_Click = function () {
    //Get store of gridpanel
    var store = App.gpMunicipios.getStore();
    //Get the total records
    var total = store.getCount();

    //Insert new record in the final
    store.insert(total, {});
    App.gpMunicipios.getView().focusRow(total);
    App.gpMunicipios.getSelectionModel().select(total);
    App.gpMunicipios.editingPlugin.startEdit(store.getAt(total), App.gpMunicipios.columns[0]);

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
    var index = App.gpMunicipios.getSelectionModel().getSelection()[0].index;

    //Validar si el indice esta como indefinido
    if (index == undefined) {
        index = indice;
    }

    //Get store of GridPanel
    var store = App.gpMunicipios.getStore();

    //Enabled the edit option
    App.gpMunicipios.editingPlugin.startEdit(App.gpMunicipios.getStore().getAt(index), App.gpMunicipios.columns[1]);
};

//Para el botón de eliminar, Eliminar un registro
var imgbtnBorrar_Click = function () {
    var identificador = App.gpMunicipios.getSelectionModel().getSelection()[0].get('ID');
    var indice = App.gpMunicipios.getStore().find('ID', identificador);
    var descripcion = App.sMunicipios.getAt(indice).get('Descripcion');
    App.direct.EliminarMunicipio(identificador);
    App.gpMunicipios.getStore().removeAt(indice);
    Ext.net.Notification.show({
        iconCls: 'icon-delete',
        pinEvent: 'click',
        header: true,
        width: 350,
        html: '<p class="deletePop">ID: ' + identificador + '</p><p class="deletePop">Descripcion: ' + descripcion + '</p>',
        title: 'Eliminar registro'
    });
    App.gpMunicipios.getSelectionModel().deselectAll();
    App.imgbtnEditar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
};

//Hacer la busqueda de información
var txtfBuscar_Change = function (textfield, newValue, oldValue, e) {
    App.sMunicipios.clearFilter();
    App.sMunicipios.filter([{ filterFn: function (item) {
        if (item.get('ID').toUpperCase().indexOf(newValue.toUpperCase()) > -1 || item.get('Descripcion').toUpperCase().indexOf(newValue.toUpperCase()) > -1) { return true; }
        else { return false; }
    }
    }]);
    App.gpMunicipios.getSelectionModel().deselectAll();
    App.imgbtnEditar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
};

//Acciones que se lanzan cada ves que cambia el store
var sMunicipios_DataChanged = function () {
    if (App.sMunicipios.getCount() > 1 || App.sMunicipios.getCount() == 0) {
        App.sbMunicipios.setText(App.sMunicipios.getCount() + ' ' + 'MUNICIPIOS');
    }
    else {
        App.sbMunicipios.setText(App.sMunicipios.getCount() + ' ' + 'MUNICIPIO');
    }

    //Resize column Description when records are 11
    if (App.sMunicipios.getCount() > 10) {
        App.gpMunicipios.columns[2].setWidth(383);
    }
    else {
        App.gpMunicipios.columns[2].setWidth(400);
    }
};

//Validar la edición o un nuevo registro
var ceMunicipios_ValidateEdit = function (editor, context) {
    var store = App.gpMunicipios.getStore();

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
                    fn: function (btn) { if (btn === 'ok') { App.gpMunicipios.getStore().removeAt(context.rowIdx); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true); } },
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
                    fn: function (btn) { if (btn === 'ok') { App.gpMunicipios.getStore().removeAt(context.rowIdx); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true); } },
                    icon: Ext.MessageBox.ERROR
                });
            }
            else {
                App.direct.ObtenerMunicipio(context.value.toUpperCase(), {
                    success: function (result) {
                        if (result) {
                            repetido = true;
                            Ext.Msg.show({
                                id: 'msgID',
                                title: 'Error',
                                msg: 'El ID ya existe',
                                buttons: Ext.MessageBox.OK,
                                fn: function (btn) { if (btn === 'ok') { App.gpMunicipios.getStore().removeAt(context.rowIdx); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true); } },
                                icon: Ext.MessageBox.ERROR
                            });
                        }
                        else {
                            //Pasar al siguiente campo
                            if (App.gpMunicipios.enterWasPressed && !repetido) {
                                App.gpMunicipios.editingPlugin.startEdit(context.rowIdx, context.colIdx + 1);
                                App.gpMunicipios.enterWasPressed = false;
                            }
                        }
                    }
                });
            }
        }
        App.txtfID.setReadOnly(true);
        repetido = false;
    }
    else if (context.field == 'Descripcion') {
        if (stateNuevo) {
            App.direct.ObtenerMunicipio(context.value.toUpperCase(), {
                success: function (result) {
                    if (result) {
                        repetido = true;
                        Ext.Msg.show({
                            id: 'msgID',
                            title: 'Error',
                            msg: 'El ID ya existe',
                            buttons: Ext.MessageBox.OK,
                            fn: function (btn) { if (btn === 'ok') { App.gpMunicipios.getStore().removeAt(context.rowIdx); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true); } },
                            icon: Ext.MessageBox.ERROR
                        });
                    }
                    else {
                        //Pasar al siguiente campo
                        if (App.gpMunicipios.enterWasPressed && !repetido) {
                            App.gpMunicipios.editingPlugin.startEdit(context.rowIdx, context.colIdx + 1);
                            App.gpMunicipios.enterWasPressed = false;
                        }
                    }
                }
            });
        }
        else {
            App.direct.ActualizarMunicipio(store.getAt(context.rowIdx).get('ID'), context.value.toUpperCase(), store.getAt(context.rowIdx).get('Estado'));
            //Pasar al siguiente campo
            if (App.gpMunicipios.enterWasPressed && !repetido) {
                App.gpMunicipios.editingPlugin.startEdit(context.rowIdx, context.colIdx + 1);
                App.gpMunicipios.enterWasPressed = false;
            }
        }
    }
    else if (context.field == 'Estado') {
        if (stateNuevo) {
            App.direct.InsertarMunicipio(store.getAt(context.rowIdx).get('ID'), store.getAt(context.rowIdx).get('Descripcion'), context.value.toUpperCase(), {
                success: function (result) {
                    if (result) {
                        repetido = true;
                        Ext.Msg.show({
                            id: 'msgID',
                            title: 'Error',
                            msg: 'El ID ya existe',
                            buttons: Ext.MessageBox.OK,
                            fn: function (btn) { if (btn === 'ok') { App.gpMunicipios.getStore().removeAt(context.rowIdx); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true); } },
                            icon: Ext.MessageBox.ERROR
                        });
                    }
                }
            });
            stateNuevo = false;
        }
        else {
            App.direct.ActualizarMunicipio(store.getAt(context.rowIdx).get('ID'), store.getAt(context.rowIdx).get('Descripcion'), context.value.toUpperCase());
        }
    }
};

//Acciones al hacer clic en un registro
var gpMunicipios_ItemClick = function (gridview, registro, gvhtml, index) {
    App.imgbtnEditar.setDisabled(false);
    App.imgbtnBorrar.setDisabled(false);
    indice = index;
};

//Asignar la descripción del estado a esta columna
var cEstado_Renderer = function (valor, columna, registro) {
    if (valor.length != 0) {
        var estado = App.sEstados.findRecord('ID', valor);
        return estado.get('Descripcion');
    }
};

//Evento que hace el filtro al seleccionar algun elemento
var cmbEstadosFiltro_Select = function (combobox, registro) {
    //1. Obtener el valor
    var valor = registro[0].get('ID');

    //2. Validar si es todos o hacer el filtro, sino si hace el filtro por Estado
    if (valor == 'Todos') {
        App.sMunicipios.clearFilter();
    }
    else {
        App.sMunicipios.filterBy(function (elemento) {
            console.log(elemento);
            if (elemento.get('Estado') == valor) {
                return true
            }
            else {
                return false;
            }
        });
    }
};