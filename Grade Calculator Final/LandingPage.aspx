<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="landingPage.aspx.cs" Inherits="GPACalculator.landingPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="calcFormStyle.css" rel="stylesheet" />
    <title>Landing Page</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid" style="text-align:center">
            <div class="col-4 landingBorder" style="height:auto; padding-bottom:20px;">
                <div style="padding:10px">
                Enter the amount of classes in the course:
                <asp:TextBox ID="txtCourseAmt" runat="server"></asp:TextBox>
                <asp:Button runat="server" ID="btnLoad" Text="Create" OnClick="btnLoad_Click" Width="177px" />
                    </div>
                <div style="padding:10px">
                Or choose an existing program:
                <asp:DropDownList runat="server" ID="courseDDL"></asp:DropDownList>
                <asp:Button runat="server" ID="dropBtn" Text="Create" OnClick="btnDroplist_Click" Width="177px" />
                    </div>
            </div>
        </div>
    </form>
</body>
</html>
