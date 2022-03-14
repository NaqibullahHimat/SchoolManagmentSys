using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Teacher : System.Web.UI.Page
{
    SchoolManagmentSystem.App_Code.CommonFn.CommonFnx fn = new SchoolManagmentSystem.App_Code.CommonFn.CommonFnx();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("../Login.aspx");
        }

        if(!IsPostBack)
        {
            GetTeacher();
        }
    }

    private void GetTeacher()
    {
        DataTable dt = fn.Fetch(@"select Row_Number() over(order by (select 1)) as [Sr.No], TeacherId, [Name], DOB, JoiningD, Gender, Mobile, 
                                Email, [Address], [Password] from Teacher");
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {

            string path;
            if (photo.HasFile)
                photo.SaveAs(HttpContext.Current.Request.PhysicalApplicationPath + "TeacherPhoto/" + photo.FileName);
            path = photo.FileName;

            if(ddlGender.SelectedValue != "0")
            {
                string email = txtEmail.Text.Trim();
                DataTable dt = fn.Fetch("Select * from Teacher where Email = '" + email + "' ");
                if (dt.Rows.Count == 0) 
                {
                    string query = "Insert into Teacher values('" + txtName.Text.Trim() + "','" + txtDOB.Text.Trim() + "','" + txtJD.Text.Trim() + "','" +
                    ddlGender.SelectedValue + "', '" + txtMobile.Text.Trim() + "','" + ddlQu.SelectedValue + "','" + txtEmail.Text.Trim() + "','" +
                    txtPassword.Text.Trim() + "','" + txtE.Text.Trim() + "','" + txtAddress.Text.Trim() + "','" + path + "')";
                    fn.Query(query);
                    lblmsg.Text = "Inserted Succesffully!";
                    lblmsg.CssClass = "alert alert-success";
                    ddlGender.SelectedIndex = 0;
                    txtName.Text = string.Empty;
                    txtDOB.Text = string.Empty;
                    txtMobile.Text = string.Empty;
                    txtEmail.Text = string.Empty;
                    txtAddress.Text = string.Empty;
                    txtPassword.Text = string.Empty;
                    txtJD.Text = string.Empty;
                    ddlQu.SelectedIndex = 0;
                    txtE.Text = string.Empty;
                    GetTeacher();
                }
                else
                {
                    lblmsg.Text = "Enter <b>'" + email + "'</b>! already exists";
                    lblmsg.CssClass = "alert alert-danger";
                    
                }
            }
            else
            {
                lblmsg.Text = "Gender is Required";
                lblmsg.CssClass = "alert alert-danger";
                
            }
        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GetTeacher();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GetTeacher();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int TeacherId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            fn.Query("Delete From Teacher where TeacherId = '" + TeacherId + "'");
            lblmsg.Text = "Teacher Deleted Succesffully!";
            lblmsg.CssClass = "alert alert-success";
            GridView1.EditIndex = -1;
            GetTeacher();

        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");
        }

    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        GetTeacher();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int TeacherId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string Name = (row.FindControl("txtName") as TextBox).Text;
            string Mobile = (row.FindControl("txtMobile") as TextBox).Text;
            string Password = (row.FindControl("txtPassword") as TextBox).Text;
            string Address = (row.FindControl("txtAddress") as TextBox).Text;
            fn.Query("Update Teacher set Name = '" + Name.Trim() + "', Mobile = '" + Mobile.Trim() + "', Address = '" + Address.Trim() + "', Password = '" + Password.Trim() + "' where TeacherId = '" + TeacherId + "'");
            lblmsg.Text = "Teacher Updated Succesffully!";
            lblmsg.CssClass = "alert alert-success";
            GridView1.EditIndex = -1;
            GetTeacher();

        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");

        }
    }
}