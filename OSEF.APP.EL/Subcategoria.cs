using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de SubCategorias
    /// </summary>
    public class Subcategoria
    {
        #region Campos

        string id;
        byte orden;
        string descripcion;
        string categoria;

        #endregion

        #region Propiedades

        public string ID
        {
            get { return id; }
            set { id = value; }
        }

        public byte Orden
        {
            get { return orden; }
            set { orden = value; }
        }

        public string Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }

        public string Categoria
        {
            get { return categoria; }
            set { categoria = value; }
        }

        #endregion
    }
}
