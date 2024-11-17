using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace BenSimonProject2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string conString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Ben_S\Documents\test.mdf";
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmitRequest_clicked(object sender, EventArgs e)
        {
            string command;
            if (txtApt.Text != "" && txtLoc.Text != "" && txtDesc.Text != "")
            {
                //Get the ID

                command = "SELECT MAX(Id) AS Id FROM Requests";
                int id = 0;
                SqlConnection conn = new SqlConnection(conString);
                conn.Open();
                SqlCommand cmd = new SqlCommand(command, conn);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    id = int.Parse(reader["Id"].ToString());
                }
                id = id + 1;
                conn.Close();
                DateTime dt = DateTime.Now;
                
                if (photo.Value != "")
                {
                    command = "INSERT INTO Requests (Id, AptNum, Location, Description, DateTime, Photo, Status) VALUES (" + id + ",'" + txtApt.Text + "','" + txtLoc.Text + "','" + txtDesc.Text + "','" + dt +"','"+ photo.Value + "',0)";
                }
                else
                {
                    command = "INSERT INTO Requests (Id, AptNum, Location, Description, DateTime, Status) VALUES (" + id + ",'" + txtApt.Text + "','" + txtLoc.Text + "','" + txtDesc.Text + "','" + dt + "',0)";
                }

                SqlConnection conn2 = new SqlConnection(conString);
                conn2.Open();

                SqlCommand cmd2 = new SqlCommand(command, conn2);
                cmd2.ExecuteNonQuery();

                conn2.Close();
                header.InnerText = "Request Submitted";

            }
        }
    }
}