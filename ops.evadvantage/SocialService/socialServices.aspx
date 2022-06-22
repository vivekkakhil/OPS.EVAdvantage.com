<%@ Page Language="C#" MasterPageFile="EVASsv.master" AutoEventWireup="true" CodeFile="socialServices.aspx.cs" Inherits="SocialService_socialServices" Title="Social Service Verification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style4
        {
            height: 20px;
        }
        .style5
        {
            width: 362px;
        }
        .style6
        {
        height: 20px;
        width: 362px;
    }
   
    </style>
   <style type="text/css" media="print">
   .text {display:none;visibility:hidden;
   font-family:Verdana, Arial, Helvetica, sans-serif;
	font-size:11px;
   }
  .pic {visibility:visible;display:inline;
   
   }
</style>
<style type="text/css">
 @media screen{
 .tt{
  display:none;visibility:hidden;
 }

 }
 @media print{
 .tt{
  display:inline;visibility:visible;
 }
 }
</style>

 <script language="javascript">
function printdiv(printpage)
{
var headstr = "<html><head><title></title></head><body><img width='200' src='../images/image001.png'/><br /><br /><h3>Social Service Verification</h3><br />";
var footstr = "</body>";
//var newstr = document.all.item(printpage).innerHTML;
var newstr = document.getElementById(printpage).innerHTML;
var oldstr = document.body.innerHTML;
document.body.innerHTML = headstr+newstr+footstr;
window.print(); 
document.body.innerHTML = oldstr;
return false;
}
//function print() 
//{
//var prtContent = document.getElementById("div_print"); 
//alert(prtContent);
//alert( document.all.item("ctl00_ContentPlaceHolder1_div_print").innerHTML);
//var WinPrint = window.open('', '', 'left=0,top=0,width=900,height=700,status=0'); 
//WinPrint.document.write('<HTML>');
//WinPrint.document.write('<head><link href="style.css" rel="stylesheet" type="text/css" /></head>');
//WinPrint.document.write('<body>');
//WinPrint.document.write('<img width="200" src="images/image001.png"/><br /><br /><p>Employment Verification</p>');
//WinPrint.document.write(document.all.item("ctl00_ContentPlaceHolder1_div_print").innerHTML );
//WinPrint.document.write('</body>');
//WinPrint.document.write('</HTML>');

//WinPrint.document.close();
//WinPrint.focus(); 
////WinPrint.print();
////WinPrint.close();

