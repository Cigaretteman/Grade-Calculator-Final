<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CalculatorForm.aspx.cs" Inherits="Grade_Calculator_Final.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <link href="~/calcFormStyle.css" rel="Stylesheet" type="text/css" />
    <script type="text/javascript">
        function MyFunction() {
            var bool = true;
            $(".vName").each(function (index) {
                if ($(this).val().length <= 0) {
                    $(this).css('border-color', 'red');
                    bool = false;
                }
                else {
                    $(this).css('border-color', 'blue');
                }
            });

            $(".vHours").each(function (index) {
                if ($(this).val().length <= 0 || isNaN($(this).val())) {
                    $(this).css('border-color', 'red');
                    bool = false;
                }
                else {
                    $(this).css('border-color', 'blue');
                }
            });

            $(".vGrade").each(function (index) {
                if ($(this).val().length > 0 && $(this).val() < 0 || $(this).val() > 100) {
                    $(this).css('border-color', 'red');
                    bool = false;
                }
                else {
                    $(this).css('border-color', 'blue');
                }
            });

            return bool;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="row">
                    <div class="col-2">
                        <triggers>

                        </triggers>
                        <asp:Button runat="server" Text="Clear" Width="115px" />
                        <br />
                        <asp:Button runat="server" Width="115px" Text="Calculate" OnClick="Calculate" OnClientClick="return MyFunction();" />
                        <br />
                        <asp:Button runat="server" Text="Add Class" OnClick="Btn_Click" Width="115px" />
                        <br />
                        <br />
                        <asp:TextBox ID="CourseName" Text="" runat="server"></asp:TextBox>
                        <br />
                        <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" Width="115px" />
                        <asp:Label runat="server" ID="lblSave"></asp:Label>
                    </div>
                    <div class="col-8">
                        <asp:Table ID="mainTable" runat="server">
                            <asp:TableHeaderRow ID="headerRow">
                                <asp:TableHeaderCell>Course Name</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Course Hours</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Course Grade</asp:TableHeaderCell>
                                <asp:TableHeaderCell>X</asp:TableHeaderCell>
                            </asp:TableHeaderRow>
                            <asp:TableRow Visible="false">
                                <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="34"   Width="400px"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow Visible="false">
                                <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="34"   Width="400px"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow Visible="false">
                                <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="34"   Width="400px"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow Visible="false">
                                <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="34"   Width="400px"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow Visible="false">
                                <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="34"   Width="400px"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow Visible="false">
                                <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="34"   Width="400px"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow Visible="false">
                                <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="34"   Width="400px"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow Visible="false">
                                <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="34"   Width="400px"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow Visible="false">
                                <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="34"   Width="400px"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow Visible="false">
                                <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="34"   Width="400px"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow Visible="false">
                                <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="34"   Width="400px"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow Visible="false">
                                <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="34"   Width="400px"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow Visible="false">
                                <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="34"   Width="400px"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow Visible="false">
                                <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="34"   Width="400px"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow Visible="false">
                                <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="34"   Width="400px"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow Visible="false">
                                <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="34"   Width="400px"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow Visible="false">
                                <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="34"   Width="400px"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow Visible="false">
                                <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="34"   Width="400px"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow Visible="false">
                                <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="34"   Width="400px"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow Visible="false">
                                <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="34"   Width="400px"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow Visible="false">
                                <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="34"   Width="400px"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow Visible="false">
                                <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="34"   Width="400px"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow Visible="false">
                                <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="34"   Width="400px"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow Visible="false">
                                <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="34"   Width="400px"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow Visible="false">
                                <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="34"   Width="400px"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow Visible="false">
                                <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="34"   Width="400px"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow Visible="false">
                                <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="34"   Width="400px"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow Visible="false">
                                <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="34"   Width="400px"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow Visible="false">
                                <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="34"   Width="400px"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                        <asp:ListBox runat="server" ID="listOut" Height="182px" Width="537px"></asp:ListBox>
                    </div>
                    <div class="col-2" style="background-color:lightgray; padding:20px; width:300px; height:400px">
                        <asp:Label ID="Label3" runat="server" Text="Your Quality Points:"></asp:Label>
                        <asp:Label ID="lblQP" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Label ID="Label5" runat="server" Text="Total Hours:"></asp:Label>
                        <asp:Label ID="lblHours" runat="server" Text=""></asp:Label>
                        <br />
                        <br />
                        <div style="text-align:center;">
                        <asp:Label ID="lblQPOut" runat="server" Text="Quality Points"></asp:Label>
                        <asp:Label ID="Label1" runat="server" Text="/"></asp:Label>
                        <asp:Label ID="lblHoursOut" runat="server" Text="Total Hours"></asp:Label>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="="></asp:Label>
                        <asp:Label ID="lblGPAOut" runat="server" Text="GPA"></asp:Label>
                            </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CoursesConnectionString %>" SelectCommand="SELECT Classes FROM Courses WHERE CourseName="></asp:SqlDataSource>
    </form>
</body>
</html>
