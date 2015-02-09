//Variables gloables
var estadoNuevo = false;
var estadoEditar = false;
var indice = 0;

//Evento que se lanza al seleccionar un elemento del nodo
var tpCuentasContables_SelectionChange = function (treemodel, nodos, opciones) {
    //1. Validar que se lance cuando no se hace un nuevo registro
    if (!estadoNuevo && !estadoEditar) {
        //2. Actualizar nodo seleccionado
        App.direct.NodoHijos(App.tpCuentasContables.getSelectionModel().getSelection()[0].getId(), {
            //2. Si e proceso es correcto
            success: function (result) {
                if (App.sCuentasContables.getCount() === 0) {
                    LimpiarCampos();
                    App.imgbtnEditar.setDisabled(true);
                    App.imgbtnBorrar.setDisabled(true);
                }
                else {
                    App.gpCuentasContables.getSelectionModel().select(0);
                }
            },

            //3. Si existe un error
            failure: function (errorMsg) {
                Ext.Msg.alert('Error', errorMsg);
            }
        });
    }
};

//Acciones al hacer clic en un registro
var gpCuentasContables_Select = function (gridview, registro, index, gvhtml) {
    //1. Validar que se lance cuando no se hace un nuevo registro
    if (!estadoNuevo && !estadoEditar) {
        //2. Habilitar los botones de editar y borrar
        App.imgbtnEditar.setDisabled(false);
        App.imgbtnBorrar.setDisabled(false);
        indice = index;

        //3. Asignar los datos en los campos
        App.txtfCuenta.setValue(registro.get('Cuenta'));
        App.txtfDescripcion.setValue(registro.get('Descripcion'));
        App.cmbTipo.setValue(registro.get('Tipo'));
        App.cmbRama.setValue(registro.get('Rama'));
        App.txtfDescripcionRama.setValue(registro.get('DescripcionRama'));
        App.cmbEstatus.setValue(registro.get('Estatus'));
    }
};

//Evento que se lanza al abrir un nodo del TreePanel
var tpCuentasContables_BeforeLoad = function (store, operation, options) {
    //1. Obtener el nodo que se abre
    var node = operation.node;

    //2. Construir los nodos hijos
    App.direct.GenerarNodo(node.getId(), {
        success: function (result) {
            node.set('loading', false);
            node.set('loaded', true);
            var data = Ext.decode(result);
            if (data.length != 0) {
                node.appendChild(data, undefined, true);
                node.expand();
            }
        },

        failure: function (errorMsg) {
            Ext.Msg.alert('Error', errorMsg);
        }
    });

    //3. Regresar falso para no lanzar el Load
    return false;
};

//Insertar un nuevo registro en blanco
var imgbtnNuevo_Click = function (imagebutton, evento, opciones) {
    //1. Activar variable global e iniciar modelo
    estadoNuevo = true;
    var modelo = App.sRama.findRecord('Cuenta', App.tpCuentasContables.getSelectionModel().getSelection()[0].getId());

    //2. Campos y Botones a deshabilitar o habilitar
    HabilitarCampos();
    App.imgbtnNuevo.setDisabled(true);
    App.imgbtnEditar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
    App.imgbtnCancelar.setDisabled(false);

    //3. Inicializar campos
    LimpiarCampos();
    App.cmbEstatus.setValue('ALTA');
    App.cmbRama.select(modelo.get('Cuenta'));
    App.txtfDescripcionRama.setValue(modelo.get('Descripcion'));
    App.txtfCuenta.focus();
};

//Editar un registro
var imgbtnEditar_Click = function (imagebutton, evento, opciones) {
    //1. Campos y Botones a deshabilitar o habilitar
    HabilitarCampos();
    App.imgbtnNuevo.setDisabled(true);
    App.imgbtnEditar.setDisabled(true);
    App.imgbtnBorrar.setDisabled(true);
    App.imgbtnCancelar.setDisabled(false);
    App.imgbtnGuardar.setDisabled(false);

    //2. Dejar forma lista para modificar
    App.txtfCuenta.setDisabled(true);
    App.cmbEstatus.setDisabled(false);
    App.txtfDescripcion.focus();

    estadoEditar = true;
};

