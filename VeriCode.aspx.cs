using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VeriCode : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ExpiresAbsolute = DateTime.Now.AddMonths(-1);
        string idx = Request.QueryString["id"];
        tbid.Text = idx; 
        SqlDataSource1.SelectCommandType
                   = SqlDataSourceCommandType.StoredProcedure;
        SqlDataSource1.SelectCommand = "VerificationCode";
    }
    protected void btnv_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommandType
                  = SqlDataSourceCommandType.StoredProcedure;
        SqlDataSource1.SelectCommand = "VerificationCode";
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoginX.aspx");
    }
}