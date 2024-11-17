<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Request.aspx.cs" Inherits="BenSimonProject2.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Maintenance Request</h1>
            Location:
        </div>
        <div>    
            <input type="text" />
        </div>
            Description:
        <div>
            <input type="text" style="font-size:40pt;height:40pt"/>
        </div>
            Image
        <div>
            <asp:FileUpload runat ="server"/>
        </div>
        <asp:Button runat="server" id="Button1" Text="Submit Maintenance Request" OnClick="btnSubmitRequest" />
    </form>
</body>
</html>
