using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Support : System.Web.UI.Page
{
    DateTime dateTime = DateTime.Today;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void send_ticket(object sender, EventArgs e)
    {
        var connectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();

        if (connection.State == ConnectionState.Open)
        {
            string query = "INSERT INTO [dbo].[Ticket]([TManagerID],[Email],[Subject],[Description],[Date],[category]) VALUES('" + email.Text + "','" + konu.Text + "','" + aciklama.Text + "','" + dateTime.ToShortDateString() + "','" + kategori.SelectedItem + "')";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.ExecuteNonQuery();
        }

        connection.Close();
    }
}