using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de Estados
    /// </summary>
    public class Estado
    {
        #region Campos

        string id;
        string abreviatura;
        string descripcion;

        #endregion

        #region Propiedades

        public string ID
        {
            get { return id; }
            set { id = value; }
        }

        public string Abreviatura
        {
            get { return abreviatura; }
            set { abreviatura = value; }
        }

        public string Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }

        #endregion
    }
}
