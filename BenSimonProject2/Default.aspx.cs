using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BenSimonProject2
{
    public partial class _Default : Page
    {
        string conString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Ben_S\Documents\test.mdf";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignIn_clicked(object sender, EventArgs e)
        {
            
            //retrieve type of user
            string command = "SELECT Type FROM Users WHERE Username = '" + txtUser.Text + "' AND Password = '" + txtPass.Text+"'";
            SqlConnection conn = new SqlConnection(conString);
            conn.Open();
            SqlCommand cmd = new SqlCommand(command, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            string type = "";
            while (reader.Read())
            {
                type = reader["Type"].ToString();
            }
            conn.Close();

            type = type.Replace(" ", string.Empty);

            //send to page
            if(type=="Tenant")
            {
                Response.Redirect("Tenant.aspx");
            }
            else if(type=="Maintenance")
            {
                Response.Redirect("Maintenance.aspx");
            }
            else if(type=="Manager")
            {
                Response.Redirect("Manager.aspx");
            }
            else
            {
                header.InnerText = "Invalid Login! Please try again!";    
            }
        }

    }
}