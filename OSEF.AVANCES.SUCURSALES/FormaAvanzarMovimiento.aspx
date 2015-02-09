<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaAvanzarMovimiento.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.FormaEfectuandoAvance" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <script type="text/javascript" src="js/avanzarMovimiento.js"></script>
</head>
<body>
    <ext:ResourceManager ID="rmAvanzarMovimiento" runat="server" HideInDesign="true" />

    <ext:Panel 
        ID="pAvanzarMovimiento" 
        runat="server"
        Width="200"
        BodyPadding="10">
        <Items>
            <ext:FieldSet
                ID="fsAvanzarMovimiento" 
                runat="server"
                DefaultAnchor="100%">
                <Items>
                    <ext:RadioGroup ID="rgAvanzarMovimiento" runat="server" ColumnsNumber="1">
                        <Items>
                            <ext:Radio ID="rRevision" runat="server" InputValue="Revisión" BoxLabel="Revisión" Checked="true" />
                            <ext:Radio ID="rTerminarProyecto" runat="server" InputValue="Terminar proyecto" BoxLabel="Terminar proyecto" />
                        </Items>
                    </ext:RadioGroup>
                </Items>
            </ext:FieldSet>
        </Items>
        <Buttons>
            <ext:Button 
                ID="btnAceptar"
                runat="server" 
                Text="Aceptar" 
                Cls="cbtn"
                MarginSpec="0 10 0 0">
                <DirectEvents>
                    <Click OnEvent="btnAceptar_Click" Success="btnAceptar_Click_Success">
                        <ExtraParams>
                            <ext:Parameter Name="Revision" Value="App.rRevision.getValue()" Mode="Raw" />
                            <ext:Parameter Name="Finalizar" Value="App.rTerminarProyecto.getValue()" Mode="Raw" />
                            <ext:Parameter Name="ID" Value="window.parent.App.sRevision.getAt(0).get('ID')" Mode="Raw" />
                        </ExtraParams>
                        <EventMask ShowMask="true" Target="CustomTarget" CustomTarget="window.parent" Msg="Avanzando..." />
                    </Click>
                </DirectEvents>
            </ext:Button>
            <ext:Button 
                ID="btnCancelar"
                runat="server" 
                Text="Cancelar"
                Cls="cbtn"
                MarginSpec="0 10 0 0">
            </ext:Button>
        </Buttons>
    </ext:Panel>
</body>
</html>