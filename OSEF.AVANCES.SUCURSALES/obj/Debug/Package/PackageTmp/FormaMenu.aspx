<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaMenu.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.FormaMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="css/login.css" />
    <link rel="Stylesheet" href="css/customControls.css" />
    <script type='text/javascript' src="js/menus.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmFormaMenu" runat="server" HideInDesign="true" />

        <ext:Store
            ID="sMenu"
            runat="server">
            <Model>
                <ext:Model ID="mMenu" runat="server" IDProperty="ID">
                    <Fields>
                        <ext:ModelField Name="ID" Type="String" />
                        <ext:ModelField Name="Descripcion" Type="String" />
                        <ext:ModelField Name="GrupoMenu" Type="String" />
                        <ext:ModelField Name="ImagenNormal" Type="String" />
                    </Fields>
                </ext:Model>
            </Model>
            <Listeners>
                <Load Fn="sMenu_Load" />
                <Add Fn="sMenu_Add" />
            </Listeners>
        </ext:Store>

        <ext:FormPanel 
            ID="FormPanelMenus" 
            runat="server"
            Width="470"
            BodyPadding="10"
            DefaultAnchor="100%">
            <Items>
                <ext:FieldSet
                    ID="DivisorDatos" 
                    runat="server"
                    Title="Datos"
                    DefaultAnchor="100%">
                    <Items>
                        <ext:TextField
                            ID="txtfID"
                            runat="server"
                            FieldLabel="ID"
                            AllowBlank="false"
                            MaxLength="4"
                            EnforceMaxLength="true"
                            Disabled="true">
                        </ext:TextField>
                        <ext:TextField
                            ID="txtfDescripcion"
                            runat="server" 
                            FieldLabel="Descripción" 
                            AllowBlank="true"
                            MaxLength="50"
                            EnforceMaxLength="true"
                            AutoFocus="true">
                            <Listeners>
                                <Blur Handler="App.txtfDescripcion.setValue(App.txtfDescripcion.getValue().toUpperCase());" />
                            </Listeners>
                        </ext:TextField>
                        <ext:ComboBox
                            ID="cmbGrupoMenu"
                            runat="server" 
                            FieldLabel="Grupo" 
                            EmptyText="Seleccionar Grupo Menú"
                            AllowBlank="false"
                            Editable="false"
                            DisplayField="Descripcion"
                            ValueField="ID">
                            <Store>
                                <ext:Store ID="sGruposMenu" runat="server">
                                    <Model>
                                        <ext:Model ID="mGruposMenu" runat="server">
                                            <Fields>
                                                <ext:ModelField Name="ID" Type="String" />
                                                <ext:ModelField Name="Descripcion" Type="String" />
                                            </Fields>
                                        </ext:Model>
                                    </Model>
                                </ext:Store>
                            </Store>
                        </ext:ComboBox>
                    </Items>
                </ext:FieldSet>
                <ext:FieldSet
                    ID="fsImagenes" 
                    runat="server" 
                    Title="Propiedades del menú" 
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
                                ID="fsNormal"
                                runat="server"
                                Title="Imagen Icono"
                                Collapsible="false"
                                Border="false"
                                Margins="20 20 0 0"
                                DefaultAnchor="100%">
                                <Items>
                                    <ext:FileUploadField 
                                        ID="fufNormal"
                                        runat="server"
                                        Width="10"
                                        Icon="Attach"
                                        Margins="20 50 20 0"
                                        AllowBlank="false">
                                        <Listeners>
                                            <Change Handler="fufNormal_Change(event);" />
                                        </Listeners>
                                    </ext:FileUploadField>
                                    <ext:Image 
                                        ID="imgNormal"
                                        runat="server"
                                        Width="100"
                                        Height="100"
                                        Margins="20 40 20 0" />
                                </Items>
                            </ext:FieldSet>
                            <ext:FieldSet 
                                ID="fsMenu"
                                runat="server"
                                Title="Selecciona el color del menú"
                                Collapsible="false"
                                Margins="0 20 0 0"
                                Border="True"
                                DefaultAnchor="100%">
                                <Items>
                                    <ext:RadioGroup ID="rgAfectar" Width="250" runat="server" ColumnsNumber="2">
                                        <Items>
                                            <ext:Radio ID="rNaranja" runat="server" BoxLabel="Naranja"/>
                                            <ext:Radio ID="rMorado" runat="server" BoxLabel="Morado"/>
                                            <ext:Radio ID="rVerde" runat="server" BoxLabel="Verde"/>
                                            <ext:Radio ID="rVerdeOscuro" runat="server" BoxLabel="Verde Oscuro"/>
                                            <ext:Radio ID="rAzul" runat="server" BoxLabel="Azul"/>
                                            <ext:Radio ID="rRojo" runat="server" BoxLabel="Rojo"/>
                                            <ext:Radio ID="rAzulOscuro" runat="server" BoxLabel="Azul Oscuro"/>
                                            <ext:Radio ID="rAmarillo" runat="server" BoxLabel="Amarillo"/>
                                            <ext:Radio ID="rRosa" runat="server" BoxLabel="Rosa"/>
                                            <ext:Radio ID="roscuro" runat="server" BoxLabel="Oscuro"/>
                                            <ext:Radio ID="rGris" runat="server" BoxLabel="Gris"/>
                                            <ext:Radio ID="rGrisClaro" runat="server" BoxLabel="Gris Claro"/>
                                        </Items>
                                    </ext:RadioGroup>
                                </Items>
                            </ext:FieldSet>
                          
                        </Items>
                    </ext:FieldContainer>
                </Items>
            </ext:FieldSet>
            </Items>
            <Listeners>
                <ValidityChange Handler="this.dockedItems.get(0).setStatus({
                                                text : valid ? 'La información esta completa/correcta' : 'Existe información incompleta/incorrecta', 
                                                iconCls: valid ? 'icon-accept' : 'icon-exclamation'
                                            });
                                            #{imgbtnGuardar}.setDisabled(!valid);" />
            </Listeners>
            <BottomBar>
                <ext:StatusBar ID="sbMenu" runat="server" Cls="x-colorToolbar" Text="Sin validar información" />
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
                    <DirectEvents>
                        <Click OnEvent="imgbtnGuardar_Click">
                            <EventMask ShowMask="true" Msg="Registrando información..." />
                            <ExtraParams>
                                <ext:Parameter Name="registro" Value="Ext.encode(this.up('form').getForm().getValues(false, false, false, true))" Mode="Raw" />
                                <ext:Parameter Name="id" Value="Ext.encode(App.txtfID.getValue())" Mode="Raw" />
                            </ExtraParams>
                        </Click>
                    </DirectEvents>
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