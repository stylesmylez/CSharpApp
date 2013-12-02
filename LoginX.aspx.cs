using System;
using System.Collections;
using System.Configuration;
using System.Data;
//using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
//using System.Xml.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class LoginX : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        string username = Login1.UserName;
        string pwd = Login1.Password;

        string strConn;
        strConn = ConfigurationManager.ConnectionStrings
            ["REALTIMEConnectionString"].ConnectionString;
        SqlConnection Conn = new SqlConnection(strConn);
        Conn.Open();

        //string sqlUserName;
        //sqlUserName = "SELECT UserName,Password FROM UserName ";
        //sqlUserName += " WHERE (UserName ='" + username + "')";
        //sqlUserName += " AND (Password ='" + pwd + "')";
        //SqlCommand com = new SqlCommand(sqlUserName, Conn);
        SqlCommand com = new SqlCommand("QLogCheck", Conn);
                   com.CommandType = CommandType.StoredProcedure;
                         com.Parameters.AddWithValue
                            ("@username", username);
                         com.Parameters.AddWithValue
                            ("@Password", pwd);

        object CurrentName;
        CurrentName = (object)com.ExecuteScalar();
        if (CurrentName != null)
        {                  
            Session["UserAuthentication"] = username;
            Session.Timeout = 1;
            Response.Redirect("Locationxy.aspx?Usernamex=" +username);
        }
        else
        {
            Session["UserAuthentication"] = "";
        }
    }

 }
