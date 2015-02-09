<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login2.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.Login2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>OSEF Technology</title>
    <link rel="shortcut icon" href="images/myApp2.ico" />
    <link rel="Stylesheet" href="css/login2.css" />
    <link rel="Stylesheet" href="css/customControls2.css" />
    <style type="text/css">
        #lLogin_Password-indicator {
            position: absolute;
        }
    </style>
</head>
<body>
    <div id="wrapper">
        <form id="form1" runat="server">
            <ext:ResourceManager ID="rmLogin" runat="server" HideInDesign="true" Theme="Neptune" />

            <%--  Header--%>
            <div id="left-pane" class="l_pane">
            </div>
            <div id="top-panel">
            </div>
            <%--  Header--%>

            <%--  cuerpo--%>
            <div id="right-panel">
                <img src="images/logo-banco2.png" alt="logo" class="imgs logo-image" />
            </div>

            <%--  Panel de Error--%>
            <div id="center-panel-error">
                <table>
                    <tr>
                        <td>
                            <img src="images/btnLogin_Adv.png" alt="img-error" />
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                            Error, usuario incorrecto
                        </td>
                    </tr>
                </table>
            </div>
            <%-- Fin panel de error --%>

            <div id="center-panel-login">
                <div id="login-right">
                    <img src="images/login.png" alt="logo" width="120px" height="110px" />
                </div>
                <div id="login-left">
                    <asp:Login ID="lLogin" runat="server">
                        <LayoutTemplate>
                            <ext:TextField
                                ID="UserName"
                                runat="server"
                                AutoFocus="true"
                                EmptyText="Usuario"
                                Width="200"
                                Height="30"
                                Cls="customTxtfield customFocus">
                            </ext:TextField>
                            <br />
                            <ext:TextField
                                ID="Password"
                                runat="server"
                                EmptyText="Contraseña"
                                InputType="Password"
                                Width="200"
                                Height="30"
                                Cls="customTxtfield customFocus">
                                <Plugins>
                                    <ext:CapsLockDetector ID="cldPassword" runat="server">
                                        <Listeners>
                                            <CapsLockOn Handler="#{Password}.showIndicator({iconCls : '#Error', tip : 'BloqMayús esta activado'});" />
                                            <CapsLockOff Handler="#{Password}.hideIndicator();" />
                                        </Listeners>
                                    </ext:CapsLockDetector>
                                </Plugins>
                            </ext:TextField>
                            <ext:HyperLink
                                ID="lnkOlvidoPsw"
                                runat="server"
                                Text="¿Olvidaste tu contraseña?">
                            </ext:HyperLink>
                            <br />
                            <br />
                            <ext:Button
                                ID="Button1"
                                runat="server"
                                Text="Accesar"
                                Width="200"
                                Height="30"
                                Cls="w8-icon green customLblButton btnlogin">
                            </ext:Button>
                        </LayoutTemplate>
                    </asp:Login>
                </div>
            </div>
            <%-- Fin cuerpo--%>
            <%--  Footer--%>
            <div id="footer">
                <div id="creditos" class="creditos" >
                    <p>
                        © 2014 Osef Technology
                    </p>
                   <%-- Descomentar si se desean redes sociales e ir a login.css y despues 
                   a la clase .footer y foter-menu y comentar las lineas de margin --%>
               
                   <div id="social-login">
                    <ul>
                        <li ><a href="#">
                    
                            <img src="images/fb.png" alt="Facebook" class="imgs"  />
                        
                            </a></li>
                        <li><a href="#">
                            <img src="images/twiter.png" alt="Twitter" class="imgs"  /></a></li>
                        <li><a href="#">
                            <img src="images/youtube.png" alt="YouTube" class="imgs"  /></a></li>
                        <li><a href="#">
                            <img src="images/linked.png" alt="LinkedIn" class="imgs"  /></a></li>
                    </ul>
                </div>
                </div>
            </div>
            <%--  Footer--%>

        </form>
    </div>
</body>
</html>
