using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de RevisionD
    /// </summary>
    public class RevisionDBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de RevisionesD
        /// </summary>
        /// <param name="iRevisionD"></param>
        public static int Insertar(RevisionD iRevisionD)
        {
            return RevisionDDataAccess.Insertar(iRevisionD);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de RevisionesD
        /// </summary>
        /// <param name="uRevisionD"></param>
        /// <returns></returns>
        public static int Actualizar(RevisionD uRevisionD)
        {
            return RevisionDDataAccess.Actualizar(uRevisionD);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar RevisionD por su Revision
        /// </summary>
        /// <param name="iRevision"></param>
        public static int BorrarPorRevision(int iRevision)
        {
            return RevisionDDataAccess.BorrarPorRevision(iRevision);
        }

        /// <summary>
        /// Método que borrar alguna RevisionD por su Revision y Renglon
        /// </summary>
        /// <param name="iRevision"></param>
        /// /// <param name="sRenglon"></param>
        public static int Borrar(int iRevision, short sRenglon)
        {
            return RevisionDDataAccess.Borrar(iRevision, sRenglon);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los regsitros de RevisionesD
        /// </summary>
        /// <returns></returns>
        public static List<RevisionD> ObtenerRevisionesD()
        {
            //1. Asignar todas las revisiones
            List<RevisionD> lRevisionD = RevisionDDataAccess.ObtenerRevisionesD();

            return lRevisionD;
        }

        /// <summary>
        /// Obtener un registro de RevisionD por su ID
        /// </summary>
        /// <param name="lID"></param>
        /// <returns></returns>
        public static RevisionD ObtenerRevisionDPorID(long lID)
        {
            return RevisionDDataAccess.ObtenerRevisionDPorID(lID);
        }

        /// <summary>
        /// Obtener un los registro de RevisionesD por su Revision
        /// </summary>
        /// <param name="bOrden"></param>
        /// <returns></returns>
        public static List<RevisionD> ObtenerRevisionesDPorRevision(int iRevision)
        {
            return RevisionDDataAccess.ObtenerRevisionesDPorRevision(iRevision);
        }

        #endregion
    }
}
