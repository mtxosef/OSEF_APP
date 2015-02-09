using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de Revision
    /// </summary>
    public class RevisionBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Revisiones
        /// </summary>
        /// <param name="iRevision"></param>
        public static int Insertar(Revision iRevision)
        {
            return RevisionDataAccess.Insertar(iRevision);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Revisiones
        /// </summary>
        /// <param name="uRevision"></param>
        /// <returns></returns>
        public static int Actualizar(Revision uRevision)
        {
            return RevisionDataAccess.Actualizar(uRevision);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar alguna Revision por su ID
        /// </summary>
        /// <param name="iID"></param>
        public static int Borrar(int iID)
        {
            return RevisionDataAccess.Borrar(iID);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los regsitros de Revisiones
        /// </summary>
        /// <returns></returns>
        public static List<Revision> ObtenerRevisiones()
        {
            //1. Obtener las revisiones en una lista
            List<Revision> lRevisiones = RevisionDataAccess.ObtenerRevisiones();

            //2. Complementarlas con sucursal
            foreach (Revision sd in lRevisiones)
                sd.RSucursal = SucursalBusiness.ObtenerSucursalPorID(sd.Sucursal);
            return lRevisiones;
        }

        /// <summary>
        /// Método que obtiene todos los regsitros de Revisiones con su ultima revisión
        /// </summary>
        /// <returns></returns>
        public static List<Revision> ObtenerRevisionesUltimaRevision()
        {
            //1. Obtener las revisiones en una lista
            List<Revision> lRevisiones = RevisionDataAccess.ObtenerRevisionesUltimaRevision();

            //2. Complementarlas con sucursal
            foreach (Revision sd in lRevisiones)
                sd.RSucursal = SucursalBusiness.ObtenerSucursalPorID(sd.Sucursal);
            return lRevisiones;
        }

        /// <summary>
        /// Obtener un registro de Revisiones por su ID
        /// </summary>
        /// <param name="iID"></param>
        /// <returns></returns>
        public static Revision ObtenerRevisionPorID(int iID)
        {
            //1. Inicializar objeto, complementarlo con la Sucursal y RevisionD
            Revision oRevision = RevisionDataAccess.ObtenerRevisionPorID(iID);
            oRevision.RSucursal = SucursalBusiness.ObtenerSucursalPorID(oRevision.Sucursal);
            oRevision.RRevisionD = RevisionDBusiness.ObtenerRevisionesDPorRevision(oRevision.ID);

            return oRevision;
        }

        #endregion

        #region Acciones

        /// <summary>
        /// Método que Afecta un registro de Revisiones
        /// </summary>
        /// <param name="aRevision"></param>
        public static int AfectarRevisionPorID(Revision aRevision)
        {
            return RevisionDataAccess.AfectarRevisionPorID(aRevision);
        }

        /// <summary>
        /// Método que avanza un movimiento de Revisiones
        /// </summary>
        /// <param name="iID"></param>
        /// <param name="strMov"></param>
        /// <returns></returns>
        public static int AvanzarRevisionPorID(int iID, string strMov)
        {
            return RevisionDataAccess.AvanzarRevisionPorID(iID, strMov);
        }

        #endregion
    }
}
