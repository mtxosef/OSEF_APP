<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.Socios" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="css/login2.css" />
    <link rel="Stylesheet" href="css/customControls2.css" />
    <script type='text/javascript' src="js/socios.js"></script>
</head>
<body class="xCustomBody">
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmSocios" runat="server" HideInDesign="true" />

        <ext:GridPanel
            ID="gpSocios"
            runat="server"
            Height="420"
            Width="960"
            Title="SOCIOS"
            EnableColumnHide="false"
            EnableColumnMove="false"
            Header="true"
            TitleAlign="Left"
            StyleSpec="margin:0 auto; margin-top: 20px;">
            <TopBar>
                <ext:Toolbar ID="tbSocios" runat="server">
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
                            Width="50">
                           
                        </ext:ImageButton>
                        <ext:ToolbarSpacer ID="tbsConceptos" runat="server" Width="500">
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
         
            <ColumnModel>
                <Columns>
                    <ext:Column 
                        ID="cSocio"
                        runat="server"
                        Text="SOCIO"
                        Align="Center"
                        Width="90"
                        DataIndex="SOCIO" />
                    <ext:Column 
                        ID="cNombre"
                        runat="server"
                        Text="NOMBRE"
                        Align="Center"
                        Width="180"
                        DataIndex="NOMBRE" />
                    <ext:Column
                        ID="cCorreo"
                        runat="server"
                        Text="CORREO ELECTRONICO"
                        Align="Left"
                        Width="170"
                        DataIndex="CORREO" />
                    <ext:Column
                        ID="RFC"
                        runat="server"
                        Text="RFC"
                        Align="Left"
                        Width="110"
                        DataIndex="RFC"/>
                    <ext:Column
                        ID="cSexo"
                        runat="server"
                        Text="SEXO"
                        Align="Left"
                        Width="100"
                        DataIndex="SEXO"/>
                    <ext:Column
                        ID="cNacimiento"
                        runat="server"
                        Text="NACIMIENTO"
                        Align="Left"
                        Width="110"
                        DataIndex="NACIMIENTO"/>
                      <ext:Column
                        ID="cTelefono"
                        runat="server"
                        Text="TELÉFONO"
                        Align="Left"
                        Width="100"
                        DataIndex="TELEFONO"/>
                      <ext:Column
                        ID="cEstatus"
                        runat="server"
                        Text="ESTATUS"
                        Align="Left"
                        Width="100"
                        DataIndex="ESTATUS"/>
                   
                </Columns>
            </ColumnModel>
 
            <FooterBar>
                <ext:StatusBar
                    ID="sbSocios"
                    runat="server"
                    Text="Estatus"
                    StatusAlign="Left">
                </ext:StatusBar>
            </FooterBar>
        </ext:GridPanel>

    </form>
</body>
</html>
