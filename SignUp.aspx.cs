using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class SignUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SignIn_Click(object sender, EventArgs e)
    {
        var connectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();


        //int ceptelnoInt = 0; Int64.TryParse(ceptelno.Text, out ceptelnoInt);
        //int IDInt = 0; Int64.TryParse(tcno.Text, out IDInt);
        string queryInsert = "INSERT INTO [dbo].[User]([Username],[UserPassword],[UserType],[Name],[Surname],[Email],[Phone],[Address],[BDate],[IBAN],[UserPicture],[Annotation],[IDNumber])";
        try { 
            if (connection.State == ConnectionState.Open && sozlesme.Checked)
            {
                string queryValues = " VALUES('" + kullanici_adi.Text + "','" + parola.Text + "'," + tur.SelectedValue + ",'" + isim.Text + "','" + soyisim.Text + "','" + email.Text + "','" + ceptelno.Text + "','" + adres.Text + "','" + dogum_tarihi.Text + "','" + IBAN.Text + "',NULL,NULL,'" + tcno.Text + "')";
                string query = queryInsert + queryValues;
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.ExecuteNonQuery();
            }
            else
            {
                errorbox.Text = "Başarıyla kayıt olunmadı.";
            }
        }
        catch(Exception ex)
        {
            Response.Write(ex);
        }
        errorbox.Text = "Başarıyla kayıt olundu.";
        connection.Close();
    }
}
