using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using REALTIMEModel;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        REALTIMEModel.Zone columns = new Zone();
        columns.Zonex = TextBox1.Text;

        REALTIMEEntities Ets = new REALTIMEEntities();
        Ets.Zones.AddObject(columns);
        Ets.SaveChanges();
    }
}