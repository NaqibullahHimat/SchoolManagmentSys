using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ExpenseDetails : System.Web.UI.Page
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
            GetExpenseDetails();
        }
    }

    private void GetExpenseDetails()
    {
        DataTable dt = fn.Fetch(@"select Row_NUMBER() over(order by (select 1)) as [Sr.No],e.ExpenseId, e.ClassId, c.ClassName, e.SubjectId, s.SubjectName,e.ChargeAmount
                                   from Expense e inner join Class c on e.ClassId = c.ClassId inner join Subjects s on e.SubjectId = s.SubjectId");
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
}