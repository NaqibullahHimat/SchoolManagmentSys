using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_FinanceMaster : System.Web.UI.Page
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
            GetFinanceMasterData();
            GetClass();
        }

        
        
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {


            if (ddlDuration.SelectedValue != "0")
            {
                DataTable dt = fn.Fetch("Select * from FinanceMaster where FinanceMasterType = '" + txtType.Text + "' and FinanceMasterAmount = '" + txtfeesAmount.Text + "' and FinanceMasterDuration = '"+ ddlDuration.SelectedValue +"' ");
                if (dt.Rows.Count == 0)
                {
                    string query = "Insert into FinanceMaster values('" + txtType.Text.Trim() + "','" + txtfeesAmount.Text.Trim() + "','" + ddlDuration.SelectedValue + "','"+ ddlClass.SelectedIndex+"')";
                    fn.Query(query);
                    lblmsg.Text = "Inserted Succesffully!";
                    lblmsg.CssClass = "alert alert-success";
                    txtType.Text = string.Empty;
                    txtfeesAmount.Text = string.Empty;
                    txtCategory.Text = string.Empty;
                    ddlDuration.SelectedIndex = 0;
                    GetFinanceMasterData();
                    GetClass();
                    
                }
                else
                {
                    lblmsg.Text = "Enter Data already exists!";
                    lblmsg.CssClass = "alert alert-danger";

                }
            }
            else
            {
                lblmsg.Text = "Duration is Required!";
                lblmsg.CssClass = "alert alert-danger";

            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");
        }
    }

    private void GetFinanceMasterData()
    {
        DataTable dt = fn.Fetch(@"select Row_Number() over(order by (select 1)) as [No], a.FinanceMasterId, a.FinanceMasterType, a.FinanceMasterAmount, a.FinanceMasterDuration , b.Category , b.ClassName  from FinanceMaster a inner join Class b on a.ClassId = b.ClassId");
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GetFinanceMasterData();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GetFinanceMasterData();
        GetClass();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        GetFinanceMasterData();
        GetClass();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int FinanceMasterId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string FinanceMasterType = (row.FindControl("txtType") as TextBox).Text;
            string Amount = (row.FindControl("txtfeesAmount") as TextBox).Text;
            string Duration = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[2].FindControl("ddlDuration")).SelectedValue;
            string ClassId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[3].FindControl("ddlClass")).SelectedValue;
            fn.Query("Update FinanceMaster set FinanceMasterType = '" + FinanceMasterType.Trim() + "', FinanceMasterAmount = '" + Amount.Trim() + "', FinanceMasterDuration = '" + Duration +"'");
            lblmsg.Text = "Student Updated Succesffully!";
            lblmsg.CssClass = "alert alert-success";
            GridView1.EditIndex = -1;
            GetFinanceMasterData();
            GetClass();
            

        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");

        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex == e.Row.RowIndex)
        {
            DropDownList ddlClassG = (DropDownList)e.Row.FindControl("ddlClassG");
            DropDownList ddlDuration = (DropDownList)e.Row.FindControl("ddlDuration");
            DataTable dt = fn.Fetch("select a.FinanceMasterId, a.FinanceMasterType, a.FinanceMasterAmount, a.FinanceMasterDuration , b.ClassName , b.ClassId from FinanceMaster a inner join Class b on a.ClassId = b.ClassId");
            ddlDuration.DataSource = dt;
            ddlDuration.DataTextField = "FinanceMasterDuration";
            ddlDuration.DataValueField = "FinanceMasterId";
            ddlDuration.DataBind();
            ddlDuration.Items.Insert(0, "select Duration");
            string SelectedDuration = DataBinder.Eval(e.Row.DataItem, "FinanceMasterDuration").ToString();
            ddlDuration.Items.FindByText(SelectedDuration).Selected = true;


            ddlClassG.DataSource = dt;
            ddlClassG.DataTextField = "ClassName";
            ddlClassG.DataValueField = "ClassId";
            ddlClassG.DataBind();
            ddlClassG.Items.Insert(0, "select Class");
            string SelectedClass = DataBinder.Eval(e.Row.DataItem, "ClassName").ToString();
            ddlClass.Items.FindByText(SelectedClass).Selected = true;
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

    protected void ddlClass_SelectedIndexChanged1(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Schoolcs"].ConnectionString);
        string query = "select Category from Class where ClassId = '"+ ddlClass.SelectedValue+"'";
        SqlCommand cmd = new SqlCommand(query, con);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            txtCategory.Text = dr.GetValue(0).ToString();
        }
        con.Close();
    }

    protected void ddlClassG_SelectedIndexChanged2(object sender, EventArgs e)
    {
        
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Schoolcs"].ConnectionString);
        string query = "select Category from Class where ClassId = '" + ddlClass.SelectedValue + "'";
        SqlCommand cmd = new SqlCommand(query, con);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            txtCategory.Text = dr.GetValue(0).ToString();
        }
        con.Close();
    }
    
    
    
}