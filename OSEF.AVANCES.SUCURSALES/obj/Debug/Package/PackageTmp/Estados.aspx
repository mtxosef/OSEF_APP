<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Estados.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.Estados" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/login.css" />
    <link rel="Stylesheet" href="css/customControls.css" />
    <script type="text/javascript" src="js/estados.js"></script>
</head>
<body class="xCustomBody">
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmEstados" runat="server" HideInDesign="true" />

        <ext:GridPanel
            ID="gpEstados"
            runat="server"
            Height="420"
            Width="960"
            Title="ESTADOS"
            EnableColumnHide="false"
            EnableColumnMove="false"
            Header="true"
            TitleAlign="Left"
            StyleSpec="margin:0 auto; margin-top: 20px;">
            <TopBar>
                <ext:Toolbar ID="tbEstados" runat="server">
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
                        <ext:ToolbarSpacer ID="tbsEstados" runat="server" Width="500">
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
                                <Click Handler="#{sEstados}.reload(); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true);" />
                            </Listeners>
                        </ext:ImageButton>
                        <ext:TextField 
                            ID="txtfBuscar"
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
            <Store>
                <ext:Store
                    ID="sEstados"
                    runat="server"
                    OnReadData="OnReadData_sEstados">
                    <Model>
                        <ext:Model ID="mEstados" runat="server">
                            <Fields>
                                <ext:ModelField Name="ID" Type="String" />
                                <ext:ModelField Name="Abreviatura" Type="String" />
                                <ext:ModelField Name="Descripcion" Type="String" />
                            </Fields>
                        </ext:Model>
                    </Model>
                    <Sorters>
                        <ext:DataSorter Property="ID" Direction="ASC" />
                    </Sorters>
                    <Listeners>
                        <DataChanged Fn="sEstados_DataChanged" />
                    </Listeners>
                </ext:Store>
            </Store>
            <ColumnModel>
                <Columns>
                    <ext:Column 
                        ID="cID"
                        runat="server"
                        Text="ID"
                        Align="Center"
                        Width="100"
                        DataIndex="ID">
                        <Editor>
                            <ext:TextField
                                ID="txtID"
                                runat="server"
                                MaxLength="2"
                                EnforceMaxLength="true"
                                ReadOnly="true">
                                <Listeners>
                                    <SpecialKey Handler="if (e.getKey() === e.ENTER) {
                                                             this.up('gridpanel').enterWasPressed = true; 
                                                         }">
                                    </SpecialKey>
                                </Listeners>
                            </ext:TextField>
                        </Editor>
                    </ext:Column>
                    <ext:Column
                        ID="cAbreviatura"
                        runat="server"
                        Text="ABREVIATURA"
                        Align="Center"
                        Width="120"
                        DataIndex="Abreviatura">
                        <Editor>
                            <ext:TextField
                                ID="txtAbreviatura"
                                runat="server"
                                MaxLength="4"
                                EnforceMaxLength="true">
                                <Listeners>
                                    <SpecialKey Handler="if (e.getKey() === e.ENTER) {
                                                             this.up('gridpanel').enterWasPressed = true; 
                                                         }">
                                    </SpecialKey>
                                </Listeners>
                            </ext:TextField>
                        </Editor>
                    </ext:Column>
                    <ext:Column
                        ID="cDescripcion"
                        runat="server"
                        Text="DESCRIPCIÓN"
                        Align="Left"
                        Width="480"
                        DataIndex="Descripcion">
                        <Editor>
                            <ext:TextField
                                ID="txtDescripcion"
                                runat="server"
                                MaxLength="50"
                                EnforceMaxLength="true">
                            </ext:TextField>
                        </Editor>
                    </ext:Column>
                </Columns>
            </ColumnModel>
            <View>
                <ext:GridView
                    ID="gvEstados"
                    runat="server"
                    StripeRows="true">
                </ext:GridView>
            </View>
            <Plugins>
                <ext:CellEditing ID="ceEstados" runat="server" ClicksToEdit="2">
                    <Listeners>
                        <ValidateEdit Fn="ceEstados_ValidateEdit" Delay="1"  />
                    </Listeners>
                </ext:CellEditing>
            </Plugins>
            <Listeners>
                <ItemClick Fn="gpEstados_ItemClick" />
            </Listeners>
            <SelectionModel>
                <ext:RowSelectionModel
                    ID="rsmEstados"
                    runat="server">
                </ext:RowSelectionModel>
            </SelectionModel>
            <FooterBar>
                <ext:StatusBar
                    ID="sbEstados"
                    runat="server"
                    Text=""
                    StatusAlign="Left">
                </ext:StatusBar>
            </FooterBar>
        </ext:GridPanel>
    </form>
</body>
</html>
