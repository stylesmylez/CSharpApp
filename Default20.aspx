<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default20.aspx.cs" Inherits="Default20" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
<body style="text-align: center">
    <form id="form1" runat="server"> 
    <script src="http://maps.google.com/maps/api/js?sensor=false">
    </script>
    <script type="text/javascript">
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
                var latitude = position.coords.latitude;
                var longitude = position.coords.longitude;
                document.getElementById("<%=tbLat.ClientID %>").value = latitude;
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
    </script>
    <style type="text/css">
        #mapContainer
        {
            height: 175px;
            width: 525px;
            border: 10px solid #eaeaea;
        }
        .style1
        {
            text-align: left;
        }
    </style>
    <div id="mapContainer">
    </div>
    <div class="style1">
    TruckId
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    Zone
    <asp:DropDownList ID="DropDownList1" runat="server">
    </asp:DropDownList>
   
    <asp:Button ID="btnSave" runat="server" Text="Verify Truck" 
        onclick="btnSave_Click1"/>
    
    <br />
    X
    <asp:TextBox ID="tbLat" runat="server" Width="16px"></asp:TextBox>
    &nbsp;Y
    <asp:TextBox ID="tblon" runat="server" Width="16px"></asp:TextBox>
    <%--<asp:Button ID="Button1" runat="server" Text="Save"  onclick="btnSave_Click" />--%>
   
    <%--<asp:Button ID="btnLat" runat="server" Text="Save" />--%>
    </div>
    </form>
</body>
</html>