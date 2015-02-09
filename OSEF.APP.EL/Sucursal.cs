using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de Sucursales
    /// </summary>
    public class Sucursal
    {
        #region Campos

        string id;
        short cr;
        string nombre;
        string gerentebbvanombre;
        string gerentebbvaapaterno;
        string gerentebbvaamaterno;
        string supervisornombre;
        string supervisorapaterno;
        string supervisoramaterno;
        string proveedorenergia;
        int superficie;
        string coordinadornombre;
        string coordinadorapaterno;
        string coordinadoramaterno;
        string calle;
        string entrecalles;
        string noexterior;
        string nointerior;
        int codigopostal;
        string colonia;
        string estado;
        string municipio;
        string contratista;
        DateTime terminocontrato;
        DateTime inicioobra;
        DateTime finobra;
        short semanasobra;
        DateTime fechaalta;
        string estatus;

        #endregion

        #region Propiedades

        public string ID
        {
            get { return id; }
            set { id = value; }
        }

        public short CR
        {
            get { return cr; }
            set { cr = value; }
        }

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        public string GerenteBBVANombre
        {
            get { return gerentebbvanombre; }
            set { gerentebbvanombre = value; }
        }

        public string GerenteBBVAAPaterno
        {
            get { return gerentebbvaapaterno; }
            set { gerentebbvaapaterno = value; }
        }

        public string GerenteBBVAAMaterno
        {
            get { return gerentebbvaamaterno; }
            set { gerentebbvaamaterno = value; }
        }

        public string SupervisorNombre
        {
            get { return supervisornombre; }
            set { supervisornombre = value; }
        }

        public string SupervisorAPaterno
        {
            get { return supervisorapaterno; }
            set { supervisorapaterno = value; }
        }

        public string SupervisorAMaterno
        {
            get { return supervisoramaterno; }
            set { supervisoramaterno = value; }
        }

        public string ProveedorEnergia
        {
            get { return proveedorenergia; }
            set { proveedorenergia = value; }
        }

        public int Superficie
        {
            get { return superficie; }
            set { superficie = value; }
        }

        public string CoordinadorNombre
        {
            get { return coordinadornombre; }
            set { coordinadornombre = value; }
        }

        public string CoordinadorAPaterno
        {
            get { return coordinadorapaterno; }
            set { coordinadorapaterno = value; }
        }

        public string CoordinadorAMaterno
        {
            get { return coordinadoramaterno; }
            set { coordinadoramaterno = value; }
        }

        public string Calle
        {
            get { return calle; }
            set { calle = value; }
        }

        public string EntreCalles
        {
            get { return entrecalles; }
            set { entrecalles = value; }
        }

        public string NoExterior
        {
            get { return noexterior; }
            set { noexterior = value; }
        }

        public string NoInterior
        {
            get { return nointerior; }
            set { nointerior = value; }
        }

        public int CodigoPostal
        {
            get { return codigopostal; }
            set { codigopostal = value; }
        }

        public string Colonia
        {
            get { return colonia; }
            set { colonia = value; }
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

        public string Contratista
        {
            get { return contratista; }
            set { contratista = value; }
        }

        public DateTime TerminoContrato
        {
            get { return terminocontrato; }
            set { terminocontrato = value; }
        }

        public DateTime InicioObra
        {
            get { return inicioobra; }
            set { inicioobra = value; }
        }

        public DateTime FinObra
        {
            get { return finobra; }
            set { finobra = value; }
        }

        public short SemanasObra
        {
            get { return semanasobra; }
            set { semanasobra = value; }
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
