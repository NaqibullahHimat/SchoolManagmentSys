using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Loginandlogout_Login : System.Web.UI.Page
{
    SchoolManagmentSystem.App_Code.CommonFn.CommonFnx fn = new SchoolManagmentSystem.App_Code.CommonFn.CommonFnx(); 
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string Email = inputEmail.Value.Trim();
        string Password = inputPassword.Value.Trim();
        DataTable dt = fn.Fetch("select * from Teacher where Email = '" + Email + "'and Password = '" + Password + "'");
        if(Email == "Admin" && Password == "123")
        {
            Session["admin"] = Email;
            Response.Redirect("Admin/AdminHome.aspx");
        }
        else if(dt.Rows.Count > 0)
        {
            Session["Staff"] = Email;
            Response.Redirect("Teacher/TeacherHome.aspx");
        }
        else
        {
            lblMsg.Text = "login Failed.";
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
    }
}