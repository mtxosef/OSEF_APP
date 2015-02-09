<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaInversion.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.FormaInversion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="css/login2.css" />
    <link rel="Stylesheet" href="css/customControls2.css" />
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
                        <ext:ModelField Name="Socio" Type="String" />
                        <ext:ModelField Name="Descripcion" Type="String" />
                        <ext:ModelField Name="TipoInversion" Type="String" />
                        <ext:ModelField Name="UnidadCalculo" Type="String" />
                        <ext:ModelField Name="TasaInteres" Type="String" />
                        <ext:ModelField Name="FechaVencimiento" Type="String" />
                        <ext:ModelField Name="ValorInversion" Type="String" />
                        <ext:ModelField Name="InstruccionesCapital" Type="String" />
                        <ext:ModelField Name="InstruccionesInteres" Type="String" />
                        
                    </Fields>
                </ext:Model>
            </Model>
           
        </ext:Store>
    
        <ext:FormPanel 
            ID="pCertificadoInversion"
            runat="server"
            Height="300"
            Width="730"
            BodyPadding="10"
            MonitorResize="true">
            <Items>
                <ext:FieldContainer
                    ID="fscSocio" 
                    runat="server" 
                    FieldLabel="Socio"
                     LabelWidth="150" 
                    AnchorHorizontal="100%" 
                    Layout="HBoxLayout">                                       
                    <Items>
                        <ext:ComboBox
                            ID="cmbSocio" 
                            runat="server" 
                            Width="200" 
                            AutoFocus="true"
                            Margins="0 3 0 0"
                            Disabled="false">
                        </ext:ComboBox>
                        <ext:TextField
                            ID="txtComplSocio" 
                            runat="server" 
                            Width="340" 
                            Margins="0 3 0 0"
                            Disabled="true">
                        </ext:TextField>
                    </Items>
                </ext:FieldContainer>            
                <ext:FieldContainer 
                    ID="cSegundaSeccion" 
                    runat="server" 
                    FieldLabel="Tipo inversión" 
                    AnchorHorizontal="100%"
                     LabelWidth="150"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:ComboBox
                            ID="cmbTipoInversion" 
                            runat="server" 
                            Width="200" 
                            Margins="0 3 0 0">
                        </ext:ComboBox>
                        <ext:TextField 
                            ID="txtUnidadInversion" 
                            runat="server" 
                             LabelWidth="120"
                            FieldLabel="Unidad inversión"
                             Width="340"
                            AllowBlank="false">
                        </ext:TextField>
                    </Items>
                </ext:FieldContainer> 
                
                 <ext:FieldContainer 
                    ID="fc2" 
                    runat="server" 
                    FieldLabel="Tasa  Interés"
                     LabelWidth="150" 
                    AnchorHorizontal="100%"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:NumberField
                            ID="nfTasa" 
                            runat="server" 
                            Width="200" 
                            Margins="0 3 0 0">
                        </ext:NumberField>
                        <ext:DateField 
                            ID="dfFechaVencimiento" 
                            runat="server" 
                            LabelWidth="120"
                            FieldLabel="Vencimiento"
                            Width="340"
                            AllowBlank="false">
                               <PickerOptions 
                                Cls="my-date-picker"
                                ID="pOFechaVencimiento" 
                                runat="server">
                                </PickerOptions>

                        </ext:DateField>
                    </Items>
                </ext:FieldContainer>    
                
                <ext:FieldContainer 
                    ID="fc3" 
                    runat="server" 
                     LabelWidth="150"
                    FieldLabel="Valor Inversión" 
                    AnchorHorizontal="100%"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:NumberField
                            ID="nfValorinversion" 
                            runat="server" 
                            Width="200" 
                            Margins="0 3 0 0">
                        </ext:NumberField>
                        
                    </Items>
                </ext:FieldContainer>    
                
                <ext:FieldContainer 
                    ID="fc4" 
                    runat="server" 
                    LabelWidth="150"
                    FieldLabel="Instrucciones al capital" 
                    AnchorHorizontal="100%"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:ComboBox
                            ID="nfInstruccionesCap" 
                            runat="server" 
                            Width="200" 
                            Margins="0 3 0 0">
                        </ext:ComboBox>
                        
                    </Items>
                </ext:FieldContainer>   
                
                <ext:FieldContainer 
                    ID="fc5" 
                    runat="server" 
                    FieldLabel="Instrucciones al interés" 
                    LabelWidth="150"
                    AnchorHorizontal="100%"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:ComboBox
                            ID="nfIntruccionesInteres" 
                            runat="server" 
                            Width="200" 
                            Margins="0 3 0 0">
                        </ext:ComboBox>
                        
                    </Items>
                </ext:FieldContainer>         
               

            </Items>
           
            <BottomBar>
                <ext:StatusBar ID="sInversion" runat="server" Cls="x-colorToolbar" Text="Sin validar información" />
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
