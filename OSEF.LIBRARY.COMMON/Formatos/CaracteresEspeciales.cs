using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.LIBRARY.COMMON.Formatos
{
    /// <summary>
    /// Clase que da formato a varias situaciones
    /// </summary>
    public class CaracteresEspeciales
    {
        /// <summary>
        /// Método que da formato a los caracteres de retorno de carro y salto de línea
        /// </summary>
        /// <param name="strNotas"></param>
        /// <returns></returns>
        public static string FormatoCaracteresEspeciales(string strNotas)
        {
            string strTemp;

            //1. Remplazar comillas sensillas, dobles y saltos de línea
            strTemp = strNotas.Replace("'", @"\'");
            strTemp = strTemp.Replace("\"", "\"");
            strTemp = strTemp.Replace("\r\r\n", @"\r\n");
            strTemp = strTemp.Replace("\r\n", @"\r\n");

            //2. Regresar cadena
            return strTemp;
        }
    }
}
