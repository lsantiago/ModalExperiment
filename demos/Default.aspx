<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </div>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" Width="279px">
            <asp:ListItem>option1</asp:ListItem>
            <asp:ListItem>option2</asp:ListItem>
            <asp:ListItem>option3</asp:ListItem>
            <asp:ListItem>option4</asp:ListItem>
            <asp:ListItem>option5</asp:ListItem>
        </asp:RadioButtonList>
        <asp:Label ID="Label2" runat="server" Text="Label" Width="279px"></asp:Label>
    </form>
</body>
</html>
