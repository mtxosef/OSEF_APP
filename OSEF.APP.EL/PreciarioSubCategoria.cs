using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de PreciarioSubCategorias
    /// </summary>
    public class PreciarioSubCategoria
    {
        #region Campos

        string id;
        string clave;
        string preciario;
        string descripcion;
        string categoria;
        string estatus;
        DateTime fechaalta;
        string tipo;

       

        #endregion

        #region Propiedades

        public string ID
        {
            get { return id; }
            set { id = value; }
        }



        public string Clave
        {
            get { return clave; }
            set { clave = value; }
        }

        public string Preciario
        {
            get { return preciario; }
            set { preciario = value; }
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

        public string Estatus
        {
            get { return estatus; }
            set { estatus = value; }
        }

        public DateTime FechaAlta
        {
            get { return fechaalta; }
            set { fechaalta = value; }
        }

        public string Tipo
        {
            get { return tipo; }
            set { tipo = value; }
        }

        #endregion
    }
}
