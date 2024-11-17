<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manager.aspx.cs" Inherits="BenSimonProject2.Manager" %>

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
        width: 1010px;
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
    <form id="form1" runat="server">
        <div>
<h1 runat="server" id="header" style="background-color: darkblue; color: white;">Welcome Maintenance Team Member</h1>
        </div>



        <div runat="server" id="divAdd" visible="false">

            <div class="pad">
                <asp:Label runat="server" Text="Add Tenant:" Font-Bold="true" Font-Size="Large" />
            </div>
            <div class="pad">
                <asp:Label runat="server" Text="Name:" />
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </div>

            <div class="pad">
                <asp:Label runat="server" Text="Apartment#:" />
                <asp:TextBox ID="txtApt" runat="server"></asp:TextBox>
            </div>

            <div class="pad">
                <asp:Label runat="server" Text="Phone:" />
                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
            </div>

            <div class="pad">
                <asp:Label runat="server" Text="Email:" />
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </div>

            <div class="pad">
                <asp:Label runat="server" Text="Check-in:" />
                <input type="datetime-local" id="dtCheckin" runat="server" />
            </div>

            <div class="pad">
                <asp:Label runat="server" Text="Check-out:" />
                <input type="datetime-local" id="dtCheckout" runat="server" />
            </div>

            <div class="pad">
                <asp:Label runat="server" Text="Username:" />
                <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
            </div>

            <div class="pad">
                <asp:Label runat="server" Text="Password:" />
                <asp:TextBox ID="txtPass" runat="server"></asp:TextBox>
            </div>

            <div class="pad">
                <asp:Button runat="server" ID="btnSubmitTenant" Text="Submit New Tenant" OnClick="btnSubmitTenant_clicked" class="coolbutton"/>
            </div>

        </div>

        <div class="pad">
            <asp:Button runat="server" ID="btnAddTenant" Text="New Tenant" OnClick="btnAddTenant_clicked" class="coolbutton"/>
        </div>

        <div>
            <table>
                <tr>
                    <td>
                        <asp:GridView DataKeyNames="ID" ID="gvTenantList" runat="server" AutoGenerateColumns="false" CellPadding="2" RowStyle-Height="50" Width="700" AutoGenerateSelectButton="true" OnSelectedIndexChanged="gvTenantList_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="ID: " ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="Name" HeaderText=" Name " ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="AptNum" HeaderText=" Apartment " ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="Phone" HeaderText=" Phone# " ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="Email" HeaderText=" Email " ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="CheckIn" HeaderText=" Check-In " ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="CheckOut" HeaderText=" Check-Out " ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center" />
                            </Columns>
                        </asp:GridView>
                    </td>
                    <td>
                        <div runat="server" id="divRemEdit">

                            <div class="pad">
                                <asp:TextBox ID="txtEdit" runat="server"></asp:TextBox>
                                <asp:Button runat="server" ID="btnEdit" Text="Edit Tenant Room" OnClick="btnEditTenant_clicked" class="coolbutton"/>
                            </div>
                            <div class="pad">
                                <asp:Button runat="server" ID="btnDelete" Text="Delete Tenant" OnClick="btnDeleteTenant_clicked" class="coolbutton"/>
                            </div>

                        </div>
                    </td>
                </tr>
            </table>
        </div>

    </form>
        </div>
</body>
</html>
