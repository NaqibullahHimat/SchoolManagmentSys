using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Expense : System.Web.UI.Page
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
            GetExpanse();

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

    protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        string ClassId = ddlClass.SelectedValue;
        DataTable dt = fn.Fetch("Select * from Subjects where ClassId = '" + ClassId + "'");
        ddlSubject.DataSource = dt;
        ddlSubject.DataTextField = "SubjectName";
        ddlSubject.DataValueField = "SubjectId";
        ddlSubject.DataBind();
        ddlSubject.Items.Insert(0, "Select Subjects");

    }

    private void GetExpanse()
    {
        DataTable dt = fn.Fetch(@"select Row_NUMBER() over(order by (select 1)) as [Sr.No],e.ExpenseId, e.ClassId, c.ClassName, e.SubjectId, s.SubjectName,e.ChargeAmount
                                   from Expense e inner join Class c on e.ClassId = c.ClassId inner join Subjects s on e.SubjectId = s.SubjectId");
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            string ClassId = ddlClass.SelectedValue;
            string SubjectId = ddlSubject.SelectedValue;
            string ChargeAmt = txtExpenseAmt.Text.Trim();
            DataTable dt = fn.Fetch("select * from Expense where ClassId = '" + ClassId + "' and SubjectId = '" + SubjectId + "' or ChargeAmount = '" + ChargeAmt + "' ");
            if (dt.Rows.Count == 0)
            {
                string query = "Insert into Expense Values('" + ClassId + "','" + SubjectId + "','" + ChargeAmt + "')";
                fn.Query(query);
                lblmsg.Text = "Inserted Succesffully!";
                lblmsg.CssClass = "alert alert-success";
                ddlClass.SelectedIndex = 0;
                ddlSubject.SelectedIndex = 0;
                txtExpenseAmt.Text = string.Empty;
                GetExpanse();
            }
            else
            {
                lblmsg.Text = "Enter <b>Data</b> Already Exists!";
                lblmsg.CssClass = "alert alert-danger";

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
        GetExpanse();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GetExpanse();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int ExpenseId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            fn.Query("Delete From Expense where ExpenseId = '" + ExpenseId + "'");
            lblmsg.Text = "Data Deleted Succesffully!";
            lblmsg.CssClass = "alert alert-success";
            GridView1.EditIndex = -1;
            GetExpanse();

        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");
        }
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        GetExpanse();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int ExpenseId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string ClassId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[2].FindControl("ddlClassGV")).SelectedValue;
            string SubjectId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[2].FindControl("ddlSubjectGV")).SelectedValue;
            string ChargeAmt = (row.FindControl("txtExpenseAmt") as TextBox).Text.Trim();
            fn.Query("Update Expense set ClassId = '" + ClassId + "', SubjectId = '" + SubjectId + "', ChargeAmount = '" + ChargeAmt + "' where ExpenseId = '" + ExpenseId + "'");
            lblmsg.Text = "Record Updated Succesffully!";
            lblmsg.CssClass = "alert alert-success";
            GridView1.EditIndex = -1;
            GetExpanse();
        }

        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");

        }
    }


    protected void ddlClassGV_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddlClassSelected = (DropDownList)sender;
        GridViewRow row = (GridViewRow)ddlClassSelected.NamingContainer;
        if (row != null)
        {
            if ((row.RowState & DataControlRowState.Edit) > 0)
            {
                DropDownList ddlSubjectGV = (DropDownList)row.FindControl("ddlSubjectGV");
                DataTable dt = fn.Fetch("select * from Subjects where ClassId = '" + ddlClassSelected.SelectedValue + "'");
                ddlSubjectGV.DataSource = dt;
                ddlSubjectGV.DataTextField = "SubjectName";
                ddlSubjectGV.DataValueField = "SubjectId";
                ddlSubjectGV.DataBind();
            }
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if((e.Row.RowState & DataControlRowState.Edit) > 0)
            {
                DropDownList ddlClass = (DropDownList)e.Row.FindControl("ddlClassGV");
                DropDownList ddlSubject = (DropDownList)e.Row.FindControl("ddlSubjectGV");
                DataTable dt = fn.Fetch("select * from Subjects where ClassId = '" + ddlClass.SelectedValue + "'");
                ddlSubject.DataSource = dt;
                ddlSubject.DataTextField = "SubjectName";
                ddlSubject.DataValueField = "SubjectId";
                ddlSubject.DataBind();
                ddlSubject.Items.Insert(0, "select Subject");
                string SelectedSubject = DataBinder.Eval(e.Row.DataItem, "SubjectName").ToString();
                ddlSubject.Items.FindByText(SelectedSubject).Selected = true;

            }
        }
    }

