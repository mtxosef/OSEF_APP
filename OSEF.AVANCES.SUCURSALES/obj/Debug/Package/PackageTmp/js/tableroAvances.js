var indice = 0;
var store;

//Evento de clic del botón Nuevo
var imgbtnNuevo_Click = function () {
    Ext.util.Cookies.set('cookieEditarRevision', 'Nuevo');
    window.parent.App.wEmergente.load('FormaAvance.aspx');
    window.parent.App.wEmergente.setHeight(600);
    window.parent.App.wEmergente.setWidth(930);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Nuevo Avance');
    window.parent.App.wEmergente.show();
};

//Acciones al hacer clic en un registro
var gpAvances_ItemClick = function (gridview, registro, gvhtml, index) {
    App.imgbtnEditar.setDisabled(false);
    App.imgbtnBorrar.setDisabled(false);
    indice = index;
};

//Evento de click del botón Editar
var imgbtnEditar_Click = function () {
    Ext.util.Cookies.set('cookieEditarRevision', App.gpAvances.getSelectionModel().getSelection()[0].get('ID'));
    window.parent.App.wEmergente.load('FormaAvance.aspx');
    window.parent.App.wEmergente.setHeight(600);
    window.parent.App.wEmergente.setWidth(930);
    window.parent.App.wEmergente.center();
    window.parent.App.wEmergente.setTitle('Editar avance ' + Ext.util.Cookies.get('cookieEditarRevision'));
    window.parent.App.wEmergente.show();
};

//Concatenar la columna de Movimiento
var cMov_Renderer = function (valor, metaData, registro) {
    var estatus = registro.get('Estatus');

    switch (estatus) {
        case 'BORRADOR':
            return '<img class="IconColumnaEstatus" src="images/cancelar.png" alt="borrador" />' + registro.get('Mov') + registro.get('MovID');
        case 'PENDIENTE':
            return '<img class="IconColumnaEstatus" src="images/pendiente.png" alt="pendiente" /> ' + registro.get('Mov') + registro.get('MovID');
        case 'CONCLUIDO':
            return '<img class="IconColumnaEstatus" src="images/concluido.png" alt="concluido" /> ' + registro.get('Mov') + registro.get('MovID');
        case 'CANCELADO':
            return '<img class="IconColumnaEstatus" src="images/cancelar.png" alt="cancelar" /> ' + registro.get('Mov') + registro.get('MovID');
    }
};

//Regresar el nombre de la sucursal
var cSucursal_Renderer = function (valor, metaData, registro) {
    return registro.get('RSucursal').Nombre;
};

//Darle formato a la columna de Programado
var ncProgramado_Renderer = function (valor) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(valor, "000.00%");
};

//Darle formato a la columna de Real
var ncReal_Renderer = function (valor) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(valor, "000.00%");
};

//Regresar el calculo de la variación
var ncVariacion_Renderer = function (valor, metaData, registro) {
    var F = Ext.util.Format;
    F.thousandSeparator = ',';
    F.decimalSeparator = '.';
    return F.number(parseFloat(registro.get('Real')) - parseFloat(registro.get('Programado')), "000.00%");
};

//Cambio en los datos del tablero
var sAvances_DataChanged = function () {
    if (App.sAvances.getCount() > 1 || App.sAvances.getCount() == 0) {
        App.sbAvances.setText(App.sAvances.getCount() + ' ' + 'MOVIMIENTOS');
    }
    else {
        App.sbAvances.setText(App.sAvances.getCount() + ' ' + 'MOVIMIENTO');
    }

    //Resize column Description when records are 11
    if (App.sAvances.getCount() > 10) {
        App.gpAvances.columns[1].setWidth(353);
    }
    else {
        App.gpAvances.columns[1].setWidth(370);
    }
};