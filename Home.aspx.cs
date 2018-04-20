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


public partial class Home : System.Web.UI.Page
{
    int userID;
    int BikeID;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindBikes();
        }
    }
    private void BindBikes()
    {
        string conn = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conn))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Bike WHERE Availability='1'", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    RepBikes.DataSource = dt;
                    RepBikes.DataBind();
                }
            }
        }
    }
    public void BikeView_Click(object sender,
                              EventArgs e)
    {
        Response.Redirect("BikeDescription.aspx");

    }

    //protected void RepBikes_ItemCommand(object source, RepeaterCommandEventArgs e)
    //{
    //    RepBikes.
    //}

    protected void RepBikes_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "ImageClick")
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
            string OwnerID = commandArgs[0];
            string Bid = commandArgs[1];

            Response.Write("tikladin");
            userID = Convert.ToInt32(OwnerID);
            BikeID = Convert.ToInt32(Bid);
            //Response.Write(userID);
            //Do something
            //if (Session["Target"] != null)
            //{
            //    Session.Contents.RemoveAll();
            //}
            //else
            //{
            Session.Add("Target", userID);
            Session.Add("TargetBike", BikeID);
            //}
            Response.Write(Convert.ToInt32(Session["TargetBike"]));
            Response.Redirect("BikeDescription.aspx");
        }
    }
}