using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Reflection;

namespace OSEF.LIBRARY.COMMON.Generics
{
    public class LibraryGenerics<T>
    {
        public static List<T> ConvertDataSetToList(IDataReader data)
        {
            List<T> lista = new List<T>();
            try
            {
                if (data != null)
                {
                    while (data.Read())
                    {
                        T itemClass = ConvertReaderToObject(data);

                        lista.Add(itemClass);
                    }
                }
            }
            finally
            {
                data.Close();
            }
            return lista;
        }

        public static T ConvertReaderToObject(IDataReader data)
        {
            T itemClass = (T)Activator.CreateInstance(typeof(T));
            PropertyInfo[] properties = itemClass.GetType().GetProperties((Recursos.flags));

            for (int i = 0; i < data.FieldCount; i++)
            {
                string currentName = data.GetName(i);
                PropertyInfo currentProperty = properties.FirstOrDefault(
                    x => currentName.ToLower().Equals(x.Name.ToLower()));

                if (currentProperty != null)
                {
                    if (data[currentName] != null && !System.DBNull.Value.Equals(data[currentName]))
                        currentProperty.SetValue(itemClass, data[currentName], null);
                }
            }
            return itemClass;
        }
    }
}
