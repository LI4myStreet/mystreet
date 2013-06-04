using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using myStreet.HttpUtils;

namespace myStreet.Account
{
    public partial class Register : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterUser.ContinueDestinationPageUrl = Request.QueryString["ReturnUrl"];
        }

        protected void RegisterUser_CreatedUser(object sender, EventArgs e)
        {
            FormsAuthentication.SetAuthCookie(RegisterUser.UserName, false /* createPersistentCookie */);

            string continueUrl = RegisterUser.ContinueDestinationPageUrl;
            if (String.IsNullOrEmpty(continueUrl))
            {
                continueUrl = "~/";
            }
            Response.Redirect(continueUrl);
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            Models.Utilizador usr = new Models.Utilizador();
            usr.Id = -1;
            usr.Morada="Morada de teste";
            usr.Nome="Nome Teste";
            usr.Password= "123456";
            usr.Tipo= "N";
            usr.Username= "teste";

            string endPoint = @"https://localhost:44300/api/utilizadores";
            var serUsr = HttpUtils.Serialization.Serialize(usr);
            serUsr = serUsr.Replace("myStreet.Models","REST.Models");
            var client = new RestClient(endPoint, HttpVerb.POST, serUsr);
            string json = client.MakeRequest();
            
            json = json.Replace("REST.Models", "myStreet.Models");

            FormsAuthentication.SetAuthCookie(usr.Username, false /* createPersistentCookie */);

            string continueUrl = RegisterUser.ContinueDestinationPageUrl;
            if (String.IsNullOrEmpty(continueUrl))
            {
                continueUrl = "~/";
            }
            Response.Redirect(continueUrl);
        }

    }
}
