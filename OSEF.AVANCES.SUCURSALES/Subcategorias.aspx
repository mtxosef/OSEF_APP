<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Subcategorias.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.Subcategorias" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/login.css" />
    <link rel="Stylesheet" href="css/customControls.css" />
    <script type="text/javascript" src="js/libs/jquery-2.0.3.min.js"></script>
    <script type='text/javascript' src="js/menu-usuario.js"></script>
    <script type="text/javascript" src="js/subcategorias.js"></script>
</head>
<body class="xCustomBody">
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmSubcategorias" runat="server" HideInDesign="true" />

        <ext:GridPanel
            ID="gpSubCategorias"
            runat="server"
            Height="420"
            Width="960"
            Title="SUBCATEGORÍAS"
            EnableColumnHide="false"
            EnableColumnMove="false"
            Header="true"
            TitleAlign="Left"
            StyleSpec="margin:0 auto; margin-top: 20px;">
            <TopBar>
                <ext:Toolbar ID="tbSubCategorias" runat="server">
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
                        <ext:ToolbarSpacer ID="tbsSubCategorias" runat="server" Width="500">
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
                                <Click Handler="#{sSubCategorias}.reload(); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true);" />
                            </Listeners>
                        </ext:ImageButton>
                        <ext:TextField 
                            ID="txtBuscar"
                            runat="server"
                            AutoFocus="true"
                            EmptyText="Buscar"
                            Width="200">
                            <Listeners>
                                <Change Fn="txtBuscar_Change" />
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
                    ID="sSubCategorias"
                    runat="server"
                    OnReadData="OnReadData_sSubCategorias">
                    <Model>
                        <ext:Model ID="mSubCategorias" runat="server" IDProperty="ID">
                            <Fields>
                                <ext:ModelField Name="ID" Type="String" />
                                <ext:ModelField Name="Orden" Type="Int" />
                                <ext:ModelField Name="Descripcion" Type="String" />
                                <ext:ModelField Name="Categoria" Type="String" />
                            </Fields>
                        </ext:Model>
                    </Model>
                    <Sorters>
                        <ext:DataSorter Property="ID" Direction="ASC" />
                    </Sorters>
                    <Listeners>
                        <DataChanged Fn="sSubCategorias_DataChanged" />
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
                    </ext:Column>
                    <ext:Column
                        ID="cCategoria"
                        runat="server"
                        Text="CATEGORÍA"
                        Align="Center"
                        Width="260"
                        DataIndex="Categoria">
                        <Editor>
                            <ext:ComboBox
                                ID="cmbCategoria"
                                runat="server"
                                DisplayField="Descripcion"
                                ValueField="ID"
                                ForceSelection="true"
                                Editable="false">
                                <Store>
                                    <ext:Store
                                        ID="sCategorias"
                                        runat="server">
                                        <Model>
                                            <ext:Model ID="mCategorias" runat="server">
                                                <Fields>
                                                    <ext:ModelField Name="ID" Type="String" />
                                                    <ext:ModelField Name="Orden" Type="String" />
                                                    <ext:ModelField Name="Descripcion" Type="String" />
                                                </Fields>
                                            </ext:Model>
                                        </Model>
                                        <Sorters>
                                            <ext:DataSorter Direction="ASC" Property="Orden" />
                                        </Sorters>
                                    </ext:Store>
                                </Store>
                            </ext:ComboBox>
                        </Editor>
                    </ext:Column>
                    <ext:NumberColumn
                        ID="ncOrden"
                        runat="server"
                        Text="ORDEN"
                        Align="Center"
                        Width="100"
                        DataIndex="Orden"
                        Format="000">
                        <Editor>
                            <ext:NumberField
                                ID="nfOrden"
                                runat="server"
                                Width="200"
                                MaxLength="3"
                                EnforceMaxLength="true"
                                MinValue="0"
                                MaxValue="255"
                                AllowDecimals="false"
                                Step="1">
                                <Listeners>
                                    <SpecialKey Handler="if (e.getKey() === e.ENTER) {
                                                             this.up('gridpanel').enterWasPressed = true; 
                                                         }">
                                    </SpecialKey>
                                </Listeners>
                            </ext:NumberField>
                        </Editor>
                    </ext:NumberColumn>
                    <ext:Column
                        ID="cDescripcion"
                        runat="server"
                        Text="DESCRIPCIÓN"
                        Align="Left"
                        Width="500"
                        DataIndex="Descripcion">
                        <Editor>
                            <ext:TextField
                                ID="txtfDescripcion"
                                runat="server"
                                MaxLength="50"
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
                </Columns>
            </ColumnModel>
            <Listeners>
                <ItemClick Fn="gpSubCategorias_ItemClick" />
            </Listeners>
            <View>
                <ext:GridView
                    ID="gvSubCategorias"
                    runat="server"
                    StripeRows="true">
                </ext:GridView>
            </View>
            <Plugins>
                <ext:CellEditing ID="ceSubCategorias" runat="server" ClicksToEdit="2">
                    <Listeners>
                        <ValidateEdit Fn="ceSubCategorias_ValidateEdit" Delay="1" />
                    </Listeners>
                </ext:CellEditing>
            </Plugins>
            <SelectionModel>
                <ext:RowSelectionModel
                    ID="rsmSubCategorias"
                    runat="server">
                </ext:RowSelectionModel>
            </SelectionModel>
            <FooterBar>
                <ext:StatusBar
                    ID="sbSubCategorias"
                    runat="server"
                    Text=""
                    StatusAlign="Left">
                </ext:StatusBar>
            </FooterBar>
        </ext:GridPanel>

    </form>
</body>
</html>
