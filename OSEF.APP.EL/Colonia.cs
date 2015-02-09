using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de Colonias
    /// </summary>
    public class Colonia
    {
        #region Campos

        string id;
        string descripcion;
        string estado;
        string municipio;

        Estado restado;
        Municipio rmunicipio;

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

        public string Municipio
        {
            get { return municipio; }
            set { municipio = value; }
        }

        public Estado REstado
        {
            get { return restado; }
            set { restado = value; }
        }

        public Municipio RMunicipio
        {
            get { return rmunicipio; }
            set { rmunicipio = value; }
        }

        #endregion
    }
}
