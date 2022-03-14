using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CommonPages_StudentAttandenceUC : System.Web.UI.UserControl
{
    SchoolManagmentSystem.App_Code.CommonFn.CommonFnx fn = new SchoolManagmentSystem.App_Code.CommonFn.CommonFnx();
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["admin"] == null)
        //{
        //    Response.Redirect("../Login.aspx");
        //}

        if(!IsPostBack)
        { 
        GetClass();

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
    protected void btnCheckAttendance_Click(object sender, EventArgs e)
    {
        DataTable dt;
        DateTime date = Convert.ToDateTime(txtMonth.Text);

        if(ddlSubject.SelectedValue == "Select Subjects")
        {
            dt = fn.Fetch(@"select Row_NUMBER() over(order by (select 1)) as [Sr.No], s.StudentName,sa.[Status],sa.[Date] 
                                   from StudentAttendance sa inner join Student s on s.RollNo = sa.RollNo 
                                   where sa.ClassId = '" + ddlClass.SelectedValue + "' and sa.RollNo = '" + txtRollNo.Text.Trim() + "' and  DATEPART(YY,Date) = '" + date.Year + "' and DATEPART(M,Date) = '" + date.Month + "'");
        }
        else
        {
            dt = fn.Fetch(@"select Row_NUMBER() over(order by (select 1)) as [Sr.No], s.StudentName,sa.[Status],sa.[Date] 
                                   from StudentAttendance sa inner join Student s on s.RollNo = sa.RollNo and sa.SubjectId = '" + ddlSubject.SelectedValue+ "'" +
                                  "where sa.ClassId = '" + ddlClass.SelectedValue + "' and sa.RollNo = '" + txtRollNo.Text.Trim() + "' and  DATEPART(YY,Date) = '" + date.Year + "' and DATEPART(M,Date) = '" + date.Month + "'");
        }
        
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
}