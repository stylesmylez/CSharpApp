using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        BadNews.Visible = false;
        SQLDs.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
        SQLDs.SelectCommand = "QLogGetUserDetails";
        //SQLDs.Select();      
    }
    protected void btnCon_Click(object sender, EventArgs e)
    {
        if (dpUsername.Text == "")
        {
            BadNews.Visible = true;
            BadNews.Text = "Validation falied!, "+
            "please re-validate.";
            return;
        }
        string Usernamex = dpUsername.Text;
        string UserIdx = dpUserId.Text;
        string CompanyIdx = dpCompanyId.Text;
        string VLabelSMBx = dpVLabelSMB.Text;
        string BelongTox = dpBelongTo.Text;
        Response.Redirect
            ("Dispatch.aspx?Usernamex=" + Usernamex
                + "&UserIdx=" + UserIdx
                + "&CompanyIdx=" + CompanyIdx
                + "&VLabelSMBx=" + VLabelSMBx
                + "&BelongTox=" + BelongTox);
    }
}