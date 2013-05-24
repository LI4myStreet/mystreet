using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime.Serialization;
using System.Net;
using System.IO;
using myStreet.HttpUtils;
using System.Web.Security;
using System.Xml.Serialization;

namespace myStreet.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string username;
            string pass;
            Models.Utilizador utilizador;

            try
            {
                username = LoginUser.UserName;
                pass = LoginUser.Password;

                string endPoint = @"http://localhost:49903/api/utilizador/";
                var client = new RestClient(endPoint);
                string json = client.MakeRequest("?username=" + username + "&password=" + pass);
                json = json.Replace("REST.Models", "myStreet.Models");

                utilizador = (Models.Utilizador)HttpUtils.Serialization.XmlDeserializeFromString(json, typeof(Models.Utilizador));

                if (utilizador != null)
                {
                    FormsAuthentication.RedirectFromLoginPage(utilizador.Username, LoginUser.RememberMeSet);
                    //Response.Redirect("~/Default.aspx?un=" + LoginUser.UserName.ToString());
                }
            }
            catch (Exception ex)
            {
                //Response.Write("<script>alert('" + ex.Message.ToString() + "');</script>");
            }

        }
    }
}
