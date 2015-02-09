<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParaPruebas.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.ParaPruebas" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <ext:ResourceManager ID="rmUsuario" runat="server" HideInDesign="true"/>

    <ext:GridPanel
        ID="gpObraCivil"
        runat="server"
        Width="870"
        Height="210"
        EnableColumnHide="false"
        EnableColumnMove="false">
        <Store>
            <ext:Store
                ID="sObraCivil"
                runat="server">
                <Model>
                    <ext:Model 
                        ID="mObraCivil"
                        runat="server" 
                        IDProperty="Renglon">
                        <Fields>
                            <ext:ModelField Name="Revision" Type="Int" />
                            <ext:ModelField Name="Renglon" Type="Int" />
                            <ext:ModelField Name="Concepto" Type="String" />
                            <ext:ModelField Name="Proveedor" Type="String" />
                            <ext:ModelField Name="Programado" Type="Float" />
                            <ext:ModelField Name="Real" Type="Float" />
                        </Fields>
                    </ext:Model>
                </Model>
            </ext:Store>
        </Store>
        <ColumnModel 
            ID="cmObraCivil" 
            runat="server">
            <Columns>
                <ext:CommandColumn
                    ID="ccAcciones"
                    runat="server"
                    Width="25">
                    <Commands>
                        <ext:GridCommand
                            Icon="Delete"
                            CommandName="Borrar">
                            <ToolTip Text="Borrar" />
                        </ext:GridCommand>
                    </Commands>
                </ext:CommandColumn>
                <ext:Column
                    ID="cConcepto"
                    runat="server"
                    Text="Concepto"
                    Width="300"
                    DataIndex="Concepto">
                </ext:Column>
                <ext:Column 
                    ID="cProveedor"
                    runat="server"
                    Text="Proveedor"
                    DataIndex="Proveedor"
                    Width="338">
                    <Renderer Fn="cProveedor_Renderer" />
                    <Editor>
                        <ext:ComboBox
                            ID="cmbProveedor"
                            runat="server"
                            DisplayField="Nombre"
                            ValueField="ID">
                            <Store>
                                <ext:Store
                                    ID="sProveedores"
                                    runat="server">
                                    <Model>
                                        <ext:Model ID="mProveedores" runat="server" IDProperty="ID">
                                            <Fields>
                                                <ext:ModelField Name="ID" Type="String" />
                                                <ext:ModelField Name="Nombre" Type="String" />
                                                <ext:ModelField Name="ContactoNombre" Type="String" />
                                                <ext:ModelField Name="ContactoAPaterno" Type="String" />
                                                <ext:ModelField Name="ContactoAMaterno" Type="String" />
                                                <ext:ModelField Name="Correo" Type="String" />
                                            </Fields>
                                        </ext:Model>
                                    </Model>
                                    <Sorters>
                                        <ext:DataSorter Property="ID" Direction="ASC" />
                                    </Sorters>
                                </ext:Store>
                            </Store>
                        </ext:ComboBox>
                    </Editor>
                </ext:Column>
                <ext:NumberColumn
                    ID="cProgramado"
                    runat="server"
                    Align="Center"
                    Text="Programado"
                    DataIndex="Programado"
                    Width="100">
                    <Renderer Fn="cProgramado_Renderer" />
                    <Editor>
                        <ext:NumberField 
                            ID="nfProgramado"
                            runat="server"
                            AllowDecimals="true"
                            AllowExponential="false"
                            DecimalPrecision="2"
                            DecimalSeparator="."
                            MaxLength="6"
                            EnforceMaxLength="true"
                            MaxValue="100"
                            MinValue="0"
                            Step="0.01">
                        </ext:NumberField>
                    </Editor>
                </ext:NumberColumn>
                <ext:NumberColumn 
                    ID="cReal"
                    runat="server"
                    Align="Center"
                    Text="Real"
                    DataIndex="Real"
                    Width="100">
                    <Renderer Fn="cReal_Renderer" />
                    <Editor>
                        <ext:NumberField 
                            ID="nfReal"
                            runat="server"
                            AllowDecimals="true"
                            AllowExponential="false"
                            DecimalPrecision="2"
                            DecimalSeparator="."
                            MaxLength="6"
                            EnforceMaxLength="true"
                            MaxValue="100"
                            MinValue="0"
                            Step="0.01">
                        </ext:NumberField>
                    </Editor>
                </ext:NumberColumn>
            </Columns>
        </ColumnModel>
        <SelectionModel>
            <ext:CellSelectionModel
                ID="csmObraCivil" 
                runat="server">
            </ext:CellSelectionModel>
        </SelectionModel>
        <Plugins>
            <ext:CellEditing 
                ID="ceObraCivil" 
                runat="server"
                ClicksToEdit="1">
                <Listeners>
                    <Edit Fn="ceObraCivil_Edit" />
                </Listeners>
            </ext:CellEditing>
        </Plugins>
        <View>
            <ext:GridView
                ID="gvObraCivil"
                runat="server"
                StripeRows="true">
            </ext:GridView>
        </View>
    </ext:GridPanel>

</body>
</html>
