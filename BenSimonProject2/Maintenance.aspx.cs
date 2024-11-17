using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BenSimonProject2
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        string currentID = "";
        string conString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Ben_S\Documents\test.mdf";

        protected void refreshTable()
        {
            string command = "SELECT [ID], [AptNum], [Location], [DateTime], [Status] FROM Requests WHERE ";


            SqlConnection conn = new SqlConnection(conString);
            conn.Open();

            if (txtApt.Text != "")
            {
                command += "AptNum = '" + txtApt.Text + "' AND ";
            }
            if (txtLoc.Text != "")
            {
                command += "Location = '" + txtLoc.Text + "' AND ";
            }
            if (dtFromTime.Value != "")
            {
                DateTime fromDT = DateTime.Parse(dtFromTime.Value);
                command += "DateTime > '" + fromDT + "' AND ";
            }
            if (dtToTime.Value != "")
            {
                DateTime toDT = DateTime.Parse(dtToTime.Value);
                command += "DateTime < '" + toDT + "' AND ";
            }

            command += "Status = '" + chkComp.Checked + "'";

            SqlDataAdapter dataMaint = new SqlDataAdapter(command, conn);
            DataTable tblMaint = new DataTable();
            dataMaint.Fill(tblMaint);
            gvMaintList.DataSource = tblMaint;
            gvMaintList.DataBind();

            conn.Close();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            refreshTable();
        }

        protected void gvMaintList_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnComplete.Visible = true;
        }

        protected void completeButton_Clicked(object sender, EventArgs e)
        {
            string command = "UPDATE Requests SET Status = 1 WHERE Id = " + gvMaintList.SelectedRow.Cells[1].Text + "";

            SqlConnection conn = new SqlConnection(conString);
            conn.Open();

            SqlCommand cmd = new SqlCommand(command, conn);
            cmd.ExecuteNonQuery();

            conn.Close();
            refreshTable();
        }

        protected void FilterButton_Clicked(object sender, EventArgs e)
        {
            refreshTable();
        }
    }
}