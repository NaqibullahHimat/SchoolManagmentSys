using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SchoolManagmentSystem.App_Code;
using System.Data;

public partial class Admin_ClassFees : System.Web.UI.Page
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
            GetFees();
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
            DataTable dt = fn.Fetch("select * from Fees where ClassId = '" + ddlClass.SelectedItem.Value + "' ");
            if (dt.Rows.Count == 0)
            {
                string query = "Insert into Fees Values('" + ddlClass.SelectedItem.Value + "','" + txtFeeAmount.Text.Trim() + "')";
                fn.Query(query);
                lblmsg.Text = "Inserted Succesffully!";
                lblmsg.CssClass = "alert alert-success";
                ddlClass.SelectedIndex = 0;
                txtFeeAmount.Text = string.Empty;
                GetFees();
            }
            else
            {
                lblmsg.Text = "Enter Fees Already Exists For <b>'" + ClassVal + "'</b>!";
                lblmsg.CssClass = "alert alert-danger";
                txtFeeAmount.Text = string.Empty;
            }
                 }

            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        

    
    private void GetFees()
    {
        DataTable dt = fn.Fetch(@"Select Row_NUMBER() over(order by (select 1)) as [Sr.No],f.FeesId,f.ClassId, 
                                c.ClassName, f.FeesAmount from Fees f inner join Class c on c.ClassId = f.ClassId");
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GetFees();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GetFees();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int FeesId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            fn.Query("Delete From Fees where FeesId = '"+FeesId+"'");
            lblmsg.Text = "Fees Deleted Succesffully!";
            lblmsg.CssClass = "alert alert-success";
            GridView1.EditIndex = -1;
            GetFees();

        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");
        }
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        GetFees();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int FeesId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string FeeAmt = (row.FindControl("TextBox1") as TextBox).Text;
            fn.Query("Update Fees set FeesAmount = '" + FeeAmt.Trim() + "' where FeesId = '" + FeesId + "'");
            lblmsg.Text = "Fees Updated Succesffully!";
            lblmsg.CssClass = "alert alert-success";
            GridView1.EditIndex = -1;
            GetFees();

        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");

        }
    }
}
