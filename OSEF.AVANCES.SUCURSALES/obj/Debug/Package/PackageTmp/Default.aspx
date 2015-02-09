<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.Default" %>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width" />
    <title>Revisiones de obra</title>
    <link rel="shortcut icon" href="images/myApp.ico" />
    <link rel="stylesheet" type="text/css" href="assets/css/bootmetro.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/demo.css" />
    <link rel="Stylesheet" href="css/customControls.css" />
    <link rel="stylesheet" href="css/login.css" />
    <script type="text/javascript" src="js/default.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmDefault" runat="server" HideInDesign="true" />

        <div id="wrap">
            <!-- Header -->
            <div id="nav-bar" class="">
                <div class="pull-left">
                    <div id="header-container">
                        <a href="Default.aspx"><img src="images/logo-banco.png" class="imgs" alt="logo" /></a>
                    </div>
                </div>
                <div class="pull-right">
                    <div id="top-info" class="pull-right">
                        <a id="settings" href="#" class="win-command pull-right">
                            <span></span>
                        </a>
                        <a id="logged-user" href="#" class="win-command pull-right">
                            <span></span>
                        </a>
                        <div class="pull-left">
                            <ext:SplitButton 
                                ID="SplitButton1"
                                runat="server"
                                Text="CHRISTIAN MEDINA"
                                Cls="xBtnCustomDesplegable">
                                <Menu>
                                    <ext:Menu ID="Menu2" runat="server">
                                        <Items>
                                            <ext:MenuItem ID="MenuItem4" runat="server" Text="Configuración" Width="250">
                                            </ext:MenuItem>
                                            <ext:MenuItem ID="miCambiarContrasena" runat="server" Text="Cambiar contraseña">
                                                <Listeners>
                                                    <Click Fn="miCambiarContrasena_Click" />
                                                </Listeners>
                                            </ext:MenuItem>
                                            <ext:MenuItem ID="MenuItem5" runat="server" Text="Cerrar sesión">
                                            </ext:MenuItem>
                                        </Items>
                                    </ext:Menu>
                                </Menu>
                            </ext:SplitButton>
                        </div>
                    </div>
                </div>
              <!--Boton Regresar-->
                <ext:ImageButton
                    ID="imgbtnRegresar"
                    runat="server"
                    ImageUrl="assets/img/controles/btnRegresar.png"
                    OverImageUrl="assets/img/controles/btnRegresarOver.png"
                    PressedImageUrl="assets/img/controles/btnRegresarPressed.png" ToolTip="Regresar"
                    Height="50"
                    Width="50"
                    Hidden="true" 
                    StyleSpec="margin-left: 900px; margin-right: auto; margin-top:25px;">
                    <Listeners>
                        <Click Handler="
                            App.imgbtnRegresar.hide();
                            App.lblRegresar.hide();
                            parent.App.pCentro.getLoader().load('Menu.aspx');">
                        </Click>
                    </Listeners>
               </ext:ImageButton>
                <ext:Label
                    ID="lblRegresar"
                    runat="server"
                    Text="Regresar"
                    Hidden="true" 
                    StyleSpec="margin-left: 1095px; margin-right: auto; margin-top:0px;">
                </ext:Label>
                 <!--Fin Boton Regresar-->
               
            </div>
            <ext:Panel 
                ID="pCentro"
                runat="server"
                Height="480"
                Width="1280"
                Region="Center"
                StyleSpec="margin-left: 30px; margin-right: auto; margin-top:20px;"
                BodyStyle="background-color:transparent;"
                AutoRender="true"
                Cls="visible">
                <Loader
                    ID="lCentro"
                    runat="server"
                    Mode="Frame"
                    AutoLoad="true"
                    Scripts="true"
                    Url="Menu.aspx">
                    <LoadMask ShowMask="True" Msg="Cargando...">
                    </LoadMask>
                </Loader>
            </ext:Panel>
        </div>
        <%-- Footer--%>
        <div id="footer-menu">
            <div id="creditos" class="creditos-menu" >
                <p>© 2014 Osef Technology</p>
                <%--<div id="social">
                    <ul>
                        <li ><a href="#">
                    
                            <img src="img/social/fb.png" alt="Facebook" class="imgs"  />
                        
                            </a></li>
                        <li><a href="#">
                            <img src="img/social/twiter.png" alt="Twitter" class="imgs"  /></a></li>
                        <li><a href="#">
                            <img src="img/social/youtube.png" alt="YouTube" class="imgs"  /></a></li>
                        <li><a href="#">
                            <img src="img/social/linked.png" alt="LinkedIn" class="imgs"  /></a></li>
                    </ul>
                </div>--%>
            </div>
        </div>
        <%-- Footer--%>

        <ext:Window 
            ID="wEmergente"
            runat="server"
            Icon="Application"
            Hidden="true"
            Modal="true"
            Padding="5"
            Resizable="False"
            Region="Center"
            XOnEsc="Ext.emptyFn">
            <Loader ID="lEmergente" runat="server" Mode="Frame" AutoLoad="false">
                <LoadMask ShowMask="true" Msg="Cargando..." />
            </Loader>
        </ext:Window>

        <ext:Window 
            ID="wEmergenteGraficas"
            runat="server"
            Icon="Application"
            Hidden="true"
            Modal="true"
            Padding="5"
            Resizable="False"
            Region="Center"
            XOnEsc="Ext.emptyFn">
            <Loader ID="Loader1" runat="server" Mode="Frame" AutoLoad="false">
                <LoadMask ShowMask="true" Msg="Cargando..." />
            </Loader>
        </ext:Window>

    </form>
</body>
</html>
