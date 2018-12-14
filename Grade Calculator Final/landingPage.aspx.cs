using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GPACalculator
{
    public partial class landingPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLoad_Click(object sender, EventArgs e)
        {
            Response.Redirect("CalculatorForm.aspx?id=" + txtCourseAmt.Text + "&custom=true", false);
        }

        protected void btnDroplist_Click(object sender, EventArgs e)
        {
            Response.Redirect("CalculatorForm.aspx?id=" + courseDDL.Text + "&custom=false", false);
        }
    }
}