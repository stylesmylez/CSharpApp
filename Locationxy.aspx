<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Locationxy.aspx.cs" Inherits="Locationxy" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Truck Verification</title><script src="http://maps.google.com/maps/api/js?sensor=false">
    </script>
    <script type="text/javascript">
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
                var latitude = position.coords.latitude;
                var longitude = position.coords.longitude;
                document.getElementById("<%=tbLatitude.ClientID %>").value = latitude;
                document.getElementById("<%=tbLongitude.ClientID %>").value = longitude;
                var coords = new google.maps.LatLng(latitude, longitude);
                var mapOptions = {
                    zoom: 15,
                    center: coords,
                    mapTypeControl: true,
                    navigationControlOptions: {
                        style: google.maps.NavigationControlStyle.SMALL
                    },
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                map = new google.maps.Map(
                document.getElementById("mapContainer"), mapOptions
                );
                var marker = new google.maps.Marker({
                    position: coords,
                    map: map,
                    title: "Your current location!"
                });

            });
        } else {
            alert("Geolocation API is not supported in your browser.");
        }
    </script>

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
<body style="text-align: center"  onload="changeHashOnLoad();">
<table><tr><td style="width: 228px" rowspan="2">&nbsp;</td>
	<td style="width: 556px" class="style9"><form id="form1" runat="server"> 
    <div class="style2">
        <br />
		<span class="style10"><strong style="color: #FFFF00">Welcome
        </strong></span>
        <asp:Label ID="lbusername" runat="server" Text="Label" Font-Bold="True" 
            ForeColor="Yellow"></asp:Label>
  
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
		<br />
  
    <style type="text/css">
        #mapContainer
        {
            height: 175px;
            width: 417px;
            border: 10px solid #eaeaea;
            text-align:center;
            background-position:center;
            position:fixed;
        }
        #Button2
        {
        }
    .style2 {
	text-align: center;
}
    .style7 {
	font-size: 20pt;
	text-decoration: underline;
}
    .style9 {
	background-image: url('VeriTruck.png');
}
.style10 {
	color: #FFFFFF;
}
    </style>
    </div>

   <%-- <script src="http://maps.google.com/maps/api/js?sensor=false">
    </script>
    <script type="text/javascript">
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
                var latitude = position.coords.latitude;
                var longitude = position.coords.longitude;
                document.getElementById("<%=HiddenField1.ClientID %>").value = latitude;
                document.getElementById("<%=tblon.ClientID %>").value = longitude;
                var coords = new google.maps.LatLng(latitude, longitude);
                var mapOptions = {
                    zoom: 15,
                    center: coords,
                    mapTypeControl: true,
                    navigationControlOptions: {
                        style: google.maps.NavigationControlStyle.SMALL
                    },
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                map = new google.maps.Map(
                document.getElementById("mapContainer"), mapOptions
                );
                var marker = new google.maps.Marker({
                    position: coords,
                    map: map,
                    title: "Your current location!"
                });

            });
        } else {
            alert("Geolocation API is not supported in your browser.");
        }
        function Button2_onclick() {

        }

        function Button2_onclick() {

        }

    </script>--%>

    <div id="mapContainer" class="style2" style="left: 62px; top: -23px">
    </div>
    <div class="style2">
    <div class="style2">
    <span class="style10"><strong>Truck ID </strong></span>
    <asp:TextBox ID="tbTruck" runat="server"></asp:TextBox>
        &nbsp;<span class="style10"><strong>Zones</strong></span> <asp:DropDownList ID="drZones" runat="server" DataSourceID="SqlZnes" 
            DataTextField="Zone" DataValueField="Zone">
    </asp:DropDownList>
   
        <br />
        <span class="style10"><strong>Comments</strong></span><br />
   
        <asp:Label ID="lbError" runat="server" Text="*" Font-Bold="True" 
            ForeColor="White"></asp:Label>
   
        <asp:TextBox ID="tbcomments" runat="server" Height="46px" TextMode="MultiLine" 
            Width="416px"></asp:TextBox>
        <br />
   
        <asp:ImageButton ID="imbVmz" runat="server" Height="34px" 
            ImageUrl="~/images/IMBmzButton.png" onclick="imbVmz_Click" 
            style="margin-bottom: 2px" Width="141px" />
        <asp:ImageButton ID="imbVerify" runat="server" Height="34px" 
            ImageUrl="~/images/IMBButton.png" onclick="imbVerify_Click" 
            style="margin-bottom: 2px" Width="141px" />
        <asp:ImageButton ID="imbVCodes" runat="server" Height="34px" 
            ImageUrl="~/images/IMBvButton.png" onclick="imbVCodes_Click" 
            style="margin-bottom: 2px" Width="141px" />
        <asp:ImageButton ID="imbLoc" runat="server" Height="34px" 
            ImageUrl="~/images/IMBLocButton.png" onclick="imbLoc_Click" 
            style="margin-bottom: 2px" Width="141px" />
        <asp:ImageButton ID="imbVLog" runat="server" Height="34px" 
            ImageUrl="~/images/IMBLogButton.png" onclick="imbVLog_Click" 
            style="margin-bottom: 2px" Width="141px" />
        <asp:ImageButton ID="imbVRef" runat="server" Height="34px" 
            ImageUrl="~/images/IMBrefButton.png" onclick="imbVRef_Click" 
            style="margin-bottom: 2px" Width="141px" />
    
        <br />
        <asp:Label ID="lbSuccess" runat="server" Text="-"></asp:Label>
    
        <br />
        </div>
        <asp:SqlDataSource ID="VerificationCode" runat="server" 
            ConnectionString="<%$ ConnectionStrings:REALTIMEConnectionString %>" 
            SelectCommand="VerificationCode" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="dpUserId" Name="ZonalMonitorId" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    <div class="style2">
    
    <br />
    &nbsp;&nbsp;&nbsp;<%--<asp:Button ID="Button1" runat="server" Text="Save"  onclick="btnSave_Click" />--%><%--<asp:Button ID="btnLat" runat="server" Text="Save" />--%><br />
        </div>
        <asp:SqlDataSource ID="SQLUserId" runat="server" 
            ConnectionString="<%$ ConnectionStrings:REALTIMEConnectionString %>" 
            SelectCommand="Xwxeb" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="lbusername" Name="XWeb" PropertyName="Text" 
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
   
        <asp:SqlDataSource ID="SqlZnes" runat="server" 
            ConnectionString="<%$ ConnectionStrings:REALTIMEConnectionString %>" 
            SelectCommand="SelUserZones" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="dpUserId" Name="UserId" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div class="style2">
        <br />
        <tr>
	<td style="width: 556px">
        <asp:TextBox ID="tbLatitude" runat="server" ForeColor="White" 
            Width="16px" Height="16px"></asp:TextBox>
        <asp:TextBox 
            ID="tbLongitude" runat="server" ForeColor="White" Width="16px" 
            Height="16px"></asp:TextBox>
    <asp:DropDownList ID="dpUserId" runat="server" DataSourceID="SQLUserId" 
            DataTextField="UserId" DataValueField="UserId" Enabled="False" 
            Height="16px" Width="16px">
    </asp:DropDownList>
   
    <asp:DropDownList ID="dpRoleId" runat="server" DataSourceID="SQLUserId" 
            DataTextField="VLabelSMB" DataValueField="VLabelSMB" Enabled="False" 
            Height="16px" Width="16px">
    </asp:DropDownList>
   
        </td></tr>
    </div>
    </div>
    </form></td><td style="width: 228px" rowspan="2">&nbsp;</td></tr></table>
    
	<p class="style7"><strong><a href="gps.aspx">How To Enable GPS</a></strong></p>
    </form>
</body>
</html>