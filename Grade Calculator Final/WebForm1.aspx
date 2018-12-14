<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Grade_Calculator_Final.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
                if ($(this).val().length <= 0 || !isNaN($(this).val())) {
                    $(this).css('border-color', 'red');
                    bool = false;
                }
                else {
                    $(this).css('border-color', 'blue');
                }
            });

            $(".vGrade").each(function (index) {
                if ($(this).val().length <= 0 || $(this).val() < 0 || $(this).val() > 100) {
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
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
            </asp:ScriptManager>
            <asp:Button runat="server" Text="Clear" />
            <asp:Button runat="server" Text="Calculate" OnClick="Calculate" OnClientClick="return MyFunction();" />
            <asp:TextBox ID="CourseName" Text="TextName" runat="server"></asp:TextBox>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
                    <asp:Button runat="server" Text="Add Class" OnClick="Btn_Click" />

                    <asp:Table ID="mainTable" runat="server">
                        <asp:TableHeaderRow ID="headerRow">
                            <asp:TableHeaderCell>Course Name</asp:TableHeaderCell>
                            <asp:TableHeaderCell>Course Hours</asp:TableHeaderCell>
                            <asp:TableHeaderCell>Course Grade</asp:TableHeaderCell>
                            <asp:TableHeaderCell>X</asp:TableHeaderCell>
                        </asp:TableHeaderRow>
                        <asp:TableRow Visible="false">
                            <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="15"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Visible="false">
                            <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="15"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Visible="false">
                            <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="15"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Visible="false">
                            <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="15"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Visible="false">
                            <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="15"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Visible="false">
                            <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="15"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Visible="false">
                            <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="15"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Visible="false">
                            <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="15"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Visible="false">
                            <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="15"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Visible="false">
                            <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="15"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Visible="false">
                            <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="15"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Visible="false">
                            <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="15"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Visible="false">
                            <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="15"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Visible="false">
                            <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="15"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Visible="false">
                            <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="15"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Visible="false">
                            <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="15"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Visible="false">
                            <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="15"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Visible="false">
                            <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="15"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Visible="false">
                            <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="15"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Visible="false">
                            <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="15"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Visible="false">
                            <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="15"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Visible="false">
                            <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="15"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Visible="false">
                            <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="15"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Visible="false">
                            <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="15"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Visible="false">
                            <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="15"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Visible="false">
                            <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="15"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Visible="false">
                            <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="15"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Visible="false">
                            <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="15"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow Visible="false">
                            <asp:TableCell><asp:TextBox CssClass="vName" runat="server" MaxLength="15"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vHours" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:TextBox CssClass="vGrade" runat="server"></asp:TextBox></asp:TableCell>
                            <asp:TableCell><asp:Button runat="server" OnClick="Unnamed_Click" Text="X"/></asp:TableCell>
                        </asp:TableRow>


                    </asp:Table>
                    <asp:Label ID="lblGpaOut" runat="server" Text="GPA:"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CoursesConnectionString %>" SelectCommand="SELECT [Course Code],[Course Name],[Course Hours],[Course Grade] FROM [computerProgrammerView] ORDER BY [Semester]"></asp:SqlDataSource>
    </form>
</body>
</html>
