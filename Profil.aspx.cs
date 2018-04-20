using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
public partial class Profil : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            BindFav();
            BindMessage();
            //ViewState["postids"] = System.Guid.NewGuid().ToString();
            //Session["postid"] = ViewState["postids"].ToString();
        //    if (Session["KullaniciID"] != null)
        //    {
        //        id = Session["KullaniciID"].ToString();
        //        Response.Write(id);
        //        UserID = Int32.Parse(id);
        //        Response.Write(UserID);
        //    }
        //}
        //else
        //{
            //if (ViewState["postids"].ToString() != Session["postid"].ToString())
            //{
            //    IsPageRefresh = true;
            //}
            //Session["postid"] = System.Guid.NewGuid().ToString();
            //ViewState["postids"] = Session["postid"].ToString();
        }
        //if(Session["KullaniciID"] != null)
        //{
        //    id = Session["KullaniciID"].ToString();
        //    Response.Write(id);
        //    UserID = Int32.Parse(id);
        //    Response.Write(UserID);   
        //}
    }

    private void BindFav()
    {
        string conn = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        using(SqlConnection con =new SqlConnection(conn))
        { 
            using (SqlCommand cmd = new SqlCommand("select * from Bike WHERE OwnerID = '" + Convert.ToInt32(Session["KullaniciID"]) + "' ", con))
            {
                using(SqlDataAdapter sda=new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    RepIlan.DataSource = dt;
                    RepIlan.DataBind();
                }
            }
        }
    }
    private void BindMessage()
    {
        string conn = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conn))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Message  WHERE TargetID ='" + Convert.ToInt32(Session["KullaniciID"]) + "'", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    RepMessage.DataSource = dt;
                    RepMessage.DataBind();
                    
                }
            }
        }
    }
    private int updateUser()//will take userID as param
    {
        int res = 0;
        string conn = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conn))
        {
            con.Open();
                if (con.State == ConnectionState.Open) {
                using (SqlCommand cmd = new SqlCommand("UPDATE [User] SET Name='" + NameInput.Text.Trim() + "' , Surname='" + SurnameInput.Text.Trim() + "', Phone='" + PhoneInput.Text.Trim() + "', Address='" + AddressInput.Text.Trim() + "', IDNumber='" + TCInput.Text.Trim() + "',IBAN='" + IBANInput.Text.Trim() + "', Annotation='" + AnnotationInput.Text.Trim() + "' WHERE UserID='" + Convert.ToInt32(Session["KullaniciID"]) + "'", con))
                {
                    res = cmd.ExecuteNonQuery();
                   
                }
            }
            return res;
        }

    }
    private int updateUserPw()//will take userID as param
    {
        int res = 0;
        string conn = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conn))
        {
            SqlDataAdapter sda = new SqlDataAdapter("select UserPassword from [User] where UserID='" + Convert.ToInt32(Session["KullaniciID"]) + "' and UserPassword='"+txtOldPw.Text.Trim()+"'", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count.ToString() == "1")
            {
                if (txtPw.Text.ToString() == txtPwControl.Text.ToString())
                {
                    con.Open();
                    if (con.State == ConnectionState.Open)
                    {
                        SqlCommand cmd = new SqlCommand("UPDATE [User] SET UserPassword='" + txtPwControl.Text.Trim() + "' WHERE UserID='" + Convert.ToInt32(Session["KullaniciID"]) + "'", con);
                        res = cmd.ExecuteNonQuery();
                        lblPwStatus.Text = "successfully updated.";
                        lblPwStatus.Visible = true;
                    }
                }
                else
                {
                    lblPwStatus.Text = "Passwords not matching.Please make sure you enter same pws";
                    lblPwStatus.Visible = true;
                }
            }
            else
            {
                lblPwStatus.Text = "your current pw is wrong.Please try again";
                lblPwStatus.Visible = true;
            }
           
        }
        return res;
    }

    public void SaveBtn_Click(object sender,
                           EventArgs e)
    {
       int result= updateUser();
        if (result > 0)
        {
            lblStatus.Text = "TEMIZ";
            lblStatus.Visible = true;
        }

    }
    public void SaveBtnPass_Click(object sender,
                          EventArgs e)
    {
          int result = updateUserPw();
    }
    protected void RepIlan_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }
    protected override void OnPreRender(EventArgs e)
    {
        ViewState["update"] = Session["update"];
    }
}