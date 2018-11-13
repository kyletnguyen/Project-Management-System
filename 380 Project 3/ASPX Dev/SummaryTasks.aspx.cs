﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace _380_Project_3.ASPX_Dev
{
    public partial class SummaryTasks : System.Web.UI.Page
    {
        private string g_sqlConn = ConfigurationManager.ConnectionStrings["devDB"].ConnectionString;
        private string g_TaskType = "Summary Task";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void Connect(SqlConnection sqlConn)
        {
            if (sqlConn.State == ConnectionState.Closed)
                sqlConn.Open();
        }

        public void Disconnect(SqlConnection sqlConn)
        {
            if (sqlConn.State == ConnectionState.Open)
                sqlConn.Close();
        }

        protected void ButtonModalSearch_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(g_sqlConn))
            {
                Connect(conn);
                using (SqlCommand cmd = new SqlCommand(String.Format("SELECT Name, Description, ExpectedStartDate, ExpectedEndDate, ExpectedEffort," +
                    "ActualStartDate, ActualEndDate, ActualEffort FROM tblTasks WHERE TaskID={0} AND UserID={1} AND ProjectID={2}",
                    DropDownListSummTaskSelect.SelectedValue, Session["_CurrentUserID"], Session["_CurrentProjID"]), conn))
                {
                    SqlDataReader sdr = cmd.ExecuteReader();

                    while (sdr.Read())
                    {
                        TextBoxName.Text = sdr[0].ToString();
                        TextBoxDescription.Text = sdr[1].ToString();

                        TextBoxExpectedStartDate.Text = sdr[2].ToString();
                        TextBoxExpectedDueDate.Text = sdr[3].ToString();
                        TextBoxExpectedEffort.Text = sdr[4].ToString();

                        TextBoxActualStartDate.Text = sdr[5].ToString();
                        TextBoxActualEndDate.Text = sdr[6].ToString();
                        TextBoxActualEffort.Text = sdr[7].ToString();
                    }
                    sdr.Close();
                }

                Disconnect(conn);
            }

            LabelActualStartDate.Visible = true;
            ImageButtonActualStartDate.Visible = true;
            TextBoxActualStartDate.Visible = true;

            LabelActualEndDate.Visible = true;
            ImageButtonActualEndDate.Visible = true;
            TextBoxActualEndDate.Visible = true;

            LabelActualDuration.Visible = true;
            TextBoxActualDuration.Visible = true;

            LabelActualEffort.Visible = true;
            TextBoxActualEffort.Visible = true;

            ButtonSave.Visible = true;
            ButtonDelete.Visible = true;
            ButtonGantt.Visible = true;
        }

        protected void ButtonNew_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(g_sqlConn))
            {
                Connect(conn);
                using (SqlCommand cmd = new SqlCommand("insert into tblTasks(UserID,ProjectID,Name,Description,TaskType,ExpectedStartDate,ExpectedEndDate,ExpectedEffort)" +
                    " values(@UserID, @ProjectID, @Name, @Description,@TaskType , @ExpStart, @ExpEnd, @ExpEffort)", conn))
                {
                    cmd.Parameters.AddWithValue("@UserID", Session["_CurrentUserID"]);
                    cmd.Parameters.AddWithValue("@ProjectID", Session["_CurrentProjID"]);
                    cmd.Parameters.AddWithValue("@Name", TextBoxName.Text);
                    cmd.Parameters.AddWithValue("@Description", TextBoxDescription.Text);
                    cmd.Parameters.AddWithValue("@TaskType", g_TaskType);
                    cmd.Parameters.AddWithValue("@ExpStart", Convert.ToDateTime(TextBoxExpectedStartDate.Text));
                    cmd.Parameters.AddWithValue("@ExpEnd", Convert.ToDateTime(TextBoxExpectedDueDate.Text));
                    cmd.Parameters.AddWithValue("@ExpEffort", TextBoxExpectedEffort.Text);

                    try
                    {
                        cmd.ExecuteNonQuery();
                    }

                    catch (Exception ex)
                    {
                        Response.Write(String.Format("Error while executing query...{0}", ex.ToString()));
                    }

                    finally
                    {
                        Disconnect(conn);
                    }
                }
            }

            DropDownListSummTaskSelect.DataBind();
            GridViewTaskList.DataBind();
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(g_sqlConn))
            {
                Connect(conn);

                using (SqlCommand cmd = new SqlCommand(String.Format("delete from tblTasks where UserID={0} and ProjectID={1} AND Name='{2}'",
                    Session["_CurrentUserID"], Session["_CurrentProjID"], TextBoxName.Text), conn))
                {
                    try
                    {
                        cmd.ExecuteNonQuery();
                    }

                    catch (Exception ex)
                    {
                        Response.Write(String.Format("Error while executing query...{0}", ex.ToString()));
                    }

                    finally
                    {
                        Disconnect(conn);
                    }
                }
            }

            DropDownListSummTaskSelect.DataBind();
            GridViewTaskList.DataBind();
        }

        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(g_sqlConn))
            {
                Connect(conn);
                using (SqlCommand cmd2 = new SqlCommand(String.Format("SELECT TaskID FROM tblTasks WHERE Name='{0}' AND UserID={1} AND ProjectID={2}",
                    TextBoxName.Text, Session["_CurrentUserID"], Session["_CurrentProjID"]), conn))
                {
                    SqlDataReader sdr = cmd2.ExecuteReader();

                    while (sdr.Read())
                    {
                        Session["_CurrentTaskID"] = sdr[0].ToString();

                    }
                    sdr.Close();
                }
                // Doesn't like " ' " when you update (thinks its a string)
                using (SqlCommand cmd = new SqlCommand("UPDATE tblTasks SET Name=@Name, Description=@Description, " +
                    "ExpectedStartDate=@ExpStartDate, ExpectedEndDate=@ExpEndDate, ExpectedEffort=@ExpEff," +
                    "ActualStartDate=@ActStartDate, ActualEndDate=@ActEndDate, ActualEffort=@ActEff " +
                    "WHERE UserID=@UserID AND ProjectID=@ProjID AND TaskID=@TaskID", conn))
                {
                    cmd.Parameters.AddWithValue("@Name", TextBoxName.Text);
                    cmd.Parameters.AddWithValue("@Description", TextBoxDescription.Text);
                    cmd.Parameters.AddWithValue("@ExpStartDate", Convert.ToDateTime(TextBoxExpectedStartDate.Text));
                    cmd.Parameters.AddWithValue("@ExpEndDate", Convert.ToDateTime(TextBoxExpectedDueDate.Text));
                    cmd.Parameters.AddWithValue("@ExpEff", TextBoxExpectedEffort.Text);
                    cmd.Parameters.AddWithValue("@ActStartDate", Convert.ToDateTime(TextBoxActualStartDate.Text));
                    cmd.Parameters.AddWithValue("@ActEndDate", Convert.ToDateTime(TextBoxActualEndDate.Text));
                    cmd.Parameters.AddWithValue("@ActEff", TextBoxActualEffort.Text);
                    cmd.Parameters.AddWithValue("@UserID", Session["_CurrentUserID"]);
                    cmd.Parameters.AddWithValue("@ProjID", Session["_CurrentProjID"]);
                    cmd.Parameters.AddWithValue("@TaskID", Session["_CurrentTaskID"]);

                    try
                    {
                        cmd.ExecuteNonQuery();
                    }

                    catch (Exception ex)
                    {
                        Response.Write(String.Format("Error while executing query...{0}", ex.ToString()));
                    }

                    finally
                    {
                        Disconnect(conn);
                    }
                }
            }

            DropDownListSummTaskSelect.DataBind();
            GridViewTaskList.DataBind();
        }

        protected void ButtonAddResource_Click(object sender, EventArgs e)
        {

        }


        protected void ImageButtonExpectedStartDate_Click(object sender, ImageClickEventArgs e)
        {
            if (CalendarExpectedStart.Visible == false)
                CalendarExpectedStart.Visible = true;

            else
                CalendarExpectedStart.Visible = false;
        }

        protected void ImageButtonExpectedDueDate_Click(object sender, ImageClickEventArgs e)
        {
            if (CalendarExpectedDue.Visible == false)
                CalendarExpectedDue.Visible = true;

            else
                CalendarExpectedDue.Visible = false;
        }

        protected void ImageButtonActualStartDate_Click(object sender, ImageClickEventArgs e)
        {
            if (CalendarActualStart.Visible == false)
                CalendarActualStart.Visible = true;

            else
                CalendarActualStart.Visible = false;
        }


        protected void ImageButtonActualEndDate_Click(object sender, ImageClickEventArgs e)
        {
            if (CalendarActualEnd.Visible == false)
                CalendarActualEnd.Visible = true;

            else
                CalendarActualEnd.Visible = false;
        }

        protected void CalendarExpectedStart_SelectionChanged(object sender, EventArgs e)
        {
            TextBoxExpectedStartDate.Text = CalendarExpectedStart.SelectedDate.ToString("dddd, dd MMMM yyyy");
            CalendarExpectedStart.Visible = false;
        }

        protected void CalendarExpectedDue_SelectionChanged(object sender, EventArgs e)
        {
            TextBoxExpectedDueDate.Text = CalendarExpectedDue.SelectedDate.ToString("dddd, dd MMMM yyyy");
            CalendarExpectedDue.Visible = false;
        }

        protected void CalendarActualStart_SelectionChanged(object sender, EventArgs e)
        {
            TextBoxActualStartDate.Text = CalendarActualStart.SelectedDate.ToString("dddd, dd MMMM yyyy");
            CalendarActualStart.Visible = false;
        }

        protected void CalendarActualEnd_SelectionChanged(object sender, EventArgs e)
        {
            TextBoxActualEndDate.Text = CalendarActualEnd.SelectedDate.ToString("dddd, dd MMMM yyyy");
            CalendarActualEnd.Visible = false;
        }
    }
}