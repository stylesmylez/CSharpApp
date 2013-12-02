<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginX.aspx.cs" Inherits="LoginX" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>NSWMA Mobile Login</title>
	<style type="text/css">
.style1 {
	background-image: url('MoBileDispatch.png');
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
<SCRIPT LANGUAGE=javascript>
{

  var Backlen=history.length;   
  history.go(-Backlen);

 }

</SCRIPT>
</head>
<body onload="changeHashOnLoad();">
<table align="center" class="style1" style="height: 472px; width: 581px"><tr>
	<td style="width: 111px; height: 138px;">&nbsp;</td><td style="width: 396px; height: 138px;"><form id="form1" runat="server">
    <div>
    
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
    
           <asp:Login ID="Login1" runat="server" BackColor="#EFF3FB" BorderColor="#B5C7DE" BorderPadding="4"
            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="12pt"
            ForeColor="#333333" OnAuthenticate="Login1_Authenticate"
            Width="294px" 
               Height="135px" style="text-align: center">
            <TitleTextStyle BackColor="#507CD1" Font-Bold="True" Font-Size="0.9em" 
                   ForeColor="White" />
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <TextBoxStyle Font-Size="0.8em" />
               <LayoutTemplate>
                   <table cellpadding="4" cellspacing="0" style="border-collapse:collapse;">
                       <tr>
                           <td>
                               <table cellpadding="0" style="height:135px;width:294px;">
                                   <tr>
                                       <td align="center" colspan="2" 
                                           style="color:White;background-color:#507CD1;font-size:0.9em;font-weight:bold;">
                                           Log In</td>
                                   </tr>
                                   <tr>
                                       <td align="right">
                                           <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                       </td>
                                       <td>
                                           <asp:TextBox ID="UserName" runat="server" Font-Size="0.8em"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                               ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                               ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td align="right">
                                           <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                       </td>
                                       <td>
                                           <asp:TextBox ID="Password" runat="server" Font-Size="0.8em" TextMode="Password"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                               ControlToValidate="Password" ErrorMessage="Password is required." 
                                               ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td colspan="2">
                                           <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                       </td>
                                   </tr>
                                   <tr>
                                       <td align="center" colspan="2" style="color:Red;">
                                           <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td align="right" colspan="2">
                                           <asp:Button ID="LoginButton" runat="server" BackColor="White" 
                                               BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" CommandName="Login" 
                                               Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" 
                                               Text="Log In" ValidationGroup="Login1" />
                                       </td>
                                   </tr>
                               </table>
                           </td>
                       </tr>
                   </table>
               </LayoutTemplate>
            <LoginButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px"
                Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
        </asp:Login>
    
           <br />
    
    </div>
    </form><br />
	<br />
	<br />
	<br />
	<br />
	</td></tr></table>
    
</body>
</html>