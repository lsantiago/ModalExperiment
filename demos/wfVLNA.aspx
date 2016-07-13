<%@ Page Language="C#" AutoEventWireup="true" CodeFile="wfVLNA.aspx.cs" Inherits="wfVLNA" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h3>Create multiple rows.</h3>
        <div style ="padding:10px 0px">
            No of rows to insert:
            <asp:TextBox ID="txtNoOfRow" runat="server"></asp:TextBox>
            &nbsp;
            <asp:Button ID="btnAddRow" runat="server" Text="Add Rows" OnClick="btnAddRow_Click" />
        </div>

        <asp:GridView ID="gvInput" runat="server" AutoGenerateColumns="false" CellPadding="5">
            <Columns>
                <asp:TemplateField HeaderText="SL No.">
                    <ItemTemplate>
                        <#Container.DataItemIndex +1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="First Name">
                    <ItemTemplate>
                        <asp:TextBox ID ="txtFirstName" runat="server"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Last Name">
                    <ItemTemplate>
                        <asp:TextBox ID ="txtLastName" runat="server"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Contact No">
                    <ItemTemplate>
                        <asp:TextBox ID ="txtContacto" runat="server"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

    </div>
    </form>
</body>
</html>
