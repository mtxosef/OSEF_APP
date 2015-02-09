<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Avances.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.Avances" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/login.css" />
    <link rel="Stylesheet" href="css/customControls.css" />
    <script type="text/javascript" src="js/tableroAvances.js"></script>
</head>
<body class="xCustomBody">
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmAvances" runat="server" HideInDesign="true" />

        <ext:GridPanel
            ID="gpAvances"
            runat="server"
            Height="420"
            Width="960"
            Title="TABLERO DE REVISIONES"
            EnableColumnHide="false"
            EnableColumnMove="false"
            Header="true"
            TitleAlign="Left"
            StyleSpec="margin:0 auto; margin-top: 20px;">
            <TopBar>
                <ext:Toolbar ID="tbAvances" runat="server">
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
                        </ext:ImageButton>
                        <ext:ToolbarSpacer ID="tbsAvances" runat="server" Width="500">
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
                                    ID="imgbtnActualizarAvances"
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
                    ID="sAvances"
                    runat="server"
                    OnReadData="OnReadData_sAvances">
                    <Model>
                        <ext:Model ID="mAvances" runat="server">
                            <Fields>
                                <ext:ModelField Name="ID" Type="Int" />
                                <ext:ModelField Name="Mov" Type="String" />
                                <ext:ModelField Name="MovID" Type="String" />
                                <ext:ModelField Name="Semana" Type="Int" />
                                <ext:ModelField Name="Sucursal" Type="String" />
                                <ext:ModelField Name="FechaEmision" Type="Date" />
                                <ext:ModelField Name="FechaRevision" Type="Date" />
                                <ext:ModelField Name="Observaciones" Type="String" />
                                <ext:ModelField Name="Comentarios" Type="String" />
                                <ext:ModelField Name="Estatus" Type="String" />
                                <ext:ModelField Name="Programado" Type="Float" />
                                <ext:ModelField Name="Real" Type="Float" />
                                <ext:ModelField Name="RSucursal" Type="Object" />
                            </Fields>
                        </ext:Model>
                    </Model>
                    <Listeners>
                        <DataChanged Fn="sAvances_DataChanged" />
                    </Listeners>
                </ext:Store>
            </Store>
            <ColumnModel>
                <Columns>
                    <ext:Column 
                        ID="cMov"
                        runat="server"
                        Text="MOVIMIENTO"
                        Align="Center"
                        Width="170"
                        DataIndex="Mov">
                        <Renderer Fn="cMov_Renderer" />
                    </ext:Column>
                    <ext:Column
                        ID="cSucursal"
                        runat="server"
                        Text="SUCURSAL"
                        Align="Left"
                        Width="370"
                        DataIndex="Sucursal">
                        <Renderer Fn="cSucursal_Renderer" />
                    </ext:Column>
                     <ext:DateColumn
                        ID="dcFechaRevision"
                        runat="server"
                        Text="FECHA REVISIÓN"
                        Align="Center"
                        Width="120"
                        DataIndex="FechaRevision"
                        Format="dd/MM/yyyy">
                        <HeaderItems>
                            <ext:ComboBox
                                ID="cmbFechaRevision"
                                runat="server">
                                <Items>
                                    <ext:ListItem Index="0" Text="(Todo)" />
                                    <ext:ListItem Index="1" Text="Hoy" />
                                    <ext:ListItem Index="2" Text="Ayer" />
                                    <ext:ListItem Index="3" Text="Mañana" />
                                    <ext:ListItem Index="4" Text="Esta semana" />
                                    <ext:ListItem Index="5" Text="Semana pasada" />
                                    <ext:ListItem Index="6" Text="Este mes" />
                                    <ext:ListItem Index="7" Text="Mes móvil" />
                                    <ext:ListItem Index="8" Text="Mes pasado" />
                                    <ext:ListItem Index="9" Text="Este año" />
                                    <ext:ListItem Index="10" Text="Año móvil" />
                                    <ext:ListItem Index="11" Text="Año pasado" />
                                    <ext:ListItem Index="12" Text="Enero" />
                                    <ext:ListItem Index="13" Text="Febrero" />
                                    <ext:ListItem Index="14" Text="Marzo" />
                                    <ext:ListItem Index="15" Text="Abril" />
                                    <ext:ListItem Index="16" Text="Mayo" />
                                    <ext:ListItem Index="17" Text="Junio" />
                                    <ext:ListItem Index="18" Text="Julio" />
                                    <ext:ListItem Index="19" Text="Agosto" />
                                    <ext:ListItem Index="20" Text="Septiembre" />
                                    <ext:ListItem Index="21" Text="Octubre" />
                                    <ext:ListItem Index="22" Text="Noviembre" />
                                    <ext:ListItem Index="23" Text="Diciembre" />
                                    <ext:ListItem Index="24" Text="Especifica..." />
                                </Items>
                                <SelectedItems>
                                    <ext:ListItem Index="0" />
                                </SelectedItems>
                            </ext:ComboBox>
                        </HeaderItems>
                    </ext:DateColumn>
                    <ext:NumberColumn
                        ID="ncProgramado"
                        runat="server"
                        Text="PROGRAMADO"
                        Align="Center"
                        Width="100"
                        DataIndex="Programado">
                        <Renderer Fn="ncProgramado_Renderer" />
                    </ext:NumberColumn>
                     <ext:NumberColumn
                        ID="ncReal"
                        runat="server"
                        Text="REAL"
                        Align="Center"
                        Width="100"
                        DataIndex="Real">
                        <Renderer Fn="ncReal_Renderer" />
                    </ext:NumberColumn>
                     <ext:NumberColumn
                        ID="ncVariacion"
                        runat="server"
                        Text="VARIACIÓN"
                        Align="Center"
                        Width="100"
                        DataIndex="ID">
                        <Renderer Fn="ncVariacion_Renderer" />
                    </ext:NumberColumn> 
                </Columns>
            </ColumnModel>
            <Listeners>
                <ItemClick Fn="gpAvances_ItemClick" />
            </Listeners>
            <SelectionModel>
                <ext:RowSelectionModel
                    ID="rsmAvances"
                    runat="server">
                </ext:RowSelectionModel>
            </SelectionModel>
            <FooterBar>
                <ext:StatusBar
                    ID="sbAvances"
                    runat="server"
                    Text=""
                    StatusAlign="Left">
                </ext:StatusBar>
            </FooterBar>
        </ext:GridPanel>
    </form>
</body>
</html>
