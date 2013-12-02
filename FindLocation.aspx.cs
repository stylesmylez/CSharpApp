using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class FindLocation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ExpiresAbsolute = DateTime.Now.AddMonths(-1);
        string Usernamex = Request.QueryString["Usernamex"];
        string Idx = Request.QueryString["RoleId"];
        int IDi =Convert.ToInt32(Idx);
        if (IDi != 2)
        {
            Response.Redirect
          ("LoginX.aspx");
        }
            //Session["username"] = lbusername.Text;
        lbusername.Text = Usernamex;
        lbv.Text = Idx;
        if (lbusername.Text == "Label")
        {
            Response.Redirect
          ("LoginX.aspx");
        }
        if (!IsPostBack)
        {
            //You must specify Google Map API Key for this component. You can obtain this key from http://code.google.com/apis/maps/signup.html
            //For samples to run properly, set GoogleAPIKey in Web.Config file.
            GoogleMapForASPNet1.GoogleMapObject.APIKey = ConfigurationManager.AppSettings["GoogleAPIKey"];

            //Specify width and height for map. You can specify either in pixels or in percentage relative to it's container.
            GoogleMapForASPNet1.GoogleMapObject.Width = "1000px"; // You can also specify percentage(e.g. 80%) here
            GoogleMapForASPNet1.GoogleMapObject.Height = "600px";

            //Specify initial Zoom level.
            GoogleMapForASPNet1.GoogleMapObject.ZoomLevel = 8;

            //Specify Center Point for map. Map will be centered on this point.
            GoogleMapForASPNet1.GoogleMapObject.CenterPoint = new GooglePoint("1", 18.182400, -76.999999);

            //Add pushpins for map.
            //This should be done with intialization of GooglePoint class. 
            //ID is to identify a pushpin. It must be unique for each pin. Type is string.
            //Other properties latitude and longitude.
            
            //GooglePoint GP1 = new GooglePoint();
            //GP1.ID = "GP1";
            //GP1.Latitude = 43.65669;
            //GP1.Longitude = -79.44268;
            //GP1.InfoHTML = "This is point 1";
            //GoogleMapForASPNet1.GoogleMapObject.Points.Add(GP1);

            //GooglePoint GP2 = new GooglePoint();
            //GP2.ID = "GP2";
            //GP2.Latitude = 43.66619;
            //GP2.Longitude = -79.44268;
            //GP2.InfoHTML = "This is point 2";
            //GoogleMapForASPNet1.GoogleMapObject.Points.Add(GP2);


            //GooglePoint GP3 = new GooglePoint();
            //GP3.ID = "GP3";
            //GP3.Latitude = 43.67689;
            //GP3.Longitude = -79.43270;
            //GP3.InfoHTML = "This is point 3";
            //GoogleMapForASPNet1.GoogleMapObject.Points.Add(GP3);



            //Create Polylines between points GP1, GP2 and GP3.
            //GooglePolyline PL1 = new GooglePolyline();
            //PL1.ID = "PL1";
            ////Give Hex code for line color
            //PL1.ColorCode = "#0000FF";
            ////Specify width for line
            //PL1.Width = 5;

            ////PL1.Points.Add(GP1);
            ////PL1.Points.Add(GP2);
            ////PL1.Points.Add(GP3);

            ////Add polyline to GoogleMap object
            //GoogleMapForASPNet1.GoogleMapObject.Polylines.Add(PL1);
        }
    }


    protected void imbGo_Click(object sender, ImageClickEventArgs e)
    {

        if (TextBox3.Text == "")
        {
            tbStatus.Text = "Verification code cannot be blank";
            return;
        }
        String connectionString =
            WebConfigurationManager.ConnectionStrings
            ["REALTIMEConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand("LocateMonitor", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add parameters
        cmd.Parameters.AddWithValue("@Apprveid", TextBox3.Text);

        using (con)
        {
            con.Open();
            SqlDataReader result = cmd.ExecuteReader();
            if (result.Read())
                tblat.Text = String.Format("{0}",
                    Convert.ToString(result["Latitude"]));

            tblon.Text = String.Format("{0}",
            Convert.ToString(result["Longitude"]));

            tbMonitor.Text = String.Format("{0}",
            Convert.ToString(result["ZonalMonitor"]));

            tbTime.Text = String.Format("{0}",
            Convert.ToString(result["TimeDateApproved"]));

            tbZone.Text = String.Format("{0}",
            Convert.ToString(result["Zone"]));

            tbTruck.Text = String.Format("{0}",
            Convert.ToString(result["TruckId"]));
        }
        tbStatus.Text = "";
        //LoadLocation.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
        //LoadLocation.SelectCommand = "VerificationReport";
    
    }
    protected void btnGo_Click(object sender, EventArgs e)
    {

    }
    protected void imbloc_Click(object sender, ImageClickEventArgs e)
    {
        if (TextBox3.Text == "")
        {
            tbStatus.Text = "Verification code cannot be blank";
            return;
        }

        double XLatitude = Convert.ToDouble(tblat.Text);
        double XLongitude = Convert.ToDouble(tblon.Text);
        GooglePoint Routex = new GooglePoint();
        Routex.ID = "Routex";
        Routex.Latitude = XLatitude;
        Routex.Longitude = XLongitude;
        Routex.InfoHTML = tbMonitor.Text + " Found";
        GoogleMapForASPNet1.GoogleMapObject.Points.Add(Routex);
        tbStatus.Text = "";
        //GoogleMapForASPNet1.GoogleMapObject.Polylines["PL1"].Points.Add(Routex);
    }
    protected void imbref_Click(object sender, ImageClickEventArgs e)
    {
        int IDi = Convert.ToInt32(lbv.Text);
        Response.Redirect("FindLocation.aspx?Usernamex="
                + lbusername.Text + "&RoleId=" + IDi);
    }
    protected void imbbk_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Locationxy.aspx?Usernamex=" + lbusername.Text);
    }
    protected void imbout_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("LoginX.aspx");
    }
}