//}

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ScriptManagerProxy ID="scriptProxy" runat="server">
    </asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="upPanel" runat="server">
        <ContentTemplate><div id="div_print" runat="server" class="content">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
    
            <tr>
              <td><asp:Label ID="Label18" runat="server" CssClass="label" 
                          Text="Your Requested Verification for  "></asp:Label> <asp:Label ID="lblname" runat="server" CssClass="label" 
                          ></asp:Label>
              </td>
              
              <td align="right">
                    <asp:Label ID="Label23" runat="server"  ForeColor="Red" 
                      CssClass="text"   Text="This is the only opportunity to print this page."></asp:Label>
                </td>
          </tr>
          <tr>
              <td  colspan="2"> <hr style="width: 798px" />
              </td>
          </tr>
           <tr>
              <td  colspan="2"> 
              <asp:Label ID="refererCheck" runat="server" Visible="False"></asp:Label>
              </td>
          </tr>
      </table>
                  <table cellpadding="0" cellspacing="0" class="style1">
                      <tr>
                          <td class="style5">
                              <asp:Label ID="Label1" runat="server" Text="Verification Issued on :"></asp:Label>
                          </td>
                          <td >
                            <asp:Label ID="lblissue" runat="server" ></asp:Label>
                              </td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label2" runat="server" Text="Verification Type :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lbltype" runat="server" ></asp:Label>
                              </td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label3" runat="server" Text="Reference Number :"></asp:Label>
                          </td>
                          <td class="style4">
                            <asp:Label ID="lblrefno" runat="server" ></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label4" runat="server" Text="Information Current as of :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblinfo" runat="server" ></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label5" runat="server" Text="Employer :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblemployer" runat="server" ></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label6" runat="server" Text="Employer Address :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblemployeradd" runat="server" ></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label19" runat="server" Text="Employer Note :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblNote" runat="server"></asp:Label>
                          </td>
                      </tr>
                      <tr>
                          <td class="style6">
                              &nbsp;</td>
                          <td class="style4">
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label7" runat="server" Text="Employee First Name :"></asp:Label>
                          </td>
                          <td class="style4">
                             <asp:Label ID="lblempfn" runat="server" ></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label8" runat="server" Text="Employee Middle Name :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblempmn" runat="server" ></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label9" runat="server" Text="Employee Last Name :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblempln" runat="server" ></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label10" runat="server" Text="Social Security Number :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblssn" runat="server" ></asp:Label></td>
                      </tr>
                      
                      
                      <tr>
                          <td class="style6">
                          </td>
                          <td class="style4">
                              </td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label13" runat="server" Text="Medical Insurance Available :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblMIA" runat="server" ></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label15" runat="server" 
                                  Text="Employee Eligible for Medical Coverage :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblEEMC" runat="server" ></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label17" runat="server" 
                                  Text="Employee Enrolled for Medical Coverage :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblEEMC1" runat="server" ></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label21" runat="server" Text="Reason for Ineligibility :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblRI" runat="server" ></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label79" runat="server" Text="Eligibility Date :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblED" runat="server"></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label24" runat="server" Text="Medical Coverage Start Date :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblMCSD" runat="server"></asp:Label>
                          </td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label26" runat="server" 
                                  Text="Medical Coverage Termination Date :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblMCTD" runat="server" ></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label28" runat="server" Text="Medical Carrier Name :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblMCN" runat="server" ></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label30" runat="server" Text="Medical Policy Number :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblMPN" runat="server" ></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label32" runat="server" Text="Medical Group Number :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblMGN" runat="server" ></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label12" runat="server" Text="Medical Carrier Phone Number :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblMCPN" runat="server" ></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label34" runat="server" Text="Medical Carrier Address :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblMCA" runat="server" ></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label36" runat="server" Text="Medical Carrier City :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblMCC" runat="server" ></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label38" runat="server" Text="Medical Carrier State :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblMCS" runat="server" ></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label40" runat="server" Text="Medical Carrier Zip Code :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblMCZ" runat="server" ></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label42" runat="server" Text="Medical Insurance Coverage Code :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblMICC" runat="server" ></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label44" runat="server" 
                                  Text="Annual Medical Insurance Cost to Employee :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblAMICE" runat="server" ></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label46" runat="server" Text="Dependent Coverage Available :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblDCA" runat="server" ></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label48" runat="server" 
                                  Text="Number of Dependents Currently Covered for Medical :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblNDCCM" runat="server" ></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label50" runat="server" Text="Medical Covered Dependent #1 :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblMCD1" runat="server" ></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label52" runat="server" Text="Medical Covered Dependent #2 :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblMCD2" runat="server" ></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label54" runat="server" Text="Medical Covered Dependent #3 :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblMCD3" runat="server" ></asp:Label></td>
                      </tr>
                       <tr>
                          <td class="style6">
                              <asp:Label ID="Label11" runat="server" Text="Medical Covered Dependent #4 :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblMCD4" runat="server" ></asp:Label></td>
                      </tr>
                       <tr>
                          <td class="style6">
                              <asp:Label ID="Label56" runat="server" Text="Medical Covered Dependent #5 :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblMCD5" runat="server" ></asp:Label></td>
                      </tr>
                      <tr class="tt"><td>
                             <img width='200' src='../images/image001.png'/><br /><br /></td>
                          <td class="style4">
                             </td>
                      </tr>
                       <tr>
                          <td class="style6">
                              <asp:Label ID="Label58" runat="server" Text="Medical Covered Dependent #6 :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblMCD6" runat="server" ></asp:Label></td>
                      </tr>
                       <tr>
                          <td class="style6">
                              <asp:Label ID="Label60" runat="server" Text="Medical Covered Dependent #7 :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblMCD7" runat="server" ></asp:Label></td>
                      </tr>
                       <tr>
                          <td class="style6">
                              <asp:Label ID="Label62" runat="server" Text="Medical Covered Dependent #8 :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblMCD8" runat="server" ></asp:Label></td>
                      </tr>
                       <tr>
                          <td class="style6">
                              <asp:Label ID="Label64" runat="server" Text="Medical Covered Dependent #9 :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblMCD9" runat="server" ></asp:Label></td>
                      </tr>
                       <tr>
                          <td class="style6">
                              <asp:Label ID="Label66" runat="server" Text="Medical Covered Dependent #10 :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblMCD10" runat="server" ></asp:Label></td>
                      </tr>
                       <tr>
                          <td class="style6">
                              <asp:Label ID="Label68" runat="server" Text="Dental Insurance Available :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblDIA" runat="server" ></asp:Label></td>
                      </tr>
                       <tr>
                          <td class="style6">
                              <asp:Label ID="Label70" runat="server" Text="Employee Eligible for Dental Coverage :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblEEDC" runat="server" ></asp:Label></td>
                      </tr>
                       <tr>
                          <td class="style6">
                              <asp:Label ID="Label72" runat="server" Text="Employee Enrolled for Dental Coverage :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblEEDC1" runat="server" ></asp:Label></td>
                      </tr>
                       <tr>
                          <td class="style6">
                              <asp:Label ID="Label74" runat="server" Text="Dental Policy Number :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblDPN" runat="server" ></asp:Label></td>
                      </tr>
                       <tr>
                          <td class="style6">
                              <asp:Label ID="Label76" runat="server" Text="Dental Carrier Name :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblDCN" runat="server" ></asp:Label></td>
                      </tr>
                       <tr>
                          <td class="style6">
                              <asp:Label ID="Label78" runat="server" Text="Dental Carrier Phone Number :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblDCPN" runat="server" ></asp:Label></td>
                      </tr>
                                         
                     
                      <tr>
                          <td class="style6">
                              &nbsp;</td>
                          <td class="style4">
                              &nbsp;</td>
                      </tr>
                     
                     
                     
                      
                      
                      
                      <tr>
                          <td class="style6">
                              &nbsp;</td>
                          <td class="style4">
                              <asp:Button ID="BtnOk" runat="server" CssClass="text" onclick="BtnOk_Click" 
                                  Text="OK" Width="57px" />
                              &nbsp;<input class="text" name="b_print" 
                                  onClick="printdiv('ContentPlaceHolder1_div_print');" type="button" 
                                  value=" Print "></input></td>
                      </tr>
                     
                     
                     
                      
                      
                      
      </table>   
      </div>
      

      </ContentTemplate>
      </asp:UpdatePanel>
</asp:Content>


