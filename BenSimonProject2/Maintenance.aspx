<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Maintenance.aspx.cs" Inherits="BenSimonProject2.WebForm3" %>

<style>
    .pad {
        padding: 3px;
    }

    .padtop {
        padding-top: 10px;
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
    <form runat="server">
        <div class="core">
            <panel>
                <div class="pad">
                    <h1 runat="server" id="header" style="background-color: darkblue; color: white;">Welcome Maintenance Team Member</h1>
                </div>
                <div class="pad">
                    <asp:Label runat="server" Text="Filters:" Font-Bold="true" Font-Size="Large" />

                </div>
                <div class="pad">
                    <asp:Label runat="server" Text="Apartment Number:" />
                    <asp:TextBox ID="txtApt" runat="server"></asp:TextBox>
                </div>
                <div class="pad">
                    <asp:Label runat="server" Text="Location:" />
                    <asp:TextBox ID="txtLoc" runat="server"></asp:TextBox>

                </div>
                <div class="pad">
                    <asp:Label runat="server" Text="Date Range:" />
                    <input type="datetime-local" id="dtFromTime" runat="server" />
                    to
                <input type="datetime-local" id="dtToTime" runat="server" />
                </div>
                <div class="pad">
                    <asp:Label runat="server" Text="Completed:" />
                    <asp:CheckBox ID="chkComp" runat="server" Text="" />
                </div>
                <div class="pad">
                    <asp:Button ID="btnFilter" runat="server" Text="Apply Filters" OnClick="FilterButton_Clicked" class="coolButton"/>
                </div>
            </panel>
            <table runat="server" >
                <tr>
                    <td>
                        <asp:GridView DataKeyNames="ID" ID="gvMaintList" runat="server" AutoGenerateColumns="false" CellPadding="2" RowStyle-Height="50" Width="700" AutoGenerateSelectButton="true" OnSelectedIndexChanged="gvMaintList_SelectedIndexChanged" BackColor="white">
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="ID: " ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="AptNum" HeaderText=" Apartment " ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="Location" HeaderText=" Location " ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="DateTime" HeaderText=" Date/Time " ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="Status" HeaderText=" Completed " ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center" />
                            </Columns>
                        </asp:GridView>
                    </td>
                    <td>
                        <asp:DetailsView ID="DetailsView1" runat="server"
                            AutoGenerateRows="True" DataKeyNames="ID"
                            DataSourceID="Details" Height="50px" Width="300px" BackColor="White">
                        </asp:DetailsView>

                        <asp:SqlDataSource ID="Details" ConnectionString="Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=C:\USERS\BEN_S\DOCUMENTS\TEST.MDF"
                            runat="server"
                            SelectCommand="SELECT * FROM [Requests] 
                         WHERE ([ID] = @ID)">

                            <SelectParameters>
                                <asp:ControlParameter ControlID="gvMaintList" Name="ID"
                                    PropertyName="SelectedValue"
                                    Type="String" />
                            </SelectParameters>

                        </asp:SqlDataSource>
                        <asp:Button ID="btnComplete" class="coolButton" runat="server" Text="Mark Complete" OnClick="completeButton_Clicked" Visible="false" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

