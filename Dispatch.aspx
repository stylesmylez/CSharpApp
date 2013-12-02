<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dispatch.aspx.cs" Inherits="Dispatch" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 42px;
        }
        .style2
        {
            width: 778px;
        }
    </style>
</head>
<body>
<div align="center">
<table width="985"><tr><td colspan="3">
<form id="form1" runat="server">
    <p align="center">&nbsp;<asp:Label ID="Label2" runat="server" 
            Text="Type your username for verification" Visible="False"></asp:Label>
    <asp:TextBox ID="tbVerify" runat="server" Visible="False"></asp:TextBox>
    <asp:Button ID="btnVerify" runat="server" onclick="btnVerify_Click" 
        Text="Verify" Visible="False" />
        <asp:Label ID="lbUsernamex" runat="server"></asp:Label>
    
        &nbsp;Welcome to Dispatch</p>
    </td></tr><tr><td class="style1">
   
    </td><td class="style2" width="863">
    <table width="863" height="585"><tr>
		<td height="581">
	&nbsp;<p>&nbsp;</p>
	<p>&nbsp;</td><td background="MoBileDispatchInsert.png" height="581">
	
    <div>
    
		<p style="width: 780px">&nbsp;</p>
		<p style="width: 780px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		Truck Supplier&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="tbCollectedBy" runat="server" 
            DataSourceID="SQLTruckSupplier" DataTextField="TruckSupplier" 
            DataValueField="TruckSupplierId" Height="20px" 
            onselectedindexchanged="tbCollectedBy_SelectedIndexChanged" Width="136px" 
                ontextchanged="tbCollectedBy_TextChanged">
        </asp:DropDownList>
        &nbsp;&nbsp;<asp:Button ID="btnSel" runat="server" onclick="btnSel_Click" Text="Go" />&nbsp;&nbsp;&nbsp;&nbsp; Truck ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="tbTruckId5" runat="server"></asp:TextBox>
            <asp:Label ID="lbTruckId5" runat="server" ForeColor="#FF3300" Text="*" 
                Visible="False"></asp:Label>
        </p>
		<p>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		Time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:TextBox ID="tbTime" runat="server"></asp:TextBox>
            <asp:Label ID="lbTime" runat="server" ForeColor="#FF3300" Text="*" 
                Visible="False"></asp:Label>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
       Sidemen&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:TextBox ID="tbSidemen" runat="server" Height="16px"></asp:TextBox>
        &nbsp;</p>
		<p>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Truck Type&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:DropDownList ID="tbTruckType" runat="server" DataSourceID="SQLTruckType" 
            DataTextField="TruckType" DataValueField="TruckTypeId" Height="20px" 
            Width="136px">
        </asp:DropDownList>
            <asp:Label ID="lbTruckType" runat="server" ForeColor="#FF3300" Text="*" 
                Visible="False"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
        Driver&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="tbDriver" runat="server" DataSourceID="SQLDriver" 
            DataTextField="Driver" DataValueField="DriverId" Height="20px" Width="136px">
        </asp:DropDownList>
        </p>
		<p>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Work&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="tbWork" runat="server" DataSourceID="SQLWork" 
            DataTextField="Work" DataValueField="WorkId" Height="20px" Width="136px">
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        Zone&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:DropDownList ID="tbZone" runat="server" DataSourceID="SQLZone" 
            DataTextField="Zone" DataValueField="ZoneId" Height="20px" Width="136px" 
                onselectedindexchanged="tbZone_SelectedIndexChanged">
        </asp:DropDownList>
        &nbsp;<asp:Button ID="btnSel1" runat="server" onclick="btnSel1_Click" Text="Go" />
        </p>
		<p>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Zonal Monitor&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="tbZonalMonitor" runat="server" 
            DataSourceID="SQLZonalMonitor" DataTextField="ZonalMonitor" 
            DataValueField="ZonalMonitorId" Height="20px" Width="136px" 
                onselectedindexchanged="tbZonalMonitor_SelectedIndexChanged">
        </asp:DropDownList>
            <asp:Label ID="lbZoneMan" runat="server" ForeColor="#FF3300" Text="*" 
                Visible="False"></asp:Label>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
		Manual Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton 
                ID="lbDate" runat="server" onclick="LinkButton1_Click">Choose Date</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Calendar ID="tbCreatedOn" runat="server" BackColor="White" 
            BorderColor="Black" 
            Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="183px" 
                Width="33px" NextPrevFormat="ShortMonth" 
            onselectionchanged="tbCreatedOn_SelectionChanged" SelectedDate="2013-03-01" 
                BorderStyle="Solid" CellSpacing="1" style="text-align: right" 
                Visible="False">
            <DayHeaderStyle Font-Bold="True" Height="8pt" Font-Size="8pt" 
                ForeColor="#333333" />
            <DayStyle BackColor="#CCCCCC" />
            <NextPrevStyle Font-Size="8pt" ForeColor="White" Font-Bold="True" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TitleStyle BackColor="#333399" Font-Bold="True" Font-Size="12pt" 
                ForeColor="White" BorderStyle="Solid" Height="12pt" />
            <TodayDayStyle BackColor="#999999" ForeColor="White" />
        </asp:Calendar>
        <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Date Selected&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox1" 
                runat="server" Width="115px"></asp:TextBox>
        &nbsp;<asp:Label ID="Label1" runat="server" ForeColor="#FF3300" Text="*" 
                Visible="False"></asp:Label>
        &nbsp;<asp:SqlDataSource ID="SQLDriver" runat="server" 
            ConnectionString="<%$ ConnectionStrings:REALTIMEConnectionString %>" 
            SelectCommand="SELECT * FROM [Drivers]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SQLZonalMonitor" runat="server" 
            ConnectionString="<%$ ConnectionStrings:REALTIMEConnectionString %>" 
            SelectCommand="MobileSelZone" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="tbZoneId" Name="ZoneId" PropertyName="Text" 
                        Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource><asp:SqlDataSource ID="SQLZone" runat="server" 
            ConnectionString="<%$ ConnectionStrings:REALTIMEConnectionString %>" 
            SelectCommand="SELECT * FROM [Zones]"></asp:SqlDataSource><asp:SqlDataSource ID="SQLWork" runat="server" 
            ConnectionString="<%$ ConnectionStrings:REALTIMEConnectionString %>" 
            SelectCommand="SELECT * FROM [Works]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SQLTruckType" runat="server" 
            ConnectionString="<%$ ConnectionStrings:REALTIMEConnectionString %>" 
            SelectCommand="MobileSelTruck" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="tbCollectId" Name="TruckSupplierId" 
                        PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource><asp:SqlDataSource ID="SQLTruckSupplier" runat="server" 
            ConnectionString="<%$ ConnectionStrings:REALTIMEConnectionString %>" 
            SelectCommand="SELECT * FROM [TruckSupplier]"></asp:SqlDataSource>
        <p align="center">
            &nbsp;<asp:Button ID="aDDlINE" runat="server" onclick="aDDlINE_Click" 
                Text="Add Entry" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <u><b><a href="Default.aspx">Logout</a></b></u><p align="center">
            <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<asp:Label ID="lbStatus" runat="server" Text="Label" Visible="False"></asp:Label>
            </b><br />
        <asp:SqlDataSource ID="SQLDispatch" runat="server" 
            ConnectionString="<%$ ConnectionStrings:REALTIMEConnectionString %>" 
            SelectCommand="InsertMPMLineRecord" SelectCommandType="StoredProcedure">
            <FilterParameters>
                <asp:ControlParameter ControlID="tbTruckId5" Name="@TruckId" 
                    PropertyName="Text" />
            </FilterParameters>
            <SelectParameters>
                <asp:Parameter Name="TruckId" Type="String" />
                <asp:Parameter Name="TruckType" Type="String" />
                <asp:Parameter Name="Driver" Type="String" />
                <asp:Parameter Name="Time" Type="String" />
                <asp:Parameter Name="Work" Type="String" />
                <asp:Parameter Name="Zone" Type="String" />
                <asp:Parameter Name="ZonalMonitor" Type="String" />
                <asp:Parameter Name="Sidemen" Type="Int32" />
                <asp:Parameter Name="CreatedOn" Type="String" />
                <asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="Ticket" Type="String" />
                <asp:Parameter Name="CollectedBy" Type="String" />
                <asp:Parameter Name="CollectedId" Type="Int32" />
                <asp:Parameter Name="TallyClerk" Type="String" />
                <asp:Parameter Name="CompanyId" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:TextBox ID="tbCollect" runat="server" Visible="False" Width="32px"></asp:TextBox>
        <asp:TextBox ID="tbCollectId" runat="server" Visible="False" Width="21px"></asp:TextBox>
        <asp:TextBox ID="tbTicket" runat="server" Visible="False" Width="36px"></asp:TextBox>
        <asp:TextBox ID="tbTallyClerk" runat="server" Visible="False" Width="39px"></asp:TextBox>
        <asp:TextBox ID="tbZoneId" runat="server" Visible="False" Width="39px"></asp:TextBox>
        <br />
    
        <asp:Label ID="lbUserId" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbUsername" runat="server" Text="Label" Visible="False"></asp:Label>
    
        <asp:Label ID="lbCompanyId" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbVLabelSMB" runat="server" Visible="False"></asp:Label>
    
        <asp:Label ID="lbBelongTo" runat="server" Visible="False"></asp:Label>
    
        <br />
    
    </div>
    </form></td></tr></table></td><td width="66">
            &nbsp;</td></tr><tr><td colspan="3" height="135">
        &nbsp;</td></tr></table>
</div>
</body>
</html>