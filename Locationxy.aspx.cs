using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System;
using System.Text;
using System.Net;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
//using System.Web.UI;

public partial class Locationxy : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ExpiresAbsolute = DateTime.Now.AddMonths(-1);
        string Usernamex = Request.QueryString["Usernamex"];
        Session["username"] = lbusername.Text;
        lbusername.Text = Usernamex;
        if (lbusername.Text == "")
        {
            Response.Redirect
          ("LoginX.aspx");
        }
        SQLUserId.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
        SQLUserId.SelectCommand = "Xwxeb";
        VerificationCode.SelectCommandType
            = SqlDataSourceCommandType.StoredProcedure;
        VerificationCode.SelectCommand = "VerificationCode";
        
        //
       
    }
    private void LoadZ()
        {
        //tbUserid.Text = dpUserId.SelectedValue;
        SqlZnes.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
        SqlZnes.SelectCommand = "SelUserZones";
        }

    
    protected void imbVerify_Click(object sender, ImageClickEventArgs e)
    {
        lbSuccess.Text = "";
        lbError.Text = "";
        if (tbLatitude.Text == "")
        {
            lbError.Text = 
                "Location Not Detected!, Loation Is Needed For The Verification Process!!";
            return;
        } 
        if (drZones.Text == "")
        {
            lbError.Text="No Zone Selected!";
            return;
        }
        if (tbTruck.Text == "")
        {
            lbError.Text = "Cannot verify without truck!";
            return;
        }
        imbVerify.Attributes.Add
            ("onclick", "return confirm"+
            "('Are you sure you want to verify this truck?');");
                 lbError.Text ="";
                 string strConn;
                 strConn = ConfigurationManager.ConnectionStrings
                     ["REALTIMEConnectionString"].ConnectionString;
                 SqlConnection Conn = new SqlConnection(strConn);
                 //Conn.Open();

                 //string sqlUserName;
                 //sqlUserName = "SELECT UserName,Password FROM UserName ";
                 //sqlUserName += " WHERE (UserName ='" + username + "')";
                 //sqlUserName += " AND (Password ='" + pwd + "')";
                 //SqlCommand com = new SqlCommand(sqlUserName, Conn);
                 SqlCommand com = new SqlCommand("XXLatLon", Conn);
                 com.CommandType = CommandType.StoredProcedure;

                 com.Parameters.AddWithValue
                    ("@TruckId", tbTruck.Text);
                 com.Parameters.AddWithValue
                    ("@Zone", drZones.Text);
                 com.Parameters.AddWithValue
                    ("@ZonalMonitor", lbusername.Text);
                 com.Parameters.AddWithValue
                    ("@Latitude", tbLatitude.Text);
                 com.Parameters.AddWithValue
                    ("@Longitude", tbLongitude.Text);
                 com.Parameters.AddWithValue
                    ("@ZonalMonitorId", dpUserId.Text);
                 com.Parameters.AddWithValue
                    ("@Comments", tbcomments.Text);

                 Conn.Open();
                 com.ExecuteNonQuery();
                 Conn.Close();

                 lbSuccess.Text = "Truck Verified";
        //tbUserid.Text = dpUserId.SelectedValue;
    
    }
    protected void imbVCodes_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("VeriCode.aspx?id=" + dpUserId.Text);
    }
    protected void imbLoc_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect
            ("FindLocation.aspx?Usernamex="
                + lbusername.Text + "&RoleId=" + dpRoleId.Text);
    }
    protected void imbVLog_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("LoginX.aspx");
    }
    protected void imbVRef_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Locationxy.aspx?Usernamex=" + lbusername.Text);
    }
    protected void imbVmz_Click(object sender, ImageClickEventArgs e)
    {
        lbSuccess.Text = "";
        lbError.Text = "";
        SqlZnes.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
        SqlZnes.SelectCommand = "SelUserZones";
    }
}
