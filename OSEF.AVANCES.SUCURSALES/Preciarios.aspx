<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Preciarios.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.Preciarios" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body class="xCustomBody">
    <ext:ResourceManager ID="rmPreciarios" runat="server" HideInDesign="true" />

    <ext:GridPanel
        ID="gpPreciarios"
        runat="server"
        Height="420"
        Width="960"
        Title="PRECIARIOS"
        EnableColumnHide="false"
        EnableColumnMove="false"
        Header="true"
        TitleAlign="Left"
        StyleSpec="margin:0 auto; margin-top: 20px;">
        <TopBar>
            <ext:Toolbar ID="tbPreciarios" runat="server">
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
<%--                        <Listeners>
                            <Click Fn="imgbtnNuevo_Click" />
                        </Listeners>--%>
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
<%--                        <Listeners>
                            <Click Fn="imgbtnEditar_Click" />
                        </Listeners>--%>
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
<%--                        <Listeners>
                            <Click Fn="imgbtnBorrar_Click" />
                        </Listeners>--%>
                    </ext:ImageButton>
                    <ext:ToolbarSpacer ID="tbsPreciarios" runat="server" Width="500">
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
<%--                        <Listeners>
                            <Click Handler="#{sGruposMenu}.reload(); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true);" />
                        </Listeners>--%>
                    </ext:ImageButton>
                    <ext:TextField 
                        ID="txtfBuscar"
                        runat="server"
                        AutoFocus="true"
                        EmptyText="Buscar"
                        Width="200">
<%--                        <Listeners>
                            <Change Fn="txtfBuscar_Change" />
                        </Listeners>--%>
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
                ID="sPreciarios"
                runat="server">
                <Model>
                    <ext:Model ID="mPreciarios" runat="server">
                        <Fields>
                            <ext:ModelField Name="ID" Type="String" />
                            <ext:ModelField Name="Descripcion" Type="String" />
                            <ext:ModelField Name="Sucursal" Type="String" />
                            <ext:ModelField Name="Estatus" Type="String" />
                            <ext:ModelField Name="FechaAlta" Type="String" />
                        </Fields>
                    </ext:Model>
                </Model>
                <Sorters>
                    <ext:DataSorter Property="ID" Direction="ASC" />
                </Sorters>
<%--                <Listeners>
                    <DataChanged Fn="sPreciarios_DataChanged" />
                </Listeners>--%>
            </ext:Store>
        </Store>
    </ext:GridPanel>

</body>
</html>
