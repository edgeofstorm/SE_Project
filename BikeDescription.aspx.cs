using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Data.Common;
using System.Configuration;


/// <summary>
/// ACAYIP YANLIS BIKE LA USER BIRLESTIRME
/// TABLODAN TIKLAYINCA GELICEK BIKE DESRIPTION TABLODA TIKLANAN DEGERIN  ID SINI AL
/// </summary>
public partial class BikeDescription : System.Web.UI.Page
{
    string user="";
    int user2;
    string id = "";
    int UserID = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) { BindUser(); anno(); BindFeedback(); }

        if (Session["KullaniciID"] != null)
        {
            id = Session["KullaniciID"].ToString();
            UserID = Int32.Parse(id);
        }
        if(Session["Target"] != null)
        {
          
            user2 = Convert.ToInt32(Session["Target"]);
            Response.Write(user2);
        }
        if (Session["Target"] == null)
        {
            Response.Write("NULL");
        }
    }

    private void BindUser()
    {
        string conn = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conn))
        {
            con.Open();
            if (con.State == ConnectionState.Open)
            {
                SqlCommand cmd = new SqlCommand("select * from [User] WHERE UserID="+ Convert.ToInt32(Session["Target"]) +"", con);

                //SqlParameter param = new SqlParameter();
                //param.ParameterName = "@UserID";
                //param.Value = user2;
                //cmd.Parameters.Add(param);

                //cmd.Parameters.Add(new SqlParameter("@UserID", user2));
                //SqlCommand cmd = new SqlCommand("select * from [User] WHERE UserID = @ID", con);//where userid=3 veya session falan filan
                //cmd.Parameters.Add("@ID", SqlDbType.Int);
                //cmd.Parameters["@ID"].Value = user2;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        RepUser.DataSource = dt;
                        RepUser.DataBind();
                        //sessionla user bigisi al

                    }
                }
            
        }
    }
    private void anno()
    {

        string connectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();

        DataTable userTable = new DataTable();
        if (connection.State == ConnectionState.Open)
        {

            SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM [User] WHERE UserID ='" + Convert.ToInt32(Session["Target"]) + "'", connection);
            adapter.Fill(userTable);
           
                for (int i = 0; i < userTable.Rows.Count; i++)
                {
                    lblAnno.Text = userTable.Rows[i]["Annotation"].ToString();
                //user = userTable.Rows[i]["Username"].ToString();
                //Session.Add("username", userTable.Rows[i]["Username"]);
                

                //session userid bla bla
            }

        }
        connection.Close();
    }
    public void SaveBtnPass_Click(object sender,
                          EventArgs e)
    {
        int result = sendMessage();
        //if (result > 0)//popup cikar -> basariyla gonderildi
        //{
        //    lblStatus.Text = "TEMIZ";
        //    lblStatus.Visible = true;
        //}

    }
    private int sendMessage()
    {
        string us = Session["username"].ToString();
        int result=0;
        string connectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();

        if (connection.State == ConnectionState.Open)
        {
            //guncelle
            SqlCommand cmd = new SqlCommand("insert into [Message](TargetUsername,[Message],SendDate,SenderID) values('" + us +"','"+txtMessage.Text.Trim()+ "','5/1/2008 8:30:52 AM','"+UserID+"')", connection);//where target bilmem ne 
            result = cmd.ExecuteNonQuery();
        }
        connection.Close();
        return result;
    }
    private void BindFeedback()
    {

        string connectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();

        DataTable userTable = new DataTable();
        if (connection.State == ConnectionState.Open)
        {
            //view yap username ekle feedbacki kim yapmis sonra usernmae al
            SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM FeedbackScore WHERE BikeID ='" + Convert.ToInt32(Session["TargetBike"]) + "'", connection);
            adapter.Fill(userTable);

            for (int i = 0; i < userTable.Rows.Count; i++)
            {
                lblFeedback.Text = userTable.Rows[i]["FeedBackText"].ToString();
                lblUserFeedback.Text = userTable.Rows[i]["UserID"].ToString();
                lblFeedbackDate.Text = userTable.Rows[i]["date"].ToString();
                //Response.Write(lblFeedback.Text.ToString());

            }

        }
        connection.Close();
    }
}