﻿<%@ Page Language="C#" MasterPageFile="siteMaster.Master" AutoEventWireup="true" CodeBehind="Tasks.aspx.cs" Inherits="_380_Project_3.ASPX_Dev.Tasks" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <div class="container">
        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Search for Deliverables</h4>
                    </div>

                    <div class="modal-body">
                        Tasks List:
                        <asp:DropDownList ID="DropDownListTaskSelect" runat="server" DataSourceID="DropDownListTaskDB" DataTextField="Name" DataValueField="TaskID" Height="30px" Width="571px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="DropDownListTaskDB" runat="server" ConnectionString="<%$ ConnectionStrings:DevDB %>" SelectCommand="SELECT [Name], [TaskID] FROM [tblTasks] WHERE ([UserID] = @UserID) AND ([ProjectID] = @ProjectID)">
                            <SelectParameters>
                                <asp:SessionParameter Name="UserID" SessionField="_CurrentUserID" Type="Int32" />
                                <asp:SessionParameter Name="ProjectID" SessionField="_CurrentProjID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <asp:Button ID="ButtonModalSearch" runat="server" Text="Open Task" CssClass="btn btn-default" OnClick="ButtonModalSearch_Click" UseSubmitBehavior="false" data-dismiss="modal" />
                    </div>
                </div>

            </div>
        </div>

    </div>
    <div>
        <table style="width: 100%;">
            <tr>
                <td class="auto-style39">
                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style3"></td>
                            <td class="auto-style3"></td>
                            <td class="auto-style3"></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="auto-style4">Name<span class="auto-style1">*</span><span class="auto-style2">:</span></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td class="auto-style5">
                    <table>
                        <tr>
                            <td class="auto-style24"></td>
                            <td class="auto-style25"></td>
                            <td class="auto-style9">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style8">
                                <asp:TextBox ID="TextBoxName" runat="server" Width="315px"></asp:TextBox>
                            </td>
                            <td class="auto-style26">
                                <asp:Button ID="ButtonSearch" runat="server" data-toggle="modal" data-target="#myModal" Text="Search" OnClientClick="return false;" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style26">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td class="auto-style6">
                    <table class="nav-justified">
                        <tr>
                            <td class="auto-style45">Resource Assigned:</td>
                            <td class="auto-style47"></td>
                            <td class="auto-style46">
                                <asp:Button ID="ButtonAddResource" runat="server" CssClass="auto-style50" Text="Add New Resource" OnClick="ButtonAddResource_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style44">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style44">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="auto-style40">
                    <table style="width: 100%;">
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="auto-style4">Description<span class="auto-style1">*</span><span class="auto-style2">:</span></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td class="auto-style27">
                    <table class="auto-style36">
                        <tr>
                            <td class="auto-style32">&nbsp;</td>
                            <td class="auto-style34">&nbsp;</td>
                            <td class="auto-style34">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style32">
                                <asp:TextBox ID="TextBoxDescription" runat="server" Height="168px" MaxLength="1000" TextMode="MultiLine" Width="351px"></asp:TextBox>
                            </td>
                            <td class="auto-style34">&nbsp;</td>
                            <td class="auto-style34">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style32">&nbsp;</td>
                            <td class="auto-style34">&nbsp;</td>
                            <td class="auto-style34">&nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td class="auto-style3">
                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style51">Associate Predecessor Task:</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style51">
                                <asp:DropDownList ID="DropDownListPre" runat="server" Height="16px" Width="140px">
                                    <asp:ListItem>Finish to Start</asp:ListItem>
                                    <asp:ListItem>Start to Start</asp:ListItem>
                                    <asp:ListItem>Finish to Finish</asp:ListItem>
                                    <asp:ListItem>Start to Finish</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style51">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style54"></td>
                            <td class="auto-style9"></td>
                            <td class="auto-style9"></td>
                        </tr>
                        <tr>
                            <td class="auto-style51">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style51">Associate Sucessor Task:</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style51">
                                <asp:DropDownList ID="DropDownListSuc" runat="server" Width="140px">
                                    <asp:ListItem>Finish to Start</asp:ListItem>
                                    <asp:ListItem>Start to Start</asp:ListItem>
                                    <asp:ListItem>Finish to Finish</asp:ListItem>
                                    <asp:ListItem>Start to Finish</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style51">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style54"></td>
                            <td class="auto-style9"></td>
                            <td class="auto-style9"></td>
                        </tr>
                        <tr>
                            <td class="auto-style51">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style51">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="auto-style41">
                    <table style="width: 100%;">
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="text-right">Expected Start Date<span class="auto-style1">*</span>:</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td class="auto-style28">
                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style77">&nbsp;</td>
                            <td class="auto-style78">&nbsp;</td>
                            <td class="auto-style76">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style71">
                    <asp:TextBox ID="TextBoxExpectedStartDate" runat="server"></asp:TextBox>
                                <asp:ImageButton ID="ImageButtonExpectedStartDate" runat="server" Height="25px" ImageUrl="~/Images/calendar.png" OnClick="ImageButtonExpectedStartDate_Click" Width="30px" />
                            </td>
                            <td class="auto-style15">Expected Due Date<span class="auto-style1">*</span>:</td>
                            <td class="auto-style75">
                    <asp:TextBox ID="TextBoxExpectedDueDate" runat="server"></asp:TextBox>
                                <asp:ImageButton ID="ImageButtonExpectedDueDate" runat="server" Height="25px" ImageUrl="~/Images/calendar.png" OnClick="ImageButtonExpectedDueDate_Click" Width="30px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style71">
                <asp:Calendar ID="CalendarExpectedStart" runat="server" OnSelectionChanged="CalendarExpectedStart_SelectionChanged" Visible="False" BackColor="White" BorderColor="White" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="75px" NextPrevFormat="FullMonth" Width="16px">
                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                    <TodayDayStyle BackColor="#CCCCCC" />
                            </asp:Calendar>
                            </td>
                            <td class="auto-style22"></td>
                            <td class="auto-style75">
                <asp:Calendar ID="CalendarExpectedDue" runat="server" OnSelectionChanged="CalendarExpectedDue_SelectionChanged" Visible="False" BackColor="White" BorderColor="White" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="75px" NextPrevFormat="FullMonth" Width="16px">
                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                    <TodayDayStyle BackColor="#CCCCCC" />
                            </asp:Calendar>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style83"></td>
                            <td class="auto-style84"></td>
                            <td class="auto-style3"></td>
                        </tr>
                        <tr>
                            <td class="auto-style53">&nbsp;</td>
                            <td class="auto-style64">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style53">List of Task(s) and Summary Task(s):</td>
                            <td class="auto-style63">
                                &nbsp;</td>
                            <td class="text-right">
                                &nbsp;</td>
                        </tr>
                    </table>
                    <asp:GridView ID="GridViewTaskList" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="GridTasks">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                            <asp:BoundField DataField="TaskType" HeaderText="TaskType" SortExpression="TaskType" />
                            <asp:BoundField DataField="ExpectedStartDate" HeaderText="Expected Start Date" SortExpression="ExpectedStartDate" />
                            <asp:BoundField DataField="ExpectedEndDate" HeaderText="Expected End Date" SortExpression="ExpectedEndDate" />
                            <asp:BoundField DataField="ExpectedDuration" HeaderText="Expected Duration" SortExpression="ExpectedDuration" />
                            <asp:BoundField DataField="ExpectedEffort" HeaderText="Expected Effort" SortExpression="ExpectedEffort" />
                            <asp:BoundField DataField="ActualStartDate" HeaderText="ActualStartDate" SortExpression="ActualStartDate" />
                            <asp:BoundField DataField="ActualEndDate" HeaderText="Actual End Date" SortExpression="ActualEndDate" />
                            <asp:BoundField DataField="ActualDuration" HeaderText="Actual Duration" SortExpression="ActualDuration" />
                            <asp:BoundField DataField="ActualEffort" HeaderText="Actual Effort" SortExpression="ActualEffort" />
                            <asp:BoundField DataField="PredecessorTask" HeaderText="Predecessor Task" SortExpression="PredecessorTask" />
                            <asp:BoundField DataField="SuccessorTask" HeaderText="Successor Task" SortExpression="SuccessorTask" />
                            <asp:BoundField DataField="Resource" HeaderText="Resource" SortExpression="Resource" />
                            <asp:BoundField DataField="Issues" HeaderText="Issues" SortExpression="Issues" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="GridTasks" runat="server" ConnectionString="<%$ ConnectionStrings:DevDB %>" SelectCommand="SELECT [Name], [Description], [TaskType], [Resource], [ExpectedStartDate], [SuccessorTask], [PredecessorTask], [ActualEffort], [ActualDuration], [ActualEndDate], [ActualStartDate], [ExpectedDuration], [ExpectedEndDate], [ExpectedEffort], [Issues] FROM [tblTasks] WHERE (([UserID] = @UserID) AND ([ProjectID] = @ProjectID))">
                        <SelectParameters>
                            <asp:SessionParameter Name="UserID" SessionField="_CurrentUserID" Type="Int32" />
                            <asp:SessionParameter Name="ProjectID" SessionField="_CurrentProjID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <table style="width: 100%;">
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="text-right">
                                <asp:Button ID="ButtonChangeTaskType" runat="server" Text="Change Task Type" />
                            </td>
                            <td class="text-right">
                                <asp:Button ID="ButtonGroupTasks" runat="server" Text="Group Tasks" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">Expected Duration:</td>
                <td class="auto-style29">
                    <asp:TextBox ID="TextBoxExpectedDuration" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style9"></td>
            </tr>
            <tr>
                <td class="auto-style10">Expected Effort:</td>
                <td class="auto-style29">
                    <asp:TextBox ID="TextBoxExpectedEffort" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style9"></td>
            </tr>
            <tr>
                <td class="auto-style12">Percent Complete:</td>
                <td class="auto-style30"></td>
                <td class="auto-style11"></td>
            </tr>
            <tr>
                <td class="auto-style41">&nbsp;</td>
                <td class="auto-style28">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style42">
                    <table style="width: 100%;">
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="text-right">
                                <asp:Label ID="LabelActualStartDate" runat="server" Text="Actual Start Date:" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style9"></td>
                            <td class="auto-style9"></td>
                            <td class="auto-style9"></td>
                        </tr>
                        <tr>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style9">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style9">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style9">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style9">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style9">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style9">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style9">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style9">&nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td class="auto-style28">
                    <table class="nav-justified">
                        <tr>
                            <td class="auto-style71"></td>
                            <td class="auto-style79"></td>
                            <td class="auto-style9"></td>
                        </tr>
                        <tr>
                            <td class="auto-style81">
                    <asp:TextBox ID="TextBoxActualStartDate" runat="server" Width="107px" Visible="False"></asp:TextBox>
                                <asp:ImageButton ID="ImageButtonActualStartDate" runat="server" Height="25px" ImageUrl="~/Images/calendar.png" OnClick="ImageButtonActualStartDate_Click" Width="30px" Visible="False" />
                            </td>
                            <td class="auto-style18">
                                <asp:Label ID="LabelActualEndDate" runat="server" Text="Actual End Date:" Visible="False"></asp:Label>
                            </td>
                            <td class="auto-style82">
                    <asp:TextBox ID="TextBoxActualEndDate" runat="server" Width="105px" Visible="False"></asp:TextBox>
                                <asp:ImageButton ID="ImageButtonActualEndDate" runat="server" Height="25px" ImageUrl="~/Images/calendar.png" OnClick="ImageButtonActualEndDate_Click" Width="30px" Visible="False" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style77">
                <asp:Calendar ID="CalendarActualStart" runat="server" OnSelectionChanged="CalendarActualStart_SelectionChanged" Visible="False" BackColor="White" BorderColor="White" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="75px" NextPrevFormat="FullMonth" Width="30px">
                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                    <TodayDayStyle BackColor="#CCCCCC" />
                            </asp:Calendar>
                            </td>
                            <td class="auto-style80">&nbsp;</td>
                            <td>
                <asp:Calendar ID="CalendarActualEnd" runat="server" OnSelectionChanged="CalendarActualEnd_SelectionChanged" Visible="False" BackColor="White" BorderColor="White" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="75px" NextPrevFormat="FullMonth" Width="30px">
                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                    <TodayDayStyle BackColor="#CCCCCC" />
                            </asp:Calendar>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style61"></td>
                            <td class="auto-style9"></td>
                            <td class="auto-style9"></td>
                        </tr>
                        <tr>
                            <td class="auto-style61">Associate Issue(s):</td>
                            <td class="auto-style9"></td>
                            <td class="auto-style58">
                                <asp:Button ID="ButtonAssociateIssues" runat="server" Text="Associate Issues" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style60">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="auto-style55">
                    <asp:Label ID="LabelActualDuration" runat="server" Text="Actual Duration:" Visible="False"></asp:Label>
                </td>
                <td class="auto-style56">
                    <asp:TextBox ID="TextBoxActualDuration" runat="server" Visible="False"></asp:TextBox>
                </td>
                <td class="auto-style57"></td>
            </tr>
            <tr>
                <td class="auto-style42">
                    <asp:Label ID="LabelActualEffort" runat="server" Text="Actual Effort:" Visible="False"></asp:Label>
                </td>
                <td class="auto-style28">
                    <asp:TextBox ID="TextBoxActualEffort" runat="server" Visible="False"></asp:TextBox>
                </td>
                <td>
                    <table style="width: 100%;">
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="text-left">
                                <table style="width: 100%;">
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style9">
                                            <asp:Button ID="ButtonNew" runat="server" Text="New" Width="101px" OnClick="ButtonNew_Click" />
                                        </td>
                                        <td class="auto-style9"></td>
                                        <td class="auto-style58">
                                            <asp:Button ID="ButtonGantt" runat="server" Text="Gantt Chart" Visible="False" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                            <td class="text-right">
                                <asp:Button ID="ButtonDelete" runat="server" Text="Delete" Width="96px" OnClick="ButtonDelete_Click" Visible="False" />
                            </td>
                            <td class="text-right">
                                <asp:Button ID="ButtonSave" runat="server" Text="Save" Width="131px" OnClick="ButtonSave_Click" Visible="False" />
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        
        .auto-style3 {
            height: 23px;
        }

        .auto-style83 {
            width: 237px;
            height: 23px;
        }
        .auto-style84 {
            width: 183px;
            height: 23px;
        }
    </style>
</asp:Content>
