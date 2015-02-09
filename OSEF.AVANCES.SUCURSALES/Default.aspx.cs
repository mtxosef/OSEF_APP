using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.EL;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class Default : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Evento que se lanza al cargar el Store de Usuario
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void sUsuario_Load(object sender, DirectEventArgs e)
        {
            Usuario oUsuario = (Usuario)Session["Usuario"];
            sUsuario.Add(new { 
                ID = oUsuario.ID,
                Correo = oUsuario.Correo,
                Nombre = oUsuario.Nombre,
                AMaterno = oUsuario.AMaterno,
                APaterno = oUsuario.APaterno,
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