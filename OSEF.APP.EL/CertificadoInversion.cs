using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de Certificados de Inversiones
    /// </summary>
    public class CertificadoInversion
    {
        #region Campos

        string id;
        string socio;
        string tipoinversion;
        byte unidadcalculo;
        decimal tasainteres;
        DateTime fechavencimiento;
        decimal valorinversion;
        string instruccionescapital;
        string instruccionesinteres;
        string usuario;
        DateTime fechaalta;
        string estatus;

        #endregion

        #region Propiedades

        public string ID
        {
            get { return id; }
            set { id = value; }
        }

        public string Socio
        {
            get { return socio; }
            set { socio = value; }
        }

        public string TipoInversion
        {
            get { return tipoinversion; }
            set { tipoinversion = value; }
        }

        public byte UnidadCalculo
        {
            get { return unidadcalculo; }
            set { unidadcalculo = value; }
        }

        public decimal TasaInteres
        {
            get { return tasainteres; }
            set { tasainteres = value; }
        }

        public DateTime FechaVencimiento
        {
            get { return fechavencimiento; }
            set { fechavencimiento = value; }
        }

        public decimal ValorInversion
        {
            get { return valorinversion; }
            set { valorinversion = value; }
        }

        public string InstruccionesCapital
        {
            get { return instruccionescapital; }
            set { instruccionescapital = value; }
        }

        public string InstruccionesInteres
        {
            get { return instruccionesinteres; }
            set { instruccionesinteres = value; }
        }

        public string Usuario
        {
            get { return usuario; }
            set { usuario = value; }
        }

        public DateTime FechaAlta
        {
            get { return fechaalta; }
            set { fechaalta = value; }
        }

        public string Estatus
        {
            get { return estatus; }
            set { estatus = value; }
        }

        #endregion
    }
}
