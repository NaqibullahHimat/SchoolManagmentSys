using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace SchoolManagmentSystem.App_Code
{ 
/// <summary>
/// Summary description for CommonFn
/// </summary>
public class CommonFn
{
    
	public class CommonFnx
	{
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Schoolcs"].ConnectionString);

            public void Query(string query)
            {
                if(con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(query,con);
                cmd.ExecuteNonQuery();
                con.Close();
            }

            public DataTable Fetch(string query)
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                return dt;
            }


		//
		// TODO: Add constructor logic here
		//
	}
}
}