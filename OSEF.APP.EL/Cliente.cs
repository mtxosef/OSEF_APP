using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de Clientes
    /// </summary>
    public class Cliente
    {
        #region Campos

        string id;
        string nombre;
        string apaterno;
        string amaterno;
        string rfc;
        string curp;
        DateTime fechanacimiento;
        byte edad;
        string sexo;
        string estadocivil;
        string profesion;
        string correo;
        string telefono;
        string telefonomovil;
        string calle;
        string noexterior;
        string nointerior;
        string colonia;
        int codigopostal;
        string entrecalles;
        string estado;
        string municipio;
        string empresa;
        string empresacalle;
        string empresanoexterior;
        string empresanointerior;
        string empresacolonia;
        int empresacodigopostal;
        string empresaentrecalles;
        string empresatelefono;
        string puesto;
        DateTime fechaalta;
        string estatus;
        string usuario;

        List<Beneficiario> rbeneficiarios;

        #endregion

        #region Propiedades

        public string ID
        {
            get { return id; }
            set { id = value; }
        }

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        public string APaterno
        {
            get { return apaterno; }
            set { apaterno = value; }
        }

        public string AMaterno
        {
            get { return amaterno; }
            set { amaterno = value; }
        }

        public string RFC
        {
            get { return rfc; }
            set { rfc = value; }
        }

        public string CURP
        {
            get { return curp; }
            set { curp = value; }
        }

        public DateTime FechaNacimiento
        {
            get { return fechanacimiento; }
            set { fechanacimiento = value; }
        }

        public byte Edad
        {
            get { return edad; }
            set { edad = value; }
        }

        public string Sexo
        {
            get { return sexo; }
            set { sexo = value; }
        }

        public string EstadoCivil
        {
            get { return estadocivil; }
            set { estadocivil = value; }
        }

        public string Profesion
        {
            get { return profesion; }
            set { profesion = value; }
        }

        public string Correo
        {
            get { return correo; }
            set { correo = value; }
        }

        public string Telefono
        {
            get { return telefono; }
            set { telefono = value; }
        }

        public string TelefonoMovil
        {
            get { return telefonomovil; }
            set { telefonomovil = value; }
        }

        public string Calle
        {
            get { return calle; }
            set { calle = value; }
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

        public string Colonia
        {
            get { return colonia; }
            set { colonia = value; }
        }

        public int CodigoPostal
        {
            get { return codigopostal; }
            set { codigopostal = value; }
        }

        public string EntreCalles
        {
            get { return entrecalles; }
            set { entrecalles = value; }
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

        public string Empresa
        {
            get { return empresa; }
            set { empresa = value; }
        }

        public string EmpresaCalle
        {
            get { return empresacalle; }
            set { empresacalle = value; }
        }

        public string EmpresaNoExterior
        {
            get { return empresanoexterior; }
            set { empresanoexterior = value; }
        }

        public string EmpresaNoInterior
        {
            get { return empresanointerior; }
            set { empresanointerior = value; }
        }

        public string EmpresaColonia
        {
            get { return empresacolonia; }
            set { empresacolonia = value; }
        }

        public int EmpresaCodigoPostal
        {
            get { return empresacodigopostal; }
            set { empresacodigopostal = value; }
        }

        public string EmpresaEntreCalles
        {
            get { return empresaentrecalles; }
            set { empresaentrecalles = value; }
        }

        public string EmpresaTelefono
        {
            get { return empresatelefono; }
            set { empresatelefono = value; }
        }

        public string Puesto
        {
            get { return puesto; }
            set { puesto = value; }
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

        public string Usuario
        {
            get { return usuario; }
            set { usuario = value; }
        }

        public List<Beneficiario> RBeneficiarios
        {
            get { return rbeneficiarios; }
            set { rbeneficiarios = value; }
        }

        #endregion
    }
}
