using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AdminHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("../Login.aspx");
        }

        GetStudents();
        GetTeachers();
        GetClasses();
    }

    private void GetStudents()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Schoolcs"].ConnectionString);
        string query = "select count(StudentId) from Student";
        SqlCommand cmd = new SqlCommand(query, con);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            lblNS.Text = dr.GetValue(0).ToString();
        }
        con.Close();
    }

    private void GetTeachers()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Schoolcs"].ConnectionString);
        string query = "select count(TeacherId) from Teacher";
        SqlCommand cmd = new SqlCommand(query, con);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            lblNT.Text = dr.GetValue(0).ToString();
        }
        con.Close();
    }

    private void GetClasses()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Schoolcs"].ConnectionString);
        string query = "select count(ClassId) from Class";
        SqlCommand cmd = new SqlCommand(query, con);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            lblNC.Text = dr.GetValue(0).ToString();
        }
        con.Close();
    }

}