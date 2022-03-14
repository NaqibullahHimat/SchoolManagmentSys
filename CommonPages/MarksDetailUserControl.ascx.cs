using SchoolManagmentSystem.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CommonPages_MarksDetailUserControl : System.Web.UI.UserControl
{
    CommonFn.CommonFnx fn = new CommonFn.CommonFnx();
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["admin"] == null)
        //{
        //    Response.Redirect("../Login.aspx");
        //}

        if (!IsPostBack)
        {
            GetClass();
            GetMarks();
        }
    }

    private void GetMarks()
    {
        DataTable dt = fn.Fetch(@"select ROW_NUMBER() Over(ORDER BY(Select 1)) as [Sr.No], e.ExamId, c.ClassId, c.ClassName, e.SubjectId, s.SubjectName, 
                                       e.RollNo, e.TotalMarks, e.outofMarks From Exam e inner join Class c on e.ClassId = c.ClassId 
                                        inner join Subjects s on s.SubjectId = e.SubjectId");
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
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            string ClassId = ddlClass.SelectedValue;
            string RollNumber = txtRoll.Text.Trim();
            DataTable dt = fn.Fetch(@"select ROW_NUMBER() Over(ORDER BY(Select 1)) as [Sr.No], e.ExamId, c.ClassId, c.ClassName, e.SubjectId, s.SubjectName, 
                                       e.RollNo, e.TotalMarks, e.outofMarks From Exam e inner join Class c on e.ClassId = c.ClassId 
                                        inner join Subjects s on s.SubjectId = e.SubjectId
                                         where e.ClassId = '" + ClassId + "' and e.RollNo = '" + RollNumber + "'");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            throw;
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;

    }
}