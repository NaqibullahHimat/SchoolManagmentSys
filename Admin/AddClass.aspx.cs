using SchoolManagmentSystem.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Admin_AddClass : System.Web.UI.Page
{
    CommonFn.CommonFnx fn = new CommonFn.CommonFnx();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["admin"] == null)
        {
            Response.Redirect("../Login.aspx");
        }

        if (!IsPostBack)
        {
            GetClass();
        }

        GetClass();
    } 

    private void GetClass()
    {
        DataTable dt = fn.Fetch("select Row_NUMBER() over(order by (select 1)) as [Sr.No], ClassId, ClassName , Category from Class");
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

        protected void btnAdd_Click1(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = fn.Fetch("select * from Class where ClassName = '" + txtClass.Text.Trim() + "' and Category = '"+ ddlCCategory.SelectedValue +"'");
                if (dt.Rows.Count == 0)
                {
                    string query = "Insert into Class Values('" + txtClass.Text.Trim() + "','"+ ddlCCategory.SelectedValue +"')";
                    fn.Query(query);
                    lblmsg.Text = "Inserted Succesffully!";
                    lblmsg.CssClass = "alert alert-success";
                    txtClass.Text = string.Empty;
                    GetClass();
                }
                else
                {
                    lblmsg.Text = "Enter Class Already Exists!";
                    lblmsg.CssClass = "alert alert-danger";
                    txtClass.Text = string.Empty;
                }
            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetClass();
        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetClass();
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetClass();
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int cId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string ClassName = (row.FindControl("txtClassEdit") as TextBox).Text;
                string Category = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[2].FindControl("ddlCCategoryG")).SelectedValue;
                fn.Query("Update Class set ClassName = '" + ClassName + "' , Category = '" + Category + "' where ClassId = '" + cId + "'");
                lblmsg.Text = "Class Updated Succesffully!";
                lblmsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetClass();
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
}

