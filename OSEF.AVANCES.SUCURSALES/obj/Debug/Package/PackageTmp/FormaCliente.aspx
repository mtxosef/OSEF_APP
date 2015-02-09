<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaCliente.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.FormaSocio" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="css/login2.css" />
    <link rel="Stylesheet" href="css/customControls2.css" />
    <link rel="Stylesheet" href="css/osef_combobox.css" />
    <script type="text/javascript" src="js/cliente.js"></script>
</head>
<body>
    <form id="Form1" runat="server">
        <ext:ResourceManager ID="rmFormaCliente" runat="server" HideInDesign="true">
        </ext:ResourceManager>

        <div>
            <ext:Panel 
                ID="pFormaCliente" 
                runat="server" 
                Width="810"
                BodyStyle="background-color:transparent;">
                <Items>
                    <ext:FormPanel 
                        ID="fpCliente" 
                        runat="server" 
                        Height="398"
                        MonitorResize="true">
                        <Items>
                             <ext:TabPanel 
                                ID="tpCliente" 
                                runat="server" 
                                ActiveTabIndex="0" 
                                Width="810"
                                Plain="true"
                                AutoScroll="true"
                                Cls="custotabpanel xchris">
                                <Items>
                                     <%--Terminado--%>
                                    <ext:Panel 
                                        ID="pDatoGenerales" 
                                        runat="server" 
                                        Title="Datos Generales" 
                                        BodyPadding="10"
                                        MonitorResize="true">
                                        <Items>
                                            <ext:FieldContainer 
                                                ID="fcCliente1" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                FieldLabel="Socio" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField
                                                        ID="txtfID"
                                                        runat="server"
                                                        Width="250"
                                                        StyleSpec="margin-right: 6px;"
                                                        AutoFocus="false"
                                                        Disabled="true"
                                                        MaxLength="8"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                    <ext:Label ID="lblAnexos" runat="server" Text="Adjuntar Anexos: " StyleSpec="margin-right: 6px;" Cls="xLabelCustomizado">
                                                    </ext:Label>
                                                    <ext:ImageButton 
                                                        ID="imgbtnAnexos" 
                                                        runat="server"
                                                        StyleSpec="margin-top: -3px;"
                                                        ImageUrl="assets/img/controles/adjuntoNormal.png"
                                                        DisabledImageUrl="assets/img/controles/adjuntoDisabled.png" 
                                                        OverImageUrl="assets/img/controles/adjuntoOver.png"
                                                        PressedImageUrl="assets/img/controles/adjuntoPressed.png" 
                                                        ToolTip="Anexos"
                                                        Height="25" 
                                                        Width="25">
                                                    </ext:ImageButton>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer
                                                ID="fcCliente2" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout"
                                                FieldLabel="Nombre(s)">
                                                <Items>
                                                    <ext:TextField
                                                        ID="txtfNombre"
                                                        runat="server"
                                                        EmptyText=""
                                                        Width="250"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false"
                                                        MaxLength="50"
                                                        EnforceMaxLength="true"
                                                        AutoFocus="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfNombre.setValue(App.txtfNombre.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                    <ext:TextField
                                                        ID="txtfAPaterno"
                                                        runat="server"
                                                        Width="198"
                                                        EmptyText="Apellido paterno"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="true"
                                                        MaxLength="50"
                                                        EnforceMaxLength="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfAPaterno.setValue(App.txtfAPaterno.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                    <ext:TextField
                                                        ID="txtfAMaterno"
                                                        runat="server"
                                                        EmptyText="Apellido materno"
                                                        Width="198"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="true"
                                                        MaxLength="50"
                                                        EnforceMaxLength="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfAMaterno.setValue(App.txtfAMaterno.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcCliente3" 
                                                runat="server" 
                                                FieldLabel="RFC"
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField
                                                        ID="txtfRFC"
                                                        runat="server"
                                                        Width="250"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="true"
                                                        MaxLength="15"
                                                        EnforceMaxLength="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfRFC.setValue(App.txtfRFC.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                    <ext:TextField
                                                        ID="txtfCURP"
                                                        runat="server"
                                                        Width="402"
                                                        AllowBlank="true"
                                                        MaxLength="18"
                                                        EnforceMaxLength="true"
                                                        EmptyText="CURP">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfCURP.setValue(App.txtfCURP.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcCliente4" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                FieldLabel="Fecha Nacimiento" 
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:DateField
                                                        ID="dfFechaNacimiento"
                                                        runat="server"
                                                        StyleSpec="margin-right: 6px;"
                                                        Width="250"
                                                        AllowBlank="false"
                                                        Vtype="daterange"
                                                        Note="Ejemplo: dd/mm/aaaa">
                                                        <PickerOptions 
                                                            ID="PickerOptions2"
                                                            runat="server"
                                                            Cls="my-date-picker">
                                                        </PickerOptions>
                                                        <Listeners>
                                                            <Select Fn="CalcularFechaNacimiento" />
                                                            <Blur Fn="CalcularFechaNacimiento" />
                                                        </Listeners>
                                                    </ext:DateField>
                                                    <ext:TextField
                                                        ID="txtfEdad"
                                                        runat="server"
                                                        Width="198"
                                                        MaxLength="50"
                                                        EnforceMaxLength="true"
                                                        StyleSpec="margin-right: 6px;"
                                                        Disabled="true"
                                                        EmptyText="Edad">
                                                    </ext:TextField>
                                                    <ext:ComboBox
                                                        ID="cmbSexo"
                                                        runat="server"
                                                        AllowBlank="false"
                                                        Editable="false"
                                                        Width="198"
                                                        EmptyText="Sexo">
                                                        <ListConfig ID="lcSexo" runat="server">
                                                            <Listeners>
                                                                <BeforeRender Fn="ListConfig_BeforeRender" />
                                                            </Listeners>
                                                        </ListConfig>
                                                        <Listeners>
                                                            <BeforeRender Fn="ComboBox_BeforeRender" />
                                                        </Listeners>
                                                        <Items>
                                                            <ext:ListItem Index="0" Text="Masculino" Value="Masculino" />
                                                            <ext:ListItem Index="1" Text="Femenino" Value="Femenino" />
                                                        </Items>
                                                    </ext:ComboBox>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcCliente5" 
                                                runat="server" 
                                                FieldLabel="Estado Civil"
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:ComboBox
                                                        ID="cmbEstadoCivil"
                                                        runat="server"
                                                        AllowBlank="false"
                                                        Editable="false"
                                                        Width="250"
                                                        StyleSpec="margin-right: 6px;">
                                                        <ListConfig ID="lcEstadoCivil" runat="server">
                                                            <Listeners>
                                                                <BeforeRender Fn="ListConfig_BeforeRender" />
                                                            </Listeners>
                                                        </ListConfig>
                                                        <Listeners>
                                                            <BeforeRender Fn="ComboBox_BeforeRender" />
                                                        </Listeners>
                                                        <Items>
                                                            <ext:ListItem Index="0" Text="" Value="Soltero" />
                                                            <ext:ListItem Index="1" Text="" Value="Casado" />
                                                            <ext:ListItem Index="2" Text="" Value="Divorciado" />
                                                            <ext:ListItem Index="3" Text="" Value="Viudo" />
                                                        </Items>
                                                    </ext:ComboBox>
                                                    <ext:ComboBox
                                                        ID="cmbProfesion"
                                                        runat="server"
                                                        Width="402"
                                                        AllowBlank="false"
                                                        Editable="true"
                                                        ValueField="ID"
                                                        DisplayField="Descripcion"
                                                        ForceSelection="true"
                                                        QueryMode="Local"
                                                        TypeAhead="true"
                                                        FieldLabel="Profesión">
                                                        <ListConfig ID="lcProfesion" runat="server">
                                                            <Listeners>
                                                                <BeforeRender Fn="ListConfig_BeforeRender" />
                                                            </Listeners>
                                                        </ListConfig>
                                                        <Listeners>
                                                            <BeforeRender Fn="ComboBox_BeforeRender" />
                                                        </Listeners>
                                                        <Store>
                                                            <ext:Store
                                                                ID="sProfesiones"
                                                                runat="server">
                                                                <Model>
                                                                    <ext:Model
                                                                        ID="mProfesiones"
                                                                        runat="server"
                                                                        IDProperty="ID">
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
                                            </ext:FieldContainer>
                                            <ext:FieldContainer
                                                ID="fcCliente6" 
                                                runat="server" 
                                                FieldLabel="Teléfono"
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField
                                                        ID="txtfTelefono"
                                                        runat="server"
                                                        Width="250"
                                                        StyleSpec="margin-right: 6px;"
                                                        Editable="true"
                                                        MaxLength="15"
                                                        EnforceMaxLength="true"
                                                        AllowBlank="false"
                                                        Note="Ejemplo: (449) 999-00-00">
                                                        <Plugins>
                                                            <ext:InputMask
                                                                ID="imTelefono"
                                                                runat="server"
                                                                Mask="(999) 999-99-99"
                                                                AllowInvalid="true" />
                                                        </Plugins>
                                                    </ext:TextField>
                                                    <ext:TextField
                                                        ID="txtfTelefonoMovil"
                                                        runat="server"
                                                        Width="402"
                                                        FieldLabel="Teléfono móvil"
                                                        ForceSelection="true"
                                                        Editable="true"
                                                        Note="Ejemplo: (044-449) 999-00-00"
                                                        MaxLength="15"
                                                        EnforceMaxLength="true">
                                                        <Plugins>
                                                            <ext:InputMask
                                                                ID="imTelefonoMovil"
                                                                runat="server"
                                                                Mask="(999-999) 999-99-99"
                                                                AllowInvalid="true" />
                                                        </Plugins>
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcCliente7" 
                                                runat="server" 
                                                FieldLabel="Correo"
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField
                                                        ID="txtfCorreo"
                                                        runat="server"
                                                        Width="250"
                                                        Editable="true"
                                                        Vtype="email"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true"
                                                        AllowBlank="false"
                                                        StyleSpec="margin-right: 6px;">
                                                    </ext:TextField>
                                                    <ext:ComboBox
                                                        ID="cmbEstatus"
                                                        runat="server"
                                                        AllowBlank="false"
                                                        Editable="false"
                                                        Width="402"
                                                        FieldLabel="Estatus">
                                                        <ListConfig ID="lcEstatus" runat="server">
                                                            <Listeners>
                                                                <BeforeRender Fn="ListConfig_BeforeRender" />
                                                            </Listeners>
                                                        </ListConfig>
                                                        <Listeners>
                                                            <BeforeRender Fn="ComboBox_BeforeRender" />
                                                        </Listeners>
                                                        <Items>
                                                            <ext:ListItem Index="0" Text="" Value="ALTA" />
                                                            <ext:ListItem Index="1" Text="" Value="BLOQUEADO" />
                                                            <ext:ListItem Index="2" Text="" Value="BAJA" />
                                                        </Items>
                                                    </ext:ComboBox>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcCliente8" 
                                                runat="server" 
                                                FieldLabel="Fecha alta"
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout"
                                                Disabled="true">
                                                <Items>
                                                    <ext:DateField
                                                        ID="dfFechaAlta"
                                                        runat="server"
                                                        StyleSpec="margin-right: 6px;"
                                                        Width="250"
                                                        AllowBlank="true"
                                                        Vtype="daterange">
                                                    </ext:DateField>
                                                    <ext:TextField
                                                        ID="txtfUsuario"
                                                        runat="server"
                                                        Width="402"
                                                        Editable="false"
                                                        MaxLength="50"
                                                        EnforceMaxLength="true"
                                                        AllowBlank="false"
                                                        FieldLabel="Usuario">
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                        </Items>
                                    </ext:Panel>
                                     <%--Terminado--%>
                                    <ext:Panel 
                                        ID="pDireccion" 
                                        runat="server" 
                                        Title="Dirección" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                            <ext:FieldContainer 
                                                ID="fcDireccion1" 
                                                runat="server" 
                                                LabelWidth="120"
                                                FieldLabel="Calle" 
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtfCalle" 
                                                        runat="server" 
                                                        Width="250" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true"
                                                        AutoFocus="true"
                                                        AllowBlank="false">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfCalle.setValue(App.txtfCalle.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                    <ext:TextField 
                                                        ID="txtfEntreCalles" 
                                                        FieldLabel="Entre Calles" 
                                                        runat="server" 
                                                        Width="402"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfEntreCalles.setValue(App.txtfEntreCalles.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcDireccion2" 
                                                runat="server" 
                                                LabelWidth="120"
                                                FieldLabel="N° Exterior"
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtfNoExterior"
                                                        runat="server"
                                                        Width="250"
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="10"
                                                        EnforceMaxLength="true"
                                                        AllowBlank="false">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfNoExterior.setValue(App.txtfNoExterior.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                    <ext:TextField 
                                                        ID="txtfNoInterior"
                                                        FieldLabel="N° Interior"
                                                        runat="server"
                                                        Width="402"
                                                        MaxLength="10"
                                                        EnforceMaxLength="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfNoInterior.setValue(App.txtfNoInterior.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcDireccion3" 
                                                runat="server" 
                                                LabelWidth="120"
                                                FieldLabel="Código Postal"
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField
                                                        ID="txtfCodigoPostal"
                                                        runat="server"
                                                        Width="250"
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="5"
                                                        EnforceMaxLength="true"
                                                        AllowBlank="false">
                                                        <Plugins>
                                                            <ext:InputMask ID="imCodigoPostal" runat="server" Mask="ttttt">
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
                                                        Width="402"
                                                        MaxLength="50"
                                                        EnforceMaxLength="true"
                                                        AllowBlank="false">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfColonia.setValue(App.txtfColonia.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcDireccion4" 
                                                runat="server"
                                                LabelWidth="120"
                                                FieldLabel="Estado" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:ComboBox 
                                                        ID="cmbEstado"
                                                        runat="server"
                                                        Width="250"
                                                        StyleSpec="margin-right: 6px;"
                                                        Editable="true"
                                                        AllowBlank="false"
                                                        DisplayField="Descripcion"
                                                        ValueField="ID"
                                                        MatchFieldWidth="true"
                                                        ForceSelection="true"
                                                        QueryMode="Local"
                                                        TypeAhead="true">
                                                        <ListConfig ID="lcEstado" runat="server">
                                                            <Listeners>
                                                                <BeforeRender Fn="ListConfig_BeforeRender" />
                                                            </Listeners>
                                                        </ListConfig>
                                                        <Listeners>
                                                            <BeforeRender Fn="ComboBox_BeforeRender" />
                                                        </Listeners>
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
                                                        Width="402"
                                                        Editable="true"
                                                        AllowBlank="false"
                                                        DisplayField="Descripcion"
                                                        ValueField="ID"
                                                        MatchFieldWidth="true"
                                                        ForceSelection="true"
                                                        QueryMode="Local"
                                                        TypeAhead="true">
                                                        <ListConfig ID="lcMunicipio" runat="server">
                                                            <Listeners>
                                                                <BeforeRender Fn="ListConfig_BeforeRender" />
                                                            </Listeners>
                                                        </ListConfig>
                                                        <Listeners>
                                                            <BeforeRender Fn="ComboBox_BeforeRender" />
                                                        </Listeners>
                                                        <Store>
                                                            <ext:Store
                                                                ID="sMunicipios"
                                                                runat="server">
                                                                <Model>
                                                                    <ext:Model ID="mMunicipios" runat="server" IDProperty="ID">
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
                                    </ext:Panel>
                                     <%--Terminado--%>
                                    <ext:Panel 
                                        ID="pDatosEmpresa" 
                                        runat="server" 
                                        Title="Datos Empresa" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                            <ext:FieldContainer 
                                                ID="fcDatosEmpresa1" 
                                                runat="server" 
                                                LabelWidth="120"
                                                FieldLabel="Empresa" 
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtfEmpresa" 
                                                        runat="server" 
                                                        Width="250" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="50"
                                                        EnforceMaxLength="true"
                                                        AutoFocus="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfEmpresa.setValue(App.txtfEmpresa.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                    <ext:TextField 
                                                        ID="txtfPuesto" 
                                                        FieldLabel="Puesto" 
                                                        runat="server" 
                                                        Width="402"
                                                        MaxLength="50"
                                                        EnforceMaxLength="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfPuesto.setValue(App.txtfPuesto.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcDatosEmpresa2" 
                                                runat="server" 
                                                LabelWidth="120"
                                                FieldLabel="Calle" 
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtfEmpresaCalle" 
                                                        runat="server" 
                                                        Width="250" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfEmpresaCalle.setValue(App.txtfEmpresaCalle.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                    <ext:TextField 
                                                        ID="txtfEmpresaEntreCalles" 
                                                        FieldLabel="Entre Calles" 
                                                        runat="server" 
                                                        Width="402"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfEmpresaEntreCalles.setValue(App.txtfEmpresaEntreCalles.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcDatosEmpresa3" 
                                                runat="server" 
                                                LabelWidth="120"
                                                FieldLabel="N° Exterior"
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtfEmpresaNoExterior"
                                                        runat="server"
                                                        Width="250"
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="10"
                                                        EnforceMaxLength="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfEmpresaNoExterior.setValue(App.txtfEmpresaNoExterior.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                    <ext:TextField 
                                                        ID="txtfEmpresaNoInterior"
                                                        FieldLabel="N° Interior"
                                                        runat="server"
                                                        Width="402"
                                                        MaxLength="10"
                                                        EnforceMaxLength="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfEmpresaNoInterior.setValue(App.txtfEmpresaNoInterior.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcDatosEmpresa4" 
                                                runat="server" 
                                                LabelWidth="120"
                                                FieldLabel="Código Postal"
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField
                                                        ID="txtfEmpresaCodigoPostal"
                                                        runat="server"
                                                        Width="250"
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="5"
                                                        EnforceMaxLength="true"
                                                        AllowBlank="true">
                                                        <Plugins>
                                                            <ext:InputMask ID="imEmpresaCodigoPostal" runat="server" Mask="ttttt" AllowInvalid="true">
                                                                <MaskSymbols>
                                                                    <ext:MaskSymbol Name="t" Regex="[0-9]" />
                                                                </MaskSymbols>
                                                            </ext:InputMask>
                                                        </Plugins>
                                                    </ext:TextField>
                                                    <ext:TextField
                                                        ID="txtfEmpresaColonia"
                                                        FieldLabel="Colonia"
                                                        runat="server"
                                                        Width="402"
                                                        MaxLength="50"
                                                        EnforceMaxLength="true"
                                                        AllowBlank="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfEmpresaColonia.setValue(App.txtfEmpresaColonia.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcDatosEmpresa5" 
                                                runat="server"
                                                LabelWidth="120"
                                                FieldLabel="Estado" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:ComboBox 
                                                        ID="cmbEmpresaEstado"
                                                        runat="server"
                                                        Width="250"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="true"
                                                        Editable="true"
                                                        StoreID="sEstados"
                                                        ValueField="ID"
                                                        DisplayField="Descripcion"
                                                        MatchFieldWidth="true"
                                                        ForceSelection="true"
                                                        QueryMode="Local"
                                                        TypeAhead="true">
                                                        <ListConfig ID="lcEmpresaEstado" runat="server">
                                                            <Listeners>
                                                                <BeforeRender Fn="ListConfig_BeforeRender" />
                                                            </Listeners>
                                                        </ListConfig>
                                                        <Listeners>
                                                            <BeforeRender Fn="ComboBox_BeforeRender" />
                                                        </Listeners>
                                                        <DirectEvents>
                                                            <Select OnEvent="cmbEmpresaEstado_Select">
                                                                <ExtraParams>
                                                                    <ext:Parameter Name="valor" Value="App.cmbEmpresaEstado.getValue()" Mode="Raw" />
                                                                </ExtraParams>
                                                            </Select>
                                                        </DirectEvents>
                                                    </ext:ComboBox>
                                                    <ext:ComboBox
                                                        ID="cmbEmpresaMunicipio"
                                                        runat="server"
                                                        FieldLabel="Municipio"
                                                        Width="402"
                                                        AllowBlank="true"
                                                        Editable="true"
                                                        DisplayField="Descripcion"
                                                        ValueField="ID"
                                                        MatchFieldWidth="true"
                                                        ForceSelection="true"
                                                        QueryMode="Local"
                                                        TypeAhead="true">
                                                        <ListConfig ID="lcEmpresaMunicipio" runat="server">
                                                            <Listeners>
                                                                <BeforeRender Fn="ListConfig_BeforeRender" />
                                                            </Listeners>
                                                        </ListConfig>
                                                        <Listeners>
                                                            <BeforeRender Fn="ComboBox_BeforeRender" />
                                                        </Listeners>
                                                        <Store>
                                                            <ext:Store
                                                                ID="sEmpresaMunicipios"
                                                                runat="server">
                                                                <Model>
                                                                    <ext:Model ID="mEmpresaMunicipios" runat="server" IDProperty="ID">
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
                                    </ext:Panel>
                                     <%--Terminado--%>
                                    <ext:Panel 
                                        ID="pBeneficiarios" 
                                        runat="server" 
                                        Title="Beneficiarios" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                            <ext:FieldContainer
                                                ID="fcBeneficiario1" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout"
                                                FieldLabel="Beneficiario">
                                                <Items>
                                                    <ext:TextField
                                                        ID="txtfNombreBeneficiario"
                                                        runat="server"
                                                        EmptyText="Nombres"
                                                        Width="250"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false"
                                                        AutoFocus="true"
                                                        MaxLength="50"
                                                        EnforceMaxLength="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfNombreBeneficiario.setValue(App.txtfNombreBeneficiario.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                     <ext:TextField
                                                        ID="txtfAPaternoBeneficiario"
                                                        runat="server"
                                                        Width="198"
                                                        EmptyText="Apellido paterno"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="true"
                                                        MaxLength="50"
                                                        EnforceMaxLength="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfAPaternoBeneficiario.setValue(App.txtfAPaternoBeneficiario.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                     <ext:TextField
                                                        ID="txtfAMaternoBeneficiario"
                                                        runat="server"
                                                        EmptyText="Apellido materno"
                                                        Width="198"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="true"
                                                        MaxLength="50"
                                                        EnforceMaxLength="true">
                                                        <Listeners>
                                                            <Blur Handler="App.txtfAMaternoBeneficiario.setValue(App.txtfAMaternoBeneficiario.getValue().toUpperCase());" />
                                                        </Listeners>
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcBeneficiario2" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                FieldLabel="Teléfono" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField
                                                        ID="txtfTelefonoBeneficiario"
                                                        runat="server"
                                                        Width="250"
                                                        StyleSpec="margin-right: 6px;"
                                                        Editable="true"
                                                        MaxLength="15"
                                                        EnforceMaxLength="true"
                                                        AllowBlank="false"
                                                        Note="Ejemplo: (449) 999-00-00">
                                                        <Plugins>
                                                            <ext:InputMask
                                                                ID="imTelefonoBeneficiario"
                                                                runat="server"
                                                                Mask="(999) 999-99-99"
                                                                AllowInvalid="true" />
                                                        </Plugins>
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcBeneficiario3" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                FieldLabel="Parentesco" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField
                                                        ID="txtfParentescoBeneficiario"
                                                        runat="server"
                                                        Width="250"
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="20"
                                                        EnforceMaxLength="true"
                                                        AllowBlank="false">
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                        </Items>
                                    </ext:Panel>
                                </Items>
                            </ext:TabPanel>
                        </Items>
                        <BottomBar>
                            <ext:StatusBar ID="sbSocios" runat="server" Cls="x-colorToolbar" Text="Sin validar información" />
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

                     <ext:Window 
                        ID="wFormaAnexos" 
                        runat="server" 
                        Icon="Application" 
                        Hidden="true" 
                        Modal="true"
                        Padding="5" 
                        Resizable="False" 
                        Region="Center" 
                        XOnEsc="Ext.emptyFn">
                        <Loader 
                            ID="Loader1" 
                            runat="server" 
                            Mode="Frame" 
                            AutoLoad="false">
                            <LoadMask 
                                ShowMask="true" 
                                Msg="Cargando..." />
                        </Loader>
                    </ext:Window>


                </Items>
            </ext:Panel>
        </div>
    </form>
</body>
</html>