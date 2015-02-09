using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de Estado
    /// </summary>
    public class MunicipioBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Municipios
        /// </summary>
        /// <param name="iMunicipio"></param>
        public static int Insertar(Municipio iMunicipio)
        {
            return MunicipioDataAccess.Insertar(iMunicipio);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Municipios
        /// </summary>
        /// <param name="uMunicipio"></param>
        /// <returns></returns>
        public static int Actualizar(Municipio uMunicipio)
        {
            return MunicipioDataAccess.Actualizar(uMunicipio);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun Municipio por su ID
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            return MunicipioDataAccess.Borrar(dID);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los regsitros de Municipios
        /// </summary>
        /// <returns></returns>
        public static List<Municipio> ObtenerMunicipios()
        {
            //1. Obtener lista de Municipios
            List<Municipio> lMunicipio = MunicipioDataAccess.ObtenerMunicipios();

            //2. Asignar a cada municipio su correspondiente estado
            foreach (Municipio sd in lMunicipio)
                sd.REstado = EstadoBusiness.ObtenerEstadoPorID(sd.Estado);

            //3. Regresar la lista con los objetos completos
            return lMunicipio;
        }

        /// <summary>
        /// Obtener un registro de Municipio por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static Municipio ObtenerMunicipioPorID(string strID)
        {
            return MunicipioDataAccess.ObtenerMunicipioPorID(strID);
        }

        /// <summary>
        /// Obtener todos los municipios por estado
        /// </summary>
        /// <param name="strEstado"></param>
        /// <returns></returns>
        public static List<Municipio> ObtenerMunicipiosPorEstado(string strEstado)
        {
            return MunicipioDataAccess.ObtenerMunicipiosPorEstado(strEstado);
        }

        #endregion
    }
}
