using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Home : System.Web.UI.MasterPage
{
    static bool girili;
    
    protected void loginin_logout()
    {

        //string curPage = HttpContext.Current.Request.Url.AbsolutePath.ToString();
        //if (curPage == "/Home.aspx") {  }
        //if (curPage == "/Profil.aspx") {anamenu.Visible=false; profil.Visible = true; }
        loginin_logout();

        if (girili == true)
        {
            uye_giris_buttons.Visible = false;
            profil.Visible = true;
        }
        else
        {
            uye_giris_buttons.Visible = true;
            profil.Visible = false;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        loginin_logout();
    }
    protected void kayit_ol_Click(object sender, EventArgs e)
    {
        Response.Redirect("SignUp.aspx");
    }
    protected void giris_yap_Click(object sender, EventArgs e)
    {

        string connectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();

        DataTable userTable = new DataTable();
        if (connection.State == ConnectionState.Open)
        {

            SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM [dbo].[User]", connection);
            adapter.Fill(userTable);
            try { 
                for (int i = 0; i < userTable.Rows.Count; i++)
                {
                    if (kullanici_adi.Text.ToString() == (string)userTable.Rows[i]["Username"] && parola.Text.ToString() == (string)userTable.Rows[i]["UserPassword"])
                    { 
                        Session.Add("kullaniciID", userTable.Rows[i]["UserID"]);
                        Session.Add("kullaciniAdi", userTable.Rows[i]["Username"]);
                        Session.Add("kullaniciTur", userTable.Rows[i]["UserType"]);
                        Session.Add("isim", userTable.Rows[i]["Name"]);
                        Session.Add("soyisim", userTable.Rows[i]["Surname"]);
                        Session.Add("email", userTable.Rows[i]["Email"]);
                        girili = true;
                        Session.Timeout = 30; //x min timeout

                        Response.Redirect("Home.aspx");
                    }
                }
            }
            catch(Exception ex)
            {
                sonuc.Text = ex.ToString();
            }
        }
        connection.Close();
    }
    protected void ilan_ver_Click(object sender, EventArgs e)
    {
        Response.Redirect("Rent_A_Bike.aspx");
    }
    protected void userprofil_Click(object sender, EventArgs e)
    {
        Response.Redirect("Profil.aspx");

    }
    protected void cikis_Click(object sender, EventArgs e)
    {
        Session.Contents.RemoveAll();
        girili = false;
        Response.Redirect("Home.aspx");
    }
}