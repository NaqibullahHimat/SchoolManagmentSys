using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SchoolManagmentSystem.App_Code;
using System.Data;

public partial class Admin_Subject : System.Web.UI.Page
{
     CommonFn.CommonFnx fn = new CommonFn.CommonFnx();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("../Login.aspx");
        }

        if (!IsPostBack)
        {
            GetClass();
            GetSubject();
        }
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
            string ClassVal = ddlClass.SelectedItem.Text;
            DataTable dt = fn.Fetch("select * from Subjects where ClassId = '" + ddlClass.SelectedItem.Value + "' and SubjectName = '"+txtSubject.Text.Trim()+"' ");
            if (dt.Rows.Count == 0)
            {
                string query = "Insert into Subjects Values('" + ddlClass.SelectedItem.Value + "','" + txtSubject.Text.Trim() + "')";
                fn.Query(query);
                lblmsg.Text = "Inserted Succesffully!";
                lblmsg.CssClass = "alert alert-success";
                ddlClass.SelectedIndex = 0;
                txtSubject.Text = string.Empty;
                GetSubject();
            }
            else
            {
                lblmsg.Text = "Enter Subject Already Exists For <b>'" + ClassVal + "'</b>!";
                lblmsg.CssClass = "alert alert-danger";
                txtSubject.Text = string.Empty;
            }
                 }

            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        

    
    private void GetSubject()
    {
        DataTable dt = fn.Fetch(@"Select Row_NUMBER() over(order by (select 1)) as [Sr.No],s.SubjectId,s.ClassId, 
                                c.ClassName, s.SubjectName from Subjects s inner join Class c on c.ClassId = s.ClassId");
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }     
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GetSubject();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        GetClass();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GetSubject();
    }

  
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int SubjectId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string ClassId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[2].FindControl("DropDownList1")).SelectedValue;
            string SubjectName = (row.FindControl("TextBox1") as TextBox).Text;
            fn.Query("Update Subjects set ClassId = '" + ClassId + "', SubjectName = '"+ SubjectName +"' where SubjectId = '" + SubjectId + "'");
            lblmsg.Text = "Subject Updated Succesffully!";
            lblmsg.CssClass = "alert alert-success";
            GridView1.EditIndex = -1;
            GetSubject();

        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");

        }
    }
}
