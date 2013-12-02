<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default1.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1 {
            text-align: center;
        }
    </style>
</head>
<body>
<div align="center">
<table width="779"><tr><td colspan="3">
    &nbsp;</td></tr><tr><td width="103" height="503">   
    </td><td width="577" background="MoBileDispatch.png" height="503">
     <form id="form1" runat="server">
    <div class="style1">
    
        <div class="style1">
            &nbsp;<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>Username&nbsp;
            <asp:TextBox ID="tbUsername" runat="server"></asp:TextBox>
            <p>
            <br />
            Password&nbsp; 
            <asp:TextBox ID="tbPassword" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnLogin" runat="server" onclick="btnLogin_Click" 
                Text="Validate" />
            <asp:Button ID="btnCon" runat="server" onclick="btnCon_Click" Text="Continue" />
            <br />
            <asp:Label ID="BadNews" runat="server" Font-Size="18pt" ForeColor="Red" 
                Text="Status" Visible="False"></asp:Label>
            <br />
            <asp:DropDownList ID="dpUserId" runat="server" BackColor="White" 
                DataSourceID="SQLDs" DataTextField="UserId" DataValueField="UserId" 
                ForeColor="White" Height="16px" Width="16px">
            </asp:DropDownList>
            <asp:DropDownList ID="dpUsername" runat="server" BackColor="White" 
                DataSourceID="SQLDs" DataTextField="Username" DataValueField="Username" 
                ForeColor="White" Height="16px" Width="16px">
            </asp:DropDownList>
            <asp:DropDownList ID="dpCompanyId" runat="server" BackColor="White" 
                DataSourceID="SQLDs" DataTextField="CompanyId" DataValueField="CompanyId" 
                ForeColor="White" Height="16px" Width="16px">
            </asp:DropDownList>
            <asp:DropDownList ID="dpVLabelSMB" runat="server" BackColor="White" 
                DataSourceID="SQLDs" DataTextField="VLabelSMB" DataValueField="VLabelSMB" 
                ForeColor="White" Height="16px" Width="16px">
            </asp:DropDownList>
            <asp:DropDownList ID="dpBelongTo" runat="server" BackColor="White" 
                DataSourceID="SQLDs" DataTextField="BelongTo" DataValueField="BelongTo" 
                ForeColor="White" Height="16px" Width="16px">
            </asp:DropDownList>
            <br />
            <br />
        </div>
        <asp:SqlDataSource ID="SQLDs" runat="server" 
            ConnectionString="<%$ ConnectionStrings:REALTIMEConnectionString %>" 
            SelectCommand="QLogGetUserDetails" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="tbUsername" Name="UserName" 
                    PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="tbPassword" Name="Password" 
                    PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:REALTIMEConnectionString %>" 
            DeleteCommand="DELETE FROM [Users] WHERE [UserId] = @original_UserId AND (([Username] = @original_Username) OR ([Username] IS NULL AND @original_Username IS NULL)) AND (([Password] = @original_Password) OR ([Password] IS NULL AND @original_Password IS NULL)) AND (([CompanyName] = @original_CompanyName) OR ([CompanyName] IS NULL AND @original_CompanyName IS NULL)) AND (([CompanyId] = @original_CompanyId) OR ([CompanyId] IS NULL AND @original_CompanyId IS NULL)) AND (([RemaingTime] = @original_RemaingTime) OR ([RemaingTime] IS NULL AND @original_RemaingTime IS NULL)) AND (([Sub] = @original_Sub) OR ([Sub] IS NULL AND @original_Sub IS NULL)) AND (([VLabelSMB] = @original_VLabelSMB) OR ([VLabelSMB] IS NULL AND @original_VLabelSMB IS NULL)) AND (([Found] = @original_Found) OR ([Found] IS NULL AND @original_Found IS NULL)) AND (([CreatedOn] = @original_CreatedOn) OR ([CreatedOn] IS NULL AND @original_CreatedOn IS NULL)) AND (([XLS] = @original_XLS) OR ([XLS] IS NULL AND @original_XLS IS NULL)) AND (([BelongTo] = @original_BelongTo) OR ([BelongTo] IS NULL AND @original_BelongTo IS NULL)) AND (([BelongToThisSide] = @original_BelongToThisSide) OR ([BelongToThisSide] IS NULL AND @original_BelongToThisSide IS NULL)) AND (([Permission] = @original_Permission) OR ([Permission] IS NULL AND @original_Permission IS NULL))" 
            InsertCommand="INSERT INTO [Users] ([Username], [Password], [CompanyName], [CompanyId], [RemaingTime], [Sub], [VLabelSMB], [Found], [CreatedOn], [XLS], [BelongTo], [BelongToThisSide], [Permission]) VALUES (@Username, @Password, @CompanyName, @CompanyId, @RemaingTime, @Sub, @VLabelSMB, @Found, @CreatedOn, @XLS, @BelongTo, @BelongToThisSide, @Permission)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [Users]" 
            UpdateCommand="UPDATE [Users] SET [Username] = @Username, [Password] = @Password, [CompanyName] = @CompanyName, [CompanyId] = @CompanyId, [RemaingTime] = @RemaingTime, [Sub] = @Sub, [VLabelSMB] = @VLabelSMB, [Found] = @Found, [CreatedOn] = @CreatedOn, [XLS] = @XLS, [BelongTo] = @BelongTo, [BelongToThisSide] = @BelongToThisSide, [Permission] = @Permission WHERE [UserId] = @original_UserId AND (([Username] = @original_Username) OR ([Username] IS NULL AND @original_Username IS NULL)) AND (([Password] = @original_Password) OR ([Password] IS NULL AND @original_Password IS NULL)) AND (([CompanyName] = @original_CompanyName) OR ([CompanyName] IS NULL AND @original_CompanyName IS NULL)) AND (([CompanyId] = @original_CompanyId) OR ([CompanyId] IS NULL AND @original_CompanyId IS NULL)) AND (([RemaingTime] = @original_RemaingTime) OR ([RemaingTime] IS NULL AND @original_RemaingTime IS NULL)) AND (([Sub] = @original_Sub) OR ([Sub] IS NULL AND @original_Sub IS NULL)) AND (([VLabelSMB] = @original_VLabelSMB) OR ([VLabelSMB] IS NULL AND @original_VLabelSMB IS NULL)) AND (([Found] = @original_Found) OR ([Found] IS NULL AND @original_Found IS NULL)) AND (([CreatedOn] = @original_CreatedOn) OR ([CreatedOn] IS NULL AND @original_CreatedOn IS NULL)) AND (([XLS] = @original_XLS) OR ([XLS] IS NULL AND @original_XLS IS NULL)) AND (([BelongTo] = @original_BelongTo) OR ([BelongTo] IS NULL AND @original_BelongTo IS NULL)) AND (([BelongToThisSide] = @original_BelongToThisSide) OR ([BelongToThisSide] IS NULL AND @original_BelongToThisSide IS NULL)) AND (([Permission] = @original_Permission) OR ([Permission] IS NULL AND @original_Permission IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_UserId" Type="Int32" />
                <asp:Parameter Name="original_Username" Type="String" />
                <asp:Parameter Name="original_Password" Type="Object" />
                <asp:Parameter Name="original_CompanyName" Type="String" />
                <asp:Parameter Name="original_CompanyId" Type="Int32" />
                <asp:Parameter Name="original_RemaingTime" Type="Int32" />
                <asp:Parameter Name="original_Sub" Type="Int32" />
                <asp:Parameter Name="original_VLabelSMB" Type="String" />
                <asp:Parameter Name="original_Found" Type="Boolean" />
                <asp:Parameter Name="original_CreatedOn" Type="DateTime" />
                <asp:Parameter Name="original_XLS" Type="Int32" />
                <asp:Parameter Name="original_BelongTo" Type="Int32" />
                <asp:Parameter Name="original_BelongToThisSide" Type="String" />
                <asp:Parameter Name="original_Permission" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="Password" Type="Object" />
                <asp:Parameter Name="CompanyName" Type="String" />
                <asp:Parameter Name="CompanyId" Type="Int32" />
                <asp:Parameter Name="RemaingTime" Type="Int32" />
                <asp:Parameter Name="Sub" Type="Int32" />
                <asp:Parameter Name="VLabelSMB" Type="String" />
                <asp:Parameter Name="Found" Type="Boolean" />
                <asp:Parameter Name="CreatedOn" Type="DateTime" />
                <asp:Parameter Name="XLS" Type="Int32" />
                <asp:Parameter Name="BelongTo" Type="Int32" />
                <asp:Parameter Name="BelongToThisSide" Type="String" />
                <asp:Parameter Name="Permission" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="Password" Type="Object" />
                <asp:Parameter Name="CompanyName" Type="String" />
                <asp:Parameter Name="CompanyId" Type="Int32" />
                <asp:Parameter Name="RemaingTime" Type="Int32" />
                <asp:Parameter Name="Sub" Type="Int32" />
                <asp:Parameter Name="VLabelSMB" Type="String" />
                <asp:Parameter Name="Found" Type="Boolean" />
                <asp:Parameter Name="CreatedOn" Type="DateTime" />
                <asp:Parameter Name="XLS" Type="Int32" />
                <asp:Parameter Name="BelongTo" Type="Int32" />
                <asp:Parameter Name="BelongToThisSide" Type="String" />
                <asp:Parameter Name="Permission" Type="String" />
                <asp:Parameter Name="original_UserId" Type="Int32" />
                <asp:Parameter Name="original_Username" Type="String" />
                <asp:Parameter Name="original_Password" Type="Object" />
                <asp:Parameter Name="original_CompanyName" Type="String" />
                <asp:Parameter Name="original_CompanyId" Type="Int32" />
                <asp:Parameter Name="original_RemaingTime" Type="Int32" />
                <asp:Parameter Name="original_Sub" Type="Int32" />
                <asp:Parameter Name="original_VLabelSMB" Type="String" />
                <asp:Parameter Name="original_Found" Type="Boolean" />
                <asp:Parameter Name="original_CreatedOn" Type="DateTime" />
                <asp:Parameter Name="original_XLS" Type="Int32" />
                <asp:Parameter Name="original_BelongTo" Type="Int32" />
                <asp:Parameter Name="original_BelongToThisSide" Type="String" />
                <asp:Parameter Name="original_Permission" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form></td><td width="85" height="503">
    &nbsp;</td></tr><tr><td colspan="3">
    &nbsp;</td></tr></table>
</div>
</body>
</html>