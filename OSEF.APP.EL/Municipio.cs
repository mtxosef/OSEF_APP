using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de Municipios
    /// </summary>
    public class Municipio
    {
        #region Campos

        string id;
        string descripcion;
        string estado;

        Estado restado;

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

        public string Estado
        {
            get { return estado; }
            set { estado = value; }
        }

        public Estado REstado
        {
            get { return restado; }
            set { restado = value; }
        }

        #endregion
    }
}
