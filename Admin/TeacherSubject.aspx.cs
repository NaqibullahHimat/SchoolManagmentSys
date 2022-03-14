using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_TeacherSubject : System.Web.UI.Page
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
            GetClass();
            GetTeacher();
            GetTeacherSubject();
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

    private void GetTeacher()
    {
        DataTable dt = fn.Fetch("Select * from Teacher");
        ddlTeacher.DataSource = dt;
        ddlTeacher.DataTextField = "Name";
        ddlTeacher.DataValueField = "TeacherId";
        ddlTeacher.DataBind();
        ddlTeacher.Items.Insert(0, "Select Teacher");
    }


    private void GetTeacherSubject()
    {
        DataTable dt = fn.Fetch(@"select Row_NUMBER() over(order by (select 1)) as [Sr.No],ts.Id, ts.ClassId, c.ClassName, ts.SubjectId, s.SubjectName, 
                                    ts.TeacherId,t.Name from TeacherSubject ts inner join Class c on ts.ClassId = c.ClassId inner join Subjects s on ts.SubjectId = s.SubjectId 
                                    inner join Teacher t on ts.TeacherId = t.TeacherId");
        GridView1.DataSource = dt;
        GridView1.DataBind();
    } 

   protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        string ClassId = ddlClass.SelectedValue;
        DataTable dt = fn.Fetch("Select * from Subjects where ClassId = '"+ClassId+"'");
        ddlSubject.DataSource = dt;
        ddlSubject.DataTextField = "SubjectName";
        ddlSubject.DataValueField = "SubjectId";
        ddlSubject.DataBind();
        //ddlSubject.Items.Insert(0, "Select Subjects");

    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {

            string ClassId = ddlClass.SelectedValue;
            string SubjectId = ddlSubject.SelectedValue;
            string TeacherId = ddlTeacher.SelectedValue;
            DataTable dt = fn.Fetch("select * from TeacherSubject where ClassId = '" + ClassId + "' and SubjectId = '" + SubjectId + "' or TeacherId = '"+TeacherId+"' ");
            if (dt.Rows.Count == 0)
            {
                string query = "Insert into TeacherSubject Values('" + ClassId + "','" + SubjectId + "','" + TeacherId + "')";
                fn.Query(query);
                lblmsg.Text = "Inserted Succesffully!";
                lblmsg.CssClass = "alert alert-success";
                ddlClass.SelectedIndex = 0;
                ddlSubject.SelectedIndex = 0;
                ddlTeacher.SelectedIndex = 0;
                GetTeacherSubject();
            }
            else
            {
                lblmsg.Text = "Enter <b>Teacher Subject</b> Already Exists!";
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
        GetTeacherSubject();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GetTeacherSubject();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int TeacherSubjectId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            fn.Query("Delete From TeacherSubject where Id = '" + TeacherSubjectId + "'");
            lblmsg.Text = "Teacher Subject Deleted Succesffully!";
            lblmsg.CssClass = "alert alert-success";
            GridView1.EditIndex = -1;
            GetTeacherSubject();

        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");
        }
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        GetTeacherSubject();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int TeacherSubjectId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string ClassId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[2].FindControl("ddlClassGV")).SelectedValue;
            string SubjectId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[2].FindControl("ddlSubjectGV")).SelectedValue;
            string TeacherId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[2].FindControl("ddlTeacherGV")).SelectedValue;
            fn.Query("Update TeacherSubject set ClassId = '" + ClassId + "', SubjectId = '" + SubjectId + "',  TeacherId = '"+TeacherId+"' where Id = '" + TeacherSubjectId + "'");
            lblmsg.Text = "Record Updated Succesffully!";
            lblmsg.CssClass = "alert alert-success";
            GridView1.EditIndex = -1;
            GetTeacherSubject();
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
        if(row != null)
        {
            if((row.RowState & DataControlRowState.Edit) > 0)
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
        if(e.Row.RowType == DataControlRowType.DataRow)
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
}