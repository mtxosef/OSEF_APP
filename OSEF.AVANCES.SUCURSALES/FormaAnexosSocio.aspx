<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaAnexosSocio.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.FormaAnexosSocio" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="css/login2.css" />
    <link rel="Stylesheet" href="css/customControls2.css" />
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmFormaMenu" runat="server" HideInDesign="true" />
        <ext:FormPanel 
            ID="FormPanelMenus" 
            runat="server"
            Width="590"
            BodyPadding="10"
            DefaultAnchor="100%">
            <Items>
                        <ext:ComboBox
                            ID="cmbGrupoMenu"
                            runat="server" 
                            FieldLabel="Comprobante" 
                            AllowBlank="false"
                            Editable="false"
                            AutoFocus="True"
                            
                            ValueField="ID">
                        </ext:ComboBox>
               
                <ext:FieldSet
                    ID="fsImagenes" 
                    runat="server" 
                    Title="Imágenes" 
                    Collapsible="false"
                    DefaultAnchor="100%">
                    <Items>
                    <ext:FieldContainer 
                        ID="fcImagenes"
                        runat="server"
                        AnchorHorizontal="100%"
                        Layout="HBoxLayout">
                        <Items>
                              <ext:FieldSet 
                                ID="fs1"
                                runat="server"
                                Title="Imagen 1"
                                Collapsible="false"
                                Border="false"
                                Margins="20 20 0 0"
                                DefaultAnchor="100%">
                                <Items>
                                    <ext:FileUploadField 
                                        ID="fufImagen1"
                                        runat="server"
                                        Width="10"
                                        Icon="Attach"
                                        Margins="20 50 20 0"
                                        AllowBlank="false">
                                    
                                    </ext:FileUploadField>
                                    <ext:Image 
                                        ID="img1"
                                        runat="server"
                                        Width="100"
                                        Height="100"
                                        Margins="20 40 20 0" />
                                </Items>
                            </ext:FieldSet>
                              <ext:FieldSet 
                                ID="FieldSet1"
                                runat="server"
                                Title="Imagen 1"
                                Collapsible="false"
                                Border="false"
                                Margins="20 20 0 0"
                                DefaultAnchor="100%">
                                <Items>
                                    <ext:FileUploadField 
                                        ID="FileUploadField1"
                                        runat="server"
                                        Width="10"
                                        Icon="Attach"
                                        Margins="20 50 20 0"
                                        AllowBlank="false">
                                    
                                    </ext:FileUploadField>
                                    <ext:Image 
                                        ID="Image1"
                                        runat="server"
                                        Width="100"
                                        Height="100"
                                        Margins="20 40 20 0" />
                                </Items>
                            </ext:FieldSet>
                              <ext:FieldSet 
                                ID="FieldSet2"
                                runat="server"
                                Title="Imagen 1"
                                Collapsible="false"
                                Border="false"
                                Margins="20 20 0 0"
                                DefaultAnchor="100%">
                                <Items>
                                    <ext:FileUploadField 
                                        ID="FileUploadField2"
                                        runat="server"
                                        Width="10"
                                        Icon="Attach"
                                        Margins="20 50 20 0"
                                        AllowBlank="false">
                                    
                                    </ext:FileUploadField>
                                    <ext:Image 
                                        ID="Image2"
                                        runat="server"
                                        Width="100"
                                        Height="100"
                                        Margins="20 40 20 0" />
                                </Items>
                            </ext:FieldSet>
                              <ext:FieldSet 
                                ID="FieldSet3"
                                runat="server"
                                Title="Imagen 1"
                                Collapsible="false"
                                Border="false"
                                Margins="20 20 0 0"
                                DefaultAnchor="100%">
                                <Items>
                                    <ext:FileUploadField 
                                        ID="FileUploadField3"
                                        runat="server"
                                        Width="10"
                                        Icon="Attach"
                                        Margins="20 50 20 0"
                                        AllowBlank="false">
                                    
                                    </ext:FileUploadField>
                                    <ext:Image 
                                        ID="Image3"
                                        runat="server"
                                        Width="100"
                                        Height="100"
                                        Margins="20 40 20 0" />
                                </Items>
                            </ext:FieldSet>
                          
                        </Items>
                    </ext:FieldContainer>
                </Items>
            </ext:FieldSet>
            </Items>
            
            <BottomBar>
                <ext:StatusBar ID="sbAnexos" runat="server" Cls="x-colorToolbar" Text="Sin validar información" />
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