using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_TeacherDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {

    }

    //protected void btnsearch_Click(object sender, EventArgs e)
    //{
    //    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Schoolcs"].ConnectionString);
    //    con.Open();
    //    SqlCommand comm = new SqlCommand("select * from Teacher where Name = '" + txtName.Text + "'", con);
    //    SqlDataReader srd = comm.ExecuteReader();
    //    while (srd.Read())
    //    {
    //        txtDOB.Text = Convert.ToDateTime(srd.GetValue(2)).ToString("dd/MM/yyyy");
    //        txtJD.Text = srd.GetValue(3).ToString();
    //        ddlGender.SelectedValue = srd.GetValue(4).ToString();
    //        txtMobile.Text = srd.GetValue(5).ToString();
    //        ddlQu.SelectedValue = srd.GetValue(6).ToString();
    //        txtEmail.Text = srd.GetValue(7).ToString();
    //        txtPassword.Text = srd.GetValue(8).ToString();
    //        txtE.Text = srd.GetValue(9).ToString();
    //        txtAddress.Text = srd.GetValue(10).ToString();

    //    }
    //    con.Close();
    //}
    protected void btnsearch_Click(object sender, EventArgs e)
    {

    }
}