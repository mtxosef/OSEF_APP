<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Municipios.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.Municipios" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/login.css" />
    <link rel="Stylesheet" href="css/customControls.css" />
    <script type="text/javascript" src="js/municipios.js"></script>
</head>
<body class="xCustomBody">
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmMunicipios" runat="server" HideInDesign="true" />

        <ext:GridPanel
            ID="gpMunicipios"
            runat="server"
            Height="420"
            Width="960"
            Title="MUNICIPIOS"
            EnableColumnHide="false"
            EnableColumnMove="false"
            Header="true"
            TitleAlign="Left"
            StyleSpec="margin:0 auto; margin-top: 20px;">
            <TopBar>
                <ext:Toolbar ID="tbMunicipios" runat="server">
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
                        <ext:ToolbarSpacer ID="tbsMunicipios" runat="server" Width="500">
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
                                <Click Handler="#{sMunicipios}.reload(); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true);" />
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
                    ID="sMunicipios"
                    runat="server"
                    OnReadData="OnReadData_sMunicipios">
                    <Model>
                        <ext:Model ID="mMunicipios" runat="server">
                            <Fields>
                                <ext:ModelField Name="ID" Type="String" />
                                <ext:ModelField Name="Descripcion" Type="String" />
                                <ext:ModelField Name="Estado" Type="String" />
                                <ext:ModelField Name="REstado" Type="Object" />
                            </Fields>
                        </ext:Model>
                    </Model>
                    <Sorters>
                        <ext:DataSorter Property="ID" Direction="ASC" />
                    </Sorters>
                    <Listeners>
                        <DataChanged Fn="sMunicipios_DataChanged" />
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
                                ID="txtfID"
                                runat="server"
                                MaxLength="4"
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
                        ID="cDescripcion"
                        runat="server"
                        Text="DESCRIPCIÓN"
                        Align="Left"
                        Width="460"
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
                    <ext:Column
                        ID="cEstado"
                        runat="server"
                        Text="ESTADO"
                        Align="Left"
                        Width="400"
                        DataIndex="Estado">
                        <Renderer Fn="cEstado_Renderer" />
                        <HeaderItems>
                            <ext:ComboBox
                                ID="cmbEstadosFiltro"
                                runat="server"
                                DisplayField="Descripcion"
                                ValueField="ID"
                                ForceSelection="true"
                                Editable="false"
                                StoreID="sEstados">
                                <Items>
                                    <ext:ListItem Index="0" Text="(Todos)" Value="Todos" />
                                </Items>
                                <SelectedItems>
                                    <ext:ListItem Index="0" />
                                </SelectedItems>
                                <Listeners>
                                    <Select Fn="cmbEstadosFiltro_Select" />
                                </Listeners>
                            </ext:ComboBox>
                        </HeaderItems>
                        <Editor>
                            <ext:ComboBox
                                ID="cmbEstado"
                                runat="server"
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
                            </ext:ComboBox>
                        </Editor>
                    </ext:Column>
                </Columns>
            </ColumnModel>
            <View>
                <ext:GridView
                    ID="gvMunicipios"
                    runat="server"
                    StripeRows="true">
                </ext:GridView>
            </View>
            <Plugins>
                <ext:CellEditing ID="ceMunicipios" runat="server" ClicksToEdit="2">
                    <Listeners>
                        <BeforeEdit Handler="App.cmbEstado.select(App.sEstados.getAt(0));" Delay="1" />
                        <ValidateEdit Fn="ceMunicipios_ValidateEdit" Delay="1"  />
                    </Listeners>
                </ext:CellEditing>
            </Plugins>
            <Listeners>
                <ItemClick Fn="gpMunicipios_ItemClick" />
            </Listeners>
            <SelectionModel>
                <ext:RowSelectionModel
                    ID="rsmMunicipios"
                    runat="server">
                </ext:RowSelectionModel>
            </SelectionModel>
            <FooterBar>
                <ext:StatusBar
                    ID="sbMunicipios"
                    runat="server"
                    Text=""
                    StatusAlign="Left">
                </ext:StatusBar>
            </FooterBar>
        </ext:GridPanel>
    </form>
</body>
</html>
