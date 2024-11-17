using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace BenSimonProject2
{
    public partial class Manager : System.Web.UI.Page
    {
        string conString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Ben_S\Documents\test.mdf";
        string currentID = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            Refresh_Table();
        }

        protected void Refresh_Table()
        {
            SqlConnection conn = new SqlConnection(conString);
            conn.Open();

            SqlDataAdapter dataMaint = new SqlDataAdapter("SELECT [Id], [name], [aptnum], [phone], [email], [checkin], [checkout] FROM Tenants", conn);
            DataTable tblMaint = new DataTable();
            dataMaint.Fill(tblMaint);
            gvTenantList.DataSource = tblMaint;
            gvTenantList.DataBind();

            conn.Close();
        }

        protected void gvTenantList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //no longer used
            //currentID = gvTenantList.SelectedRow.Cells[1].Text;
        }


        protected void btnAddTenant_clicked(object sender, EventArgs e)
        {
            divAdd.Visible = true;
            btnAddTenant.Visible = false;
        }

        protected void btnSubmitTenant_clicked(object sender, EventArgs e)
        {
            if (txtName.Text != "" && txtApt.Text != "" && txtEmail.Text != "" && txtPhone.Text != "" && txtUser.Text != "" && txtPass.Text != "" && dtCheckin.Value != null && dtCheckout.Value != null)
            {
                //set new ID for tenant
                string command = "SELECT MAX(Id) AS Id FROM Tenants";
                int id = 0;
                SqlConnection idConn = new SqlConnection(conString);
                idConn.Open();
                SqlCommand cmdid = new SqlCommand(command, idConn);
                SqlDataReader reader = cmdid.ExecuteReader();
                while (reader.Read())
                {
                    id = int.Parse(reader["Id"].ToString());
                }
                id = id + 1;

                //
                command = "INSERT INTO Users (Username, Password, Type) VALUES ('" + txtUser.Text + "','" + txtPass.Text + "','Tenant')";

                SqlConnection userconn = new SqlConnection(conString);
                userconn.Open();

                SqlCommand cmduser = new SqlCommand(command,userconn);
                cmduser.ExecuteNonQuery();

                userconn.Close();
                SqlConnection conn2 = new SqlConnection(conString);
                conn2.Open();
                command = "INSERT INTO Tenants VALUES (" + id + ",'" + txtName.Text + "','" + txtPhone.Text + "','" + txtEmail.Text + "','" + dtCheckin.Value + "','" + dtCheckout.Value +"'," + txtApt.Text + ")";
                
                SqlCommand cmdtenant = new SqlCommand(command,conn2);
                cmdtenant.ExecuteNonQuery();

                conn2.Close();
                header.InnerText = "Tenant Added";
            }
            else {
                header.InnerText = "please fill all fields!";   
            }

            Refresh_Table();
            divAdd.Visible = false;
            btnAddTenant.Visible = true;
        }

        protected void btnDeleteTenant_clicked(object sender, EventArgs e)
        {

            string command = "DELETE FROM Tenants WHERE Id = "+ gvTenantList.SelectedRow.Cells[1].Text + "";

            SqlConnection conn = new SqlConnection(conString);
            conn.Open();

            SqlCommand cmd = new SqlCommand(command, conn);
            cmd.ExecuteNonQuery();

            header.InnerText = "Tenant Deleted";

            conn.Close();
            Refresh_Table();
        }

            protected void btnEditTenant_clicked(object sender, EventArgs e) 
        {
            string command = "UPDATE Tenants SET aptnum = '" + txtEdit.Text + "' WHERE Id = "+ gvTenantList.SelectedRow.Cells[1].Text + "";
            
            SqlConnection conn = new SqlConnection(conString);
            conn.Open();

            SqlCommand cmd = new SqlCommand(command, conn);
            cmd.ExecuteNonQuery();

            header.InnerText = "Tenant Edited";
            conn.Close();

            Refresh_Table();
        }
    }
}