<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaCambiarContrasena.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.FormaCambiarPass" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
       <link rel="stylesheet" href="css/login.css" />
    <link rel="Stylesheet" href="css/customControls.css" />
</head>
<body>
    <form id="form1" runat="server">
    <ext:ResourceManager ID="ResourceManager1" runat="server" />

    <ext:FormPanel 
        ID="FormPanelMenus" 
        runat="server"
        Width="440"
        BodyPadding="10"
        DefaultAnchor="100%">
        <Items>
        <ext:FieldSet ID="DivisorDatos" 
                runat="server"
                Height="120"
                Title="Cambiar Contraseña"
                DefaultAnchor="100%">
                <Items>
           
            <ext:TextField ID="txtContraActual" 
                runat="server" 
                Name="ID" 
                LabelWidth="150"
                FieldLabel="Contraseña Actual" 
                MsgTarget="Side"
                AllowBlank="false" />
            
            <ext:TextField ID="txtContrasena" 
                runat="server" 
                Name="Contrasena" 
                LabelWidth="150"
                FieldLabel="Contraseña" 
                MsgTarget="Side"
                AllowBlank="false" />

              <ext:TextField ID="txtConfirmarContra" 
                runat="server" 
                LabelWidth="150"
                Name="ConfirmarContrasena" 
                FieldLabel="Confirmar Contraseña" 
                MsgTarget="Side"
                AllowBlank="false" />

            </Items>

         </ext:FieldSet>                            
        </Items>
         <Buttons>
            <ext:ImageButton ID="imgbtnGuardar" 
            runat="server" 
            ImageUrl="assets/img/controles/Guardar.png" 
            DisabledImageUrl="assets/img/controles/GuardarDisabled.png"
            OverImageUrl="assets/img/controles/GuardarOver.png" 
            PressedImageUrl="assets/img/controles/GuardarPressed.png" 
            ToolTip="Guardar" 
            Height="50" 
            Width="50">
            </ext:ImageButton>
            <ext:ImageButton 
            ID="imgbtnCancelar" 
            runat="server" 
            ImageUrl="assets/img/controles/Cancelar.png" 
            DisabledImageUrl="assets/img/controles/CancelarDisabled.png"
                OverImageUrl="assets/img/controles/CancelarOver.png" 
                PressedImageUrl="assets/img/controles/CancelarPressed.png" 
                ToolTip="Cancelar" 
                Height="50" 
                Width="50">
            </ext:ImageButton>
        </Buttons>
       
    </ext:FormPanel>

    </form>
</body>
</html>
