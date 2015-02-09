<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaInfoGraficas.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.FormaInfoGraficas" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link rel="stylesheet" href="css/login.css" />
    <link rel="Stylesheet" href="css/customControls.css" />
    <script>
        Ext.override(Ext.chart.LegendItem, {
            createSeriesMarkers: function (config) {
                var me = this,
                    index = config.yFieldIndex,
                    series = me.series,
                    seriesType = series.type,
                    surface = me.surface,
                    z = me.zIndex;

                // Line series - display as short line with optional marker in the middle
                if (seriesType === 'line' || seriesType === 'scatter') {
                    if (seriesType === 'line') {
                        var seriesStyle = Ext.apply(series.seriesStyle, series.style);
                        me.drawLine(0.5, 0.5, 16.5, 0.5, z, seriesStyle, index);
                    };

                    if (series.showMarkers || seriesType === 'scatter') {
                        var markerConfig = Ext.apply(series.markerStyle, series.markerConfig || {}, {
                            fill: series.getLegendColor(index)
                        });
                        me.drawMarker(8.5, 0.5, z, markerConfig);
                    }
                }
                // All other series types - display as filled box
                else {
                    me.drawFilledBox(12, 12, z, index);
                }
            },

            /**
            * @private Creates line sprite for Line series.
            */
            drawLine: function (fromX, fromY, toX, toY, z, seriesStyle, index) {
                var me = this,
                    surface = me.surface,
                    series = me.series;

                return me.add('line', surface.add({
                    type: 'path',
                    path: 'M' + fromX + ',' + fromY + 'L' + toX + ',' + toY,
                    zIndex: (z || 0) + 2,
                    "stroke-width": series.lineWidth,
                    "stroke-linejoin": "round",
                    "stroke-dasharray": series.dash,
                    stroke: seriesStyle.stroke || series.getLegendColor(index) || '#000',
                    style: {
                        cursor: 'pointer'
                    }
                }));
            }

        });
    </script>

    <script>
        var saveChart = function (btn) {
            Ext.MessageBox.confirm('Confirm Download', 'Would you like to download the chart as an image?', function (choice) {
                if (choice == 'yes') {
                    btn.up('panel').down('chart').save({
                        type: 'image/png'
                    });
                }
            });
        };
    </script>


