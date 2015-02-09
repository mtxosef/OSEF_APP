<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OlvidasteContrasena.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.FormaOlvidoContrasena" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
      <link rel="stylesheet" href="css/login.css" />
    <link rel="Stylesheet" href="css/customControls.css" />
</head>
<body>
    <form id="form1" runat="server">
     <ext:ResourceManager ID="rmOlvidoContraseña" runat="server" />


      <ext:FormPanel 
        ID="FormPanel1" 
        runat="server"
        Title="Restablecer Contraseña"
        Width="450"
        StyleSpec="margin:0 auto; margin-top: 180px;"
        BodyPadding="10"
        DefaultAnchor="100%">
        <Items>
            <ext:FieldContainer 
            ID="ContenedorNombre" 
            runat="server" 
            FieldLabel="¿Olvidaste tu contraseña?" 
            AnchorHorizontal="100%"
            LabelWidth="180"
            Layout="HBoxLayout">
            </ext:FieldContainer>
            
           
            
            <ext:FieldSet ID="FieldSet1" 
                runat="server"
                Title="Instrucciones"
                Collapsible="False"
                DefaultAnchor="100%">
               
                <Items>
                    <ext:FieldContainer ID="FieldContainer2" 
                        runat="server"
                        LabelWidth="380"
                        FieldLabel="Ingresa tu usuario o dirección de correo para restablecer tu contraseña"
                        Layout="HBoxLayout">                        
                        </ext:FieldContainer>
                    
                    <ext:FieldContainer ID="FieldContainer3" 
                        runat="server" 
                        FieldLabel=" Puede que tengas que ver en tu carpeta de spam o desbloquear no-reply@osef.com.mx" 
                        Layout="HBoxLayout"
                        LabelWidth="380">

                      </ext:FieldContainer>

                      

                </Items>

             
            </ext:FieldSet>
          <ext:TextField 
          ID="txtEnviaCorreo" 
          EmptyText="Usuario/Dirección E-mail" 
          runat="server" 
          />


        </Items>
        
        <Buttons>
       
            
            <ext:Button 
            ID="btnEnviar" 
            runat="server" 
            Text="Enviar" 
            Cls="cbtn"
            MarginSpec="0 10 0 0">
             
            </ext:Button>
        </Buttons>
    </ext:FormPanel>




   

    </form>
</body>
</html>
