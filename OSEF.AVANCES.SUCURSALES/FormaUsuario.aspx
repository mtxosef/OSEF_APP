<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaUsuario.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.Forma_usuario" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/login.css" />
    <link rel="Stylesheet" href="css/customControls.css" />
    <script type='text/javascript' src="js/usuarios.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmUsuario" runat="server" HideInDesign="true"/>

        <ext:Store
            ID="sUsuario"
            runat="server">
            <Model>
                <ext:Model ID="mUsuario" runat="server" IDProperty="ID">
                    <Fields>
                        <ext:ModelField Name="ID" Type="String" />
                        <ext:ModelField Name="Correo" Type="String" />
                        <ext:ModelField Name="Nombre" Type="String" />
                        <ext:ModelField Name="APaterno" Type="String" />
                        <ext:ModelField Name="AMaterno" Type="String" />
                        <ext:ModelField Name="Contrasena" Type="String" />
                        <ext:ModelField Name="Estatus" Type="String" />
                        <ext:ModelField Name="Bloqueado" Type="Boolean" />
                        <ext:ModelField Name="EnLinea" Type="Boolean" />
                        <ext:ModelField Name="FechaAlta" Type="Date" />
                        <ext:ModelField Name="FechaBloqueo" Type="Date" />
                        <ext:ModelField Name="UltimoAcceso" Type="Date" />
                        <ext:ModelField Name="CambioContrasena" Type="Date" />
                    </Fields>
                </ext:Model>
            </Model>
            <Listeners>
                <Load Fn="sUsuario_Load" />
                <Add Fn="sUsuario_Add" />
            </Listeners>
        </ext:Store>

        <ext:FormPanel
            ID="fpUsuario"
            runat="server"
            BodyPadding="10"
            ButtonAlign="Right"
            Width="750"
            Height="380">
            <Items>
                <ext:FieldSet
                    ID="fsDatosGenerales"
                    runat="server"
                    Title="Datos generales"
                    Padding="3">
                    <Items>
                        <ext:Container
                            ID="cUsuario1"
                            runat="server"
                            Layout="HBoxLayout"
                            Margin="5">
                            <Items>
                                <ext:TextField
                                    ID="txtfID"
                                    runat="server"
                                    FieldLabel="Usuario"
                                    LabelWidth="105"
                                    MaxLength="50"
                                    EnforceMaxLength="true"
                                    AutoFocus="true"
                                    AllowBlank="false"
                                    StyleSpec="margin-right: 6px;"
                                    Width="350">
                                    <DirectEvents>
                                        <Blur Before="txtfID_Blur_Before" OnEvent="txtfID_Blur" Success="txtfID_Blur_Success" />
                                    </DirectEvents>
                                </ext:TextField>
                                <ext:TextField
                                    ID="txtfCorreo"
                                    runat="server"
                                    EmptyText="Correo electrónico"
                                    LabelWidth="110"
                                    Vtype="email"
                                    MaxLength="50"
                                    EnforceMaxLength="true"
                                    AllowBlank="false"
                                    Width="350">
                                    <DirectEvents>
                                        <Blur Before="txtfCorreo_Blur_Before" OnEvent="txtfCorreo_Blur" Success="txtfCorreo_Blur_Success" />
                                    </DirectEvents>
                                </ext:TextField>
                            </Items>
                        </ext:Container>
                        <ext:Container
                            ID="cUsuario2"
                            runat="server"
                            Layout="HBoxLayout"
                            Margin="5">
                            <Items>
                                <ext:TextField
                                    ID="txtfNombre"
                                    runat="server"
                                    FieldLabel="Nombre(s)"
                                    LabelWidth="105"
                                    MaxLength="50"
                                    EnforceMaxLength="true"
                                    Width="350"
                                    StyleSpec="margin-right: 6px;"
                                    AllowBlank="false">
                                    <Listeners>
                                        <Blur Handler="App.txtfNombre.setValue(App.txtfNombre.getValue().toUpperCase());" />
                                    </Listeners>
                                </ext:TextField>
                                <ext:TextField
                                    ID="txtfAPaterno"
                                    runat="server"
                                    EmptyText="Apellido paterno"
                                    MaxLength="50"
                                    EnforceMaxLength="true"
                                    StyleSpec="margin-right: 6px;"
                                    Width="172">
                                    <Listeners>
                                        <Blur Handler="App.txtfAPaterno.setValue(App.txtfAPaterno.getValue().toUpperCase());" />
                                    </Listeners>
                                </ext:TextField>
                                <ext:TextField
                                    ID="txtfAMaterno"
                                    runat="server"
                                    EmptyText="Apellido materno"
                                    MaxLength="50"
                                    EnforceMaxLength="true"
                                    Width="172">
                                    <Listeners>
                                        <Blur Handler="App.txtfAMaterno.setValue(App.txtfAMaterno.getValue().toUpperCase());" />
                                    </Listeners>
                                </ext:TextField>
                            </Items>
                        </ext:Container>
                        <ext:Container
                            ID="cUsuario3"
                            runat="server"
                            Layout="HBoxLayout"
                            Margin="5">
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
                                    StyleSpec="margin-right: 6px;"
                                    SubmitValue="false">
                                    <Validator Fn="txtfContrasena_Validator" />
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
                                <ext:Checkbox
                                    ID="chkBloqueado"
                                    runat="server"
                                    BoxLabel="Bloqueado"
                                    Disabled="true">
                                </ext:Checkbox>
                            </Items>
                        </ext:Container>
                        <ext:Container
                            ID="cUsuario4"
                            runat="server"
                            Layout="HBoxLayout"
                            Margin="5">
                            <Items>
                                <ext:TextField
                                    ID="txtfConfirmarContrasena"
                                    runat="server"
                                    FieldLabel="Confirmar"
                                    LabelWidth="105"
                                    MaxLength="50"
                                    EnforceMaxLength="true"
                                    AllowBlank="false"
                                    Width="350"
                                    StyleSpec="margin-right: 6px;"
                                    SubmitValue="false">
                                    <Validator Fn="txtfConfirmarContrasena_Validator" />
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
                                <ext:Checkbox
                                    ID="chkEnLinea"
                                    runat="server"
                                    BoxLabel="En línea"
                                    Disabled="true">
                                </ext:Checkbox>
                            </Items>
                        </ext:Container>
                    </Items>
                </ext:FieldSet>
                <ext:FieldSet
                    ID="fsEstado"
                    runat="server"
                    Title="Información"
                    Padding="3">
                    <Items>
                        <ext:Container
                            ID="cUsuario5"
                            runat="server"
                            Layout="HBoxLayout"
                            Margin="5">
                            <Items>
                                <ext:ComboBox
                                    ID="cmbEstatus"
                                    runat="server"
                                    FieldLabel="Estatus"
                                    LabelWidth="105"
                                    Anchor="100%"
                                    Editable="false"
                                    Width="350"
                                    StyleSpec="margin-right: 6px;"
                                    Disabled="true">
                                    <Items>
                                        <ext:ListItem Index="0" Text="ALTA" />
                                        <ext:ListItem Index="1" Text="BLOQUEADO" />
                                        <ext:ListItem Index="2" Text="BAJA" />
                                    </Items>
                                    <SelectedItems>
                                        <ext:ListItem Index="0" />
                                    </SelectedItems>
                                </ext:ComboBox>
                                <ext:TextField
                                    ID="txtfUsuario"
                                    runat="server"
                                    FieldLabel="Usuario alta"
                                    LabelWidth="130"
                                    MaxLength="50"
                                    EnforceMaxLength="true"
                                    Width="350"
                                    Disabled="true">
                                </ext:TextField>
                            </Items>
                        </ext:Container>
                        <ext:Container
                            ID="cUsuario6"
                            runat="server"
                            Layout="HBoxLayout"
                            Margin="5">
                            <Items>
                                <ext:DateField
                                    ID="dfFechaAlta"
                                    runat="server"
                                    FieldLabel="Fecha alta"
                                    LabelWidth="105"
                                    Disabled="true"
                                    Width="350"
                                    StyleSpec="margin-right: 6px;">
                                    <PickerOptions 
                                        Cls="my-date-picker"
                                        ID="pOFechaAlta" 
                                        runat="server">
                                    </PickerOptions>
                                </ext:DateField>
                                <ext:DateField
                                    ID="dfFechaBloqueo"
                                    runat="server"
                                    FieldLabel="Fecha bloqueo"
                                    Disabled="true"
                                    LabelWidth="130"
                                    Width="350">
                                    <PickerOptions
                                        Cls="my-date-picker"
                                        ID="pOFechaBloqueo"
                                        runat="server">
                                    </PickerOptions>
                                </ext:DateField>
                            </Items>
                        </ext:Container>
                        <ext:Container
                            ID="cUsuario7"
                            runat="server"
                            Layout="HBoxLayout"
                            Margin="5">
                            <Items>
                                <ext:DateField
                                    ID="dfUltimoAcceso"
                                    runat="server"
                                    FieldLabel="Último acceso"
                                    LabelWidth="105"
                                    Width="350"
                                    Disabled="true"
                                    StyleSpec="margin-right: 6px;">
                                    <PickerOptions
                                        Cls="my-date-picker"
                                        ID="poUltimoAcceso"
                                        runat="server">
                                    </PickerOptions>
                                </ext:DateField>
                                <ext:DateField
                                    ID="dfCambioContrasena"
                                    runat="server"
                                    FieldLabel="Cambio contraseña"
                                    LabelWidth="130"
                                    Width="350"
                                    Disabled="true">
                                    <PickerOptions
                                        Cls="my-date-picker"
                                        ID="poCambioContrasena"
                                        runat="server">
                                    </PickerOptions>
                                </ext:DateField>
                            </Items>
                        </ext:Container>
                    </Items>
                </ext:FieldSet>
            </Items>
            <Listeners>
                <ValidityChange Handler="this.dockedItems.get(0).setStatus({
                                                text : valid ? 'La información esta completa/correcta' : 'Existe información incompleta/incorrecta', 
                                                iconCls: valid ? 'icon-accept' : 'icon-exclamation'
                                            });
                                            #{imgbtnGuardar}.setDisabled(!valid);" />
            </Listeners>
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
                    <DirectEvents>
                        <Click OnEvent="imgbtnGuardar_Click">
                            <EventMask ShowMask="true" Msg="Registrando información..." />
                            <ExtraParams>
                                <ext:Parameter Name="registro" Value="sendData()" Mode="Raw" />
                            </ExtraParams>
                        </Click>
                    </DirectEvents>
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
                    <Listeners>
                        <Click Handler="window.parent.App.wEmergente.hide();" />
                    </Listeners>
                </ext:ImageButton>
            </Buttons>
            <BottomBar>
                <ext:StatusBar
                    ID="sbUsuario" 
                    runat="server" 
                    Cls="x-colorToolbar"
                    Text="Sin validar información" />
            </BottomBar>
        </ext:FormPanel>
    </form>
</body>
</html>