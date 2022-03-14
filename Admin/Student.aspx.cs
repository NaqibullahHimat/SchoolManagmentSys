using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Student : System.Web.UI.Page
{
    SchoolManagmentSystem.App_Code.CommonFn.CommonFnx fn = new SchoolManagmentSystem.App_Code.CommonFn.CommonFnx(); 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("../Login.aspx");
        }

        if (!IsPostBack)
        {
            GetClass();
            GetStudent();
            GetRoll();
        }

        GetRoll();

    }

    private void GetRoll()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Schoolcs"].ConnectionString);
        string query = "select 'S' + CONVERT(varchar(50), count(StudentId)+1) from Student";
        SqlCommand cmd = new SqlCommand(query, con);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            txtRoll.Text = dr.GetValue(0).ToString();
        }
        con.Close();
    }

    private void GetClass()
    {
        DataTable dt = fn.Fetch("Select * from Class");
        ddlClass.DataSource = dt;
        ddlClass.DataTextField = "ClassName";
        ddlClass.DataValueField = "ClassId";
        ddlClass.DataBind();
        ddlClass.Items.Insert(0, "Select Class");
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            string path;
            if (photo.HasFile)
                photo.SaveAs(HttpContext.Current.Request.PhysicalApplicationPath + "StudentPhoto/" + photo.FileName);
            path = photo.FileName;

            string Document;
            if (Documents.HasFile)
                Documents.SaveAs(HttpContext.Current.Request.PhysicalApplicationPath + "StudentDocument/" + Documents.FileName);
            Document = Documents.FileName;


            if (ddlGender.SelectedValue != "0")
            {
                string RollNo = txtRoll.Text.Trim();
                DataTable dt = fn.Fetch("Select * from Student where ClassId = '"+ddlClass.SelectedValue+"' and RollNo = '" + RollNo + "' ");
                if (dt.Rows.Count == 0)
                {
                    string query = "Insert into Student values('" + txtName.Text.Trim() + "','" + txtFName.Text.Trim() + "','" + txtDOB.Text.Trim() + "','" + txtTazkira.Text.Trim() + "','" +
                    ddlGender.SelectedValue + "', '" + txtMobile.Text.Trim() + "','" + txtParentContact.Text.Trim() + "',' KBLB1" + DateTime.Today.Year.ToString() + txtRoll.Text.Trim() + "','" + ddlClass.SelectedValue + "','" + path + "', '" +
                    txtAddress.Text.Trim() + "', '"+ Document +"')";
                    fn.Query(query);
                    lblmsg.Text = "Inserted Succesffully!";
                    lblmsg.CssClass = "alert alert-success";
                    txtName.Text = string.Empty;
                    txtFName.Text = string.Empty;
                    txtDOB.Text = string.Empty;
                    txtTazkira.Text = string.Empty;
                    ddlGender.SelectedIndex = 0;
                    txtMobile.Text = string.Empty;
                    txtParentContact.Text = string.Empty;
                    txtRoll.Text = string.Empty;
                    ddlClass.SelectedIndex = 0;
                    txtAddress.Text = string.Empty;
                    GetStudent();
                }
                else
                {
                    lblmsg.Text = "Enter Roll No. <b>'" + RollNo + "'</b> already exists For Selected Class!";
                    lblmsg.CssClass = "alert alert-danger";

                }
            }
            else
            {
                lblmsg.Text = "Gender is Required";
                lblmsg.CssClass = "alert alert-danger";

            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");
        }
    }

    private void GetStudent()
    {
        DataTable dt = fn.Fetch(@"select Row_Number() over(order by (select 1)) as [Sr.No],s.StudentId, s.[StudentName], s.DOB, s.Gender, s.Mobile, 
                                s.RollNo, s.[Address], c.ClassId, c.ClassName from Student s inner join Class c on c.ClassId = s.ClassId");
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GetStudent();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GetStudent();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        GetStudent();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int StudentId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string Name = (row.FindControl("txtName") as TextBox).Text;
            string Mobile = (row.FindControl("txtMobile") as TextBox).Text;
            string RollNo = (row.FindControl("txtRollNo") as TextBox).Text;
            string Address = (row.FindControl("txtAddress") as TextBox).Text;
            string ClassId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[4].FindControl("ddlClass")).SelectedValue;
            fn.Query("Update Student set StudentName = '" + Name.Trim() + "', Mobile = '" + Mobile.Trim() + "', Address = '" + Address.Trim() + 
                     "', RollNo = '" + RollNo.Trim() + "', ClassId = '"+ ClassId +"' where StudentId = '" + StudentId + "'");
            lblmsg.Text = "Student Updated Succesffully!";
            lblmsg.CssClass = "alert alert-success";
            GridView1.EditIndex = -1;
            GetStudent();

        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");

        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex == e.Row.RowIndex)
        {
            
          DropDownList ddlClass = (DropDownList)e.Row.FindControl("ddlClass");
          DataTable dt = fn.Fetch("select * from Class");
          ddlClass.DataSource = dt;
          ddlClass.DataTextField = "ClassName";
          ddlClass.DataValueField = "ClassId";
          ddlClass.DataBind();
          ddlClass.Items.Insert(0, "select Class");
          string SelectedClass = DataBinder.Eval(e.Row.DataItem, "ClassName").ToString();
          ddlClass.Items.FindByText(SelectedClass).Selected = true;

            }
        }
    protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Schoolcs"].ConnectionString);
        //string qury = "select count(ClassId) from Student where ClassId = '" + ddlClass.SelectedItem.Text +"'";
        //SqlCommand cmd = new SqlCommand(qury,con);
        //SqlDataReader dr;
        //con.Open();
        //dr = cmd.ExecuteReader();

        //while(dr.Read())
        //{
        //    string name = (string)dr["name"].ToString();
        //    txtRoll.Text = name;
        //}        
    }
}
