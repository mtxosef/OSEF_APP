using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de Revision
    /// </summary>
    public class Revision
    {
        #region Campos

        int id;
        string mov;
        string movid;
        string origen;
        string origenid;
        short semana;
        string sucursal;
        DateTime fechaemision;
        Nullable<DateTime> fecharevision;
        string observaciones;
        string comentarios;
        string estatus;

        Sucursal rsucursal;
        List<RevisionD> rrevisiond;

        decimal programado;
        decimal real;

        #endregion

        #region Propiedades

        public int ID
        {
            get { return id; }
            set { id = value; }
        }

        public string Mov
        {
            get { return mov; }
            set { mov = value; }
        }

        public string MovID
        {
            get { return movid; }
            set { movid = value; }
        }

        public string Origen
        {
            get { return origen; }
            set { origen = value; }
        }

        public string OrigenID
        {
            get { return origenid; }
            set { origenid = value; }
        }

        public short Semana
        {
            get { return semana; }
            set { semana = value; }
        }

        public string Sucursal
        {
            get { return sucursal; }
            set { sucursal = value; }
        }

        public DateTime FechaEmision
        {
            get { return fechaemision; }
            set { fechaemision = value; }
        }

        public Nullable<DateTime> FechaRevision
        {
            get { return fecharevision; }
            set { fecharevision = value; }
        }

        public string Observaciones
        {
            get { return observaciones; }
            set { observaciones = value; }
        }

        public string Comentarios
        {
            get { return comentarios; }
            set { comentarios = value; }
        }

        public string Estatus
        {
            get { return estatus; }
            set { estatus = value; }
        }

        public Sucursal RSucursal
        {
            get { return rsucursal; }
            set { rsucursal = value; }
        }

        public List<RevisionD> RRevisionD
        {
            get { return rrevisiond; }
            set { rrevisiond = value; }
        }

        public decimal Programado
        {
            get { return programado; }
            set { programado = value; }
        }

        public decimal Real
        {
            get { return real; }
            set { real = value; }
        }

        #endregion
    }
}
