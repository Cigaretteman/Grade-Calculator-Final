using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

namespace Grade_Calculator_Final
{
    public class ClassHolder
    {
        public int CreditScore { get; set; }
        public string GradeString { get; set; }
        public string ClassName { get; set; }
    }
    public partial class WebForm1 : System.Web.UI.Page
    {
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
                    return;
                }
            }
        }

        public struct SGrades
        {
            public int FilledCount;//amount of filled grades
            public int FilledHours;//amount of filled hours
            public int TotalCount;//total amount of grades
            public int UnfilledCount;//amount of missing grades
            public int QualityPoints;//amount of quality points the student has
            public int TotalHours;//total amount of course hours
            public int MissingHours;//missing hours for missing classes
            public double GPA;//student's current GPA
        }
        int[] GradeValues = new int[] { 1, 2, 3, 4 };
        List<ClassHolder> Unfilled = new List<ClassHolder>();
        List<string> ListItems = new List<string>();
        protected void Calculate(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                List<TextBox> gradeInputs = Session["gradeTextboxes"] as List<TextBox>;
                SGrades Grades = new SGrades
                {
                    FilledCount = 0,
                    FilledHours = 0,
                    TotalCount = 0,
                    UnfilledCount = 0,
                    QualityPoints = 0,
                    TotalHours = 0,
                    MissingHours = 0,
                    GPA = 0
                };
                int visibleRows = 0;
                //for loop o count every visible row
                for (int i = 1; i < mainTable.Rows.Count; i++)
                {
                    if (mainTable.Rows[i].Visible == true)
                    {
                        visibleRows++;
                    }
                }

                ///
                for (int k = 1; k < mainTable.Rows.Count; k++)
                {
                    if (mainTable.Rows[k].Visible == false)
                    {
                        continue;
                    }
                    List<TextBox> TextBoxes = new List<TextBox>();
                    for (int i = 0; i < mainTable.Rows[k].Cells.Count; i++)
                    {
                        foreach (TextBox TxtBox in mainTable.Rows[k].Cells[i].Controls.OfType<TextBox>())
                        {
                            TextBoxes.Add(TxtBox);
                        }
                    }
                    if (TextBoxes.Count() > 2)
                    {
                        if (TextBoxes[0].Text.Length <= 0)
                        {
                            lblGPAOut.Text = "Client side manipulation detected";
                            return;
                        }

                        if (!int.TryParse(TextBoxes[1].Text, out int Hours))
                        {
                            lblGPAOut.Text = "Client side manipulation detected";
                            return;
                        }
                        else
                        {
                            Grades.TotalHours += Hours;
                        }

                        if (TextBoxes[2].Text.Length > 0)
                        {
                            if (!int.TryParse(TextBoxes[2].Text, out int Grade))
                            {
                                lblGPAOut.Text = "Client side manipulation detected";
                                return;
                            }
                            else if (GradeValues.Contains(Grade = GetGrade(Grade)))
                            {
                                Grades.QualityPoints += (Grade * Hours);
                                Grades.FilledHours += Hours;
                                Grades.FilledCount++;
                            }
                            else if (Hours == 5)
                            {
                                ListItems.Add($"{TextBoxes[0].Text} has a grade lower than 50. You cannot have failing grades.");
                                ListItems.Add("Considering it never taken for calulations");
                                ListItems.Add(string.Empty);
                                Unfilled.Add(new ClassHolder
                                {
                                    ClassName = TextBoxes[0].Text,
                                    CreditScore = Hours
                                });
                                Grades.UnfilledCount++;
                                Grades.MissingHours += Hours;
                            }
                        }
                        else
                        {
                            Unfilled.Add(new ClassHolder
                            {
                                ClassName = TextBoxes[0].Text,
                                CreditScore = Hours
                            });
                            Grades.UnfilledCount++;
                            Grades.MissingHours += Hours;
                        }

                        Grades.TotalCount++;
                    }
                }
                //calculate GPA with method call
                Grades.GPA = (double)Grades.QualityPoints / Grades.FilledHours;
                if (Grades.UnfilledCount <= 0)
                {
                    return;
                }
                //calculate the student's missing quality points
                double QPneeded = ((Grades.TotalHours * 2) - Grades.QualityPoints);
                //output to label
                lblGPAOut.Text = Grades.GPA.ToString("0.00");

                Perm(Grades, QPneeded);
            }
            else
            {

            }
        }

        string[] StaticGrades = new string[] { "D", "C", "B", "A" };
        static int[] set = { 4, 3, 2, 1 };
        int k, n = 4;
        int[] buf;
        private void Perm(SGrades Grades, Double gpaNeeded)
        {
            //number of missing classes
            k = Grades.UnfilledCount;
            //array of length missing classes
            buf = new int[k];
            //instantiate list for the lowest grade possble to pass
            List<string> lowestGrade = new List<string>();
            if (k > 0)
            {
                //return list of lowestgrade
                List<string> lowest = rec(0, 0, Grades, gpaNeeded, lowestGrade);
                //check for if the student can pass the course
                if (listOut.Items.Count <= 0)
                {
                    listOut.Items.Add("No grades will make you pass, talk to your counselor about retaking courses");
                }

                listOut.Items.Add("");
                listOut.Items.Add("The Lowest grades you will need to pass in each course are:");

                //output the lowest grade possible in each course
                foreach (string a in lowest)
                {
                    listOut.Items.Add(a);
                }

                if (ListItems.Count > 0)
                {
                    listOut.Items.Add(string.Empty);
                    foreach (string item in ListItems)
                    {
                        listOut.Items.Add(item);
                    }
                }
            }
        }

        private List<string> rec(int ind, int begin, SGrades Grades, Double gpaNeeded, List<string> lowestGrade)
        {
            //loop for going through each grade value
            for (int i = begin; i < n; i++)
            {
                //adds the grade to the array
                buf[ind] = set[i];
                //check if loop is less than the missing grade count
                if (ind + 1 < k)
                {
                    //if yes call recursive function
                    rec(ind + 1, i, Grades, gpaNeeded, lowestGrade);

                }
                //else check quality point and output to listbox
                else
                {
                    double QualityPoints = 0;
                    //loop for adding up the amount of quality points in array buf
                    for (int idx = 0; idx < buf.Length; idx++)
                    {
                        QualityPoints += buf[idx] * Unfilled[idx].CreditScore;
                    }
                    //check if buf quality points is bigger than the quality points needed to pass the course
                    if ((QualityPoints) >= gpaNeeded)
                    {
                        List<string> SendingOut = new List<string>();
                        //loop through each value in array buff
                        foreach (int X in buf)
                        {
                            //add them to a list
                            SendingOut.Add(StaticGrades[X - 1]);
                        }
                        listOut.Items.Clear();
                        listOut.Items.Add("The lowest grades you will need to pass are:");
                        //output sendingout as a joined string
                        listOut.Items.Add(string.Join(",", SendingOut));
                        //clear lowest grade
                        lowestGrade.Clear();
                        //set each unfilled class name with its lowest possible grade
                        for (int index = 0; index < Unfilled.Count; index++)
                        {
                            lowestGrade.Add(Unfilled[index].ClassName + ":  " + SendingOut[index]);
                        }
                    }
                    //output for the amount of quality points in buf
                    //Console.WriteLine(QualityPoints);
                }
            }
            //returns the lowest grades output to the listbox
            return lowestGrade;
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    if (int.TryParse(Request.QueryString["id"], out int numOfTextboxes))
                    {
                        if (numOfTextboxes > 30)
                            numOfTextboxes = 30;
                        for (int i = 0; i <= numOfTextboxes; i++)
                        {
                            mainTable.Rows[i].Visible = true;
                        }
                        Session["table"] = mainTable;
                        return;
                    }
                    else
                    {
                        for (int i = 1; i < 5 + 1; i++)
                        {
                            mainTable.Rows[i].Visible = true;
                        }
                        Session["table"] = mainTable;
                        return;
                    }
                }
                else if (Request.QueryString["custom"] != null)
                {
                    SqlDataSource1.SelectCommand += "'" + Request.QueryString["custom"] + "'";
                    string Courses = string.Empty;
                    using (SqlConnection Client = new SqlConnection(SqlDataSource1.ConnectionString))
                    {
                        Client.Open();
                        using (SqlCommand Cmd = new SqlCommand(SqlDataSource1.SelectCommand, Client))
                        {
                            using (var reader = Cmd.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    Dictionary<string, string> row = new Dictionary<string, string>();
                                    for (int i = 0; i < reader.FieldCount; i++)
                                    {
                                        Courses = reader.GetString(i);
                                    }
                                }
                            }
                        }
                    }
                    string[] Tokens = Regex.Split(Courses, "\n"); // string.split MISSING????
                    if (Tokens.Length > 0)
                    {
                        int tableIndex = 1;
                        for (int i = 0; i < Tokens.Length; i += 2)
                        {
                            mainTable.Rows[tableIndex].Visible = true;
                            mainTable.Rows[tableIndex].Cells[0].Text = Tokens[i];
                            mainTable.Rows[tableIndex].Cells[1].Text = Tokens[(i) + 1];
                            tableIndex++;
                        }
                    }
                    Session["table"] = mainTable;
                }
            }
            else
            {
                mainTable = Session["table"] as Table;
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            btn.Parent.Parent.Visible = false;
            Session["table"] = mainTable;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            StringBuilder Query = new StringBuilder($"INSERT INTO Courses (CourseName, Classes) VALUES ('{CourseName.Text}','");
            Dictionary<string, string> Data = new Dictionary<string, string>();
            List<string> Classes = new List<string>();
            for (int k = 0; k < mainTable.Rows.Count; k++)
            {
                for (int i = 0; i < mainTable.Rows[k].Cells.Count; i++)
                {
                    if (mainTable.Rows[k].Visible)
                    {
                        foreach (TextBox a in mainTable.Rows[k].Cells[i].Controls.OfType<TextBox>())
                        {
                            switch (i)
                            {
                                case 0:
                                    Query.Append(a.Text + " \n ");
                                    break;
                                case 1:
                                    Query.Append(a.Text + " \n ");
                                    break;
                            }
                        }
                    }
                }
            }
            Query.Remove(Query.Length - 3, 3).Append("')");
            int rowsAff = 0;
            using (SqlConnection Client = new SqlConnection(SqlDataSource1.ConnectionString))
            {
                Client.Open();
                using (SqlCommand Cmd = new SqlCommand())
                {
                    Cmd.Connection = Client;
                    Cmd.CommandText = Query.ToString();
                    foreach (KeyValuePair<string, string> value in Data)
                    {
                        Cmd.Parameters.AddWithValue(value.Key, value.Value.ToString());
                    }
                    rowsAff = Cmd.ExecuteNonQuery();
                }
            }
            if (rowsAff == 0)
            {
                CourseName.Text = $"{CourseName.Text} already exists";
            }
            else
            {
                CourseName.Text = "Created";
            }
        }
        public static int GetGrade(int Grade)
        {
            if (Grade <= 100 && Grade >= 50)
            {
                if (Grade >= 80)
                {
                    return 4;
                }
                else if (Grade >= 70)
                {
                    return 3;
                }
                else if (Grade >= 60)
                {
                    return 2;
                }
                else if (Grade >= 50)
                {
                    return 1;
                }
            }
            else if (Grade >= 0 && Grade <= 49)
            {
                return 5;
            }
            return 0;
        }
    }
}