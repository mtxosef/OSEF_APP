using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de Bienes Inmuebles
    /// </summary>
    public class BienInmueble
    {
        #region Campos

        string id;
        string solicitudprestamo;
        string tipopersona;
        string ubicacion;
        string inscripcion;
        string tipo;
        int valor;

        #endregion

        #region Propiedades

        public string ID
        {
            get { return id; }
            set { id = value; }
        }

        public string SolicitudPrestamo
        {
            get { return solicitudprestamo; }
            set { solicitudprestamo = value; }
        }

        public string TipoPersona
        {
            get { return tipopersona; }
            set { tipopersona = value; }
        }

        public string Ubicacion
        {
            get { return ubicacion; }
            set { ubicacion = value; }
        }

        public string Inscripcion
        {
            get { return inscripcion; }
            set { inscripcion = value; }
        }

        public string Tipo
        {
            get { return tipo; }
            set { tipo = value; }
        }

        public int Valor
        {
            get { return valor; }
            set { valor = value; }
        }

        #endregion
    }
}
