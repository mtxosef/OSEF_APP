using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de Usuarios
    /// </summary>
    public class UsuarioBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Usuarios
        /// </summary>
        /// <param name="iUsuario"></param>
        public static int Insertar(Usuario iUsuario)
        {
            return UsuarioDataAccess.Insertar(iUsuario);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Usuarios
        /// </summary>
        /// <param name="uUsuario"></param>
        /// <returns></returns>
        public static int Actualizar(Usuario uUsuario)
        {
            return UsuarioDataAccess.Actualizar(uUsuario);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar alguna Usuario por su ID
        /// </summary>
        /// <param name="strID"></param>
        public static int Borrar(string strID)
        {
            return UsuarioDataAccess.Borrar(strID);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los regsitros de Usuarios
        /// </summary>
        /// <returns></returns>
        public static List<Usuario> ObtenerUsuarios()
        {
            return UsuarioDataAccess.ObtenerUsuarios();
        }

        /// <summary>
        /// Obtener un registro de Usuario por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static Usuario ObtenerUsuarioPorID(string strID)
        {
            return UsuarioDataAccess.ObtenerUsuarioPorID(strID);
        }

        /// <summary>
        /// Obtener un registro de Usuario por su Correo
        /// </summary>
        /// <param name="strCorreo"></param>
        /// <returns></returns>
        public static Usuario ObtenerUsuarioPorCorreo(string strCorreo)
        {
            return UsuarioDataAccess.ObtenerUsuarioPorCorreo(strCorreo);
        }

        #endregion

        #region Acción

        /// <summary>
        /// Método que valida el usuario y la contraseña para hacer login
        /// </summary>
        /// <param name="strUsuario"></param>
        /// <param name="strContrasena"></param>
        /// <returns></returns>
        public static bool ValidarUsuarioContrasena(string strUsuario, string strContrasena)
        {
            return UsuarioDataAccess.ValidarUsuarioContrasena(strUsuario, strContrasena);
        }

        #endregion
    }
}
