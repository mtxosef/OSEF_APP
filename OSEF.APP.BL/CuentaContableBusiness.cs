using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de CuentasContables
    /// </summary>
    public class CuentaContableBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de CuentasContables
        /// </summary>
        /// <param name="iCuentaContable"></param>
        public static int Insertar(CuentaContable iCuentaContable)
        {
            return CuentaContableDataAccess.Insertar(iCuentaContable);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de CuentasContables
        /// </summary>
        /// <param name="uCuentaContable"></param>
        /// <returns></returns>
        public static int Actualizar(CuentaContable uCuentaContable)
        {
            return CuentaContableDataAccess.Actualizar(uCuentaContable);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar alguna Cuenta Contable por su Cuenta
        /// </summary>
        /// <param name="dCuenta"></param>
        public static int Borrar(string dCuenta)
        {
            return CuentaContableDataAccess.Borrar(dCuenta);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los registros de CuentasContables
        /// </summary>
        /// <returns></returns>
        public static List<CuentaContable> ObtenerCuentasContables()
        {
            return CuentaContableDataAccess.ObtenerCuentasContables();
        }

        /// <summary>
        /// Obtener un registro de Cuenta Contable por su Cuenta
        /// </summary>
        /// <param name="strCuenta"></param>
        /// <returns></returns>
        public static CuentaContable ObtenerCuentaContablePorCuenta(string strCuenta)
        {
            return CuentaContableDataAccess.ObtenerCuentaContablePorCuenta(strCuenta);
        }

        /// <summary>
        /// Método que obtiene todos los registros de CuentasContables por Rama
        /// </summary>
        /// <returns></returns>
        public static List<CuentaContable> ObtenerCuentaContablePorRama(string strRama)
        {
            return CuentaContableDataAccess.ObtenerCuentaContablePorRama(strRama);
        }

        #endregion
    }
}
