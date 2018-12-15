using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace GPACalculator
{
    public partial class landingPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection Client = new SqlConnection(SqlDataSource1.ConnectionString))
            {
                Client.Open();
                using (SqlCommand Cmd = new SqlCommand(SqlDataSource1.SelectCommand, Client))
                {
                    using (var reader = Cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            courseDDL.Items.Add(reader.GetValue(0).ToString());
                        }
                    }
                }
            }
        }

        protected void btnLoad_Click(object sender, EventArgs e)
        {
            Response.Redirect("CalculatorForm.aspx?id=" + txtCourseAmt.Text, false);
        }

        protected void btnDroplist_Click(object sender, EventArgs e)
        {
            Response.Redirect("CalculatorForm.aspx?custom=" + courseDDL.Text, false);
        }
    }
}