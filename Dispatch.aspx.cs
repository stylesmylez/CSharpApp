using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
////using REALTIMEModel;

public partial class Dispatch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ExpiresAbsolute = DateTime.Now.AddMonths(-1);
        lbStatus.Visible = false;
        string Usernamex = Request.QueryString["Usernamex"];
        string UserIdx = Request.QueryString["UserIdx"];
        string CompanyIdx = Request.QueryString["CompanyIdx"];
        string VLabelSMBx = Request.QueryString["VLabelSMBx"];
        string BelongTox = Request.QueryString["BelongTox"];
        lbUsername.Text = Usernamex;
        lbUsernamex.Text = Usernamex;
        lbUserId.Text = UserIdx;
        lbCompanyId.Text = CompanyIdx;
        lbVLabelSMB.Text = VLabelSMBx;
        lbBelongTo.Text = BelongTox;
        if (lbBelongTo.Text == "3")
        {
            Response.Redirect
           ("Riverton.aspx?Usernamex=" + Usernamex
               + "&UserIdx=" + UserIdx
               + "&CompanyIdx=" + CompanyIdx
               + "&VLabelSMBx=" + VLabelSMBx
               + "&BelongTox=" + BelongTox);
        }

        if (lbUserId.Text == "")
        {
            Response.Redirect
          ("Default.aspx");
        }
        if (lbUsername.Text == "")
        {
            Response.Redirect
          ("Default.aspx");
        }
        if (lbCompanyId.Text == "")
        {
            Response.Redirect
          ("Default.aspx");
        }
        if (lbBelongTo.Text == "")
        {
            Response.Redirect
          ("Default.aspx");
        }
    }
    protected void aDDlINE_Click(object sender, EventArgs e)
    {

        if (lbUserId.Text == "")
        {
            return;
        }
        if (lbCompanyId.Text == "")
        {
            return;
        }
        if (lbBelongTo.Text == "")
        {
            return;
        }

        if (TextBox1.Text == "")
        {
            Label1.Visible = true;
            return;
        } 
        if (tbTruckId5.Text == "")
        {
            lbTruckId5.Visible = true;
            return;
        } 
        if (tbTime.Text == "")
        {
            lbTime.Visible = true;
            return;
        }
        if (tbZonalMonitor.Text == "")
        {
            lbZoneMan.Visible = true;
            return;
        }
        if (tbTruckType.Text == "")
        {
            lbTruckType.Visible = true;
            return;
        }
        Label1.Visible = false;
        lbTruckId5.Visible = false;
        lbTime.Visible = false;
        tbCreatedOn.Visible = false;
        lbTruckType.Visible = false;
        lbZoneMan.Visible = false;

        /*REALTIMEModel.MPMLineRecord columns = new MPMLineRecord();
        
            columns.TruckId         = tbTruckId5.Text;        
            columns.TruckType       = tbTruckType.SelectedItem.ToString();        
            columns.Driver          = tbDriver.SelectedItem.ToString();        
            columns.Time            = tbTime.Text;        
            columns.Work            = tbWork.SelectedItem.ToString();        
            columns.Zone            = tbZone.SelectedItem.ToString();        
            columns.ZonalMonitor    = tbZonalMonitor.SelectedItem.ToString();
            columns.Sidemen         = Convert.ToInt32(tbSidemen.Text);        
            columns.CreatedOn       = tbCreatedOn.SelectedDate.ToString
                                        ("yyyy/MM/dd"); 
            columns.UserId          = Convert.ToInt32(lbUserId.Text);        
            columns.Ticket          = tbTicket.Text;        
            columns.CollectedBy     = tbCollect.Text;        
            columns.CollectedId     = Convert.ToInt32(tbCollectId.Text);        
            columns.TallyClerk      = tbTallyClerk.Text;        
            columns.CompanyId       = Convert.ToInt32(lbCompanyId.Text);

        REALTIMEEntities Ets = new REALTIMEEntities();
        Ets.MPMLineRecords.AddObject(columns);
        Ets.SaveChanges();

        tbTruckId5.Text = "";
        tbTime.Text = "";
        tbSidemen.Text = "";
        TextBox1.Text = "";
        lbStatus.Visible = true;
        lbStatus.Text = "Entry posted successfully!";
         */
        ///*
        String stylesmylezString = ConfigurationManager.ConnectionStrings
            ["REALTIMEConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection 
            stylesmylezCon = new System.Data.SqlClient.SqlConnection
                (stylesmylezString);

        System.Data.SqlClient.SqlCommand szCmd = new 
            System.Data.SqlClient.SqlCommand();
        
        szCmd.Connection = stylesmylezCon;
        szCmd = new SqlCommand
            ("InsertMPMLineRecord",stylesmylezCon);
        szCmd.CommandType = CommandType.StoredProcedure;        
       
        szCmd.Parameters.AddWithValue
            ("@TruckId", tbTruckId5.Text);
        szCmd.Parameters.AddWithValue
            ("@TruckType", tbTruckType.SelectedItem.ToString());
        szCmd.Parameters.AddWithValue
            ("@Driver", tbDriver.SelectedItem.ToString());
        szCmd.Parameters.AddWithValue
            ("@Time", tbTime.Text);
        szCmd.Parameters.AddWithValue
            ("@Work", tbWork.SelectedItem.ToString());
        szCmd.Parameters.AddWithValue
            ("@Zone", tbZone.SelectedItem.ToString());
        szCmd.Parameters.AddWithValue
            ("@ZonalMonitor", tbZonalMonitor.SelectedItem.ToString());
        szCmd.Parameters.AddWithValue
            ("@Sidemen", tbSidemen.Text);
        szCmd.Parameters.AddWithValue
            ("@CreatedOn", tbCreatedOn.SelectedDate.ToString
            ("yyyy/MM/dd"));
        szCmd.Parameters.AddWithValue
            ("@UserId", lbUserId.Text);
        szCmd.Parameters.AddWithValue
            ("@Ticket", tbTicket.Text);
        szCmd.Parameters.AddWithValue
            ("@CollectedBy", tbCollect.Text);
        szCmd.Parameters.AddWithValue
            ("@CollectedId", tbCollectId.Text);
        szCmd.Parameters.AddWithValue
            ("@TallyClerk", tbTallyClerk.Text);
        szCmd.Parameters.AddWithValue
            ("@CompanyId", lbCompanyId.Text);

        stylesmylezCon.Open();
        szCmd.ExecuteNonQuery();
        stylesmylezCon.Close();
        
        tbTruckId5.Text = "";
        tbTime.Text = "";
        tbSidemen.Text = "";
        TextBox1.Text = "";
        lbStatus.Visible = true;
        lbStatus.Text = "Entry posted successfully!";
         //*/
        
    }
    protected void tbCollectedBy_SelectedIndexChanged(object sender, EventArgs e)
    {
       
    }
    protected void tbCreatedOn_SelectionChanged(object sender, EventArgs e)
    {
        TextBox1.Text = tbCreatedOn.SelectedDate.ToString("yyyy/MM/dd");
        tbCreatedOn.Visible = false;
    }
    protected void tbZonalMonitor_SelectedIndexChanged(object sender, EventArgs e)
    {
        tbCreatedOn.Visible = true;
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        tbCreatedOn.Visible = true;
    }
    protected void tbZone_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    protected void btnSel_Click(object sender, EventArgs e)
    {
        tbCollect.Text = tbCollectedBy.SelectedItem.ToString();
        tbCollectId.Text = tbCollectedBy.SelectedValue.ToString();
        SQLTruckType.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
        SQLTruckType.SelectCommand = "MobileSelTruck";
    }
    protected void btnSel1_Click(object sender, EventArgs e)
    {
        tbZoneId.Text = tbZone.SelectedValue.ToString();
        SQLZonalMonitor.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
        SQLZonalMonitor.SelectCommand = "MobileSelZone";
    }
    protected void tbCollectedBy_TextChanged(object sender, EventArgs e)
    {

    }
    protected void btnVerify_Click(object sender, EventArgs e)
    {

    }
}