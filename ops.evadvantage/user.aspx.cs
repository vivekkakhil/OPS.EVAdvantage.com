using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using ops.evadvantage.BLL;

public partial class Admin_user : System.Web.UI.Page
{
    CreateEmp objEmp = new CreateEmp();
    int UserId = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        LinkButton lnk = (LinkButton)Master.FindControl("lnkUser");
        lnk.Font.Bold = true;
        LinkButton lnk1 = (LinkButton)Master.FindControl("lnkManage");
        lnk1.Font.Bold = true;
        if (Session["user"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        if (gvActiveCode.Rows.Count == 0)
        {
            Session["verifyid"] = "0";
        }
        if (!IsPostBack)
        {
            tblDetail.Visible = false;
            truser.Visible = true;
            tblCreate.Visible = false;
            tblMsg.Visible = false;
        }
    }
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        objEmp.UserName = txtUser.Text;
        DataSet ds = objEmp.GetUserName();
        if (ds.Tables[0].Rows.Count == 0)
        {
           objEmp = PrepareParameterUser();
           UserId = objEmp.SaveData();

           objEmp = PrepareParameterDetails();
           objEmp.SaveDetails();

           gvActiveCode.DataBind();
           ops.evadvantage.Utilities.MessageBox("User Created Successfully.", Page);
           ClearControl();
              
        }
        else
        {
            ops.evadvantage.Utilities.MessageBox("User name already exists.", Page);
        }

    }
    private CreateEmp PrepareParameterUser()
    {
        objEmp.UserName = txtUser.Text;
        objEmp.Pwd = txtPwd.Text;
        if (ddltype.SelectedValue == "1")
        {
            objEmp.Type = "0";
        }
        else
        {
            objEmp.Type = "1";
        }
        
        objEmp.IsActive = "0";

        return objEmp;
    }
    private CreateEmp PrepareParameterDetails()
    {
        objEmp = new CreateEmp();
        objEmp.UserId = UserId;
        objEmp.Email = txtEmail.Text;

        return objEmp;
    }
    private void ClearControl()
    {
        txtEmail.Text = String.Empty;
        txtUser.Text = String.Empty;
        txtPwd.Text = String.Empty;
        txtrePwd.Text = String.Empty;
        ddltype.SelectedIndex = -1;
        tblDetail.Visible = false;

    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        ClearControl();
    }
    public string GetImageUrl(object type)
    {
        if (type.ToString() == "0")
        {
            return "../images/admin.gif";
        }
        else
        {
            return "../images/moderator.gif";
        }
    }
    public string GetStatusImageUrl(object status)
    {
        if (status.ToString() == "0")
        {
            return "../images/ratingplus.gif";
        }
        else
        {
            return "../images/ratingminus.gif";
        }
    }
    public void ChangeStatus(object sender, CommandEventArgs e)
    {
        int userId = Convert.ToInt32(e.CommandName);
        if (userId != Convert.ToInt32(Session["userid"]))
        {
                objEmp.UserId = userId;
                string status = e.CommandArgument.ToString();

                if (status == "0")
                {
                    objEmp.IsActive = "1";
                }
                else
                {
                    objEmp.IsActive = "0";
                }
                objEmp.UpdateDataForActivate();
                gvActiveCode.DataBind();
            
        }
        else
        {
            ops.evadvantage.Utilities.MessageBox("You are logging with this account so you can not inactivate", Page);
        }
    }
    public string GetUser(object userid)
    {
        objEmp.UserId = Convert.ToInt32(userid.ToString());
        DataSet ds = objEmp.GetUserEmpInfo();
        return ds.Tables[0].Rows[0]["Firstname"].ToString() + " " + ds.Tables[0].Rows[0]["lastname"].ToString();


    }
    public void GetUserId(object sender, CommandEventArgs e)
    {
        //string ssn = e.CommandArgument.ToString();
        //objEmp.SSN = ssn;
        //DataSet ds = objEmp.GetUserId();

        //if (ds.Tables[0].Rows.Count != 0)
        //{
        //    Session["emp"] = ds.Tables[0].Rows[0]["UserId"].ToString();
        //}
        //else
        //{
        //    Session["emp"] = "0";
        //}
        Session["verifyid"] = e.CommandArgument.ToString();
        gvDetail.DataBind();
        //gvUsed.DataBind();
        tblDetail.Visible = true;

    }
   
    protected void gvActiveCode_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        for (int i = 0; i < gvActiveCode.Rows.Count; i++)
        {

            gvActiveCode.Rows[i].Visible = false;

        }
        gvActiveCode.Rows[e.NewSelectedIndex].Visible = true;
    }
    protected void btnSelection_Click(object sender, EventArgs e)
    {
        Session["verifyid"] = "0";
        gvActiveCode.DataBind();
        gvActiveCode.SelectedIndex = -1;       
        tblDetail.Visible = false;
    }
    public string GetImageUrlCC(object status)
    {
        if (status.ToString() == "Y")
        {
            return "../images/DNNExplorer_OK.gif";
        }
        else
        {
            return "../images/DNNExplorer_Cancel.gif";
        }
    }
    protected void lnkUser_Click(object sender, EventArgs e)
    {
        truser.Visible = false;
        tblMsg.Visible = true;
        tblCreate.Visible = true;
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        truser.Visible = true;
        tblMsg.Visible = false;
        tblCreate.Visible = false;
    }
}
