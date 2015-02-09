using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.INTELISIS.EL;
using OSEF.INTELISIS.DL;

namespace OSEF.INTELISIS.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de Agente
    /// </summary>
    public class AgenteBusiness
    {
        #region Consultar

        /// <summary>
        /// Método que obtiene todos los regsitros de Agente
        /// </summary>
        /// <returns></returns>
        public static List<Agente> ObtenerAgentes()
        {
            return AgenteDataAccess.ObtenerAgentes();
        }

        #endregion
    }
}
