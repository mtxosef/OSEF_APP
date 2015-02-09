using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de Beneficiario Socios
    /// </summary>
    public class Beneficiario
    {
        #region Campos

        string id;
        string socio;
        string certificadoinversion;
        string nombre;
        string apaterno;
        string amaterno;
        string telefono;
        string telefonomovil;
        string parentesco;

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

        public string CertificadoInversion
        {
            get { return certificadoinversion; }
            set { certificadoinversion = value; }
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

        public string Parentesco
        {
            get { return parentesco; }
            set { parentesco = value; }
        }

        #endregion
    }
}
