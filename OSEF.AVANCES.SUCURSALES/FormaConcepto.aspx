<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaConcepto.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.FormaConcepto" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/login.css" />
    <link rel="Stylesheet" href="css/customControls.css" />
    <script type='text/javascript' src="js/conceptos.js"></script>
</head>
<body>
   <form id="form1" runat="server">
        <ext:ResourceManager ID="rmFormaConcepto" runat="server" HideInDesign="true" />

        <ext:Store
            ID="sConcepto"
            runat="server">
            <Model>
                <ext:Model
                    ID="mConcepto"
                    runat="server"
                    IDProperty="ID">
                    <Fields>
                        <ext:ModelField Name="ID" Type="String" />
                        <ext:ModelField Name="Modulo" Type="String" />
                        <ext:ModelField Name="Orden" Type="Int" />
                        <ext:ModelField Name="Descripcion" Type="String" />
                        <ext:ModelField Name="Categoria" Type="String" />
                        <ext:ModelField Name="SubCategoria" Type="String" />
                        <ext:ModelField Name="FechaAlta" Type="Date" />
                        <ext:ModelField Name="Estatus" Type="String" />
                    </Fields>
                </ext:Model>
            </Model>
            <Listeners>
                <Load Fn="sConcepto_Load" />
                <Add Fn="sConcepto_Add" />
            </Listeners>
        </ext:Store>
    
        <ext:FormPanel
            ID="PanelConcepto"
            runat="server"
            Height="250"
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
                            ID="txtfID"
                            runat="server"
                            Width="200"
                            Margins="0 3 0 0"
                            MaxLength="7"
                            EnforceMaxLength="true"
                            Disabled="true">
                        </ext:TextField>
                    </Items>
                </ext:FieldContainer>
                <ext:FieldContainer 
                    ID="ContenedorOrden" 
                    runat="server" 
                    FieldLabel="Modulo" 
                    AnchorHorizontal="100%"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:ComboBox 
                            ID="cmbModulo"
                            runat="server"
                            Width="200"
                            Margins="0 3 0 0"
                            ForceSelection="true"
                            Editable="false"
                            AllowBlank="false"
                            AutoFocus="true">
                            <Items>
                                <ext:ListItem Index="0" Text="PROYECTOS" Value="PROY" />
                                <ext:ListItem Index="1" Text="CONTABILIDAD" Value="CONT" />
                            </Items>
                        </ext:ComboBox>
                        <ext:NumberField
                            ID="nfOrden"
                            runat="server"
                            Width="300"
                            MaxLength="5"
                            EnforceMaxLength="true"
                            MinValue="0"
                            MaxValue="32767"
                            AllowDecimals="false"
                            Step="1"
                            AllowBlank="false"
                            FieldLabel="Orden">
                            <Listeners>
                                <Blur Fn="nfOrden_Blur" />
                            </Listeners>
                        </ext:NumberField>
                    </Items>
                </ext:FieldContainer>            
                <ext:FieldContainer 
                    ID="ContendeorDescripcion" 
                    runat="server" 
                    FieldLabel="Descripción" 
                    AnchorHorizontal="100%"
                    Layout="HBoxLayout">
                    <Items>
                        <ext:TextField
                            ID="txtfDescripcion" 
                            runat="server" 
                            Width="503"
                            MaxLength="50"
                            EnforceMaxLength="true">
                            <Listeners>
                                <Blur Handler="App.txtfDescripcion.setValue(App.txtfDescripcion.getValue().toUpperCase());" />
                            </Listeners>
                        </ext:TextField>
                    </Items>
                </ext:FieldContainer>
                <ext:FieldContainer
                    ID="ContenedorCategorias" 
                    runat="server" 
                    FieldLabel="Categoría" 
                    Layout="HBoxLayout">
                    <Items>
                        <ext:ComboBox 
                            ID="cmbCategoria"
                            runat="server"
                            Width="200"
                            Margins="0 3 0 0"
                            DisplayField="Descripcion"
                            ValueField="ID"
                            ForceSelection="true"
                            Editable="false"
                            AllowBlank="true">
                            <Store>
                                <ext:Store
                                    ID="sCategorias"
                                    runat="server">
                                    <Model>
                                        <ext:Model ID="mCategorias" runat="server" IDProperty="ID">
                                            <Fields>
                                                <ext:ModelField Name="ID" Type="String" />
                                                <ext:ModelField Name="Descripcion" Type="String" />
                                            </Fields>
                                        </ext:Model>
                                    </Model>
                                </ext:Store>
                            </Store>
                            <DirectEvents>
                                <Change OnEvent="cmbCategoria_Change">
                                    <ExtraParams>
                                        <ext:Parameter Name="valor" Value="App.cmbCategoria.getValue()" Mode="Raw" />
                                    </ExtraParams>
                                </Change>
                            </DirectEvents>
                        </ext:ComboBox>
                        <ext:ComboBox 
                            ID="cmbSubCategoria" 
                            runat="server"  
                            FieldLabel="Subcategoría" 
                            Width="300"
                            DisplayField="Descripcion"
                            ValueField="ID"
                            ForceSelection="true"
                            Editable="false"
                            AllowBlank="true">
                            <Store>
                                <ext:Store
                                    ID="sSubCategorias"
                                    runat="server">
                                    <Model>
                                        <ext:Model ID="mSubCategorias" runat="server">
                                            <Fields>
                                                <ext:ModelField Name="ID" Type="String" />
                                                <ext:ModelField Name="Descripcion" Type="String" />
                                            </Fields>
                                        </ext:Model>
                                    </Model>
                                    <Listeners>
                                        <Load Fn="sSubCategorias_Load" />
                                    </Listeners>
                                </ext:Store>
                            </Store>
                        </ext:ComboBox>
                    </Items>
                </ext:FieldContainer>
                <ext:FieldContainer
                    ID="ContenedorFechaEstatus" 
                    runat="server" 
                    FieldLabel="Fecha Alta" 
                    Layout="HBoxLayout">
                    <Items>
                        <ext:DateField
                            ID="dfFechaAlta"
                            runat="server"
                            Width="200"
                            Margins="0 3 0 0"
                            Disabled="true">
                            <PickerOptions
                                ID="poFechaAlta"
                                runat="server"
                                Cls="my-date-picker">
                            </PickerOptions>
                        </ext:DateField>
                        <ext:ComboBox
                            ID="cmbEstatus"
                            runat="server"
                            Width="300"
                            FieldLabel="Estatus"
                            Disabled="true">
                            <Items>
                                <ext:ListItem Text="ALTA" />
                                <ext:ListItem Text="BAJA" />
                                <ext:ListItem Text="BLOQUEADO" />
                            </Items>
                            <SelectedItems>
                                <ext:ListItem Index="0" />
                            </SelectedItems>
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
                <ext:StatusBar ID="sbConcepto" runat="server" Cls="x-colorToolbar" Text="Sin validar información" />
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
                    Width="50"
                    MarginSpec="0 20 0 0">
                    <Listeners>
                        <Click Handler="window.parent.App.wEmergente.hide();" />
                    </Listeners>
                </ext:ImageButton>
            </Buttons>
        </ext:FormPanel>
    </form>
</body>
</html>
