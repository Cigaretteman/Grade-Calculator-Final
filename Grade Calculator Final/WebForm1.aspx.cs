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
    public class ClassHolder
    {
        public int CreditScore { get; set; }
        public string GradeString { get; set; }
        public string ClassName { get; set; }
    }
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

                for (int i = 0; i < mainTable.Rows.Count; i++)
                {
                    Grades.TotalHours += int.Parse(mainTable.Rows[i].Cells[1].ToString());
                    if (int.TryParse(gradeInputs[i].Text, out int Grade))
                    {
                        if (GradeValues.Contains((Grade = GetGrade(Grade))))
                        {
                            Grades.QualityPoints += (Grade * Convert.ToInt32(mainTable.Rows[i].Cells[1]));
                            Grades.FilledHours += Convert.ToInt32(mainTable.Rows[i].Cells[1]);
                            Grades.FilledCount++;
                        }
                        else
                        {
                            Unfilled.Add(new ClassHolder
                            {
                                ClassName = mainTable.Rows[i].Cells[0].ToString(),
                                CreditScore = int.Parse(mainTable.Rows[i].Cells[1].ToString())
                            });
                            Grades.UnfilledCount++;
                            Grades.MissingHours += int.Parse(mainTable.Rows[i].Cells[1].ToString());
                        }
                    }
                    else
                    {
                        Unfilled.Add(new ClassHolder
                        {
                            ClassName = mainTable.Rows[i].Cells[0].ToString(),
                            CreditScore = int.Parse(mainTable.Rows[i].Cells[1].ToString())
                        });
                        Grades.UnfilledCount++;
                        Grades.MissingHours += int.Parse(mainTable.Rows[i].Cells[1].ToString());
                    }
                    Grades.TotalCount++;
                }
                //calculate GPA with method call
                Grades.GPA = (double)Grades.QualityPoints / Grades.FilledHours;
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
            return 0;
        }
    }
}