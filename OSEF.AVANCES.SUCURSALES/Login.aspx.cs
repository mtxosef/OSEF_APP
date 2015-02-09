using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.BL;
using System.Web.Security;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class Login : System.Web.UI.Page
    {
        #region Global variables

        //Variable para saber si dejar la mascara o quitarla
        bool bMascara = false;

        #endregion

        #region Eventos

        /// <summary>
        /// Evento de carga de la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Evento de autenticación del control Login
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lLogin_Authenticate(object sender, AuthenticateEventArgs e)
        {
            //1. Obtener nombre de usuario y passsword
            string strUsuario = lLogin.UserName;
            string strContrasena = lLogin.Password;

            //2. Obtener control TextField del password
            TextField txtfPassword = (TextField)lLogin.FindControl("Password");

            //3. Validar si el nombre de usuario y el password son correctos
            if (UsuarioBusiness.ValidarUsuarioContrasena(strUsuario, strContrasena))
            {
                //4. Autenticar verdadero y redireccionar a la pantalla principal
                FormsAuthentication.SetAuthCookie(strUsuario, true);
                e.Authenticated = true;
                bMascara = true;
                Session["Usuario"] = UsuarioBusiness.ObtenerUsuarioPorID(strUsuario);
                if (Session["Usuario"] == null)
                    Session["Usuario"] = UsuarioBusiness.ObtenerUsuarioPorCorreo(strUsuario);
            }
            else
            {
                //5. Sino la contraseña es incorrecta
                txtfPassword.SelectOnFocus = true;
                txtfPassword.Focus(true);
                bMascara = false;
            }
        }

        /// <summary>
        /// Evento que se lanza al presionar la tecla "Enter" en el TextField Password
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Password_SpecialKey(object sender, DirectEventArgs e)
        {
            //1. Objeto de autenticación
            AuthenticateEventArgs auth = new AuthenticateEventArgs();
            //2. Mandar a llamar el evento de autenticación
            lLogin_Authenticate(this, auth);
            //3. Asignar ExtraParamsResponse para saber si quitar la mascara o dejarla
            e.ExtraParamsResponse.Add(new Ext.Net.Parameter("showMask", bMascara.ToString().ToLower(), ParameterMode.Raw));
            //4. Direccionar a la página de Default si la autenticación fue true
            if (bMascara)
                Response.Redirect("~/Default.aspx", true);
        }

        /// <summary>
        /// Evento Click del botón de entrar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void imgbtnLogin_Click(object sender, DirectEventArgs e)
        {
            //1. Objeto de autenticación
            AuthenticateEventArgs auth = new AuthenticateEventArgs();
            //2. Mandar a llamar el evento de autenticación
            lLogin_Authenticate(this, auth);
            //3. Asignar ExtraParamsResponse para saber si quitar la mascara o dejarla
            e.ExtraParamsResponse.Add(new Ext.Net.Parameter("showMask", bMascara.ToString().ToLower(), ParameterMode.Raw));
            //4. Direccionar a la página de Default si la autenticación fue true
            if (bMascara)
                Response.Redirect("~/Default.aspx", true);
        }

        #endregion
    }
}