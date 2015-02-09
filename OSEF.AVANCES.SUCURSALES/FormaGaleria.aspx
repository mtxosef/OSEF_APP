<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaGaleria.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.FormaGaleria" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="css/login.css" />
    <link rel="Stylesheet" href="css/customControls.css" />
    <script language="javascript" type="text/javascript">
        var onGroupCommand = function (column, command, group) {
            if (command === 'CargarImagenes') {
                App.wCargarImagenes.load('FormaCargaMultiImagenes.aspx');
                App.wCargarImagenes.setHeight(351.5);
                App.wCargarImagenes.setWidth(630);
                App.wCargarImagenes.center();
                App.wCargarImagenes.setTitle('Nueva Imagen');
                App.wCargarImagenes.show();
            }
        };

        var getAdditionalData = function (data, idx, record, orig) {
            return {
                rowBodyColspan: record.fields.getCount(),
                rowBody: Ext.String.format('<div style=\'padding:0 5px 5px 5px;\'>The {0} [{1}] requires light conditions of <i>{2}</i>.<br /><b>Price: {3}</b></div>', data.Common, data.Botanical, data.Light, Ext.util.Format.usMoney(data.Price))
            };
        }; 

    </script>
</head>
<body>
    <ext:ResourceManager ID="rmGaleria" runat="server" />
    <form id="form1" runat="server">
    <div>
        <ext:GridPanel 
        ID="GridPanel1" 
        runat="server" 
        Collapsible="false" 
        Height="560" 
        Width="900"
        RowLines="true" 
        Frame="false" 
        ForceFit="true">
            <Store>
                <ext:Store 
                ID="Store1" 
                runat="server" 
                GroupField="Light">
                    <Proxy>
                        <ext:AjaxProxy 
                        Url="PlantService.asmx/Plants">
                            <ActionMethods 
                            Read="POST" />
                            <Reader>
                                <ext:XmlReader 
                                Record="Plant" />
                            </Reader>
                        </ext:AjaxProxy>
                    </Proxy>
                    <Model>
                        <ext:Model 
                        ID="Model1" 
                        runat="server">
                            <Fields>
                                <ext:ModelField Name="Common" />
                                <ext:ModelField Name="Botanical" />
                                <ext:ModelField Name="Zone" Type="Int" />
                                <ext:ModelField Name="ColorCode" />
                                <ext:ModelField Name="Light" />
                                <ext:ModelField Name="Price" Type="Float" />
                                <ext:ModelField Name="Availability" Type="Date" />
                                <ext:ModelField Name="Indoor" Type="Boolean" />
                            </Fields>
                        </ext:Model>
                    </Model>
                    <Sorters>
                        <ext:DataSorter 
                        Property="Common" 
                        Direction="ASC" />
                    </Sorters>
                </ext:Store>
            </Store>
            <ColumnModel ID="ColumnModel1" runat="server" Height="23">
                <Columns>
                    <ext:Column 
                    ID="Column1"
                    runat="server" 
                    Text="Common Name"
                    DataIndex="Common" 
                    Width="220" />
                    <ext:Column 
                    ID="Column2" 
                    runat="server" 
                    Text="Light" 
                    DataIndex="Light" 
                    Width="130" />
                    <ext:Column 
                    ID="Column3" 
                    runat="server" 
                    Text="Price" 
                    DataIndex="Price" 
                    Width="70"
                    Align="right" 
                    Groupable="false">
                        <Renderer Format="UsMoney" />
                    </ext:Column>
                    <ext:DateColumn 
                    ID="DateColumn1" 
                    runat="server" 
                    Text="Available" 
                    DataIndex="Availability"
                    Width="95" 
                    Groupable="false" 
                    Format="yyyy-MM-dd" />
                    <ext:Column 
                    ID="Column4" 
                    runat="server" 
                    Text="Indoor?" 
                    DataIndex="Indoor" 
                    Width="55" />
                    <ext:CommandColumn 
                    ID="CommandColumn1" 
                    runat="server" 
                    Hidden="true">
                        <GroupCommands>
                            <ext:GridCommand 
                            Icon="Find" 
                            CommandName="CargarImagenes" 
                            Text="Examinar">
                                <ToolTip 
                                Title="Seleccionar Imagenes" 
                                Text="Selecciona todas las imágenes de esta partida" />
                            </ext:GridCommand>
                            <ext:CommandFill />
                        </GroupCommands>
                        <Listeners>
                            <GroupCommand Fn="onGroupCommand" />
                        </Listeners>
                    </ext:CommandColumn>
                </Columns>
            </ColumnModel>
            <View>
                <ext:GridView 
                ID="GridView1" 
                runat="server" 
                TrackOver="false" 
                StripeRows="false" />
            </View>
            <SelectionModel>
                <ext:CheckboxSelectionModel 
                ID="CheckboxSelectionModel1" 
                runat="server" 
                RowSpan="2" />
            </SelectionModel>
            <Features>
                <ext:Grouping 
                ID="Grouping1" 
                runat="server" 
                HideGroupedHeader="true" 
                GroupHeaderTplString='{columnName}: {name} ({[values.rows.length]} {[values.rows.length > 1 ? "Items" : "Item"]})' />
                <ext:RowBody 
                ID="RowBody1" 
                runat="server">
                    <GetAdditionalData Fn="getAdditionalData" />
                </ext:RowBody>
                <ext:RowWrap 
                ID="RowWrap1"
                runat="server" />
            </Features>
        </ext:GridPanel>
        <ext:Window 
        ID="wCargarImagenes" 
        runat="server" 
        Icon="Application"
        Hidden="true"
        Modal="true" 
        Padding="5" 
        Resizable="False" 
        Region="Center" 
        XOnEsc="Ext.emptyFn">
            <Loader 
            ID="Loader1" 
            runat="server" 
            Mode="Frame" 
            AutoLoad="false">
                <LoadMask 
                ShowMask="true" 
                Msg="Cargando..." />
            </Loader>
        </ext:Window>
    </div>
    </form>
</body>
</html>
