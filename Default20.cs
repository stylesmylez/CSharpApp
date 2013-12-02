using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Text;
using System.Net;
using System.Web.UI;

public partial class Default20 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
       // string latitude = hfLat.Value;
        //string longitude = hfLon.Value;
    
        //Save to database here
    }

    protected void btnSave_Click1(object sender, System.EventArgs e)
    {

    }
}



namespace GoogleGeocoder
{
   public interface ISpatialCoordinate
   {
      decimal Latitude {get; set; }
      decimal Longitude {get; set; }
   }
   public struct Coordinate : ISpatialCoordinate
   {
      private decimal _latitude;
      private decimal _longitude;

      public Coordinate(decimal latitude, decimal longitude)
      {
         _latitude = latitude;
         _longitude = longitude;
      }

      #region ISpatialCoordinate Members

      public decimal Latitude
      {
        get
        {
            return _latitude;
        }
        set
        {
            this._latitude = value;
        }
      }

      public decimal Longitude
      {
        get
        {
            return _longitude;
        }
        set
        {
            this._longitude = value;
        }
      }

   #endregion
   }

   public class Geocode
   {
      private const string _googleUri = "http://maps.google.com/maps/geo?q=";
      private const string _googleKey = "ABQIAAAAAbmewSRic45gmeA3SqPU2xTN7OoKn4WqNHLTV0WVkMCPFkG3kxRiF6l_Jlmlap7r6S592BJ_XDSJtg";
      private const string _outputType = "csv"; // Available options: csv, xml, kml, json

      private static Uri GetGeocodeUri(string address)
      {
         address = HttpUtility.UrlEncode(address);
         return new Uri(String.Format("{0}{1}&output={2}&key={3}", _googleUri, address, _outputType, _googleKey));
      }
      public static Coordinate GetCoordinates(string address)
      {
         WebClient client = new WebClient();
         Uri uri = GetGeocodeUri(address);
         string[] geocodeInfo = client.DownloadString(uri).Split(',');
         return new Coordinate(Convert.ToDecimal(geocodeInfo[2]), Convert.ToDecimal(geocodeInfo[3]));
      }

   }
}