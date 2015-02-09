<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tVtasUnidadesVsTiempo.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.tVtasUnidadesVsTiempo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="Stylesheet" href="css/osef_combobox.css" />
    <script type="text/javascript" src="js/cliente.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmUnidadesVsTiempo" runat="server" HideInDesign="true" />

                <%--Control para obtener las familias de los articulos--%>
<%--        <asp:SqlDataSource 
            ID="sqldsFamilias"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:SmartSystems %>"
            ProviderName="System.Data.SqlClient"
            SelectCommand="web_spS_ObtenerTodasArtFam"
            SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>--%>

        <ext:ComboBox
            ID="cmbAgente"
            runat="server"
            DisplayField="Nombre"
            ValueField="Agente"
            FieldLabel="Agente"
            LabelWidth="50"
            Width="400"
            ForceSelection="true"
            TypeAhead="true"
            QueryMode="Local"
            PageSize="5">
            <Store>
                <ext:Store
                    ID="sAgentes"
                    runat="server">
                    <Listeners>
                        <Refresh Handler="App.direct.Actualizar();" />
                    </Listeners>
                    <Model>
                        <ext:Model ID="mAgentes" runat="server">
                            <Fields>
                                <ext:ModelField Name="Agente" />
                                <ext:ModelField Name="Nombre" />
                            </Fields>
                        </ext:Model>
                    </Model>
                </ext:Store>
            </Store>
            <Items>
                <ext:ListItem Index="0" Text="(Todos)" Value="Todos" />
            </Items>
            <SelectedItems>
                <ext:ListItem Index="0" />
            </SelectedItems>
            <ListConfig ID="lcAgente" runat="server">
                <Listeners>
                    <BeforeRender Fn="ListConfig_BeforeRender" />
                </Listeners>
            </ListConfig>
            <Listeners>
                <BeforeRender Fn="ComboBox_BeforeRender" />
            </Listeners>
        </ext:ComboBox>

<%--        <ext:ComboBox
            ID="cmbFamilia"
            runat="server"
            FieldLabel="Familia"
            LabelWidth="50"
            Width="400"
            DisplayField="Familia"
            ValueField="Familia"
            QueryMode="Local"
            ForceSelection="true"
            TypeAhead="true"
            PageSize="5">
            <Store>
                <ext:Store
                    ID="sFamilias"
                    runat="server"
                    DataSourceID="sqldsFamilias"
                    IsPagingStore="true"
                    PageSize="5">
                    <Model>
                        <ext:Model ID="mFamilias" runat="server">
                            <Fields>
                                <ext:ModelField Name="Familia" />
                            </Fields>
                        </ext:Model>
                    </Model>
                </ext:Store>
            </Store>
            <ListConfig ID="lcFamilia" runat="server">
                <Listeners>
                    <BeforeRender Fn="ListConfig_BeforeRender" />
                </Listeners>
            </ListConfig>
            <Listeners>
                <BeforeRender Fn="ComboBox_BeforeRender" />
            </Listeners>
        </ext:ComboBox>

        <ext:ComboBox
            ID="cmbTiempo"
            runat="server"
            FieldLabel="Tiempo"
            LabelWidth="50"
            Width="400">
            <ListConfig ID="lcTiempo" runat="server">
                <Listeners>
                    <BeforeRender Fn="ListConfig_BeforeRender" />
                </Listeners>
            </ListConfig>
            <Listeners>
                <BeforeRender Fn="ComboBox_BeforeRender" />
            </Listeners>
            <Items>
                <ext:ListItem Index="0" Text="Semana" Value="Semana" />
                <ext:ListItem Index="1" Text="Día" Value="Dia" />
                <ext:ListItem Index="2" Text="Mes" Value="Mes" />
            </Items>
        </ext:ComboBox>

        <ext:Panel
            ID="Panel1" 
            runat="server"
            Width="600"
            Height="300"
            Title="Unidades huevo 2014"
            Layout="FitLayout">
            <Items>
                <ext:Chart ID="Chart1" runat="server" InsetPadding="30">
                    <Store>
                        <ext:Store
                            ID="Store1" 
                            runat="server" 
                            Data="<%# Ext.Net.Examples.ChartData.GenerateData() %>" 
                            AutoDataBind="true">                           
                            <Model>
                                <ext:Model ID="Model1" runat="server">
                                    <Fields>
                                        <ext:ModelField Name="Name" />
                                        <ext:ModelField Name="Data1" />
                                        <ext:ModelField Name="Data2" />
                                    </Fields>
                                </ext:Model>
                            </Model>
                        </ext:Store>
                    </Store>

                    <Gradients>
                        <ext:Gradient GradientID="bar-gradient" Angle="90">
                            <Stops>
                                <ext:GradientStop Offset="0" Color="#99BBE8" />
                                <ext:GradientStop Offset="70" Color="#77AECE" />
                                <ext:GradientStop Offset="100" Color="#77AECE" />
                            </Stops>
                        </ext:Gradient>
                    </Gradients>

                    <Axes>
                        <ext:NumericAxis Minimum="0" Maximum="100" Fields="Data1" Grid="true">
                            <Label Font="10px Arial">
                                <Renderer Handler="return Ext.util.Format.number(value, '0,0');" />
                            </Label>
                        </ext:NumericAxis>

                        <ext:CategoryAxis Position="Bottom" Fields="Name" Grid="true">
                            <Label Font="11px Arial">
                                <Renderer Handler="return value.substr(0, 3);" />
                            </Label>
                        </ext:CategoryAxis>
                    </Axes>

                    <Series>
                        <ext:ColumnSeries Axis="Left" XField="Name" YField="Data1">
                            <Style Fill="url(#bar-gradient)" StrokeWidth="3" />                            
                        </ext:ColumnSeries>

                        <ext:LineSeries Axis="Left" XField="Name" YField="Data2">
                            <Listeners>
                                <ItemMouseUp Handler="Ext.net.Notification.show({title:'Elemento Seleccionado', html:item.value[1] + ' huevos en ' + Ext.Date.monthNames[item.value[0]]});" />
                            </Listeners>

                            <Tips ID="Tips1" runat="server" TrackMouse="true" Width="150" Height="25">                            
                                <Renderer Handler="this.setTitle(storeItem.get('Data2') + ' huevos en ' + storeItem.get('Name').substr(0, 3));"></Renderer>
                            </Tips>

                            <Style Fill="#18428E" Stroke="#18428E" StrokeWidth="3" />

                            <MarkerConfig 
                                Type="Circle" 
                                Size="4" 
                                Radius="4" 
                                StrokeWidth="0" 
                                Fill="#18428E" 
                                Stroke="#18428E" 
                                />
                        </ext:LineSeries>
                    </Series>
                </ext:Chart>
            </Items>
        </ext:Panel>--%>

    </form>
</body>
</html>
