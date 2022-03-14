using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Marks : System.Web.UI.Page
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
            GetMarks();
        }
    }

    private void GetMarks()
    {
        DataTable dt = fn.Fetch(@"select Row_NUMBER() over(order by (select 1)) as [Sr.No],e.ExamId, e.ClassId, c.ClassName, e.SubjectId, s.SubjectName,e.RollNo,e.TotalMarks,e.outofMarks,e.ExamType,e.ExamDate
                                   from Exam e inner join Class c on e.ClassId = c.ClassId inner join Subjects s on e.SubjectId = s.SubjectId");
        GridView1.DataSource = dt;
        GridView1.DataBind();
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

        DataTable dtR = fn.Fetch("Select * from Student where ClassId = '" + ClassId + "'");
        ddlRoll.DataSource = dtR;
        ddlRoll.DataTextField = "RollNo";
        ddlRoll.DataValueField = "StudentId";
        ddlRoll.DataBind();
        ddlRoll.Items.Insert(0, "Select Subjects");
        




    }


    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            string ClassId = ddlClass.SelectedValue;
            string SubjectId = ddlSubject.SelectedValue;
            string RollNumber = ddlRoll.SelectedItem.Text.Trim();
            string StudentMarks = txtStudentMarks.Text.Trim();
            string OutOfMarks = txtOutOfMarks.Text.Trim();
            string ExamType = ddlExamType.SelectedValue;
            string ExamDate = txtExamDate.Text.Trim();
            DataTable dt = fn.Fetch("select * from Exam where ClassId = '" + ClassId + "' and SubjectId = '" + SubjectId + "' and RollNo = '" + RollNumber + "' ");
                if (dt.Rows.Count == 0)
                {
                    string query = "Insert into Exam Values('" + ClassId + "','" + SubjectId + "','" + RollNumber + "', '" + StudentMarks + "','" + OutOfMarks + "', '"+ ExamType +"','"+ ExamDate +"')";
                    fn.Query(query);
                    lblmsg.Text = "Inserted Succesffully!";
                    lblmsg.CssClass = "alert alert-success";
                    ddlClass.SelectedIndex = 0;
                    ddlSubject.SelectedIndex = 0;
                    ddlRoll.SelectedIndex = 0;
                    txtStudentMarks.Text = string.Empty;
                    txtOutOfMarks.Text = string.Empty;
                    ddlExamType.SelectedIndex = 0;
                    txtExamDate.Text = string.Empty;
                    GetMarks();
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
        GetMarks();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GetMarks();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        GetMarks();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int ExamId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string ClassId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[2].FindControl("ddlClassGV")).SelectedValue;
            string SubjectId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[2].FindControl("ddlSubjectGV")).SelectedValue;
            string ddlRollNo = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[0].FindControl("dllRollGV")).SelectedItem.Text.Trim();
            string ddlExamType = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[0].FindControl("ddlExamTypeGV")).SelectedItem.Text.Trim();


            //string RollNo = (row.FindControl("txtRollNumberGV") as TextBox).Text.Trim();
          
            string StudentMarks = (row.FindControl("txtStudentMarksGV") as TextBox).Text.Trim();
            string OutOfMarks = (row.FindControl("txtOutOfMarksGV") as TextBox).Text.Trim();
            string ExamDate = (row.FindControl("txtExamDateGV") as TextBox).Text.Trim();
            fn.Query("Update Exam set ClassId = '" + ClassId + "', SubjectId = '" + SubjectId
                        + "', RollNo = '" + ddlRollNo + "',TotalMarks = '" + StudentMarks + "', outofMarks = '" + OutOfMarks + "', ExamType = '"+ddlExamType+"', ExamDate = '"+ExamDate+"' where ExamId = '" + ExamId + "'");
            lblmsg.Text = "Record Updated Succesffully!";
            lblmsg.CssClass = "alert alert-success";
            GridView1.EditIndex = -1;
            GetMarks();
        }

        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");

        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if ((e.Row.RowState & DataControlRowState.Edit) > 0)
        {
            DropDownList ddlClass = (DropDownList)e.Row.FindControl("ddlClassGV");
            DropDownList ddlSubject = (DropDownList)e.Row.FindControl("ddlSubjectGV");
            DropDownList ddlRollNo = (DropDownList)e.Row.FindControl("dllRollGV");
            DataTable dt = fn.Fetch("select * from Subjects where ClassId = '" + ddlClass.SelectedValue + "'");
            ddlSubject.DataSource = dt;
            ddlSubject.DataTextField = "SubjectName";
            ddlSubject.DataValueField = "SubjectId";
            ddlSubject.DataBind();
            ddlSubject.Items.Insert(0, "select Subject");
            string SelectedSubject = DataBinder.Eval(e.Row.DataItem, "SubjectName").ToString();
            ddlSubject.Items.FindByText(SelectedSubject).Selected = true;

            DataTable dtR = fn.Fetch("select * from Student where ClassId = '" + ddlClass.SelectedValue + "'");
            ddlRollNo.DataSource = dtR;
            ddlRollNo.DataTextField = "RollNo";
            ddlRollNo.DataValueField = "StudentId";
            ddlRollNo.DataBind();
            ddlRollNo.Items.Insert(0, "select Roll Number");
            string SelectedRoll = DataBinder.Eval(e.Row.DataItem, "RollNo").ToString();
            ddlRollNo.Items.FindByText(SelectedRoll).Selected = true;


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

                
               DropDownList ddlRollNoGV = (DropDownList)row.FindControl("dllRollGV");
               DataTable dtR = fn.Fetch("select * from Student where ClassId = '" + ddlClassSelected.SelectedValue + "'");
               ddlRollNoGV.DataSource = dtR;
               ddlRollNoGV.DataTextField = "RollNo";
               ddlRollNoGV.DataValueField = "StudentId";
               ddlRollNoGV.DataBind();
             

            }
            
        }
    }
    
}