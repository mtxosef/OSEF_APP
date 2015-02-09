using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de Proveedores
    /// </summary>
    public class Proveedor
    {
        #region Campos

        string id;
        string nombre;
        string rfc;
        string contactonombre;
        string contactoapaterno;
        string contactoamaterno;
        string correo;
        string calle;
        string entrecalles;
        string noexterior;
        string nointerior;
        int codigopostal;
        string colonia;
        string estado;
        string municipio;

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

        public string RFC
        {
            get { return rfc; }
            set { rfc = value; }
        }

        public string ContactoNombre
        {
            get { return contactonombre; }
            set { contactonombre = value; }
        }

        public string ContactoAPaterno
        {
            get { return contactoapaterno; }
            set { contactoapaterno = value; }
        }

        public string ContactoAMaterno
        {
            get { return contactoamaterno; }
            set { contactoamaterno = value; }
        }

        public string Correo
        {
            get { return correo; }
            set { correo = value; }
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

        #endregion
    }
}