//Eliminar un registro
var imgbtnBorrar_Click = function (imagebutton, evento, opciones) {
    App.direct.EliminarRegistro(App.txtfCuenta.getValue(), {
        success: function (result) {
            //3. Actualizar el store para reflejar el nuevo registro
            App.direct.NodoHijos(App.tpCuentasContables.getSelectionModel().getSelection()[0].getId(), {
                //4. Si el proceso es correcto
                success: function (result) {
                    App.gpCuentasContables.getSelectionModel().deselectAll();
                    App.imgbtnEditar.setDisabled(true);
                    App.imgbtnBorrar.setDisabled(true);
                    LimpiarCampos();
                },

                //5. Si existe un error
                failure: function (errorMsg) {
                    Ext.Msg.alert('Error', errorMsg);
                }
            });

            //2. Mandar mensaje de confirmación
            Ext.net.Notification.show({
                iconCls: 'icon-delete',
                pinEvent: 'click',
                header: true,
                width: 200,
                html: '<p class="deletePop">ID: ' + App.txtfCuenta.getValue() + '</p><p class="deletePop">Descripción: ' + App.txtfDescripcion.getValue() + '</p>',
                title: 'Eliminar registro'
            });
        },

        failure: function (errorMsg) {
            Ext.Msg.alert('Error', errorMsg);
        }
    });
};

//Cancelar el editar o dar de alta un nuevo registro
var imgbtnCancelar_Click = function (imagebutton, evento, opciones) {
    //1. Validar si no hay registros, limpir los campos
    if (App.sCuentasContables.getCount() === 0) {
        LimpiarCampos();
    }
    else {
        //2. Obtener el registro seleccionado
        var registro = App.gpCuentasContables.getSelectionModel().getSelection()[0];
        //3. Asignar los datos en los campos
        AsignarCampos(registro);
    }

    //4. Deshabilitar o habilitar campos y botones
    DeshabilitarCampos();
    App.imgbtnNuevo.setDisabled(false);
    App.imgbtnEditar.setDisabled(false);
    App.imgbtnBorrar.setDisabled(false);
    App.imgbtnCancelar.setDisabled(true);
    App.imgbtnGuardar.setDisabled(true);

    //5. Desactivar variable global
    estadoNuevo = false;
    estadoEditar = false;
};

//Guardar un registro nuevo y con edición
var imgbtnGuardar_Click = function (imagebutton, evento, opciones) {
    if (estadoNuevo) {
        //1. Mandar llamar método para agregar un registro nuevo
        App.direct.NuevoRegistro(App.txtfCuenta.getValue(), App.txtfDescripcion.getValue(), App.cmbTipo.getValue(), App.cmbRama.getValue(), App.cmbEstatus.getValue(), {
            //2. Si se agrego bien el registro
            success: function (result) {
                //3. Actualizar el store para reflejar el nuevo registro
                App.direct.NodoHijos(App.tpCuentasContables.getSelectionModel().getSelection()[0].getId(), {
                    //4. Si el proceso es correcto
                    success: function (result) {
                        App.gpCuentasContables.getSelectionModel().deselectAll();
                    },

                    //5. Si existe un error
                    failure: function (errorMsg) {
                        Ext.Msg.alert('Error', errorMsg);
                    }
                });

                //6. Mandar mensaje de confirmación
                Ext.Msg.alert(
                'Registro completo',
                "<p align='center'>Cuenta registrada: <br/>" + result + ".</p>",
                function (buttonId, text, message) {
                    //7. Deshabilitar o habilitar campos y botones
                    DeshabilitarCampos();
                    App.imgbtnNuevo.setDisabled(false);
                    App.imgbtnEditar.setDisabled(false);
                    App.imgbtnBorrar.setDisabled(false);
                    App.imgbtnGuardar.setDisabled(true);
                    App.imgbtnCancelar.setDisabled(true);

                    //8. Desactivar variable global y asignar el registro
                    estadoNuevo = false;
                    var storeIndice = App.sCuentasContables.findExact('Cuenta', result);

                    //9. Validar si el registro esta en el nodo o no
                    if (storeIndice !== -1) {
                        App.gpCuentasContables.getSelectionModel().select(storeIndice);
                    }
                    else {
                        if (App.sCuentasContables.getCount() === 0) {
                            LimpiarCampos();
                        }
                        else {
                            App.gpCuentasContables.getSelectionModel().select(0);
                        }
                    }
                }
            );
            },

            //10. Si existe un error
            failure: function (errorMsg) {
                Ext.Msg.alert('Error', errorMsg);
            }
        });
    }
    else {
        //11. Método que actualiza el registro
        App.direct.EditarRegistro(App.txtfCuenta.getValue(), App.txtfDescripcion.getValue(), App.cmbTipo.getValue(), App.cmbRama.getValue(), App.cmbEstatus.getValue(), {
            //12. Si se agrego bien el registro
            success: function (result) {
                App.direct.NodoHijos(App.tpCuentasContables.getSelectionModel().getSelection()[0].getId(), {
                    success: function (result) {
                        App.gpCuentasContables.getSelectionModel().deselectAll();
                    },

                    failure: function (errorMsg) {
                        Ext.Msg.alert('Error', errorMsg);
                    }
                });

                //13. Mandar mensaje de confirmación
                Ext.Msg.alert(
                'Registro actualizado',
                "<p align='center'>Cuenta actualizada: <br/>" + result + ".</p>",
                function (buttonId, text, message) {
                    //14. Deshabilitar o habilitar campos y botones
                    DeshabilitarCampos();
                    App.imgbtnNuevo.setDisabled(false);
                    App.imgbtnEditar.setDisabled(false);
                    App.imgbtnBorrar.setDisabled(false);
                    App.imgbtnGuardar.setDisabled(true);
                    App.imgbtnCancelar.setDisabled(true);

                    //15. Desactivar variable global y asignar el registro
                    estadoEditar = false;
                    var storeIndice = App.sCuentasContables.findExact('Cuenta', result);

                    //16. Validar si el registro esta en el nodo o no
                    if (storeIndice !== -1) {
                        App.gpCuentasContables.getSelectionModel().select(storeIndice);
                    }
                    else {
                        if (App.sCuentasContables.getCount() === 0) {
                            LimpiarCampos();
                        }
                        else {
                            App.gpCuentasContables.getSelectionModel().select(0);
                        }
                    }
                });
            },

            //17. Si existe un error
            failure: function (errorMsg) {
                Ext.Msg.alert('Error', errorMsg);
            }
        });
    }
};

