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
using EVA.BLL;

public partial class editEmpInfo : System.Web.UI.Page
{
    CreateEmp objEmp = new CreateEmp();
    static int UserDetailId = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        if (IsPostBack != true)
        {           
            if (Session["user"] != null)
            {
                //BindDropDown();
                objEmp.UserName = Session["user"].ToString();
                DataSet ds = objEmp.GetUserName();
                if (ds.Tables[0].Rows.Count != 0)
                {
                    txtSSN.Text = ds.Tables[0].Rows[0]["SSN"].ToString();
                    txtCompany.Text = ds.Tables[0].Rows[0]["CompanyName"].ToString();
                    //ddlCompany.SelectedValue = ds.Tables[0].Rows[0]["CompanyId"].ToString();
                    DateTime dt = Convert.ToDateTime(ds.Tables[0].Rows[0]["DateOfBirth"]);

                    txtDate.Text = dt.ToString("MM/dd/yyyy");
                    txtEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                    //lblUser.Text = ds.Tables[0].Rows[0]["UserName"].ToString();
                    txtPwd.Attributes["value"] = ds.Tables[0].Rows[0]["Pwd"].ToString();
                    UserDetailId = Convert.ToInt32(ds.Tables[0].Rows[0]["UserDetailId"]);
                }
            }
        }
       
        

    }
    //private void BindDropDown()
    //{
    //    EVA.Utilities.BindDropDownList(ddlCompany, objEmp.GetCompany(), "CompanyName", "CompanyId");
    //}
    
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("empHome.aspx");
    }
    private void ClearControl()
    {
        //txtSSN.Text = String.Empty;
        //ddlCompany.SelectedValue = "0";
        txtEmail.Text = String.Empty;
        //txtDate.Text = String.Empty;
        txtPwd.Attributes["value"] = String.Empty; 
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        ClearControl();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        objEmp = PrepareParameterUser();
        objEmp.UpdateData();

        objEmp = PrepareParameterDetails();
        objEmp.UpdateDetails();

        EVA.Utilities.MessageBox("Account updated Successfully.", Page);
        ClearControl();
    }
    private CreateEmp PrepareParameterUser()
    {
        objEmp.UserId =Convert.ToInt32(Session["userid"]);
        objEmp.Pwd = txtPwd.Text;
        
        return objEmp;
    }
    private CreateEmp PrepareParameterDetails()
    {
        objEmp = new CreateEmp();
        //objEmp.UserId =Convert.ToInt32(Session["userid"]);
        //objEmp.SSN = txtSSN.Text;
        //objEmp.CompanyId = Convert.ToInt32(ddlCompany.SelectedValue);
        //objEmp.DateOfBirth = Convert.ToDateTime(txtDate.Text);
        objEmp.Email = txtEmail.Text;
        objEmp.UserDetailId = UserDetailId;
       
        return objEmp;
    }
}
