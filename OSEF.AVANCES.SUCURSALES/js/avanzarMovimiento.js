var btnAceptar_Click_Success = function (response, result) {
    //1. Obtener datos de la nueva revisión
    App.direct.ObtenerRevision(result.extraParamsResponse.revision, {
        //2. Asignar los datos a los controles
        success: function (result) {
            console.log(result, window.parent.App.sRevision);

            //Actualizar store de Revision
            window.parent.App.sRevision.getAt(0).set('ID', result.ID);
            window.parent.App.sRevision.getAt(0).set('Mov', result.Mov);
            window.parent.App.sRevision.getAt(0).set('MovID', result.MovID);
            window.parent.App.sRevision.getAt(0).set('Origen', result.Origen);
            window.parent.App.sRevision.getAt(0).set('OrigenID', result.OrigenID);
            window.parent.App.sRevision.getAt(0).set('Semana', result.Semana);
            window.parent.App.sRevision.getAt(0).set('Sucursal', result.Sucursal);
            window.parent.App.sRevision.getAt(0).set('FechaEmision', result.FechaEmision);
            window.parent.App.sRevision.getAt(0).set('FechaRevision', result.FechaRevision);
            window.parent.App.sRevision.getAt(0).set('Observaciones', result.Observaciones);
            window.parent.App.sRevision.getAt(0).set('Comentarios', result.Comentarios);
            window.parent.App.sRevision.getAt(0).set('Estatus', result.Estatus);
            window.parent.App.sRevision.getAt(0).set('RSucursal', result.RSucursal);

            window.parent.App.cmbMov.setValue(window.parent.App.sRevision.getAt(0).get('Mov'));
            window.parent.App.cmbMov.setReadOnly(false);
            window.parent.App.txtfMovID.setValue('');
            window.parent.App.nfSemana.setValue(window.parent.App.sRevision.getAt(0).get('Semana'));
            window.parent.App.nfSemana.setReadOnly(false);
            window.parent.App.dfFechaEmision.setValue(window.parent.App.sRevision.getAt(0).get('FechaEmision'));
            window.parent.App.dfFechaRevision.setValue('');
            window.parent.App.txtfObservaciones.setValue('');
            window.parent.App.txtfComentarios.setValue('');
            window.parent.App.sbFormaAvance.setText(window.parent.App.sRevision.getAt(0).get('Estatus'));

            HabilitarControlesAvanzar();
            window.parent.App.wEmergente.hide();
        },
        failure: function (errorMessage) { },
        eventMask: { showMask: true }
    });
};

//Habilitar los controles de la FormaAvance
function HabilitarControlesAvanzar() {
    window.parent.App.cmbMov.setDisabled(false);
    window.parent.App.nfSemana.setDisabled(false);
    window.parent.App.dfFechaEmision.setDisabled(false);
    window.parent.App.dfFechaRevision.setDisabled(false);
    window.parent.App.txtfObservaciones.setDisabled(false);
    window.parent.App.txtfComentarios.setDisabled(false);
    window.parent.App.gpObraCivil.setDisabled(false);
    window.parent.App.imgbtnGuardar.setDisabled(false);
    window.parent.App.imgbtnBorrar.setDisabled(false);
}