using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using myStreet.HttpUtils;

namespace myStreet.example
{
    public partial class drag_feature : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmeterOcorrencia(object sender, System.EventArgs e)
        {
            Models.Ocorrencia oc = new Models.Ocorrencia();
            oc.Estado = "Em estudo";
            oc.Coordenadas = coordenadas.Value ;
            oc.Descricao = descricao.Value;
            oc.Id= -1;
            oc.LocalidadeID = 1;
            oc.Morada = morada.Value;
            if (Models.Global.CurrentUser == null)
            {
                oc.UtilizadorID = 1;
            }
            else
            {
                oc.UtilizadorID = Models.Global.CurrentUser.Id;
            }

            string endPoint = @"http://localhost:49903/api/ocorrencias";
            var serUsr = oc.ToJSON();
            serUsr = serUsr.Replace(@"\",@"");
            var client = new RestClient(endPoint, HttpVerb.POST, serUsr,"json");
            string json = client.MakeRequest();
        }
    }
}