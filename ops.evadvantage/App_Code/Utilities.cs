using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net.Mail;

/// <summary>
/// Summary description for Utilities
/// </summary>
namespace ops.evadvantage
{
    public class Utilities
    {
        public Utilities()
        {
        }
        public static void MessageBox(string msg, System.Web.UI.Page page)
        {
            ScriptManager.RegisterClientScriptBlock(page, typeof(Page), "MyKey", "alert('" + msg + "');", true);
        }
        public static void BindDropDownList(DropDownList ddl, DataSet ds, string textField, string valueField)
        {
            ddl.DataSource = ds;
            ddl.DataTextField = textField;
            ddl.DataValueField = valueField;
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("-Select-", "0"));
        }
        public static void SendMail(String toAdd, String from, String body, String subject)
        {
            try
            {
                MailMessage objMailMessage = new MailMessage();
                MailAddress objFrom = new MailAddress(from, "Auto Generated Mail");
                objMailMessage.From = objFrom;
                objMailMessage.To.Add(toAdd);
                objMailMessage.Subject = subject;
                objMailMessage.IsBodyHtml = true;
                objMailMessage.Body = body;
                SmtpClient smtpserver = new SmtpClient(ConfigurationManager.AppSettings["SmtpClient"].ToString());
                smtpserver.Port = Convert.ToInt32(ConfigurationManager.AppSettings["SmtpPort"].ToString());
                //smtpserver.Send(objMailMessage);
                smtpserver.Send(objMailMessage);
            }
            catch (Exception ex)
            {
            }


        }
        public static string GenerateMaximumNo(string maximumNo, bool IsVivintCompany)
        {
            string prefix = GetNumberPrefix(maximumNo, IsVivintCompany);
            return GenerateMaximumNo(maximumNo, prefix, IsVivintCompany);
        }

        public static string GetNumberPrefix(string maximumNo, bool IsVivintCompany)
        {
            if (maximumNo != "")
            {
                if (IsVivintCompany)
                    return maximumNo.Substring(0, 2);
                else
                    return maximumNo.Substring(0, 7);
            }
            else
                return "";
        }

        public static string GenerateMaximumNo(string maximumNo, string prefix, bool IsVivintCompany)
        {
            string newMaximumNo = "";
            if (maximumNo == "")
            {
                newMaximumNo = "";
            }
            else
            {
                if (IsVivintCompany)
                    newMaximumNo = prefix + IncrementNo(GetNoDigits(maximumNo, prefix.Length)).ToString("0000000");
                else
                    newMaximumNo = prefix + IncrementNo(GetNoDigits(maximumNo, prefix.Length)).ToString("00");
            }
            return newMaximumNo;
        }
        public static int IncrementNo(int maximumNoDigits)
        {
            if (maximumNoDigits != 0)
                return maximumNoDigits + 1;
            else
                return 0;
        }

        public static int GetNoDigits(string maximumNo, int prefixLength)
        {
            int digits = 0;
            if (maximumNo.Length >= prefixLength)
            {
                digits = Convert.ToInt32(maximumNo.Substring(prefixLength));
            }
            return digits;
        }

        public string GetAmount(string amt)
        {
            if (amt != "")
            {
                int main = Convert.ToInt32(amt.Substring(0, 7));
                string sub = amt.Substring(7, 2);

                return "$ " + main.ToString() + "." + sub;
            }
            else
            {
                return "N/A";
            }
        }
        public string GetDate(string str)
        {
            if (str != "")
            {
                string y = str.Substring(0, 4);
                string m = str.Substring(4, 2);
                string d = str.Substring(6, 2);
                return m + "/" + d + "/" + y;
            }
            else
            {
                return "N/A";
            }
        }
        public string GetData(string str)
        {
            if (str != "")
            {
                return str;
            }
            else
            {
                return "N/A";
            }
        }
        public string GetYes(string str)
        {
            if (str != "")
            {
                if (str == "Y")
                {
                    return "Yes";
                }
                else
                {
                    return "No";
                }
            }
            else
            {
                return "N/A";
            }
        }
        public string GetReason(string str)
        {
            if (str != "")
            {
                if (str == "01")
                {
                    return "Part Time/Not Enough Hours";
                }
                else if (str == "02")
                {
                    return "Not Yet Eligible";
                }
                else
                {
                    return "Employment Position Ineligible";
                }
            }
            else
            {
                return "N/A";
            }
        }

        public string GetFrequencyCode(string code)
        {
            if (code == "1")
            {
                return "Weekly";
            }
            else if (code == "2")
            {
                return "Bi-weekly";
            }
            else if (code == "3")
            {
                return "Semi-monthly";
            }
            else if (code == "4")
            {
                return "Monthly";
            }
            else if (code == "5")
            {
                return "Quarterly";
            }
            else
            {
                return code;
            }
        }


    }
}
