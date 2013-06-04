using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace myStreet
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string script = "map = new OpenLayers.Map(\"myStreetMap\");map.addLayer(new OpenLayers.Layer.OSM());map.zoomToMaxExtent();";

            Page.ClientScript.RegisterClientScriptInclude("selective", ResolveUrl(@"Scripts\OpenLayers.js"));
            if (!Master.Page.ClientScript.IsStartupScriptRegistered("myStreetMapScript"))
            {
                Master.Page.ClientScript.RegisterStartupScript
                    (this.GetType(), "myStreetMapScript", script, true);
            }
        }

        protected void getCoordinates()
        {

        }
    }
}
