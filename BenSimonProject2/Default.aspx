<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BenSimonProject2._Default" %>

<style>
    .pad {
        padding: 3px;
    }

    .coolbutton {
        background-color: darkblue;
        border: none;
        color: white;
        padding: 10px 30px;
        text-align: center;
        font-size: 18px;
        margin: 4px 2px;
    }

    .core {
        background-color: white;
        margin: 0 auto;
        text-align: center;
        width: 500px;
        height: 300px;
        border: 1px solid #000000;
        align-content: center;
        vertical-align: central;
    }
</style>

<html>
<head runat="server">
    <title></title>
</head>
<body style="background-color: lightgray;">
    >
    <form id="form1" runat="server">
        <div class="core">

            <h1 runat="server" id="header" style="background-color: darkblue; color: white;">Maintenance System Sign-In</h1>
            <table style="margin: 0 auto;">
                <tr>
                    <!-- username -->
                    <td>
                        <asp:Label runat="server" Text="Username:" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <!-- password-->
                    <td>
                        <asp:Label runat="server" Text="Password:" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtPass" runat="server"></asp:TextBox>
                    </td>
                </tr>



            </table>
            <asp:Button class="coolbutton" runat="server" ID="btnSignIn" Text="Sign in" OnClick="btnSignIn_clicked" />
        </div>
    </form>
</body>
</html>
