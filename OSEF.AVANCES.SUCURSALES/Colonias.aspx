<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Colonias.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.Colonias" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       <link rel="stylesheet" href="css/login.css" />
    <link rel="Stylesheet" href="css/customControls.css" />
    <script type="text/javascript" src="js/libs/jquery-2.0.3.min.js"></script>
    <script type='text/javascript' src="js/menu-usuario.js"></script>
    <script type="text/javascript" src="js/estados.js"></script>
</head>
<body class="xCustomBody">
    <form id="form1" runat="server">
    <div>
        <ext:ResourceManager ID="rmColonias" runat="server">
        </ext:ResourceManager>

       <ext:GridPanel
            ID="gpColonias"
            runat="server"
            Height="420"
            Width="960"
            Title="COLONIAS"
            EnableColumnHide="false"
            EnableColumnMove="false"
            Header="true"
            TitleAlign="Left"
            StyleSpec="margin:0 auto; margin-top: 20px;">
            <TopBar>
                <ext:Toolbar ID="tbColonias" runat="server">
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
                           
                        </ext:ImageButton>
                        <ext:ToolbarSpacer ID="tbsColonias" runat="server" Width="500">
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
                           
                        </ext:ImageButton>
                        <ext:TextField 
                            ID="txtBuscar"
                            runat="server"
                            AutoFocus="true"
                            EmptyText="Buscar"
                            Width="200">
                            
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
                    runat="server">
                    <Model>
                        <ext:Model ID="mColonoias" runat="server">
                            <Fields>
                                <ext:ModelField Name="ID" Type="String" />
                                <ext:ModelField Name="Colonia" Type="String" />
                                <ext:ModelField Name="Estado" Type="String" />
                                <ext:ModelField Name="Municipio" Type="String" />
                            </Fields>
                        </ext:Model>
                    </Model>
                    <Sorters>
                        <ext:DataSorter Property="ID" Direction="ASC" />
                    </Sorters>
                    
                </ext:Store>
            </Store>
            <ColumnModel>
                <Columns>
                    <ext:Column 
                        ID="cID"
                        runat="server"
                        Text="ID"
                        Align="Center"
                        Width="140"
                        DataIndex="ID">
                      
                    </ext:Column>
                    <ext:Column
                        ID="cColonia"
                        runat="server"
                        Text="COLONIA"
                        Align="Center"
                        Width="270"
                        DataIndex="Colonia">
                       
                    </ext:Column>
                    <ext:Column
                        ID="cEstado"
                        runat="server"
                        Text="ESTADO"
                        Align="Left"
                        Width="270"
                        DataIndex="Estado">
                      
                    </ext:Column>
                    <ext:Column
                        ID="cMunicipio"
                        runat="server"
                        Text="MUNICIPIO"
                        Align="Left"
                        Width="270"
                        DataIndex="Municipio">
                      
                    </ext:Column>
                </Columns>
            </ColumnModel>
            <View>
                <ext:GridView
                    ID="gvColonias"
                    runat="server"
                    StripeRows="true">
                </ext:GridView>
            </View>
            
          
            <FooterBar>
                <ext:StatusBar
                    ID="sbEstados"
                    runat="server"
                    Text=""
                    StatusAlign="Left">
                </ext:StatusBar>
            </FooterBar>
        </ext:GridPanel>

    </div>
    </form>
</body>
</html>
