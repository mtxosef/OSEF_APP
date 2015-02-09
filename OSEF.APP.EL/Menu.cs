using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de Menus
    /// </summary>
    public class Menu
    {
        #region Campos

        string id;
        string descripcion;
        string grupomenu;
        string imagennormal;
        GrupoMenu rgrupomenu;

        #endregion

        #region Propiedades

        public string ID
        {
            get { return id; }
            set { id = value; }
        }

        public string Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }

        public string GrupoMenu
        {
            get { return grupomenu; }
            set { grupomenu = value; }
        }

        public string ImagenNormal
        {
            get { return imagennormal; }
            set { imagennormal = value; }
        }

        public GrupoMenu RGrupoMenu
        {
            get { return rgrupomenu; }
            set { rgrupomenu = value; }
        }

        #endregion
    }
}
