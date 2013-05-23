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
            string content;

            try
            {
                username = LoginUser.UserName;
                pass = LoginUser.Password;

                string endPoint = @"http://localhost:49903/api/utilizador/";
                var client = new RestClient(endPoint);
                var json = client.MakeRequest("?username=bmm&password=123456");

                //WebClient proxy = new WebClient();
                //byte[] abc = proxy.DownloadData((new Uri("http://localhost:49903/api/utilizador/?username=bmm&password=123456")));
                //Stream strm = new MemoryStream(abc);
                //DataContractSerializer obj = new DataContractSerializer(typeof(string));
                //content = obj.ReadObject(strm).ToString();

                Response.Redirect("~/Default.aspx?un=" + LoginUser.UserName.ToString());
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message.ToString() + "');</script>");
            }

        }
    }
}