//Actualizar datos
var imgbtnActualizar_Click = function (imagebutton, evento, opciones) {
    App.direct.NodoHijos(App.tpCuentasContables.getSelectionModel().getSelection()[0].getId(), {
        success: function (result) {
            App.gpCuentasContables.getSelectionModel().select(0);
        },

        failure: function (errorMsg) {
            Ext.Msg.alert('Error', errorMsg);
        }
    });
};

//Lanzar despues de pasar el campo de Cuenta
var txtfCuenta_Blur = function (textfield, evento, opciones) {
    //1. Validar que la cuenta no este repetida en el Store local
    if (App.sCuentasContables.find('Cuenta', textfield.getValue()) !== -1) {
        Ext.Msg.show({
            id: 'msgCuenta',
            title: 'Error en Cuenta',
            msg: 'La cuenta ya existe',
            buttons: Ext.MessageBox.OK,
            onEsc: Ext.emptyFn,
            closable: false,
            fn: function (btn) { if (btn === 'ok') { textfield.focus(); App.imgbtnGuardar.setDisabled(true) } },
            icon: Ext.MessageBox.ERROR
        });
    }
    else {
        //2. Validar que la cuenta no este repetida en servidor
        App.direct.CuentaRepetida(textfield.getValue(), {
            //3. Si el proceso es correcto
            success: function (result) {
                if (result === true) {
                    Ext.Msg.show({
                        id: 'msgCuenta',
                        title: 'Error en Cuenta',
                        msg: 'La cuenta ya existe',
                        buttons: Ext.MessageBox.OK,
                        onEsc: Ext.emptyFn,
                        closable: false,
                        fn: function (btn) { if (btn === 'ok') { textfield.focus(); App.imgbtnGuardar.setDisabled(true) } },
                        icon: Ext.MessageBox.ERROR
                    });
                }
                else {
                    //4. Validar por campos
                    ValidarGuardar();
                }
            },

            //5. Si existe un error
            failure: function (errorMsg) {
                Ext.Msg.alert('Error', errorMsg);
            }
        });
    }
};

//Lanzar despues de pasar el campo Descripción
var txtfDescripcion_Blur = function () {
    //Llamar la función que valida
    ValidarGuardar();
};

