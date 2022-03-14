using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_EmployeeAttendance : System.Web.UI.Page
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
            Attendance();
        }
    }

    private void Attendance()
    {
        DataTable dt = fn.Fetch("select TeacherId, Name, Mobile, Email from Teacher");
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void btnMarkAttendance_Click(object sender, EventArgs e)
    {
        foreach(GridViewRow row in GridView1.Rows )
        {
            int TeacherId = Convert.ToInt32(row.Cells[1].Text);

            RadioButton rb1 = (row.Cells[0].FindControl("RadioButton1") as RadioButton);
            RadioButton rb2 = (row.Cells[0].FindControl("RadioButton2") as RadioButton);
            int status = 0;
            if(rb1.Checked)
            {
                status = 1;
            }

            else if(rb2.Checked)
            {
                status = 0;
            }

            fn.Query("Insert into TeacherAttandence values('"+TeacherId+"','"+status+"','"+DateTime.Now.ToString("yyyy/MM/dd")+"' )");
            lblmsg.Text = "Inserted Succesffully!";
            lblmsg.CssClass = "alert alert-success";

        }
    }
   
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        lblTime.Text = DateTime.Now.ToString();
    }
}