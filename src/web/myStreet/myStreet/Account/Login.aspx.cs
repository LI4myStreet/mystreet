using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime.Serialization;
using System.Net;
using System.IO;

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
                username = Request.Form["UserName"].ToString();
                pass = Request.Form["Password"].ToString();

                WebClient proxy = new WebClient();
                byte[] abc = proxy.DownloadData((new Uri("http://localhost:4567/Service1.svc/GetData")));
                Stream strm = new MemoryStream(abc);
                DataContractSerializer obj = new DataContractSerializer(typeof(string));
                content = obj.ReadObject(strm).ToString();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message.ToString() + "');</script>");
            }

        }
    }
}
