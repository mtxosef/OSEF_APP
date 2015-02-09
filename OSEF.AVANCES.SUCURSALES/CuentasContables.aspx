<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CuentasContables.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.CuentasContables" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/login2.css" />
    <link rel="Stylesheet" href="css/customControls2.css" />
    <script type="text/javascript" src="js/cuentascontables.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmCuentasContables" runat="server" HideInDesign="true" />

        <ext:GridPanel 
            ID="gpCuentasContables"
            runat="server"
            Height="400"
            Width="960"
            Title="CUENTAS CONTABLES"
            EnableColumnHide="false"
            EnableColumnMove="false"
            Header="true"
            TitleAlign="Left"
            StyleSpec="margin:0 auto; margin-top: 20px;"
            Cls="x-CustomTreePanel">
            <LeftBar>
                <ext:Toolbar ID="tbCuentasContables" runat="server">
                    <Items>
                        <ext:TreePanel
                            ID="tpCuentasContables"
                            runat="server"
                            Height="200"
                            Width="270"
                            RootVisible="false"
                            AutoScroll="true"
                            Header="false">
                            <Listeners>
                                <BeforeLoad Fn="tpCuentasContables_BeforeLoad" />
                                <SelectionChange Fn="tpCuentasContables_SelectionChange" />
                            </Listeners>
                            <SelectionModel>
                                <ext:TreeSelectionModel ID="tsmCuentasContables" runat="server">
                                    <SelectedRows>
                                        <ext:SelectedRow RecordID="A" />
                                    </SelectedRows>
                                </ext:TreeSelectionModel>
                            </SelectionModel>
                        </ext:TreePanel>
                    </Items>
                </ext:Toolbar>
            </LeftBar>
            <TopBar>
                <ext:Toolbar ID="tbCuentasContablesTopBar" runat="server">
                    <Items>
                        <ext:ImageButton
                            ID="imgbtnNuevo"
                            runat="server"
                            ImageUrl="assets/img/controles/nuevo-normal.png"
                            DisabledImageUrl="assets/img/controles/nuevo-disable.png"
                            OverImageUrl="assets/img/controles/nuevo-over.png"
                            PressedImageUrl="assets/img/controles/nuevo-pressed.png"
                            Height="50"
                            Width="50">
                            <Listeners>
                                <Click Fn="imgbtnNuevo_Click" />
                            </Listeners>
                        </ext:ImageButton>
                        <ext:ImageButton
                            ID="imgbtnEditar"
                            runat="server"
                            ImageUrl="assets/img/controles/edit-normal.png"
                            DisabledImageUrl="assets/img/controles/edit-disable.png"
                            OverImageUrl="assets/img/controles/edit-over.png"
                            PressedImageUrl="assets/img/controles/edit-pressed.png"
                            Height="50"
                            Width="50"
                            Disabled="true">
                            <Listeners>
                                <Click Fn="imgbtnEditar_Click" />
                            </Listeners>
                        </ext:ImageButton>
                        <ext:ImageButton
                            ID="imgbtnBorrar"
                            runat="server"
                            ImageUrl="assets/img/controles/delete-normal.png"
                            DisabledImageUrl="assets/img/controles/delete-disable.png"
                            OverImageUrl="assets/img/controles/delete-over.png"
                            PressedImageUrl="assets/img/controles/delete-pressed.png"
                            Height="50"
                            Width="50"
                            Disabled="true">
                            <Listeners>
                                <Click Fn="imgbtnBorrar_Click" />
                            </Listeners>
                        </ext:ImageButton>
                        <ext:ImageButton
                            ID="imgbtnGuardar"
                            runat="server"
                            ImageUrl="assets/img/controles/Guardar.png"
                            DisabledImageUrl="assets/img/controles/GuardarDisabled.png"
                            OverImageUrl="assets/img/controles/GuardarOver.png"
                            PressedImageUrl="assets/img/controles/GuardarPressed.png"
                            Height="50"
                            Width="50"
                            Disabled="true">
                            <Listeners>
                                <Click Fn="imgbtnGuardar_Click" />
                            </Listeners>
                        </ext:ImageButton>
                        <ext:ImageButton
                            ID="imgbtnCancelar"
                            runat="server"
                            ImageUrl="assets/img/controles/Cancelar.png"
                            DisabledImageUrl="assets/img/controles/CancelarDisabled.png"
                            OverImageUrl="assets/img/controles/CancelarOver.png"
                            PressedImageUrl="assets/img/controles/CancelarPressed.png"
                            Height="50"
                            Width="50"
                            Disabled="true">
                            <Listeners>
                                <Click Fn="imgbtnCancelar_Click" />
                            </Listeners>
                        </ext:ImageButton>
                        <ext:ToolbarSpacer ID="tbsCuentasContables" runat="server" Width="380">
                        </ext:ToolbarSpacer>
                        <ext:ImageButton
                            ID="imgbtnActualizar"
                            runat="server"
                            ImageUrl="assets/img/controles/update-normal.png"
                            DisabledImageUrl="assets/img/controles/update-disable.png"
                            OverImageUrl="assets/img/controles/update-hover.png"
                            PressedImageUrl="assets/img/controles/update-pressed.png"
                            Height="50"
                            Width="50">
                            <Listeners>
                                <Click Fn="imgbtnActualizar_Click" />
                            </Listeners>
                        </ext:ImageButton>
                        <ext:TextField 
                            ID="txtBuscar"
                            runat="server"
                            AutoFocus="true"
                            EmptyText="Buscar"
                            Width="200">
                            <Listeners>
                                <Change Fn="txtfBuscar_Change" />
                            </Listeners>
                            <RightButtons>
                                <ext:ImageButton
                                    ID="imgbtnBuscar"
                                    runat="server"
                                    ImageUrl="assets/img/controles/search.png"
                                    OverImageUrl=""
                                    PressedImageUrl=""
                                    Height="22px"
                                    Width="22px">                                              
                                </ext:ImageButton>
                            </RightButtons>
                        </ext:TextField>
                    </Items>
                </ext:Toolbar>
            </TopBar>
            <FooterBar>
                <ext:Toolbar ID="tbCuentasContablesBottomBar" runat="server" Layout="VBoxLayout">
                    <Items>
                        <ext:FieldContainer
                            ID="fcCuenta"
                            runat="server"
                            AnchorHorizontal="100%" 
                            FieldLabel="Cuenta"
                            Layout="HBoxLayout">
                            <Items>
                                <ext:TextField
                                    ID="txtfCuenta"
                                    runat="server"
                                    StyleSpec="margin-right: 6px;"
                                    Width="200"
                                    Disabled="true"
                                    MaxLength="20"
                                    EnforceMaxLength="true"
                                    AllowBlank="false">
                                    <Plugins>
                                        <ext:InputMask ID="imCuenta" runat="server" Mask="999-99-99" />
                                    </Plugins>
                                    <Listeners>
                                        <Blur Fn="txtfCuenta_Blur" />
                                    </Listeners>
                                </ext:TextField>
                                <ext:TextField
                                    ID="txtfDescripcion"
                                    runat="server"
                                    StyleSpec="margin-right: 6px;"
                                    FieldLabel="Descripción"
                                    Width="400"
                                    Disabled="true"
                                    MaxLength="100"
                                    EnforceMaxLength="true"
                                    AllowBlank="false">
                                    <Listeners>
                                        <Blur Fn="txtfDescripcion_Blur" />
                                    </Listeners>
                                </ext:TextField>
                                <ext:ComboBox
                                    ID="cmbTipo"
                                    runat="server"
                                    StyleSpec="margin-bottom: 6px;"
                                    FieldLabel="Tipo"
                                    LabelWidth="50"
                                    Width="220"
                                    Disabled="true"
                                    Editable="false"
                                    AllowBlank="false">
                                    <Listeners>
                                        <Select Fn="cmbTipo_Select" />
                                    </Listeners>
                                    <Items>
                                        <ext:ListItem Index="0" Text="Estructura" Value="Estructura" />
                                        <ext:ListItem Index="1" Text="Mayor" Value="Mayor" />
                                        <ext:ListItem Index="2" Text="SubCuenta" Value="SubCuenta" />
                                    </Items>
                                </ext:ComboBox>
                            </Items>
                        </ext:FieldContainer>
                        <ext:FieldContainer
                            ID="fcRama"
                            runat="server"
                            AnchorHorizontal="100%"
                            FieldLabel="SubCuentaDe"
                            Layout="HBoxLayout">
                            <Items>
                                <ext:ComboBox
                                    ID="cmbRama"
                                    runat="server"
                                    StyleSpec="margin-right: 6px;"
                                    Width="200"
                                    DisplayField="Cuenta"
                                    ValueField="Cuenta"
                                    Disabled="true"
                                    AllowBlank="false">
                                    <Listeners>
                                        <Select Fn="cmbRama_Select" />
                                        <Change Fn="cmbRama_Change" />
                                    </Listeners>
                                    <Store>
                                        <ext:Store ID="sRama" runat="server">
                                            <Model>
                                                <ext:Model ID="mRama" runat="server" IDProperty="Cuenta">
                                                    <Fields>
                                                        <ext:ModelField Name="Cuenta" Type="String" />
                                                        <ext:ModelField Name="Rama" Type="String" />
                                                        <ext:ModelField Name="Descripcion" Type="String" />
                                                        <ext:ModelField Name="Tipo" Type="String" />
                                                        <ext:ModelField Name="Estatus" Type="String" />
                                                    </Fields>
                                                </ext:Model>
                                            </Model>
                                        </ext:Store>
                                    </Store>
                                </ext:ComboBox>
                                <ext:TextField
                                    ID="txtfDescripcionRama"
                                    runat="server"
                                    StyleSpec="margin-right: 6px;"
                                    FieldLabel="Descripción"
                                    Width="400"
                                    Disabled="true">
                                </ext:TextField>
                                <ext:ComboBox
                                    ID="cmbEstatus"
                                    runat="server"
                                    StyleSpec="margin-right: 6px;"
                                    FieldLabel="Estatus"
                                    LabelWidth="50"
                                    Width="220"
                                    Disabled="true"
                                    AllowBlank="false">
                                    <Items>
                                        <ext:ListItem Index="0" Text="ALTA" Value="ALTA" />
                                        <ext:ListItem Index="1" Text="BLOQUEADO" Value="BLOQUEADO" />
                                        <ext:ListItem Index="2" Text="BAJA" Value="BAJA" />
                                    </Items>
                                </ext:ComboBox>
                            </Items>
                        </ext:FieldContainer>
                    </Items>
                </ext:Toolbar>
            </FooterBar>
            <BottomBar>
                <ext:StatusBar
                    ID="sbCuentasContables"
                    runat="server"
                    Text="ESTATUS"
                    Cls="xCustomToolbar"
                    StatusAlign="Left">
                </ext:StatusBar>
            </BottomBar>
            <Store>
                <ext:Store
                    ID="sCuentasContables"
                    runat="server"
                    AutoLoad="false">
                    <Model>
                        <ext:Model ID="mCuentasContables" runat="server" IDProperty="Cuenta">
                            <Fields>
                                <ext:ModelField Name="Cuenta" Type="String" />
                                <ext:ModelField Name="Rama" Type="String" />
                                <ext:ModelField Name="Descripcion" Type="String" />
                                <ext:ModelField Name="Tipo" Type="String" />
                                <ext:ModelField Name="Estatus" Type="String" />
                                <ext:ModelField Name="DescripcionRama" Type="String" />
                            </Fields>
                        </ext:Model>
                    </Model>
                    <Listeners>
                        <DataChanged Fn="sCuentasContables_DataChanged" />
                    </Listeners>
                </ext:Store>
            </Store>
            <ColumnModel>
                <Columns>
                    <ext:Column
                        ID="cCuenta"
                        runat="server"
                        Text="CUENTA"
                        Align="Center"
                        Width="200"
                        DataIndex="Cuenta" />
                    <ext:Column 
                        ID="cDescripcion"
                        runat="server"
                        Text="DESCRIPCIÓN"
                        Align="Left"
                        Width="480"
                        DataIndex="Descripcion" />
                </Columns>
            </ColumnModel>
            <Listeners>
                <Select Fn="gpCuentasContables_Select" />
            </Listeners>
<%--            <SelectionModel>
                <ext:RowSelectionModel
                    ID="rsmCuentasContables"
                    runat="server">--%>
<%--                    <SelectedRows>
                        <ext:SelectedRow RowIndex="0" />
                    </SelectedRows>--%>
<%--                </ext:RowSelectionModel>
            </SelectionModel>--%>
        </ext:GridPanel>

    </form>
</body>
</html>
