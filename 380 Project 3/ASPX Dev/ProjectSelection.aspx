﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectSelection.aspx.cs" Inherits="_380_Project_3.ASPX_Dev.ProjectSelection" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            width: 600px;
        }
        .auto-style3 {
            height: 40px;
        }
        .auto-style4 {
            width: 600px;
            height: 40px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 class="auto-style1">Welcome to the Project Management System</h1>
        </div>
        <table align="center">
            <tr>
                <td colspan="1" class="auto-style10">Select Project:&nbsp;&nbsp;&nbsp; </td>
                <td colspan="1" class="auto-style2">
                    <asp:DropDownList ID="DropDownListProjSelect" runat="server" DataSourceID="ProjectSelectDB" DataTextField="ProjectName" DataValueField="ProjectID" Height="30px" Width="571px" TabIndex="1">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="ProjectSelectDB" runat="server" ConnectionString="<%$ ConnectionStrings: DevDB %>" SelectCommand="SELECT [ProjectName], [ProjectID] FROM [tblProjSelect] WHERE ([UserID] = @UserID)">
                        <SelectParameters>
                            <asp:SessionParameter Name="UserID" SessionField="_CurrentUserID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td colspan="1" class="auto-style25">
                    <asp:Button ID="ButtonOpen" runat="server" OnClick="ButtonOpen_Click" Text="Open Project" Width="160px" TabIndex="2" />
                </td>
            </tr>

            <tr>
                <td colspan="1" class="auto-style3"></td>
                <td colspan="1" class="auto-style4"></td>
                <td class="auto-style3">
                    <asp:Button ID="ButtonNew" runat="server" data-toggle="modal" data-target="#myModal" Text="New Project" Width="160px" OnClientClick="return false;" TabIndex="3" />

                </td>
            </tr>

            <tr>
                <td colspan="4">&nbsp;</td>
            </tr>

            <tr>
                <td colspan="1" class="auto-style19"></td>
                <td colspan="1" class="auto-style2">
                    <asp:Button ID="ButtonDelete" runat="server" OnClick="ButtonDelete_Click" Text="Delete Project" Width="160px" />
                </td>
                <td colspan="1" class="auto-style23">
                    <asp:Button ID="ButtonGenReport" runat="server" OnClick="ButtonGenReport_Click" Text="Generate Reports" Width="160px" TabIndex="5" />
                </td>

            </tr>
        </table>


        <div class="container">
            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Create New Project</h4>
                        </div>

                        <div class="modal-body">
                            Project Name:<br />
                            <asp:TextBox ID="TextBoxProjectName" autofocus="" runat="server"></asp:TextBox>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <asp:Button ID="ButtonModalCreate" runat="server" Text="Create Project" CssClass="btn btn-default" OnClick="ButtonModalCreate_Click" UseSubmitBehavior="false" data-dismiss="modal" />
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </form>

</body>
</html>