</head>
<body>
    <form id="Form1" runat="server">
        <ext:ResourceManager ID="rmFormaSucursal" runat="server" HideInDesign="true" />


            <ext:Panel 
                ID="pGraficas" 
                runat="server" 
                cls="xCustomChart"
                BodyStyle="background-color:transparent;">
                <Items>
                    <ext:FormPanel 
                        ID="fpFormaGraficas" 
                        runat="server" 
                        Width="940"
                        Height="585"
                        MonitorResize="true">
                        <Items>
                             <ext:TabPanel 
                                ID="tbFormaGraficas" 
                                runat="server" 
                                ActiveTabIndex="0" 
                                Plain="true"
                                Cls="custotabpanel xchris">
                                <Items>
                                    <ext:Panel 
                                        ID="pGrafica1" 
                                        runat="server" 
                                        Title="Gráfica 1" 
                                        BodyPadding="10"
                                        MonitorResize="true"
                                        Width="890"
                                                Height="340"
                                        Layout="FitLayout">
                                        <Items>
                                                <ext:Chart 
                                                            ID="Chart1" 
                                                            runat="server"
                                                            Shadow="true"
                                                            Animate="true">
                                                            <Store>
                                                                <ext:Store ID="Store1" runat="server" Data="<%# Data %>" AutoDataBind="true">                           
                                                                    <Model>
                                                                        <ext:Model ID="Model1" runat="server">
                                                                            <Fields>
                                                                                <ext:ModelField Name="Year" />
                                                                                <ext:ModelField Name="Comedy" />
                                                                                <ext:ModelField Name="Action" />
                                                                                <ext:ModelField Name="Drama" />
                                                                                <ext:ModelField Name="Thriller" />
                                                                            </Fields>
                                                                        </ext:Model>
                                                                    </Model>
                                                                </ext:Store>
                                                            </Store>

                                                            <LegendConfig Position="Right" LabelFont="Century Gothic" ></LegendConfig>

                                                            <Axes>
                                                                <ext:NumericAxis Fields="Comedy,Action,Drama,Thriller" Position="Bottom" Grid="true">
                                                                    <Label>
                                                                        <Renderer Handler="return String(value).replace(/000000$/, 'M');" />
                                                                    </Label>
                                                                </ext:NumericAxis>                            

                                                                <ext:CategoryAxis Fields="Year" Position="Left" />                            
                                                            </Axes>

                                                            <Series>
                                                                <ext:BarSeries 
                                                                    Axis="Bottom"
                                                                    Gutter="80"
                                                                    XField="Year" 
                                                                    YField="Comedy,Action,Drama,Thriller"
                                                                    Stacked="true">
                                                                    <Tips TrackMouse="true" Width="65" Height="28">
                                                                        <Renderer Handler="this.setTitle(String(item.value[1] / 1000000) + 'M');" />
                                                                    </Tips>
                                                                </ext:BarSeries>
                                                            </Series>
                                                        </ext:Chart>
                                        </Items>
                                    </ext:Panel>




                                    <ext:Panel 
                                        ID="pGrafica2" 
                                        runat="server" 
                                        Title="Gráfica 2" 
                                        BodyPadding="10" 
                                        AutoScroll="true"
                                          Width="890" 
                                                Height="440"
                                                Layout="FitLayout">
                                     
                                       
                                                <TopBar>
                                                    <ext:Toolbar ID="Toolbar1" runat="server">
                                                        <Items>


                                                          
                                                            <ext:ImageButton
                                                                ID="imgbtnActualizar"
                                                                runat="server"
                                                                ImageUrl="assets/img/controles/update-normal.png"
                                                                DisabledImageUrl="assets/img/controles/update-disable.png"
                                                                OverImageUrl="assets/img/controles/update-hover.png"
                                                                PressedImageUrl="assets/img/controles/update-pressed.png"
                                                                ToolTip="Refrescar"
                                                                Height="50"
                                                                Width="50" OnDirectClick="ReloadData">
                                                            </ext:ImageButton>
                                                      


                                                             <ext:ImageButton
                                                                ID="ImageButton1"
                                                                runat="server"
                                                                ImageUrl="assets/img/controles/Savenormal.png"
                                                                DisabledImageUrl="assets/img/controles/Savedisable.png"
                                                                OverImageUrl="assets/img/controles/Saveover.png"
                                                                PressedImageUrl="assets/img/controles/Savepressed.png"
                                                                ToolTip="Guardar Imagen"
                                                                Height="50"
                                                                Width="50" Handler="saveChart">
   							                                </ext:ImageButton>	
                                                        </Items>
                                                    </ext:Toolbar>
                                                </TopBar>
                                                <Items>
                                                    <ext:Chart 
                                                        ID="Chart2" 
                                                        runat="server" 
                                                        Animate="true" >
                                                        <Store>
                                                            <ext:Store ID="Store2" runat="server">
                                                                <Model>
                                                                    <ext:Model ID="Model2" runat="server">
                                                                        <Fields>
                                                                            <ext:ModelField Name="Date" Type="Date" />
                                                                            <ext:ModelField Name="Data1" />
                                                                            <ext:ModelField Name="Data2" />
                                                                        </Fields>
                                                                    </ext:Model>
                                                                </Model>
                                                            </ext:Store>
                                                        </Store>
                                                        <Axes>
                                                            <ext:TimeAxis 
                                                                Title="Date" 
                                                                Fields="Date"
                                                                Position="Bottom" 
                                                                DateFormat="MMM dd"
                                                                Constrain="true"
                                                                FromDate="<%# DateTime.Today %>"
                                                                ToDate="<%# DateTime.Today.AddDays(14) %>"
                                                                AutoDataBind="true" />

                                                            <ext:NumericAxis 
                                                                Title="Data (blue)" 
                                                                Fields="Data1" 
                                                                Position="Left" 
                                                                Maximum="10" >
                                                                <LabelTitle Fill="#115fa6"    />
                                                                <Label Fill="#115fa6"  />
                                                            </ext:NumericAxis>

                                                            <ext:NumericAxis 
                                                                Title="Data (green)"
                                                                Fields="Data2" 
                                                                Position="Right" 
                                                                Maximum="100" >
                                                                <LabelTitle Fill="#94ae0a" />
                                                                <Label Fill="#94ae0a" />
                                                            </ext:NumericAxis>
                                                        </Axes>
                                                        <Series>
                                                            <ext:LineSeries 
                                                                Titles="Blue Line" 
                                                                XField="Date" 
                                                                YField="Data1" 
                                                                Axis="Left" 
                                                                Smooth="3">
                                                                <HighlightConfig Size="7" Radius="7" />
                                                                <MarkerConfig Size="4" Radius="4" StrokeWidth="0" />
                                                            </ext:LineSeries>

                                                            <ext:LineSeries 
                                                                Titles="Green Line" 
                                                                XField="Date" 
                                                                YField="Data2" 
                                                                Axis="Right" 
                                                                Smooth="3">
                                                                <HighlightConfig Size="7" Radius="7"  />
                                                                <MarkerConfig Size="4" Radius="4" StrokeWidth="0" />
                                                            </ext:LineSeries>
                                                        </Series>
                                                        <Plugins>
                                                            <ext:VerticalMarker ID="VerticalMarker1" runat="server">
                                                                <XLabelRenderer Handler="return Ext.util.Format.date(value, 'M d');" />
                                                            </ext:VerticalMarker>
                                                        </Plugins>
                                                        <LegendConfig Position="Bottom" LabelFont="Century Gothic" />
                                                    </ext:Chart>
                                    
                                        </Items>
                                    </ext:Panel>


                                </Items>
                            </ext:TabPanel>
                        </Items>
                       
                        <BottomBar>
                            <ext:StatusBar ID="sbSucursal" runat="server" Cls="x-colorToolbar" Text="Sin validar información" />
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
                                Width="50">
                            </ext:ImageButton>
                        </Buttons>
                    </ext:FormPanel>
                </Items>
            </ext:Panel>
    </form>
</body>
</html>