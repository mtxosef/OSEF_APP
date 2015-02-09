<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaSolicitudPrestamo.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.FormaSolicitudPrestamo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="css/login2.css" />
    <link rel="Stylesheet" href="css/customControls2.css" />
    <script type='text/javascript' src="js/sucursales.js"></script>
</head>
<body>
    <form id="Form1" runat="server">
        <ext:ResourceManager ID="rmSolicitudPrestamo" runat="server" HideInDesign="true" />

        <div>
            <ext:Panel 
                ID="pSolicitudPrestamo" 
                runat="server" 
                Width="910"
                BodyStyle="background-color:transparent;">
                <Items>
                    <ext:FormPanel 
                        ID="fpsolicitudPrestamo" 
                        runat="server" 
                        Height="525"
                        MonitorResize="true"
                        >
                        <Items>
                             <ext:TabPanel 
                                ID="tbSolicitudPrestamo" 
                                runat="server" 
                                ActiveTabIndex="0" 
                                Width="900"
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
                                        <ext:FieldSet 
                                        ID="fsDivisorDatos" 
                                        runat="server" 
                                        Title="Datos Generales" 
                                        DefaultAnchor="100%"
                                        AutoScroll="false">
                                        <Items>
                                            <ext:FieldContainer 
                                                ID="C1" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                FieldLabel="Socio" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:ComboBox
                                                        ID="cmbSocio"
                                                        runat="server"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        AutoFocus="true">
                                                    </ext:ComboBox>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer
                                                ID="C2" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout"
                                                FieldLabel="Nombre">
                                                <Items>
                                                    <ext:TextField
                                                        ID="txtfNombre"
                                                        runat="server"
                                                        EmptyText="Nombres"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false">
                                                    </ext:TextField>
                                                     <ext:TextField
                                                        ID="txtApPaterno"
                                                        runat="server"
                                                        Width="200"
                                                        EmptyText="Apellido Paterno"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false">
                                                    </ext:TextField>
                                                     <ext:TextField
                                                        ID="txtApMaterno"
                                                        runat="server"
                                                        EmptyText="Apellido Materno"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false">
                                                    </ext:TextField>
                                            </Items>
                                            </ext:FieldContainer>
                                             <ext:FieldContainer 
                                                ID="c3" 
                                                runat="server"
                                                LabelWidth="120"  
                                                FieldLabel="Nacionalidad" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:ComboBox
                                                        ID="cmbNacionalidad"
                                                        runat="server"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;">
                                                    </ext:ComboBox>
                                                    <ext:RadioGroup
                                                        ID="rgRegMatrimonial"
                                                        runat="server"
                                                        Width="480"
                                                        LabelWidth="140"
                                                        StyleSpec="margin-right: 6px;"
                                                        FieldLabel="Registro Matrimonial">
                                                        <Items>
                                                            <ext:Radio ID="rBienesSeparados" runat="server" BoxLabel="Bienes Separados" Checked="true" />
                                                            <ext:Radio ID="rBienesMancomunados" runat="server" BoxLabel="Bienes Mancomunados"  />
                                                        </Items>
                                                    </ext:RadioGroup>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="c4" 
                                                runat="server" 
                                                FieldLabel="N° Dependientes"
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:NumberField
                                                        ID="nfNDependientes"
                                                        runat="server"
                                                        Width="200"
                                                        MaxLength="2"
                                                        EnforceMaxLength="true"
                                                        MinValue="0"
                                                        MaxValue="99"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowDecimals="false"
                                                        Step="1">
                                                    </ext:NumberField>
                                                    <ext:TextField
                                                        ID="txtEdades"
                                                        runat="server"
                                                        Width="406"
                                                        FieldLabel="Edades">
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="c5" 
                                                runat="server"
                                                LabelWidth="120"  
                                                FieldLabel="Tipo de casa" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:RadioGroup
                                                        ID="rgTipoVivienda"
                                                        runat="server"
                                                        Width="500"
                                                        LabelWidth="140"
                                                        StyleSpec="margin-right: 6px;">
                                                        <Items>
                                                            <ext:Radio ID="rPropia" runat="server" BoxLabel="Propia" Checked="true" />
                                                            <ext:Radio ID="rRentada" runat="server" BoxLabel="Rentada"  />
                                                            <ext:Radio ID="rFamilia" runat="server" BoxLabel="Familia"  />
                                                            <ext:Radio ID="rHipoteca" runat="server" BoxLabel="Hipoteca"  />
                                                        </Items>
                                                    </ext:RadioGroup>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="c6" 
                                                runat="server" 
                                                FieldLabel="Antigüedad en domicilio actual"
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:NumberField
                                                        ID="nAnosDomicilioActual"
                                                        runat="server"
                                                        Width="200"
                                                        MaxLength="2"
                                                        EnforceMaxLength="true"
                                                        MinValue="0"
                                                        MaxValue="99"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowDecimals="false"
                                                        Step="1">
                                                    </ext:NumberField>
                                                   
                                                </Items>
                                            </ext:FieldContainer>
                                            </Items>
                                            </ext:FieldSet>

                                            <ext:FieldSet 
                                                ID="fsDomicilioAnterior" 
                                                runat="server" 
                                                Title="Domicilio Anterior" 
                                                DefaultAnchor="100%"
                                                AutoScroll="false">
                                                <Items>
                                                      <ext:FieldContainer 
                                                ID="FieldContainerCalles" 
                                                runat="server" 
                                                LabelWidth="120" 
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
                                                    </ext:TextField>
                                                    <ext:TextField 
                                                        ID="txtfEntreCalles" 
                                                        FieldLabel="Entre Calles" 
                                                        runat="server" 
                                                        Width="300"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="FieldContainerNumInt" 
                                                runat="server" 
                                                LabelWidth="120" 
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
                                                    </ext:TextField>
                                                    <ext:TextField 
                                                        ID="txtfNoInterior"
                                                        FieldLabel="N° Interior"
                                                        runat="server"
                                                        Width="300"
                                                        MaxLength="10"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="FieldContainerCPCol" 
                                                runat="server" 
                                                LabelWidth="120" 
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
                                                    </ext:TextField>
                                                    <ext:ComboBox
                                                        ID="txtfColonia"
                                                        FieldLabel="Colonia"
                                                        runat="server"
                                                        Width="300"
                                                        ForceSelection="true"
                                                        Editable="false">
                                                    </ext:ComboBox>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="ContenedorEstMun" 
                                                runat="server"
                                                LabelWidth="120" 
                                                FieldLabel="Estado" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:ComboBox 
                                                        ID="cmbEstado"
                                                        runat="server"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        ForceSelection="true"
                                                        Editable="false">
                                                    </ext:ComboBox>
                                                    <ext:ComboBox
                                                        ID="cmbMunicipio"
                                                        runat="server"
                                                        FieldLabel="Municipio"
                                                        Width="300"
                                                        ForceSelection="true"
                                                        Editable="false">
                                                    </ext:ComboBox>
                                                </Items>
                                                </ext:FieldContainer>
                                                </Items>
                                            </ext:FieldSet>
                                        </Items>
                                    </ext:Panel>
                                     <%--Terminado--%>
                                    <ext:Panel 
                                        ID="pOcupacionActual" 
                                        runat="server" 
                                        Title="Ocupación actual" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                            <ext:FieldContainer 
                                                ID="fcOcupacion0" 
                                                runat="server" 
                                                FieldLabel="Empresa"
                                                LabelWidth="120"  
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtEmpresa" 
                                                        runat="server" 
                                                        Width="406" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                    <ext:TextField 
                                                        ID="txtPuesto" 
                                                        runat="server"
                                                        FieldLabel="Puesto" 
                                                        Width="306" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcOcupacion1" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                FieldLabel="Antigüedad" 
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:NumberField
                                                        ID="nfAntiguedad"
                                                        runat="server"
                                                        Width="200"
                                                        MaxLength="2"
                                                        EnforceMaxLength="true"
                                                        MinValue="0"
                                                        MaxValue="99"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowDecimals="false"
                                                        Step="1">
                                                    </ext:NumberField>
                                                    <ext:NumberField
                                                        ID="nfIngresos"
                                                        runat="server"
                                                        Width="200"
                                                        FieldLabel="Ingresos"
                                                        MaxLength="6"
                                                        EnforceMaxLength="true"
                                                        MinValue="0"
                                                        MaxValue="999999"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowDecimals="true"
                                                        Step="1">
                                                    </ext:NumberField>
                                                    <ext:NumberField
                                                        ID="nfOtrosIngresos"
                                                        runat="server"
                                                        Width="200"
                                                        FieldLabel="Otros Ingresos"
                                                        MaxLength="6"
                                                        EnforceMaxLength="true"
                                                        MinValue="0"
                                                        MaxValue="999999"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowDecimals="true"
                                                        Step="1">
                                                    </ext:NumberField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcOcupacion2" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                FieldLabel="Concepto" 
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtOtrosIngresos" 
                                                        runat="server" 
                                                        Width="406" 
                                                        EmptyText="Concepto Otros Ingresos"
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                   
                                                </Items>
                                            </ext:FieldContainer>                                         
                                            <ext:FieldContainer
                                                ID="fcOcupacion3" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout"
                                                FieldLabel="Jefe Inmediato">
                                                <Items>
                                                    <ext:TextField
                                                        ID="txtJefeInmediato"
                                                        runat="server"
                                                        EmptyText="Nombres"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false">
                                                    </ext:TextField>
                                                     <ext:TextField
                                                        ID="txtApPaternoJefe"
                                                        runat="server"
                                                        Width="200"
                                                        EmptyText="Apellido Paterno"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false">
                                                    </ext:TextField>
                                                     <ext:TextField
                                                        ID="txtApMaternoJefe"
                                                        runat="server"
                                                        EmptyText="Apellido Materno"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false">
                                                    </ext:TextField>
                                            </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcOcupacion4" 
                                                runat="server" 
                                                FieldLabel="Empresa Anterior"
                                                LabelWidth="120"  
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtEmpresaAnterior" 
                                                        runat="server" 
                                                        Width="406" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                        </Items>
                                    </ext:Panel>
                                     <%--Terminado--%>
                                    <ext:Panel 
                                        ID="pDatosConyugue" 
                                        runat="server" 
                                        Title="Datos Conyugue" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                            <ext:FieldSet 
                                                ID="fsDatosGeneralesConyuge" 
                                                runat="server" 
                                                Title="Datos Generales" 
                                                DefaultAnchor="100%">
                                                <Items>
                                                     <ext:FieldContainer
                                                        ID="FieldContainer1" 
                                                        runat="server" 
                                                        LabelWidth="120" 
                                                        AnchorHorizontal="100%" 
                                                        Layout="ColumnLayout"
                                                        FieldLabel="Nombre">
                                                        <Items>
                                                        <ext:TextField
                                                        ID="TextField1"
                                                        runat="server"
                                                        EmptyText="Nombres"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false">
                                                        </ext:TextField>
                                                        <ext:TextField
                                                        ID="TextField6"
                                                        runat="server"
                                                        Width="200"
                                                        EmptyText="Apellido Paterno"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false">
                                                        </ext:TextField>
                                                        <ext:TextField
                                                        ID="TextField7"
                                                        runat="server"
                                                        EmptyText="Apellido Materno"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false">
                                                        </ext:TextField>
                                                        </Items>
                                                    </ext:FieldContainer>
                                                       <ext:FieldContainer 
                                                        ID="FieldContainer2" 
                                                        runat="server" 
                                                        LabelWidth="120" 
                                                        FieldLabel="Fecha Nacimiento" 
                                                        AnchorHorizontal="100%"
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                        <ext:DateField
                                                        ID="NumberField1"
                                                        runat="server"
                                                        StyleSpec="margin-right: 6px;"
                                                        Width="200">
                                                        <PickerOptions 
                                                            ID="poFechaNacimiento"
                                                            runat="server"
                                                            Cls="my-date-picker">
                                                        </PickerOptions>
                                                        </ext:DateField>
                                                        <ext:NumberField
                                                        ID="NumberField2"
                                                        runat="server"
                                                        Width="200"
                                                        FieldLabel="Edad"
                                                        MaxLength="2"
                                                        EnforceMaxLength="true"
                                                        MinValue="0"
                                                        MaxValue="99"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowDecimals="false"
                                                        Step="1">
                                                        </ext:NumberField>
                                                        <ext:TextField
                                                        ID="NumberField3"
                                                        runat="server"
                                                        Width="200"
                                                        EmptyText="RFC">
                                                        </ext:TextField>
                                                        </Items>
                                                    </ext:FieldContainer>
                                                </Items>
                                            </ext:FieldSet>


                                                <ext:FieldSet 
                                                ID="FieldSet1" 
                                                runat="server" 
                                                Title="Domicilio" 
                                                DefaultAnchor="100%"
                                                AutoScroll="false">
                                                 <Items>
                                                    <ext:FieldContainer 
                                                    ID="FieldContainer3" 
                                                    runat="server" 
                                                    LabelWidth="120" 
                                                    FieldLabel="Calle" 
                                                    AnchorHorizontal="100%"
                                                    Layout="ColumnLayout">
                                                    <Items>
                                                        <ext:TextField 
                                                            ID="TextField8" 
                                                            runat="server" 
                                                            Width="200" 
                                                            StyleSpec="margin-right: 6px;"
                                                            MaxLength="100"
                                                            EnforceMaxLength="true">
                                                        </ext:TextField>
                                                        <ext:TextField 
                                                            ID="TextField9" 
                                                            FieldLabel="Entre Calles" 
                                                            runat="server" 
                                                            Width="300"
                                                            MaxLength="100"
                                                            EnforceMaxLength="true">
                                                        </ext:TextField>
                                                    </Items>
                                                </ext:FieldContainer>
                                                    <ext:FieldContainer 
                                                    ID="FieldContainer4" 
                                                    runat="server" 
                                                    LabelWidth="120" 
                                                    FieldLabel="N° Exterior"
                                                    AnchorHorizontal="100%" 
                                                    Layout="ColumnLayout">
                                                    <Items>
                                                        <ext:TextField 
                                                            ID="TextField10"
                                                            runat="server"
                                                            Width="200"
                                                            StyleSpec="margin-right: 6px;"
                                                            MaxLength="10"
                                                            EnforceMaxLength="true">
                                                        </ext:TextField>
                                                        <ext:TextField 
                                                            ID="TextField11"
                                                            FieldLabel="N° Interior"
                                                            runat="server"
                                                            Width="300"
                                                            MaxLength="10"
                                                            EnforceMaxLength="true">
                                                        </ext:TextField>
                                                    </Items>
                                                </ext:FieldContainer>
                                                    <ext:FieldContainer 
                                                    ID="FieldContainer5" 
                                                    runat="server" 
                                                    LabelWidth="120" 
                                                    FieldLabel="Código Postal"
                                                    AnchorHorizontal="100%" 
                                                    Layout="ColumnLayout">
                                                    <Items>
                                                        <ext:TextField 
                                                            ID="TextField12" 
                                                            runat="server" 
                                                            Width="200" 
                                                            StyleSpec="margin-right: 6px;"
                                                            MaxLength="5"
                                                            EnforceMaxLength="true"
                                                            AllowBlank="true">
                                                        </ext:TextField>
                                                        <ext:ComboBox
                                                            ID="ComboBox1"
                                                            FieldLabel="Colonia"
                                                            runat="server"
                                                            Width="300"
                                                            ForceSelection="true"
                                                            Editable="false">
                                                        </ext:ComboBox>
                                                    </Items>
                                                </ext:FieldContainer>
                                                    <ext:FieldContainer 
                                                    ID="FieldContainer6" 
                                                    runat="server"
                                                    LabelWidth="120" 
                                                    FieldLabel="Estado" 
                                                    Layout="ColumnLayout">
                                                    <Items>
                                                        <ext:ComboBox 
                                                            ID="ComboBox2"
                                                            runat="server"
                                                            Width="200"
                                                            StyleSpec="margin-right: 6px;"
                                                            ForceSelection="true"
                                                            Editable="false">
                                                        </ext:ComboBox>
                                                        <ext:ComboBox
                                                            ID="ComboBox3"
                                                            runat="server"
                                                            FieldLabel="Municipio"
                                                            Width="300"
                                                            ForceSelection="true"
                                                            Editable="false">
                                                        </ext:ComboBox>
                                                    </Items>
                                                    </ext:FieldContainer>
                                                    <ext:FieldContainer 
                                                    ID="FieldContainer7" 
                                                    runat="server" 
                                                    LabelWidth="120"
                                                    FieldLabel="Telefono"
                                                    AnchorHorizontal="100%" 
                                                    Layout="ColumnLayout">
                                                    <Items>
                                                        <ext:TextField 
                                                            ID="TextField13"
                                                            runat="server"
                                                            Width="200"
                                                            StyleSpec="margin-right: 6px;"
                                                            MaxLength="10"
                                                            EnforceMaxLength="true">
                                                        </ext:TextField>
                                                        <ext:TextField 
                                                            ID="TextField14"
                                                            FieldLabel="Celular"
                                                            runat="server"
                                                            Width="300"
                                                            MaxLength="10"
                                                            EnforceMaxLength="true">
                                                        </ext:TextField>
                                                    </Items>
                                                </ext:FieldContainer>

                                                </Items>
                                                </ext:FieldSet>

                                                  <ext:FieldSet 
                                                ID="FieldSet2" 
                                                runat="server" 
                                                Title="Empresa" 
                                                DefaultAnchor="100%">
                                                 <Items>
                                                <ext:FieldContainer 
                                                ID="FieldContainer8" 
                                                runat="server" 
                                                FieldLabel="Empresa"
                                                LabelWidth="120"  
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="TextField15" 
                                                        runat="server" 
                                                        Width="406" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                    <ext:TextField 
                                                        ID="TextField16" 
                                                        runat="server"
                                                        FieldLabel="Puesto" 
                                                        Width="306" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="FieldContainer9" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                FieldLabel="Antigüedad" 
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:NumberField
                                                        ID="NumberField4"
                                                        runat="server"
                                                        Width="200"
                                                        MaxLength="2"
                                                        EnforceMaxLength="true"
                                                        MinValue="0"
                                                        MaxValue="99"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowDecimals="false"
                                                        Step="1">
                                                    </ext:NumberField>
                                                    <ext:NumberField
                                                        ID="NumberField5"
                                                        runat="server"
                                                        Width="200"
                                                        FieldLabel="Ingresos"
                                                        MaxLength="6"
                                                        EnforceMaxLength="true"
                                                        MinValue="0"
                                                        MaxValue="999999"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowDecimals="true"
                                                        Step="1">
                                                    </ext:NumberField>
                                                    <ext:NumberField
                                                        ID="NumberField6"
                                                        runat="server"
                                                        Width="200"
                                                        FieldLabel="Otros Ingresos"
                                                        MaxLength="6"
                                                        EnforceMaxLength="true"
                                                        MinValue="0"
                                                        MaxValue="999999"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowDecimals="true"
                                                        Step="1">
                                                    </ext:NumberField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="FieldContainer10" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                FieldLabel="Concepto" 
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="TextField17" 
                                                        runat="server" 
                                                        Width="406" 
                                                        EmptyText="Concepto Otros Ingresos"
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                   
                                                </Items>
                                            </ext:FieldContainer>                                         
                                            <ext:FieldContainer
                                                ID="FieldContainer11" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout"
                                                FieldLabel="Jefe Inmediato">
                                                <Items>
                                                    <ext:TextField
                                                        ID="TextField18"
                                                        runat="server"
                                                        EmptyText="Nombres"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false">
                                                    </ext:TextField>
                                                     <ext:TextField
                                                        ID="TextField19"
                                                        runat="server"
                                                        Width="200"
                                                        EmptyText="Apellido Paterno"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false">
                                                    </ext:TextField>
                                                     <ext:TextField
                                                        ID="TextField20"
                                                        runat="server"
                                                        EmptyText="Apellido Materno"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false">
                                                    </ext:TextField>
                                            </Items>
                                            </ext:FieldContainer>

                                            <ext:FieldContainer 
                                                    ID="FieldContainer12" 
                                                    runat="server" 
                                                    LabelWidth="120" 
                                                    FieldLabel="Calle" 
                                                    AnchorHorizontal="100%"
                                                    Layout="ColumnLayout">
                                                    <Items>
                                                        <ext:TextField 
                                                            ID="TextField21" 
                                                            runat="server" 
                                                            Width="200" 
                                                            StyleSpec="margin-right: 6px;"
                                                            MaxLength="100"
                                                            EnforceMaxLength="true">
                                                        </ext:TextField>
                                                        <ext:TextField 
                                                            ID="TextField22" 
                                                            FieldLabel="Entre Calles" 
                                                            runat="server" 
                                                            Width="300"
                                                            MaxLength="100"
                                                            EnforceMaxLength="true">
                                                        </ext:TextField>
                                                    </Items>
                                                </ext:FieldContainer>
                                                    <ext:FieldContainer 
                                                    ID="FieldContainer13" 
                                                    runat="server" 
                                                    LabelWidth="120" 
                                                    FieldLabel="N° Exterior"
                                                    AnchorHorizontal="100%" 
                                                    Layout="ColumnLayout">
                                                    <Items>
                                                        <ext:TextField 
                                                            ID="TextField23"
                                                            runat="server"
                                                            Width="200"
                                                            StyleSpec="margin-right: 6px;"
                                                            MaxLength="10"
                                                            EnforceMaxLength="true">
                                                        </ext:TextField>
                                                        <ext:TextField 
                                                            ID="TextField24"
                                                            FieldLabel="N° Interior"
                                                            runat="server"
                                                            Width="300"
                                                            MaxLength="10"
                                                            EnforceMaxLength="true">
                                                        </ext:TextField>
                                                    </Items>
                                                </ext:FieldContainer>
                                                    <ext:FieldContainer 
                                                    ID="FieldContainer14" 
                                                    runat="server" 
                                                    LabelWidth="120" 
                                                    FieldLabel="Código Postal"
                                                    AnchorHorizontal="100%" 
                                                    Layout="ColumnLayout">
                                                    <Items>
                                                        <ext:TextField 
                                                            ID="TextField25" 
                                                            runat="server" 
                                                            Width="200" 
                                                            StyleSpec="margin-right: 6px;"
                                                            MaxLength="5"
                                                            EnforceMaxLength="true"
                                                            AllowBlank="true">
                                                        </ext:TextField>
                                                        <ext:ComboBox
                                                            ID="ComboBox4"
                                                            FieldLabel="Colonia"
                                                            runat="server"
                                                            Width="300"
                                                            ForceSelection="true"
                                                            Editable="false">
                                                        </ext:ComboBox>
                                                    </Items>
                                                </ext:FieldContainer>
                                                    <ext:FieldContainer 
                                                    ID="FieldContainer15" 
                                                    runat="server"
                                                    LabelWidth="120" 
                                                    FieldLabel="Estado" 
                                                    Layout="ColumnLayout">
                                                    <Items>
                                                        <ext:ComboBox 
                                                            ID="ComboBox5"
                                                            runat="server"
                                                            Width="200"
                                                            StyleSpec="margin-right: 6px;"
                                                            ForceSelection="true"
                                                            Editable="false">
                                                        </ext:ComboBox>
                                                        <ext:ComboBox
                                                            ID="ComboBox6"
                                                            runat="server"
                                                            FieldLabel="Municipio"
                                                            Width="300"
                                                            ForceSelection="true"
                                                            Editable="false">
                                                        </ext:ComboBox>
                                                    </Items>
                                                    </ext:FieldContainer>
                                                </Items>
                                                </ext:FieldSet>
                                        </Items>
                                    </ext:Panel>
                                     <%--Terminado--%>
                                    <ext:Panel 
                                        ID="pReferencias" 
                                        runat="server" 
                                        Title="Referencias" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                        <ext:FieldContainer 
                                                ID="fcReferencia1" 
                                                runat="server" 
                                                FieldLabel="Nombre Insitución"
                                                LabelWidth="120"  
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtInsitucion" 
                                                        runat="server" 
                                                        Width="300" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                    <ext:ComboBox 
                                                        ID="cmbTipoCuenta" 
                                                        runat="server"
                                                        FieldLabel="Tipo Cuenta" 
                                                        Width="306" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:ComboBox>
                                                </Items>
                                            </ext:FieldContainer>
                                        <ext:FieldContainer 
                                                ID="fcReferencia2" 
                                                runat="server" 
                                                FieldLabel="No. Cuenta"
                                                LabelWidth="120"  
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtNoCuenta" 
                                                        runat="server" 
                                                        Width="300" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                        </Items>
                                    </ext:Panel>
                                     <%--Terminado--%>
                                    <ext:Panel 
                                        ID="pBienes" 
                                        runat="server" 
                                        Title="Bienes" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                         <ext:FieldContainer 
                                                ID="fcBienes1" 
                                                runat="server" 
                                                FieldLabel="Ubicación"
                                                LabelWidth="120"  
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtUbicacion" 
                                                        runat="server" 
                                                        Width="300" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                    <ext:ComboBox 
                                                        ID="cmbTipoInmueble" 
                                                        runat="server"
                                                        FieldLabel="Tipo Inmueble" 
                                                        Width="306" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:ComboBox>
                                                </Items>
                                            </ext:FieldContainer>
                                         <ext:FieldContainer 
                                                ID="fcBienes2" 
                                                runat="server" 
                                                FieldLabel="Inscripción"
                                                LabelWidth="120"  
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtInscripción" 
                                                        runat="server" 
                                                        Width="300" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                     <ext:NumberField 
                                                        ID="nfValorInmueble" 
                                                        runat="server"
                                                        FieldLabel="Valor" 
                                                        Width="306" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="9"
                                                        EnforceMaxLength="true"
                                                        MinValue="0"
                                                        MaxValue="999999999"
                                                        AllowDecimals="true"
                                                        Step="1">
                                                    </ext:NumberField>
                                                </Items>
                                            </ext:FieldContainer>
                                        </Items>
                                    </ext:Panel>
                                     <%--Terminado--%>
                                    <ext:Panel 
                                        ID="pDatosgeneralesAval" 
                                        runat="server" 
                                        Title="Datos Aval" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                            <ext:FieldContainer
                                                ID="fcDatosAval1" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout"
                                                FieldLabel="Nombre">
                                                <Items>
                                                    <ext:TextField
                                                        ID="txtNombreAval"
                                                        runat="server"
                                                        EmptyText="Nombres"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false">
                                                    </ext:TextField>
                                                     <ext:TextField
                                                        ID="txtApAval"
                                                        runat="server"
                                                        Width="200"
                                                        EmptyText="Apellido Paterno"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false">
                                                    </ext:TextField>
                                                     <ext:TextField
                                                        ID="txtApMaternoAval"
                                                        runat="server"
                                                        EmptyText="Apellido Materno"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false">
                                                    </ext:TextField>
                                            </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcDatosAval2" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:RadioGroup
                                                        ID="rgSocioCooperativa"
                                                        runat="server"
                                                        Width="380"
                                                        LabelWidth="120" 
                                                        StyleSpec="margin-right: 6px;"
                                                        FieldLabel="Es socio">
                                                        <Items>
                                                            <ext:Radio ID="rSocioSi" runat="server" BoxLabel="Si" Checked="true" />
                                                            <ext:Radio ID="rSocioNo" runat="server" BoxLabel="No"  />
                                                        </Items>
                                                    </ext:RadioGroup>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcDatosAval3" 
                                                runat="server"
                                                LabelWidth="120"  
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:RadioGroup
                                                        ID="rgEstadoCivil"
                                                        runat="server"
                                                        Width="380"
                                                        LabelWidth="120" 
                                                        StyleSpec="margin-right: 6px;"
                                                        FieldLabel="Estado Civil">
                                                        <Items>
                                                            <ext:Radio ID="rEdoCivilCasado" runat="server" BoxLabel="Casado" Checked="true" />
                                                            <ext:Radio ID="rEdoCivilSoltero" runat="server" BoxLabel="Soltero"  />
                                                        </Items>
                                                    </ext:RadioGroup>
                                                    <ext:TextField
                                                        ID="txtOtro"
                                                        runat="server"
                                                        FieldLabel="Otro"
                                                        Width="350"
                                                        StyleSpec="margin-right: 6px;">
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcDatosAval4" 
                                                runat="server"
                                                LabelWidth="120"  
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:RadioGroup
                                                        ID="rgRegistroMatAval"
                                                        runat="server"
                                                        Width="480"
                                                        LabelWidth="120"
                                                        StyleSpec="margin-right: 6px;"
                                                        FieldLabel="Registro Matrimonial">
                                                        <Items>
                                                            <ext:Radio ID="rSeparadoAval" runat="server" BoxLabel="Bienes Separados" Checked="true" />
                                                            <ext:Radio ID="rMancomunadoAval" runat="server" BoxLabel="Bienes Mancomunados"  />
                                                        </Items>
                                                    </ext:RadioGroup>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcDatosAval5" 
                                                runat="server" 
                                                LabelWidth="120"
                                                FieldLabel="Calle" 
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtCalleAval" 
                                                        runat="server" 
                                                        Width="200" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                    <ext:TextField 
                                                        ID="txtEntreCallesAval" 
                                                        FieldLabel="Entre Calles" 
                                                        runat="server" 
                                                        Width="300"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcDatosAval6" 
                                                runat="server" 
                                                LabelWidth="120"
                                                FieldLabel="N° Exterior"
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtNExteriorAval"
                                                        runat="server"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="10"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                    <ext:TextField 
                                                        ID="txtNIntAval"
                                                        FieldLabel="N° Interior"
                                                        runat="server"
                                                        Width="300"
                                                        MaxLength="10"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcDatosAval7" 
                                                runat="server" 
                                                LabelWidth="120"
                                                FieldLabel="Código Postal"
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtCpAval" 
                                                        runat="server" 
                                                        Width="200" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="5"
                                                        EnforceMaxLength="true"
                                                        AllowBlank="true">
                                                    </ext:TextField>
                                                    <ext:ComboBox
                                                        ID="cmbColoniaAval"
                                                        FieldLabel="Colonia"
                                                        runat="server"
                                                        Width="300"
                                                        ForceSelection="true"
                                                        Editable="false">
                                                    </ext:ComboBox>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcDatosAval8" 
                                                runat="server"
                                                LabelWidth="120"
                                                FieldLabel="Estado" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:ComboBox 
                                                        ID="cmbEstadoAval"
                                                        runat="server"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        ForceSelection="true"
                                                        Editable="false">
                                                    </ext:ComboBox>
                                                    <ext:ComboBox
                                                        ID="cmbMunicipioAval"
                                                        runat="server"
                                                        FieldLabel="Municipio"
                                                        Width="300"
                                                        ForceSelection="true"
                                                        Editable="false">
                                                    </ext:ComboBox>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcDatosAval9" 
                                                runat="server" 
                                                LabelWidth="120"
                                                FieldLabel="Telefono"
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtTelefonoAval"
                                                        runat="server"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="10"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                    <ext:TextField 
                                                        ID="txtCelularAval"
                                                        FieldLabel="Celular"
                                                        runat="server"
                                                        Width="300"
                                                        MaxLength="10"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcDatosAval10" 
                                                runat="server"
                                                LabelWidth="120"  
                                                FieldLabel="Tipo de casa" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:RadioGroup
                                                        ID="rgTipoCasaAval"
                                                        runat="server"
                                                        Width="500"
                                                        LabelWidth="140"
                                                        StyleSpec="margin-right: 6px;">
                                                        <Items>
                                                            <ext:Radio ID="rPropiaAval" runat="server" BoxLabel="Propia" Checked="true" />
                                                            <ext:Radio ID="rRentadaAval" runat="server" BoxLabel="Rentada"  />
                                                            <ext:Radio ID="rFamiliaAval" runat="server" BoxLabel="Familia"  />
                                                            <ext:Radio ID="rHipotecaAval" runat="server" BoxLabel="Hipoteca"  />
                                                        </Items>
                                                    </ext:RadioGroup>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcDatosAval11" 
                                                runat="server" 
                                                FieldLabel="Antigüedad en domicilio actual"
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:NumberField
                                                        ID="nfAntiguedadDocmicilioAval"
                                                        runat="server"
                                                        Width="200"
                                                        MaxLength="2"
                                                        EnforceMaxLength="true"
                                                        MinValue="0"
                                                        MaxValue="99"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowDecimals="false"
                                                        Step="1">
                                                    </ext:NumberField>
                                                </Items>
                                            </ext:FieldContainer>
                                        </Items>
                                    </ext:Panel>
                                     <%--Terminado--%>
                                    <ext:Panel 
                                        ID="pOcupacionAval" 
                                        runat="server" 
                                        Title="Ocupación Aval" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                           <ext:FieldContainer 
                                                ID="fcOcupacionAval" 
                                                runat="server" 
                                                FieldLabel="Empresa"
                                                LabelWidth="120"  
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtEmpresaAval" 
                                                        runat="server" 
                                                        Width="406" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                    <ext:TextField 
                                                        ID="txtPruesto" 
                                                        runat="server"
                                                        FieldLabel="Puesto" 
                                                        Width="306" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                           <ext:FieldContainer
                                                ID="fcOcupacionAval1" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout"
                                                FieldLabel="Jefe Inmediato">
                                                <Items>
                                                    <ext:TextField
                                                        ID="TextField2"
                                                        runat="server"
                                                        EmptyText="Nombres"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false">
                                                    </ext:TextField>
                                                     <ext:TextField
                                                        ID="TextField3"
                                                        runat="server"
                                                        Width="200"
                                                        EmptyText="Apellido Paterno"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false">
                                                    </ext:TextField>
                                                     <ext:TextField
                                                        ID="TextField4"
                                                        runat="server"
                                                        EmptyText="Apellido Materno"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false">
                                                    </ext:TextField>
                                            </Items>
                                            </ext:FieldContainer>
                                           <ext:FieldContainer 
                                                ID="fcOcupacionAval2" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                FieldLabel="Antigüedad" 
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:NumberField
                                                        ID="nfAnitguedadAval"
                                                        runat="server"
                                                        Width="200"
                                                        MaxLength="2"
                                                        EnforceMaxLength="true"
                                                        MinValue="0"
                                                        MaxValue="99"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowDecimals="false"
                                                        Step="1">
                                                    </ext:NumberField>
                                                    <ext:NumberField
                                                        ID="nfIngresosAval"
                                                        runat="server"
                                                        Width="200"
                                                        FieldLabel="Ingresos"
                                                        MaxLength="6"
                                                        EnforceMaxLength="true"
                                                        MinValue="0"
                                                        MaxValue="999999"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowDecimals="true"
                                                        Step="1">
                                                    </ext:NumberField>
                                                    <ext:NumberField
                                                        ID="nfOtrosIngresosAval"
                                                        runat="server"
                                                        Width="200"
                                                        FieldLabel="Otros Ingresos"
                                                        MaxLength="6"
                                                        EnforceMaxLength="true"
                                                        MinValue="0"
                                                        MaxValue="999999"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowDecimals="true"
                                                        Step="1">
                                                    </ext:NumberField>
                                                </Items>
                                            </ext:FieldContainer>
                                           <ext:FieldContainer 
                                                ID="fcOcupacionAval3" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                FieldLabel="Concepto" 
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtConceptoIngresosAval" 
                                                        runat="server" 
                                                        Width="406" 
                                                        EmptyText="Concepto Otros Ingresos"
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                     <ext:TextField 
                                                        ID="txtTelefonoOcupacionAval" 
                                                        runat="server"
                                                        FieldLabel="Teléfono" 
                                                        Width="306" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EmptyText="Tel. Empresa"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>                                         
                                           <ext:FieldContainer 
                                                ID="fcOcupacionAval4" 
                                                runat="server" 
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:RadioGroup
                                                        ID="rgPropietario"
                                                        runat="server"
                                                        Width="380"
                                                        LabelWidth="120" 
                                                        StyleSpec="margin-right: 6px;"
                                                        FieldLabel="Propietario">
                                                        <Items>
                                                            <ext:Radio ID="rSi" runat="server" BoxLabel="Si" Checked="true" />
                                                            <ext:Radio ID="rNo" runat="server" BoxLabel="No"  />
                                                        </Items>
                                                    </ext:RadioGroup>
                                                </Items>
                                            </ext:FieldContainer>
                                           <ext:FieldContainer 
                                                ID="fcOcupacionAval5" 
                                                runat="server" 
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:RadioGroup
                                                        ID="rgTipo"
                                                        runat="server"
                                                        Width="380"
                                                        LabelWidth="120" 
                                                        StyleSpec="margin-right: 6px;"
                                                        FieldLabel="Tipo">
                                                        <Items>
                                                            <ext:Radio ID="rEmpleado" runat="server" BoxLabel="Empleado" Checked="true" />
                                                            <ext:Radio ID="rGiroComercial" runat="server" BoxLabel="Giro Comercial"  />
                                                        </Items>
                                                    </ext:RadioGroup>
                                                </Items>
                                            </ext:FieldContainer> 
                                           <ext:FieldContainer 
                                                ID="fcOcupacionAval6" 
                                                runat="server" 
                                                FieldLabel="Empresa Anterior"
                                                LabelWidth="120"  
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="TextField5" 
                                                        runat="server" 
                                                        Width="406" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>

                                        </Items>
                                    </ext:Panel>
                                     <%--Terminado--%>
                                    <ext:Panel 
                                        ID="pBienesAval" 
                                        runat="server" 
                                        Title="Bienes del Aval" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                         <ext:FieldContainer 
                                                ID="fcBienesAval1" 
                                                runat="server" 
                                                FieldLabel="Ubicación"
                                                LabelWidth="120"  
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtUbicacionAval" 
                                                        runat="server" 
                                                        Width="300" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                    <ext:ComboBox 
                                                        ID="cmbTipoInmuebleAval" 
                                                        runat="server"
                                                        FieldLabel="Tipo Inmueble" 
                                                        Width="306" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:ComboBox>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcBienesAval2" 
                                                runat="server" 
                                                FieldLabel="Inscripción"
                                                LabelWidth="120"  
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtInscripcionAval" 
                                                        runat="server" 
                                                        Width="300" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                     <ext:NumberField 
                                                        ID="nfValorInmuebleAval" 
                                                        runat="server"
                                                        FieldLabel="Valor" 
                                                        Width="306" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="9"
                                                        EnforceMaxLength="true"
                                                        MinValue="0"
                                                        MaxValue="999999999"
                                                        AllowDecimals="true"
                                                        Step="1">
                                                    </ext:NumberField>
                                                </Items>
                                            </ext:FieldContainer>
                                        </Items>
                                    </ext:Panel>
                                     <%--Terminado--%>
                                    <ext:Panel 
                                        ID="pDatosOperacion" 
                                        runat="server" 
                                        Title="Datos de Operación" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                         <ext:FieldContainer 
                                                ID="fcDatosOp" 
                                                runat="server" 
                                                FieldLabel="Cantidad Solicitada"
                                                LabelWidth="140"  
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:NumberField 
                                                        ID="nfcantidadSol" 
                                                        runat="server" 
                                                        Width="200" 
                                                        StyleSpec="margin-right: 6px;"
                                                        EnforceMaxLength="true"
                                                        MaxLength="9"
                                                        MinValue="0"
                                                        MaxValue="999999999"
                                                        AllowDecimals="true"
                                                        Step="1">
                                                    </ext:NumberField>
                                                    <ext:NumberField 
                                                        ID="nfPlazo" 
                                                        runat="server"
                                                        FieldLabel="Plazo" 
                                                        Width="326" 
                                                        LabelWidth="120" 
                                                        StyleSpec="margin-right: 6px;"
                                                        EnforceMaxLength="true"
                                                        MaxLength="9"
                                                        MinValue="0"
                                                        MaxValue="999999999"
                                                        AllowDecimals="true"
                                                        Step="1">
                                                    </ext:NumberField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcDatosOp2" 
                                                runat="server" 
                                                FieldLabel="Forma de Pago"
                                                LabelWidth="140"  
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:ComboBox 
                                                        ID="cmbFormaPago" 
                                                        runat="server" 
                                                        Width="200" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:ComboBox>
                                                     <ext:ComboBox 
                                                        ID="cmbDestinoPrestamo" 
                                                        runat="server" 
                                                        Width="326" 
                                                        LabelWidth="120" 
                                                        FieldLabel="Destino Préstamo"
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:ComboBox>
                                                </Items>
                                            </ext:FieldContainer>

                                            <ext:FieldContainer 
                                                ID="fcUserFecha" 
                                                runat="server" 
                                                FieldLabel="Fecha Movimiento"
                                                LabelWidth="140"  
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:DateField
                                                        ID="dfFechaMovimiento"
                                                        runat="server"
                                                        StyleSpec="margin-right: 6px;"
                                                        Width="200">
                                                        <PickerOptions 
                                                            ID="PickerOptions1"
                                                            runat="server"
                                                            Cls="my-date-picker">
                                                        </PickerOptions>
                                                     </ext:DateField>
                                                     <ext:ComboBox 
                                                        ID="cmbUser" 
                                                        runat="server" 
                                                        Width="326" 
                                                        LabelWidth="120" 
                                                        FieldLabel="Usuario"
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:ComboBox>
                                                </Items>
                                            </ext:FieldContainer>
                                        </Items>
                                    </ext:Panel>

                                </Items>
                            </ext:TabPanel>
                        </Items>
                        <BottomBar>
                            <ext:StatusBar ID="sbSolicitudPrestamo" runat="server" Cls="x-colorToolbar" Text="Sin validar información" />
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
                </Items>
            </ext:Panel>
        </div>
    </form>
</body>
</html>