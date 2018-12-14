using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Grade_Calculator_Final
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        int Count
        {
            get { return (int)Session["Count"]; }
            set { Session["Count"] = value; }
        }

        protected void Btn_Click(object sender, EventArgs e)
        {
            Button button = sender as Button;
            foreach (TableRow Row in mainTable.Rows)
            {
                if (!Row.Visible)
                {
                    for (int i = 0; i < 4; i++)
                    {
                        if (Row.Cells[i].Controls[0] as TextBox != null)
                            ((TextBox)Row.Cells[i].Controls[0]).Text = string.Empty;
                    }
                    Row.Visible = true;
                    Count++;
                    return;
                }
            }
        }
        protected void Calculate(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

            }
            else
            {

            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Count = 5;
                int counter = 0;
                foreach (TableRow Row in mainTable.Rows)
                {
                    if (counter > Count)
                    {
                        break;
                    }
                    else if (!Row.Visible)
                    {
                        Row.Visible = true;
                        counter++;
                    }
                }
            }
            else
            {
                //MakeTables();
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            btn.Parent.Parent.Visible = false;
            Count--;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string Query = "INSERT INTO Classes (Course, Classes) VALUES ('";
            Dictionary<string, string> Data = new Dictionary<string, string>();
            List<string> Classes = new List<string>();
            for (int k = 0; k < mainTable.Rows.Count; k++)
            {
                for (int i = 0; i < mainTable.Rows[k].Cells.Count; i++)
                {
                    foreach (TextBox a in mainTable.Rows[k].Cells[i].Controls.OfType<TextBox>())
                    {
                        switch (i)
                        {
                            case 0:
                                Data.Add("@course" + k, a.Text);
                                Classes.Add("@course" + k);
                                break;
                            case 1:
                                Data.Add("@hours" + k, a.Text);
                                Classes.Add("@hours" + k);
                                break;
                        }
                    }
                }
            }
            string joinMerge = string.Join(" \n ", Classes);
            Query += joinMerge + "')";

            using (SqlConnection Client = new SqlConnection(SqlDataSource1.ConnectionString))
            {
                Client.Open();
                using (SqlCommand Cmd = new SqlCommand(Query, Client))
                {
                    foreach (KeyValuePair<string, string> value in Data)
                    {
                        Cmd.Parameters.AddWithValue(value.Key, value.Value);
                    }
                    Cmd.ExecuteNonQuery();
                }
            }
        }
    }
}