//Al seleccionar un tipo lanzar validación para guardar
var cmbTipo_Select = function () {
    //Llamar la función que valida
    ValidarGuardar();
};

//Evento que se lanza al seleccionar un elemento de Rama
var cmbRama_Select = function (combobox, registro, opciones) {
    App.txtfDescripcionRama.setValue(registro[0].get('Descripcion'));
};

//Lanzar cuando se modifica el valor en el ComboBox
var cmbRama_Change = function (combobox, valorNuevo, valorAnterior, opciones) {
    //1. Llamar la función que valida
    ValidarGuardar();

    //2. Si no hay valor en el ComboBox, limpiar la Descripción
    if (valorNuevo == '') {
        App.txtfDescripcionRama.setValue('');
    }
};

//Acciones que se lanzan cada ves que cambia el store
var sCuentasContables_DataChanged = function () {
    if (App.sCuentasContables.getCount() > 1 || App.sCuentasContables.getCount() == 0) {
        App.sbCuentasContables.setText(App.sCuentasContables.getCount() + ' ' + 'Cuentas contables');
    }
    else {
        App.sbCuentasContables.setText(App.sCuentasContables.getCount() + ' ' + 'Cuenta contable');
    }

    //Resize column Description when records are 11
    if (App.sCuentasContables.getCount() > 10) {
        App.gpCuentasContables.columns[1].setWidth(463);
    }
    else {
        App.gpCuentasContables.columns[1].setWidth(480);
    }
};

//Hacer la busqueda de información
var txtfBuscar_Change = function (textfield, newValue, oldValue, e) {
//    if (newValue != '') {
//        App.tpCuentasContables
//    }
};

//Para habilitar los campos de captura
function HabilitarCampos() {
    App.txtfCuenta.setDisabled(false);
    App.txtfDescripcion.setDisabled(false);
    App.cmbTipo.setDisabled(false);
    App.cmbRama.setDisabled(false);
};

//Para deshabilitar los campos de captura
function DeshabilitarCampos() {
    App.txtfCuenta.setDisabled(true);
    App.txtfDescripcion.setDisabled(true);
    App.cmbTipo.setDisabled(true);
    App.cmbRama.setDisabled(true);
    App.cmbEstatus.setDisabled(true);
};

//Limpiar los campos para registrar un nuevo registro
function LimpiarCampos() {
    App.txtfCuenta.setValue('');
    App.txtfDescripcion.setValue('');
    App.cmbTipo.setValue('');
    App.cmbRama.setValue('');
    App.txtfDescripcionRama.setValue('');
    App.cmbEstatus.setValue('');
};

//Asigna los valores a los campos
function AsignarCampos(registro) {
    //1. Asignar los datos en los campos
    App.txtfCuenta.setValue(registro.get('Cuenta'));
    App.txtfDescripcion.setValue(registro.get('Descripcion'));
    App.cmbTipo.setValue(registro.get('Tipo'));
    App.cmbRama.setValue(registro.get('Rama'));
    App.txtfDescripcionRama.setValue(registro.get('DescripcionRama'));
    App.cmbEstatus.setValue(registro.get('Estatus'));
};

//Valida que este la información completa para habilitar el boton de Guardar
function ValidarGuardar() {
    //1. Variable para saber si se habilita o no
    var guardar = false;

    //2. Se valida si es por el botón de Nuevo
    if (estadoNuevo) {
        //3. Validar si los campos son válidos
        if (App.txtfCuenta.isValid()) {
            if (App.txtfDescripcion.isValid()) {
                if (App.cmbTipo.isValid()) {
                    if (App.cmbRama.isValid()) {
                        if (App.cmbEstatus.isValid()) {
                            guardar = true;
                        }
                    }
                }
            }
        }

        //4. Si los campos son validos habilitar guardar
        if (guardar) {
            App.imgbtnGuardar.setDisabled(false);
        }
        else {
            App.imgbtnGuardar.setDisabled(true);
        }
    }
};

//Función que actualiza el nodo seleccionado
function ActualizarNodo(nodo) {
    App.direct.NodoHijos(nodo, {
        //2. Si e proceso es correcto
        success: function (result) {
            App.gpCuentasContables.getSelectionModel().select(0);
        },

        //3. Si existe un error
        failure: function (errorMsg) {
            Ext.Msg.alert('Error', errorMsg);
        }
    });
};