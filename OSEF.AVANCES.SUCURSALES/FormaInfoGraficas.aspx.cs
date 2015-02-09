using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class FormaInfoGraficas : System.Web.UI.Page
    {
    
        public List<object> Data
        {
            get
            {
                return new List<object> 
            { 
                new {Year = 2005, Comedy = 34000000, Action = 23890000, Drama = 18450000, Thriller = 20060000},
                new {Year = 2006, Comedy = 56703000, Action = 38900000, Drama = 12650000, Thriller = 21000000},
                new {Year = 2007, Comedy = 42100000, Action = 50410000, Drama = 25780000, Thriller = 23040000},
                new {Year = 2008, Comedy = 38910000, Action = 56070000, Drama = 24810000, Thriller = 26940000}
            };
            }
        }

        private List<object> GenerateData()
        {
            List<object> data = new List<object>();
            Random random = new Random();
            double p = (random.NextDouble() * 11) + 1;
            DateTime date = DateTime.Today;

            for (int i = 0; i < 15; i++)
            {
                data.Add(new
                {
                    Date = date.AddDays(i),
                    Data1 = Math.Round(random.NextDouble() * 10),
                    Data2 = Math.Round(random.NextDouble() * 100)
                });
            }

            return data;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!X.IsAjaxRequest)
            {
                this.Chart2.GetStore().DataSource = this.GenerateData();
            }
        }

        protected void ReloadData(object sender, DirectEventArgs e)
        {
            Store store = this.Chart2.GetStore();

            store.DataSource = GenerateData();
            store.DataBind();
        }


    }
}