<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaProveedor.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.FormaProveedor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/login.css" />
    <link rel="Stylesheet" href="css/customControls.css" />
    <script type="text/javascript" src="js/proveedores.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmFormaProveedor" runat="server" HideInDesign="true" />

        <ext:Store
            ID="sProveedor"
            runat="server">
            <Model>
                <ext:Model ID="mProveedor" runat="server" IDProperty="ID">
                    <Fields>
                        <ext:ModelField Name="ID" Type="String" />
                        <ext:ModelField Name="Nombre" Type="String" />
                        <ext:ModelField Name="RFC" Type="String" />
                        <ext:ModelField Name="ContactoNombre" Type="String" />
                        <ext:ModelField Name="ContactoAPaterno" Type="String" />
                        <ext:ModelField Name="ContactoAMaterno" Type="String" />
                        <ext:ModelField Name="Correo" Type="String" />
                        <ext:ModelField Name="Calle" Type="String" />
                        <ext:ModelField Name="EntreCalles" Type="String" />
                        <ext:ModelField Name="NoExterior" Type="String" />
                        <ext:ModelField Name="NoInterior" Type="String" />
                        <ext:ModelField Name="CodigoPostal" Type="Int" />
                        <ext:ModelField Name="Colonia" Type="String" />
                        <ext:ModelField Name="Estado" Type="String" />
                        <ext:ModelField Name="Municipio" Type="String" />
                    </Fields>
                </ext:Model>
            </Model>
            <Listeners>
                <Load Fn="sProveedor_Load" />
                <Add Fn="sProveedor_Add" />
            </Listeners>
        </ext:Store>
    
        <ext:FormPanel 
            ID="PanelProveedores"
            runat="server"
            Height="380"
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
                            ID="txtID" 
                            runat="server" 
                            Width="200" 
                            Margins="0 3 0 0"
                            Disabled="true">
                        </ext:TextField>
                    </Items>
                </ext:FieldContainer>            
                <ext:FieldContainer 
                    ID="ContenedorNombre" 
                    runat="server" 
                    FieldLabel="Nombre" 
                    AnchorHorizontal="100%"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:TextField 
                            ID="txtfNombre" 
                            runat="server" 
                            Width="200"
                            MaxLength="50"
                            EnforceMaxLength="true"
                            AutoFocus="true"
                            AllowBlank="false">
                            <Listeners>
                                <Blur Handler="App.txtfNombre.setValue(App.txtfNombre.getValue().toUpperCase());" />
                            </Listeners>
                        </ext:TextField>
                    </Items>
                </ext:FieldContainer>            
                <ext:FieldContainer 
                    ID="ContendeorRFC" 
                    runat="server" 
                    FieldLabel="RFC" 
                    AnchorHorizontal="100%"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:TextField
                            ID="txtfRFC"
                            runat="server"
                            Width="200"
                            MaxLength="15"
                            EnforceMaxLength="true">
                            <Listeners>
                                <Blur Handler="App.txtfRFC.setValue(App.txtfRFC.getValue().toUpperCase());" />
                            </Listeners>
                        </ext:TextField>
                    </Items>
                </ext:FieldContainer>          
                <ext:FieldContainer
                    ID="FieldContainerContactos"
                    runat="server"
                    FieldLabel="Contacto"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:TextField
                            ID="txtfContactoNombre"
                            Width="200"
                            runat="server"
                            Margins="0 4 0 0"
                            MaxLength="50"
                            EnforceMaxLength="true">
                            <Listeners>
                                <Blur Handler="App.txtfContactoNombre.setValue(App.txtfContactoNombre.getValue().toUpperCase());" />
                            </Listeners>
                        </ext:TextField>
                        <ext:TextField
                            ID="txtfContactoAPaterno"
                            Width="147"
                            runat="server"
                            Margins="0 4 0 0"
                            MaxLength="50"
                            EnforceMaxLength="true">
                            <Listeners>
                                <Blur Handler="App.txtfContactoAPaterno.setValue(App.txtfContactoAPaterno.getValue().toUpperCase());" />
                            </Listeners>
                        </ext:TextField>
                        <ext:TextField
                            ID="txtfContactoAMaterno" 
                            Width="147" 
                            runat="server"
                            MaxLength="50"
                            EnforceMaxLength="true">
                            <Listeners>
                                <Blur Handler="App.txtfContactoAMaterno.setValue(App.txtfContactoAMaterno.getValue().toUpperCase());" />
                            </Listeners>
                        </ext:TextField>
                    </Items>
                </ext:FieldContainer>
                <ext:FieldContainer
                    ID="ContenedorCorreo"
                    runat="server"
                    FieldLabel="Correo"
                    AnchorHorizontal="100%"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:TextField
                            ID="txtfCorreo"
                            runat="server"
                            Vtype="email"
                            Width="200"
                            Margins="0 3 0 0"
                            MaxLength="100"
                            EnforceMaxLength="true">
                            <Listeners>
                                <Blur Handler="App.txtfCorreo.setValue(App.txtfCorreo.getValue().toLowerCase());" />
                            </Listeners>
                        </ext:TextField>
                    </Items>
                </ext:FieldContainer>
                <ext:FieldContainer 
                    ID="FieldContainerCalles" 
                    runat="server" 
                    FieldLabel="Calle" 
                    AnchorHorizontal="100%"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:TextField
                            ID="txtfCalle"
                            runat="server"
                            Width="200"
                            Margins="0 3 0 0"
                            MaxLength="100"
                            EnforceMaxLength="true">
                            <Listeners>
                                <Blur Handler="App.txtfCalle.setValue(App.txtfCalle.getValue().toUpperCase());" />
                            </Listeners>
                        </ext:TextField>
                        <ext:TextField
                            ID="txtfEntreCalles"
                            FieldLabel="Entre Calles"
                            runat="server"
                            Width="300"
                            MaxLength="100"
                            EnforceMaxLength="true">
                            <Listeners>
                                <Blur Handler="App.txtfEntreCalles.setValue(App.txtfEntreCalles.getValue().toUpperCase());" />
                            </Listeners>
                        </ext:TextField>
                    </Items>
                </ext:FieldContainer>
                <ext:FieldContainer
                    ID="FieldContainerNumInt"
                    runat="server"
                    FieldLabel="N° Exterior"
                    AnchorHorizontal="100%"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:TextField
                            ID="txtfNoExterior"
                            runat="server"
                            Width="200"
                            Margins="0 3 0 0"
                            MaxLength="10"
                            EnforceMaxLength="true">
                            <Listeners>
                                <Blur Handler="App.txtfNoExterior.setValue(App.txtfNoExterior.getValue().toUpperCase());" />
                            </Listeners>
                        </ext:TextField>
                        <ext:TextField
                            ID="txtfNoInterior"
                            FieldLabel="N° Interior"
                            runat="server"
                            Width="300"
                            MaxLength="10"
                            EnforceMaxLength="true">
                            <Listeners>
                                <Blur Handler="App.txtfNoInterior.setValue(App.txtfNoInterior.getValue().toUpperCase());" />
                            </Listeners>
                        </ext:TextField>
                    </Items>
                </ext:FieldContainer>
                <ext:FieldContainer
                    ID="FieldContainerCPCol"
                    runat="server"
                    FieldLabel="Código Postal"
                    AnchorHorizontal="100%"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:TextField
                            ID="txtfCodigoPostal"
                            runat="server"
                            Width="200"
                            Margins="0 3 0 0"
                            MaxLength="5"
                            EnforceMaxLength="true"
                            AllowBlank="false">
                            <Plugins>
                                <ext:InputMask ID="imCP" runat="server" Mask="ttttt">
                                    <MaskSymbols>
                                        <ext:MaskSymbol Name="t" Regex="[0-9]" />
                                    </MaskSymbols>
                                </ext:InputMask>
                            </Plugins>
                        </ext:TextField>
                        <ext:TextField
                            ID="txtColonia"
                            FieldLabel="Colonia"
                            runat="server"
                            Width="300"
                            MaxLength="50"
                            EnforceMaxLength="true">
                            <Listeners>
                                <Blur Handler="App.txtColonia.setValue(App.txtColonia.getValue().toUpperCase());" />
                            </Listeners>
                        </ext:TextField>
                    </Items>
                </ext:FieldContainer>
                <ext:FieldContainer
                    ID="FieldContainer5"
                    runat="server"
                    FieldLabel="Estado"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:ComboBox 
                            ID="cmbEstado"
                            runat="server"
                            Width="200"
                            Margins="0 3 0 0"
                            DisplayField="Descripcion"
                            ValueField="ID"
                            ForceSelection="true"
                            Editable="false">
                            <Store>
                                <ext:Store
                                    ID="sEstados"
                                    runat="server">
                                    <Model>
                                        <ext:Model ID="mEstados" runat="server" IDProperty="ID">
                                            <Fields>
                                                <ext:ModelField Name="ID" Type="String" />
                                                <ext:ModelField Name="Descripcion" Type="String" />
                                            </Fields>
                                        </ext:Model>
                                    </Model>
                                </ext:Store>
                            </Store>
                            <DirectEvents>
                                <Select OnEvent="cmbEstado_Select">
                                    <ExtraParams>
                                        <ext:Parameter Name="valor" Value="App.cmbEstado.getValue()" Mode="Raw" />
                                    </ExtraParams>
                                </Select>
                            </DirectEvents>
                        </ext:ComboBox>
                        <ext:ComboBox
                            ID="cmbMunicipio"
                            runat="server"
                            FieldLabel="Municipio"
                            Width="300"
                            DisplayField="Descripcion"
                            ValueField="ID"
                            ForceSelection="true"
                            Editable="false"
                            MatchFieldWidth="true">
                            <Store>
                                <ext:Store
                                    ID="sMunicipios"
                                    runat="server">
                                    <Model>
                                        <ext:Model ID="mMunicipios" runat="server">
                                            <Fields>
                                                <ext:ModelField Name="ID" Type="String" />
                                                <ext:ModelField Name="Descripcion" Type="String" />
                                                <ext:ModelField Name="Estado" Type="String" />
                                            </Fields>
                                        </ext:Model>
                                    </Model>
                                </ext:Store>
                            </Store>
                        </ext:ComboBox>
                    </Items>
                </ext:FieldContainer>
            </Items>
            <Listeners>
                <ValidityChange Handler="this.dockedItems.get(0).setStatus({
                                                text : valid ? 'La información esta completa/correcta' : 'Existe información incompleta/incorrecta', 
                                                iconCls: valid ? 'icon-accept' : 'icon-exclamation'
                                            });
                                            #{imgbtnGuardar}.setDisabled(!valid);" />
            </Listeners>
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
                    <DirectEvents>
                        <Click OnEvent="imgbtnGuardar_Click">
                            <EventMask ShowMask="true" Msg="Registrando información..." />
                            <ExtraParams>
                                <ext:Parameter Name="registro" Value="Ext.encode(this.up('form').getForm().getValues(false, false, false, true))" Mode="Raw" />
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