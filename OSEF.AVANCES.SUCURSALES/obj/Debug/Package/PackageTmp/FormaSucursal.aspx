<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaSucursal.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.FormaSucursales" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/login.css" />
    <link rel="Stylesheet" href="css/customControls.css" />
    <script type='text/javascript' src="js/sucursales.js"></script>
</head>
<body>
    <form id="Form1" runat="server">
        <ext:ResourceManager ID="rmFormaSucursal" runat="server" HideInDesign="true" />

        <ext:Store
            ID="sSucursal"
            runat="server">
            <Model>
                <ext:Model ID="mSucursal" runat="server" IDProperty="ID">
                    <Fields>
                        <ext:ModelField Name="ID" Type="String" />
                        <ext:ModelField Name="CR" Type="String" />
                        <ext:ModelField Name="Nombre" Type="String" />
                        <ext:ModelField Name="GerenteBBVANombre" Type="String" />
                        <ext:ModelField Name="GerenteBBVAAPaterno" Type="String" />
                        <ext:ModelField Name="GerenteBBVAAMaterno" Type="String" />
                        <ext:ModelField Name="SupervisorNombre" Type="String" />
                        <ext:ModelField Name="SupervisorAPaterno" Type="String" />
                        <ext:ModelField Name="SupervisorAMaterno" Type="String" />
                        <ext:ModelField Name="ProveedorEnergia" Type="String" />
                        <ext:ModelField Name="Superficie" Type="Int" />
                        <ext:ModelField Name="CoordinadorNombre" Type="String" />
                        <ext:ModelField Name="CoordinadorAPaterno" Type="String" />
                        <ext:ModelField Name="CoordinadorAMaterno" Type="String" />
                        <ext:ModelField Name="Calle" Type="String" />
                        <ext:ModelField Name="EntreCalles" Type="String" />
                        <ext:ModelField Name="NoExterior" Type="String" />
                        <ext:ModelField Name="NoInterior" Type="String" />
                        <ext:ModelField Name="CodigoPostal" Type="Int" />
                        <ext:ModelField Name="Colonia" Type="String" />
                        <ext:ModelField Name="Estado" Type="String" />
                        <ext:ModelField Name="Municipio" Type="String" />
                        <ext:ModelField Name="Contratista" Type="String" />
                        <ext:ModelField Name="TerminoContrato" Type="Date" />
                        <ext:ModelField Name="InicioObra" Type="Date" />
                        <ext:ModelField Name="FinObra" Type="Date" />
                        <ext:ModelField Name="SemanasObra" Type="Int" />
                        <ext:ModelField Name="FechaAlta" Type="Date" />
                        <ext:ModelField Name="Estatus" Type="String" />
                    </Fields>
                </ext:Model>
            </Model>
            <Listeners>
                <Load Fn="sSucursal_Load" />
                <Add Fn="sSucursal_Add" />
            </Listeners>
        </ext:Store>

        <div>
            <ext:Panel 
                ID="pSucursales" 
                runat="server" 
                Width="780"
                BodyStyle="background-color:transparent;">
                <Items>
                    <ext:FormPanel 
                        ID="fpFormaSucursales" 
                        runat="server" 
                        Height="385"
                        MonitorResize="true">
                        <Items>
                             <ext:TabPanel 
                                ID="tbFormaSucursales" 
                                runat="server" 
                                ActiveTabIndex="0" 
                                Width="770"
                                Plain="true"
                                Cls="custotabpanel xchris">
                                <Items>
                                    <ext:Panel 
                                        ID="pDatoGenerales" 
                                        runat="server" 
                                        Title="Datos Generales" 
                                        BodyPadding="10"
                                        MonitorResize="true">
                                        <Items>
                                            <ext:FieldContainer 
                                                ID="ContenedorID" 
                                                runat="server" 
                                                FieldLabel="ID" 
                                                LabelWidth="120"
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField
                                                        ID="txtfID"
                                                        runat="server"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="10"
                                                        EnforceMaxLength="true"
                                                        Disabled="true">
                                                    </ext:TextField>
                                                    <ext:NumberField
                                                        ID="nfCR"
                                                        runat="server"
                                                        Width="405"
                                                        MaxLength="4"
                                                        EnforceMaxLength="true"
                                                        MinValue="0"
                                                        MaxValue="9999"
                                                        AllowDecimals="false"
                                                        Step="1"
                                                        FieldLabel="CR"
                                                        LabelWidth="30"
                                                        AutoFocus="true">
                                                    </ext:NumberField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="ContenedorNombre" 
                                                runat="server" 
                                                FieldLabel="Nombre" 
                                                AnchorHorizontal="100%"
                                                LabelWidth="120"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField
                                                        ID="txtfNombre"
                                                        runat="server"
                                                        Width="611"
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true"
                                                        AllowBlank="false">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfNombre.setValue(App.txtfNombre.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="ContenedorGerente" 
                                                runat="server" 
                                                FieldLabel="Gerente BBVA"
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField
                                                        ID="txtfGerenteBBVANombre"
                                                        runat="server"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="50"
                                                        EnforceMaxLength="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfGerenteBBVANombre.setValue(App.txtfGerenteBBVANombre.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                    <ext:TextField
                                                        ID="txtfGerenteBBVAAPaterno"
                                                        runat="server"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="50"
                                                        EnforceMaxLength="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfGerenteBBVAAPaterno.setValue(App.txtfGerenteBBVAAPaterno.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                    <ext:TextField
                                                        ID="txtfGerenteBBVAAMaterno"
                                                        runat="server"
                                                        Width="200"
                                                        MaxLength="50"
                                                        EnforceMaxLength="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfGerenteBBVAAMaterno.setValue(App.txtfGerenteBBVAAMaterno.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="ContenedorSupervisor" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                FieldLabel="Supervisor"
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtfSupervisorNombre"
                                                        runat="server"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="50"
                                                        EnforceMaxLength="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfSupervisorNombre.setValue(App.txtfSupervisorNombre.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                    <ext:TextField
                                                        ID="txtfSupervisorAPaterno"
                                                        runat="server"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="50"
                                                        EnforceMaxLength="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfSupervisorAPaterno.setValue(App.txtfSupervisorAPaterno.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                    <ext:TextField
                                                        ID="txtfSupervisorAMaterno"
                                                        runat="server"
                                                        Width="200"
                                                        MaxLength="50"
                                                        EnforceMaxLength="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfSupervisorAMaterno.setValue(App.txtfSupervisorAMaterno.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="ContenedorProvEnergia" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                FieldLabel="Proveedor Energía"
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField
                                                        ID="txtfProveedorEnergia"
                                                        runat="server"
                                                        Width="612"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfProveedorEnergia.setValue(App.txtfProveedorEnergia.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="ContenedorSuperficie" 
                                                runat="server" 
                                                FieldLabel="Superficie (m2)"
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:NumberField
                                                        ID="nfSuperficie"
                                                        runat="server"
                                                        Width="200"
                                                        MaxLength="4"
                                                        EnforceMaxLength="true"
                                                        MinValue="0"
                                                        MaxValue="9999"
                                                        AllowDecimals="false"
                                                        Step="1">
                                                    </ext:NumberField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="ContenedorCordinador" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                FieldLabel="Coordinador"
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField
                                                        ID="txtfCoordinadorNombre"
                                                        runat="server"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="50"
                                                        EnforceMaxLength="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfCoordinadorNombre.setValue(App.txtfCoordinadorNombre.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                    <ext:TextField
                                                        ID="txtfCoordinadorAPaterno"
                                                        runat="server"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="50"
                                                        EnforceMaxLength="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfCoordinadorAPaterno.setValue(App.txtfCoordinadorAPaterno.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                    <ext:TextField
                                                        ID="txtfCoordinadorAMaterno"
                                                        runat="server"
                                                        Width="200"
                                                        MaxLength="50"
                                                        EnforceMaxLength="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfCoordinadorAMaterno.setValue(App.txtfCoordinadorAMaterno.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="ContenedorFechas" 
                                                runat="server" 
                                                FieldLabel="Fecha Alta"
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:DateField
                                                        ID="dfFechaAlta"
                                                        runat="server"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        Disabled="true">
                                                        <PickerOptions 
                                                        Cls="my-date-picker"
                                                        ID="pOFechaAlta" 
                                                        runat="server">
                                                        </PickerOptions>
                                                    </ext:DateField>
                                                   <ext:ComboBox
                                                        ID="cmbEstatus"
                                                        runat="server"
                                                        Width="305"
                                                        FieldLabel="Estatus"
                                                        StyleSpec="margin-left: 101px;"
                                                        Disabled="true">
                                                       <Items>
                                                            <ext:ListItem Text="ALTA" />
                                                            <ext:ListItem Text="BAJA" />
                                                            <ext:ListItem Text="BLOQUEADO" />
                                                            <ext:ListItem Text="PENDIENTE" />
                                                        </Items>
                                                        <SelectedItems>
                                                            <ext:ListItem Index="0" />
                                                        </SelectedItems>
                                                    </ext:ComboBox>
                                                </Items>
                                            </ext:FieldContainer>
                                        </Items>
                                    </ext:Panel>
                                    <ext:Panel 
                                        ID="pDireccion" 
                                        runat="server" 
                                        Title="Domicilio" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                            <ext:FieldContainer 
                                                ID="FieldContainerCalles" 
                                                runat="server" 
                                                FieldLabel="Calle" 
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtfCalle" 
                                                        runat="server" 
                                                        Width="200" 
                                                        StyleSpec="margin-right: 6px;"
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
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtfNoExterior"
                                                        runat="server"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
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
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtfCodigoPostal" 
                                                        runat="server" 
                                                        Width="200" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="5"
                                                        EnforceMaxLength="true"
                                                        AllowBlank="true">
                                                        <Plugins>
                                                            <ext:InputMask ID="imCP" runat="server" Mask="ttttt">
                                                                <MaskSymbols>
                                                                    <ext:MaskSymbol Name="t" Regex="[0-9]" />
                                                                </MaskSymbols>
                                                            </ext:InputMask>
                                                        </Plugins>
                                                    </ext:TextField>
                                                    <ext:TextField
                                                        ID="txtfColonia"
                                                        FieldLabel="Colonia"
                                                        runat="server"
                                                        Width="300"
                                                        MaxLength="50"
                                                        EnforceMaxLength="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfColonia.setValue(App.txtfColonia.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="ContenedorEstMun" 
                                                runat="server"
                                                FieldLabel="Estado" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:ComboBox 
                                                        ID="cmbEstado"
                                                        runat="server"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        DisplayField="Descripcion"
                                                        ValueField="ID"
                                                        ForceSelection="true"
                                                        Editable="false"
                                                        FireSelectOnLoad="true"
                                                        AllowBlank="false"
                                                        MatchFieldWidth="false">
                                                        <ListConfig Width="200" MaxHeight="195">
                                                        </ListConfig>
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
                                                            <Change OnEvent="cmbEstado_Change">
                                                                <ExtraParams>
                                                                    <ext:Parameter Name="valor" Value="App.cmbEstado.getValue()" Mode="Raw" />
                                                                </ExtraParams>
                                                            </Change>
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
                                                        AllowBlank="false"
                                                        MatchFieldWidth="false">
                                                        <ListConfig Width="200" MaxHeight="195">
                                                        </ListConfig>
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
                                                                <Listeners>
                                                                    <Load Fn="sMunicipios_Load" />
                                                                </Listeners>
                                                            </ext:Store>
                                                        </Store>
                                                    </ext:ComboBox>
                                                </Items>
                                            </ext:FieldContainer>
                                        </Items>
                                    </ext:Panel>
                                    <ext:Panel 
                                        ID="pContrato" 
                                        runat="server" 
                                        Title="Contrato" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                            <ext:FieldContainer 
                                                ID="ContenedorContratista" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                FieldLabel="Contratista"
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtfContratista"
                                                        runat="server" 
                                                        Width="400" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfContratista.setValue(App.txtfContratista.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="ContenedorTermino" 
                                                runat="server" 
                                                FieldLabel="Termino Contrato"
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:DateField
                                                        ID="dfTerminoContrato"
                                                        runat="server"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;">
                                                    </ext:DateField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="ContenedorInicioObra" 
                                                runat="server" 
                                                FieldLabel="Inicio Obra"
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:DateField
                                                        ID="dfInicioObra"
                                                        runat="server"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;">
                                                    </ext:DateField>
                                                    <ext:DateField 
                                                        ID="dfFinObra"
                                                        runat="server" 
                                                        FieldLabel="Fin Obra" 
                                                        Width="300">
                                                    </ext:DateField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="ContenedorSemanas" 
                                                runat="server" 
                                                FieldLabel="Semanas Obra"
                                                LabelWidth="120" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:NumberField
                                                        ID="nfSemanasObra"
                                                        runat="server"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="4"
                                                        EnforceMaxLength="true"
                                                        MinValue="0"
                                                        MaxValue="9999"
                                                        AllowDecimals="false"
                                                        Step="1">
                                                    </ext:NumberField>
                                                </Items>
                                            </ext:FieldContainer>
                                        </Items>
                                    </ext:Panel>
                                </Items>
                            </ext:TabPanel>
                        </Items>
                        <Listeners>
                            <ValidityChange Handler="this.dockedItems.get(0).setStatus({
                                                            text : valid ? 'La información esta completa/correcta' : 'Existe información incompleta/incorrecta', 
                                                            iconCls: valid ? 'icon-accept' : 'icon-exclamation'
                                                        });
                                                        #{imgbtnGuardar}.setDisabled(!valid);" />
                        </Listeners>
                        <BottomBar>
                            <ext:StatusBar ID="sbSucursal" runat="server" Cls="x-colorToolbar" Text="Sin validar información" />
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
                </Items>
            </ext:Panel>
        </div>
    </form>
</body>
</html>