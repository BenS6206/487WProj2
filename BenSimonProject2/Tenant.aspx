<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tenant.aspx.cs" Inherits="BenSimonProject2.WebForm1" %>

<style>
    .pad {
        padding: 3px;
    }

    .core {
        background-color: white;
        margin: 0 auto;
        text-align: center;
        width: 500px;
        height: 330px;
        border: 1px solid #000000;
        align-content: center;
        vertical-align: central;
    }
</style>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color: lightgray;">
    <div class="core">
        <div>
            <h1 runat="server" id="header" style="background-color: darkblue; color: white;">Welcome Tenant, please submit your request.</h1>
        </div>
        <form id="form1" runat="server">
            <table style="margin: 0 auto;">
                <tr>
                    <td>
                        <asp:Label runat="server" Text="Apartment#:" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtApt" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" Text="Location:" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtLoc" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" Text="Description:" /></td>
                    <td>
                        <asp:TextBox ID="txtDesc" runat="server" Height="100px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" Text="Photo (Optional):" /></td>
                    <td>
                        <input id="photo" type="file" accept=".png" runat="server" /></td>
                </tr>
            </table>
            <div class="pad">
                <asp:Button runat="server" ID="btnSubmitTenant" Text="Submit New Request" OnClick="btnSubmitRequest_clicked" />
            </div>
        </form>
    </div>
</body>
</html>
