<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FindLocation.aspx.cs" Inherits="FindLocation" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<%@ Register Src="~/GoogleMapForASPNet.ascx" TagName="GoogleMapForASPNet" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Find Monitors Location</title>



	<style type="text/css">
.style1 {
	background-image: url('Find-Location.png');
	text-align: center;
}
        .style2 {
	text-align: center;
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
    <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <h3>
        &nbsp;&nbsp;<table align="center"><tr><td class="style1"><br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
         	<br />
            <asp:Label ID="lbusername" runat="server" Text="Label"></asp:Label>
            <div class="style2">
            Welcome to Google Maps v<asp:Label ID="lbv" runat="server" Text="Label"></asp:Label>
            .
         Verification Code.
         <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
         &nbsp;<br />
			<asp:ImageButton ID="imbGo" runat="server" Height="34px" 
                ImageUrl="~/IMBGo.png" onclick="imbGo_Click" Width="141px" />
            <asp:ImageButton ID="imbloc" runat="server" Height="34px" 
                ImageUrl="~/IMBLocate.png" onclick="imbloc_Click" Width="141px" />
            <asp:ImageButton ID="imbref" runat="server" Height="34px" 
                ImageUrl="~/images/IMBrefButton.png" onclick="imbref_Click" Width="141px" />
            <asp:ImageButton ID="imbbk" runat="server" Height="34px" 
                ImageUrl="~/IMBBack.png" onclick="imbbk_Click" Width="141px" />
            <asp:ImageButton ID="imbout" runat="server" Height="34px" 
                ImageUrl="~/images/IMBLogButton.png" onclick="imbout_Click" Width="141px" />
        &nbsp;<br />
         <asp:Label ID="tbStatus" runat="server" Text="*"></asp:Label></div>
			</td></tr></table> 
         <asp:SqlDataSource ID="LoadLocation" runat="server" 
             ConnectionString="<%$ ConnectionStrings:REALTIMEConnectionString %>" 
             SelectCommand="VerificationReport" SelectCommandType="StoredProcedure">
             <SelectParameters>
                 <asp:ControlParameter ControlID="TextBox3" Name="ZonalMonitorid" 
                     PropertyName="Text" Type="Int32" />
             </SelectParameters>
         </asp:SqlDataSource>
         <asp:SqlDataSource ID="MonitorsC" runat="server" 
             ConnectionString="<%$ ConnectionStrings:REALTIMEConnectionString %>" 
             SelectCommand="SELECT * FROM [TrucksApproved]"></asp:SqlDataSource>
&nbsp;<div>
        <uc1:GoogleMapForASPNet ID="GoogleMapForASPNet1" runat="server" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="style2">
                Latitude:
                <asp:TextBox ID="tblat" runat="server"></asp:TextBox>
                Longitude:&nbsp;
                <asp:TextBox ID="tblon" runat="server"></asp:TextBox>
                &nbsp;Monitor:
                <asp:TextBox ID="tbMonitor" runat="server"></asp:TextBox>
                Date/Time:&nbsp;
                <asp:TextBox ID="tbTime" runat="server"></asp:TextBox>
                <br />
                Zone:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="tbZone" runat="server"></asp:TextBox>
                &nbsp;Truck:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="tbTruck" runat="server"></asp:TextBox>
                <br />
            </div>
        </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    </form>
        
</body>
</html>
