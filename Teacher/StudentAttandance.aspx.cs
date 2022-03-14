using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Teacher_StudentAttandance : System.Web.UI.Page
{
    SchoolManagmentSystem.App_Code.CommonFn.CommonFnx fn = new SchoolManagmentSystem.App_Code.CommonFn.CommonFnx();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["staff"] == null)
        {
            Response.Redirect("../Login.aspx");
        }

        if (!IsPostBack)
        {
            GetClass();
            btnMarkAttendance.Visible = false;
           

        }
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        lblTime.Text = DateTime.Now.ToString();
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


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        DataTable dt = fn.Fetch(@"select StudentId, RollNo, StudentName, Mobile from Student where ClassId = '"+ddlClass.SelectedValue+"'");
        GridView1.DataSource = dt;
        GridView1.DataBind();
        if (dt.Rows.Count >0)
        {
            btnMarkAttendance.Visible = true;

        }
        else
        {
            btnMarkAttendance.Visible = false;
        }
    
    }
    protected void btnMarkAttendance_Click(object sender, EventArgs e)
    {
        bool isTrue = false;
        foreach (GridViewRow row in GridView1.Rows)
        {
            string RollNumber = row.Cells[2].Text.Trim();

            RadioButton rb1 = (row.Cells[0].FindControl("RadioButton1") as RadioButton);
            RadioButton rb2 = (row.Cells[0].FindControl("RadioButton2") as RadioButton);
            int status = 0;
            if (rb1.Checked)
            {
                status = 1;
            }

            else if (rb2.Checked)
            {
                status = 0;
            }

            fn.Query("Insert into StudentAttendance values('" + ddlClass.SelectedValue + "','" + ddlSubject.SelectedValue + "','" + RollNumber + "','" + status + "','" + DateTime.Now.ToString("yyyy/MM/dd") + "' )");
            isTrue = true;
            

        }
        if(isTrue)
        {
            lblmsg.Text = "Inserted Succesffully!";
            lblmsg.CssClass = "alert alert-success";
        }
        else
        {
            lblmsg.Text = "Somthing went wrong!";
            lblmsg.CssClass = "alert alert-warning";
        }
    }
}