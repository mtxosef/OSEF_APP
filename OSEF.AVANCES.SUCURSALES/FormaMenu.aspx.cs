using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.BL;
using System.IO;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class FormaMenu : System.Web.UI.Page
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
                sGruposMenu.DataSource = GrupoMenuBusiness.ObtenerGruposMenu();
                sGruposMenu.DataBind();
            }
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
            string strID = JSON.Deserialize<string>(e.ExtraParams["id"]);
            string strcookieEditarMenu = Cookies.GetCookie("cookieEditarMenu").Value;
            Dictionary<string, string> dRegistro = JSON.Deserialize<Dictionary<string, string>>(strRegistro);
            OSEF.APP.EL.Menu oMenu = new OSEF.APP.EL.Menu();

            //2. Por cada elemento del submit de la Forma detectar el campo y asignarlo al objeto correspondiente
            foreach (KeyValuePair<string, string> sd in dRegistro)
            {
                switch (sd.Key)
                {
                    //3. Datos del menú
                    case "txtfDescripcion":
                        oMenu.Descripcion = sd.Value;
                        break;
                    case "cmbGrupoMenu":
                        oMenu.GrupoMenu = sd.Value;
                        break;
                }
            }

            //5. Validar si es un registro Nuevo
            if (strcookieEditarMenu.Equals("Nuevo"))
            {
                //6. Insertar en la base de datos y crear las carpetas
                oMenu.ImagenNormal = "";
              
                oMenu.ID = MenuBusiness.Insertar(oMenu);
                Directory.CreateDirectory(Server.MapPath(" ") + "\\images\\menu\\" + oMenu.ID);
                Directory.CreateDirectory(Server.MapPath(" ") + "\\images\\menu\\" + oMenu.ID + "\\NORMAL");
           

                //7. Guardar las imagenes en la carpeta respectiva
                fufNormal.PostedFile.SaveAs(Server.MapPath(" ") + "\\images\\menu\\" + oMenu.ID + "\\NORMAL\\" + fufNormal.FileName);
                
                //8. Actualizar direcciones
                oMenu.ImagenNormal = "\\images\\menu\\" + oMenu.ID + "\\NORMAL\\" + fufNormal.FileName;
              
                MenuBusiness.Actualizar(oMenu);

                //8. Mandar mensaje con el código del menú
                var success = new JFunction { Fn = "imgbtnGuardar_Click_Success" };
                X.Msg.Alert("Registro completo", "<p align='center'>Menú registrado con ID: <br/>" + oMenu.ID + ".</p>", success).Show();
            }
            else
            {
                //9. Actualizar los datos del menú
                oMenu.ID = strID;
                OSEF.APP.EL.Menu pMenu = MenuBusiness.ObtenerMenuPorID(oMenu.ID);

                //10. Validar FileUploadField Normal
                if (fufNormal.HasFile)
                {
                    oMenu.ImagenNormal = "\\images\\menu\\" + oMenu.ID + "\\NORMAL\\" + fufNormal.FileName;
                    fufNormal.PostedFile.SaveAs(Server.MapPath(" ") + "\\images\\menu\\" + oMenu.ID + "\\NORMAL\\" + fufNormal.FileName);
                    File.Delete(Server.MapPath(" ") + pMenu.ImagenNormal);
                }
                else
                    oMenu.ImagenNormal = pMenu.ImagenNormal;

                
              


                //14. Actualizar
                MenuBusiness.Actualizar(oMenu);

                //15. Mandar mensaje con el código del Menú
                var success = new JFunction { Fn = "imgbtnGuardar_Click_Success" };
                X.Msg.Alert("Actualización completa", "<p align='center'>Se han actualizado los datos del menú <br/>" + oMenu.ID + ".</p>", success).Show();
            }
        }

        /// <summary>
        /// Evento que se lanza al cargar el store
        /// </summary>
        [DirectMethod]
        public void sMenu_Load()
        {
            string strcookieEditarMenu = Cookies.GetCookie("cookieEditarMenu").Value;
            if (!strcookieEditarMenu.Equals("Nuevo"))
            {
                OSEF.APP.EL.Menu oMenu = MenuBusiness.ObtenerMenuPorID(strcookieEditarMenu);
                sMenu.Add(new
                {
                    ID = oMenu.ID,
                    Descripcion = oMenu.Descripcion,
                    GrupoMenu = oMenu.GrupoMenu,
                    ImagenNormal = oMenu.ImagenNormal,
                   
                });
            }
        }
    }
}