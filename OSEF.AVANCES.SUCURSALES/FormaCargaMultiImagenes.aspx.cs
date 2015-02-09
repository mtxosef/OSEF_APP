using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class FormaCargaMultiImagenes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void MultiUpload1_FileUpload(object sender, FileUploadEventArgs e)
        {
            X.Msg.Notify("File is uploaded", "Name: " + e.FileName).Show();
        }
    }
}