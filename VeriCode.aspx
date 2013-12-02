<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VeriCode.aspx.cs" Inherits="VeriCode" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Verification Code</title>
	<style type="text/css">
.style1 {
	background-image: url('VeriTruck.png');
}
        .style2
        {
            height: 19px;
            width: 195px;
        }
    .style3 {
	text-align: center;
	color: #FFFF00;
}
    .style4 {
	color: #FFFF00;
}
.style5 {
	height: 19px;
	width: 195px;
	color: #FFFF00;
}
    </style>
<script type = "text/javascript" >
    function changeHashOnLoad() {
        window.location.href += "#";
        setTimeout("changeHashAgain()", "50");
    }

    function changeHashAgain() {
        window.location.href += "1";
    }

    var storedHash = window.location.hash;
    window.setInterval(function () {
        if (window.location.hash != storedHash) {
            window.location.hash = storedHash;
        }
    }, 50);


</script>
</head>
<body onload="changeHashOnLoad();">
<table align="center" class="style1" style="width: 563px"><tr>
	<td class="style5" style="width: 100px"> &nbsp;</td>
	<td style="width: 242px; height: 19px" class="style3"> <br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	.......................................................................................</td>
	<td style="width: 107px; height: 19px" class="style4"> &nbsp;</td></tr><tr>
	<td class="style2" style="width: 100px"> &nbsp;</td>
	<td style="width: 242px; height: 19px"> <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="ApprovedId" DataSourceID="SqlDataSource1" AllowPaging="True" 
            ForeColor="White">
            <Columns>
                <asp:BoundField DataField="ApprovedId" HeaderText="&lt;--Codes--&gt;" 
                    InsertVisible="False" ReadOnly="True" SortExpression="ApprovedId" />
                <asp:BoundField DataField="TruckId" HeaderText="Truck Id" 
                    SortExpression="TruckId" />
                <asp:BoundField DataField="Zone" HeaderText="Zone" SortExpression="Zone" />
                <asp:BoundField DataField="ZonalMonitor" HeaderText="Zonal Monitor" 
                    SortExpression="ZonalMonitor" />
                <asp:BoundField DataField="Comments" HeaderText="Comments" 
                    SortExpression="Comments" />
            </Columns>
        </asp:GridView>
    <asp:Button ID="btnv" runat="server" onclick="btnv_Click" Text="Codes" 
            Visible="False" Width="85px" />
    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Logout" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:REALTIMEConnectionString %>" 
            SelectCommand="VerificationCode" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="tbid" Name="ZonalMonitorId" 
                    PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    <asp:TextBox ID="tbid" runat="server" Enabled="False" Width="23px"></asp:TextBox>
    </form></td>
	<td style="width: 107px; height: 19px"> &nbsp;</td></tr></table>
   
</body>
</html>
