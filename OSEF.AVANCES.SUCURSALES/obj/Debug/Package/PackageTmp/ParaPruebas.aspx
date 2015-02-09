<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParaPruebas.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.ParaPruebas" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <ext:ResourceManager ID="rmUsuario" runat="server" HideInDesign="true"/>

        <ext:FormPanel
            ID="fpUsuario"
            runat="server"
            BodyPadding="10"
            ButtonAlign="Right"
            Width="750"
            Height="380">
            <Items>
                <ext:TextField
                    ID="txtfContrasena"
                    runat="server"
                    FieldLabel="Contraseña"
                    LabelWidth="105"
                    MaxLength="50"
                    EnforceMaxLength="true"
                    AllowBlank="false"
                    Width="350"
                    StyleSpec="margin-right: 6px;">
                    <Plugins>
                        <ext:PasswordMask ID="pmContrasena" runat="server">
                        </ext:PasswordMask>
                        <ext:CapsLockDetector ID="cldContrasena" runat="server">
                            <Listeners>
                                <CapsLockOn Handler="#{txtfContrasena}.showIndicator({iconCls : '#Error', tip : 'BloqMayús esta activado'});" />
                                <CapsLockOff Handler="#{txtfContrasena}.hideIndicator();" />
                            </Listeners>
                        </ext:CapsLockDetector>
                    </Plugins>
                </ext:TextField>
                <ext:TextField
                    ID="txtfConfirmarContrasena"
                    runat="server"
                    FieldLabel="Confirmar"
                    LabelWidth="105"
                    MaxLength="50"
                    EnforceMaxLength="true"
                    AllowBlank="false"
                    Width="350"
                    StyleSpec="margin-right: 6px;">
                    <Plugins>
                        <ext:PasswordMask ID="pmConfirmarContrasena" runat="server"  />
                        <ext:CapsLockDetector ID="cldConfirmarContrasena" runat="server">
                            <Listeners>
                                <CapsLockOn Handler="#{txtfConfirmarContrasena}.showIndicator({iconCls : '#Error', tip : 'BloqMayús esta activado'});" />
                                <CapsLockOff Handler="#{txtfConfirmarContrasena}.hideIndicator();" />
                            </Listeners>
                        </ext:CapsLockDetector>
                    </Plugins>
                </ext:TextField>
            </Items>
            <Listeners>
                <ValidityChange Handler="this.dockedItems.get(0).setStatus({
                                                text : valid ? 'La información esta completa/correcta' : 'Existe información incompleta/incorrecta', 
                                                iconCls: valid ? 'icon-accept' : 'icon-exclamation'
                                            });
                                            #{imgbtnGuardar}.setDisabled(!valid);" />
            </Listeners>
            <Buttons>
                <ext:Button
                    ID="imgbtnGuardar" 
                    runat="server"
                    Disabled="true"
                    Text="Save">
                    <DirectEvents>
                        <Click OnEvent="imgbtnGuardar_Click">
                            <EventMask ShowMask="true" Msg="Registrando información..." />
                            <ExtraParams>
                                <ext:Parameter Name="registro" Value="Ext.encode(this.up('form').getForm().getValues(false, false, false, true))" Mode="Raw" />
                            </ExtraParams>
                        </Click>
                    </DirectEvents>
                </ext:Button>
            </Buttons>
            <BottomBar>
                <ext:StatusBar
                    ID="sbUsuario" 
                    runat="server" 
                    Cls="x-colorToolbar"
                    Text="Sin validar información" />
            </BottomBar>
        </ext:FormPanel>

</body>
</html>
