using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.EL;
using OSEF.APP.BL;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class Forma_usuario : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!X.IsAjaxRequest)
            {
                //1. Dar formato al español en mensajes de la contraseña
                PasswordMask mask = pmContrasena;
                PasswordMask maskC = pmConfirmarContrasena;
                Ext.Net.JsonObject messages = new Ext.Net.JsonObject();

                messages["pass"] = "contraseña";
                messages["and"] = "y";
                messages["passTooShort"] = "contraseña es muy corta (tamaño mínimo: {0})";
                messages["noCharType"] = "contraseña debe contener {0}";
                messages["digits"] = "dígitos";
                messages["letters"] = "letras";
                messages["lettersUp"] = "letras en mayúsculas";
                messages["symbols"] = "símbolos";
                messages["inBlackList"] = "contraseña esta en la lista de las más utilizadas";
                messages["passRequired"] = "contraseña requerida";
                messages["equalTo"] = "contraseña es igual al usuario";
                messages["repeat"] = "contraseña consiste de caracteres repetidos";
                messages["badChars"] = "contraseña contiene caracteres no admitidos: â€œ{0}â€";

                mask.Messages = messages;
                maskC.Messages = messages;
            }
        }

        /// <summary>
        /// Evento que se lanza al pasar el campo de ID o Usuario
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void txtfID_Blur(object sender, DirectEventArgs e)
        {
            //1. Verificar si no hay un Usuario con el mismo nombre
            if (UsuarioBusiness.ObtenerUsuarioPorID(txtfID.Text) != null)
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("repetido", "true", ParameterMode.Raw));
            else
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("repetido", "false", ParameterMode.Raw));
        }

        /// <summary>
        /// Evento que se lanza al pasar el campo de Correo
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void txtfCorreo_Blur(object sender, DirectEventArgs e)
        {
            //1. Verificar si no hay un Correo con el mismo nombre
            if (UsuarioBusiness.ObtenerUsuarioPorCorreo(txtfCorreo.Text) != null)
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("repetido", "true", ParameterMode.Raw));
            else
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("repetido", "false", ParameterMode.Raw));
        }

        /// <summary>
        /// Evento de clic del botón Guardar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void imgbtnGuardar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener datos de la Forma y saber si es edición o nuevo
            string strRegistro = e.ExtraParams["registro"];

            string strcookieEditarUsuario = Cookies.GetCookie("cookieEditarUsuario").Value;
            Dictionary<string, string> dRegistro = JSON.Deserialize<Dictionary<string, string>>(strRegistro);
            Usuario oUsuario = new Usuario();

            //2. Por cada elemento del submit de la Forma detectar el campo y asignarlo al objeto correspondiente
            foreach (KeyValuePair<string, string> sd in dRegistro)
            {
                switch (sd.Key)
                {
                    //3. Datos del usuario
                    case "txtfID":
                        oUsuario.ID = sd.Value;
                        break;
                    case "txtfCorreo":
                        oUsuario.Correo = sd.Value;
                        break;
                    case "cmbEstatus":
                        oUsuario.Estatus = sd.Value;
                        break;
                    case "txtfNombre":
                        oUsuario.Nombre = sd.Value;
                        break;
                    case "txtfAPaterno":
                        oUsuario.APaterno = sd.Value;
                        break;
                    case "txtfAMaterno":
                        oUsuario.AMaterno = sd.Value;
                        break;
                    case "txtfContrasena":
                        oUsuario.Contrasena = sd.Value;
                        break;
                }
            }

            //4. Validar si es nuevo o es uno existente
            if (strcookieEditarUsuario.Equals("Nuevo"))
            {
                oUsuario.Estatus = "ALTA";
                oUsuario.FechaAlta = DateTime.Now;
                oUsuario.Bloqueado = false;
                oUsuario.EnLinea = false;
                //5. Insertar en la base de datos
                UsuarioBusiness.Insertar(oUsuario);
                //6. Mandar mensaje con el código del proveedor
                var success = new JFunction { Fn = "imgbtnGuardar_Click_Success" };
                X.Msg.Alert("Registro completo", "<p align='center'>Usuario registrado con ID: <br/>" + oUsuario.ID + ".</p>", success).Show();
            }
            else
            {
                oUsuario.ID = strcookieEditarUsuario;
                //7. Actualizar los datos del usuario
                UsuarioBusiness.Actualizar(oUsuario);
                //8. Mandar mensaje con el código del Usuario
                var success = new JFunction { Fn = "imgbtnGuardar_Click_Success" };
                X.Msg.Alert("Actualización completa", "<p align='center'>Se han actualizado los datos del usuario <br/>" + oUsuario.ID + ".</p>", success).Show();
            }
        }

        /// <summary>
        /// Evento que se lanza al cargar el store
        /// </summary>
        [DirectMethod]
        public void sUsuario_Load()
        {
            string strcookieEditarUsuario = Cookies.GetCookie("cookieEditarUsuario").Value;
            if (!strcookieEditarUsuario.Equals("Nuevo"))
            {
                Usuario oUsuario = UsuarioBusiness.ObtenerUsuarioPorID(strcookieEditarUsuario);
                sUsuario.Add(new
                {
                    ID = oUsuario.ID,
                    Correo = oUsuario.Correo,
                    Nombre = oUsuario.Nombre,
                    APaterno = oUsuario.APaterno,
                    AMaterno = oUsuario.AMaterno,
                    Contrasena = oUsuario.Contrasena,
                    Estatus = oUsuario.Estatus,
                    Bloqueado = oUsuario.Bloqueado,
                    EnLinea = oUsuario.EnLinea,
                    FechaAlta = oUsuario.FechaAlta,
                    FechaBloqueo = oUsuario.FechaBloqueo,
                    UltimoAcceso = oUsuario.UltimoAcceso,
                    CambioContrasena = oUsuario.CambioContrasena
                });
            }
        }
    }
}