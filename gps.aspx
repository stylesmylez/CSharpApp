<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Page Language="C#" %>
<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta http-equiv="Content-Language" content="en-us" />
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>How to enable GPS</title>
<style type="text/css">
.style2 {
	text-align: center;
}
.style3 {
	background-image: url('GPS.png');
}
.style4 {
	background-image: url('GPS-IDevice.png');
}
.style5 {
	background-image: url('GPS-bb.png');
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
<table style="height: 2176px; width: 484px;" align="center"><tr>
	<td style="width: 430px; height: 724px;" class="style3"></td></tr><tr>
	<td style="width: 430px; height: 724px;" class="style4"></td></tr><tr>
	<td style="width: 430px" class="style5">&nbsp;</td></tr></table></form>

<p class="style2"><a href="Default.aspx">Logout</a></p>

</body>

</html>
