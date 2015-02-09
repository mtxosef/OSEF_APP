<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaColonia.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.FormaColonias" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="css/login.css" />
    <link rel="Stylesheet" href="css/customControls.css" />
    <script type="text/javascript" src="js/colonias.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmFormaProveedor" runat="server" HideInDesign="true" />

        <ext:Store
            ID="sColonias"
            runat="server">
            <Model>
                <ext:Model ID="mFormacolonias" runat="server" IDProperty="ID">
                    <Fields>
                        <ext:ModelField Name="ID" Type="String" />
                        <ext:ModelField Name="Colonia" Type="String" />
                        <ext:ModelField Name="Estado" Type="String" />
                        <ext:ModelField Name="Municipio" Type="String" />
                       
                    </Fields>
                </ext:Model>
            </Model>
           
        </ext:Store>
    
        <ext:FormPanel 
            ID="fpColonias"
            runat="server"
            Height="230"
            Width="650"
            BodyPadding="10"
            MonitorResize="true">
            <Items>
                <ext:FieldContainer
                    ID="ContenedorID" 
                    runat="server" 
                    FieldLabel="ID" 
                    AnchorHorizontal="100%" 
                    Layout="HBoxLayout">                                       
                    <Items>
                        <ext:TextField
                            ID="txtIDColonia" 
                            runat="server" 
                            Width="200" 
                            Margins="0 3 0 0"
                            Disabled="true">
                        </ext:TextField>
                    </Items>
                </ext:FieldContainer>            
                <ext:FieldContainer 
                    ID="ContenedorColonia" 
                    runat="server" 
                    FieldLabel="Colonia" 
                    AnchorHorizontal="100%"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:TextField 
                            ID="txtfColonia" 
                            runat="server" 
                            Width="200"
                            MaxLength="50"
                            EnforceMaxLength="true"
                            AutoFocus="true"
                            AllowBlank="false">
                         
                        </ext:TextField>
                    </Items>
                </ext:FieldContainer> 
                
                <ext:FieldContainer 
                    ID="fcEstado" 
                    runat="server" 
                    FieldLabel="Estado" 
                    AnchorHorizontal="100%"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:ComboBox 
                            ID="cmbEstados" 
                            runat="server" 
                            Width="200"
                            MaxLength="50"
                            EnforceMaxLength="true"
                            AutoFocus="true"
                            Text="Selecciona un estado"
                            AllowBlank="false">
                         
                        </ext:ComboBox>
                    </Items>
                </ext:FieldContainer>   
                
                <ext:FieldContainer 
                    ID="fcMunicipios" 
                    runat="server" 
                    FieldLabel="Municipios" 
                    AnchorHorizontal="100%"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:ComboBox 
                            ID="cbMunicipio" 
                            runat="server" 
                            Width="200"
                            MaxLength="50"
                            EnforceMaxLength="true"
                            AutoFocus="true"
                            Text="Selecciona municipio"
                            AllowBlank="false">
                         
                        </ext:ComboBox>
                    </Items>
                </ext:FieldContainer>         
             


            </Items>
           
            <BottomBar>
                <ext:StatusBar ID="sbProveedor" runat="server" Cls="x-colorToolbar" Text="Sin validar información" />
            </BottomBar>
            <Buttons>
                <ext:ImageButton
                    ID="imgbtnGuardar" 
                    runat="server" 
                    ImageUrl="assets/img/controles/Guardar.png" 
                    DisabledImageUrl="assets/img/controles/GuardarDisabled.png"
                    OverImageUrl="assets/img/controles/GuardarOver.png" 
                    PressedImageUrl="assets/img/controles/GuardarPressed.png" 
                    ToolTip="Guardar" 
                    Height="50" 
                    Width="50"
                    Disabled="true">
                    
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
                    <Listeners>
                        <Click Handler="window.parent.App.wEmergente.hide();" />
                    </Listeners>
                </ext:ImageButton>
            </Buttons>
        </ext:FormPanel>
    </form>
</body>
</html>