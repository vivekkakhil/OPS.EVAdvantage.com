<%@ Page Language="C#" MasterPageFile="~/EVA.master" AutoEventWireup="true" CodeFile="employment.aspx.cs"
    Inherits="employment" Title="Employment Verification Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style3
        {
            height: 20px;
        }
        .style4
        {
            height: 20px;
        }
        .style5
        {
            width: 285px;
        }
        .style6
        {
            height: 20px;
            width: 285px;
        }
        .body2
        {
            color: #000000;
            font-family: Verdana,Arial,Helvetica,sans-serif;
            font-size: 11px;
            line-height: 17px;
            margin: 0;
            padding: 0;
        }
    </style>
    <style type="text/css" media="print">
        .text
        {
            display: none;
            visibility: hidden;
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-size: 11px;
        }
    </style>

    <script language="javascript">
        function printdiv(printpage) {
            var headstr = "<html><head><title></title></head><body><div style='width:100%; text-align:center;'><img width='200' src='images/image001.png' align='center'/></div><h3>Employment Verification</h3><br />";
            var footstr = "</body>";
            //var newstr = document.all.item(printpage).innerHTML;
            var newstr = document.getElementById(printpage).innerHTML;
            var oldstr = document.body.innerHTML;
            document.body.innerHTML = headstr + newstr + footstr;
            document.getElementById("main_body").className = "body2";
            window.print();
            document.body.innerHTML = oldstr;
            document.getElementById("main_body").className = "body1";
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManagerProxy ID="scriptProxy" runat="server">
    </asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="upPanel" runat="server">
        <ContentTemplate>
            <div id="div_print" runat="server" class="content">
                <table width="100%">
                    <tr>
                        <td style="width: 60%">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label18" runat="server" CssClass="label" Text="Your Requested Verification for  "></asp:Label>
                                        <asp:Label ID="lblname" runat="server" CssClass="label"></asp:Label>
                                    </td>
                                    <td align="right">
                                        <asp:Label ID="Label23" runat="server" ForeColor="Red" CssClass="text" Text="This is the only opportunity to print this page."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <hr style="width: 550px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                    </td>
                                </tr>
                            </table>
                            <table cellpadding="0" cellspacing="0" class="style1">
                                <tr>
                                    <td class="style5">
                                        <asp:Label ID="Label1" runat="server" Text="Verification Issued on :"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblissue" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6">
                                        <asp:Label ID="Label2" runat="server" Text="Verification Type :"></asp:Label>
                                    </td>
                                    <td class="style4">
                                        <asp:Label ID="lbltype" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6">
                                        <asp:Label ID="Label3" runat="server" Text="Reference Number :"></asp:Label>
                                    </td>
                                    <td class="style4">
                                        <asp:Label ID="lblrefno" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6">
                                        <asp:Label ID="Label4" runat="server" Text="Information Current as of :"></asp:Label>
                                    </td>
                                    <td class="style4">
                                        <asp:Label ID="lblinfo" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6">
                                        <asp:Label ID="Label5" runat="server" Text="Employer :"></asp:Label>
                                    </td>
                                    <td class="style4">
                                        <asp:Label ID="lblemployer" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6">
                                        <asp:Label ID="Label6" runat="server" Text="Employer Address :"></asp:Label>
                                    </td>
                                    <td class="style4">
                                        <asp:Label ID="lblemployeradd" runat="server"></asp:Label>
                                    </td>
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
                                        &nbsp;
                                    </td>
                                    <td class="style4">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6">
                                        <asp:Label ID="Label7" runat="server" Text="Employee First Name :"></asp:Label>
                                    </td>
                                    <td class="style4">
                                        <asp:Label ID="lblempfn" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6">
                                        <asp:Label ID="Label8" runat="server" Text="Employee Middle Name :"></asp:Label>
                                    </td>
                                    <td class="style4">
                                        <asp:Label ID="lblempmn" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6">
                                        <asp:Label ID="Label9" runat="server" Text="Employee Last Name :"></asp:Label>
                                    </td>
                                    <td class="style4">
                                        <asp:Label ID="lblempln" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6">
                                        <asp:Label ID="Label10" runat="server" Text="Social Security Number :"></asp:Label>
                                    </td>
                                    <td class="style4">
                                        <asp:Label ID="lblssn" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6">
                                        <asp:Label ID="Label11" runat="server" Text="Employee Id :"></asp:Label>
                                    </td>
                                    <td class="style4">
                                        <asp:Label ID="lblempid" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6">
                                        <asp:Label ID="Label12" runat="server" Text="Employment Status :"></asp:Label>
                                    </td>
                                    <td class="style4">
                                        <asp:Label ID="lblestatus" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6">
                                        <asp:Label ID="Label13" runat="server" Text="Job Status :"></asp:Label>
                                    </td>
                                    <td class="style4">
                                        <asp:Label ID="lbljstatus" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6">
                                        <asp:Label ID="Label14" runat="server" Text="Most Recent Hire Date :"></asp:Label>
                                    </td>
                                    <td class="style4">
                                        <asp:Label ID="lblrhdt" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6">
                                        <asp:Label ID="Label15" runat="server" Text="Previous Hire Date :"></asp:Label>
                                    </td>
                                    <td class="style4">
                                        <asp:Label ID="lblphdt" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6">
                                        <asp:Label ID="Label16" runat="server" Text="Total Time With Employer :"></asp:Label>
                                    </td>
                                    <td class="style4">
                                        <asp:Label ID="lblyears" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6">
                                        <asp:Label ID="Label17" runat="server" Text="Job Title :"></asp:Label>
                                    </td>
                                    <td class="style4">
                                        <asp:Label ID="lbltitle" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6">
                                        &nbsp;
                                    </td>
                                    <td class="style4">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3" colspan="2">
                                        <table id="tblsep" runat="server" width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td class="style5">
                                                    <asp:Label ID="Label20" runat="server" Text="Separation Date :"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblsepdt" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style6">
                                                    <asp:Label ID="Label22" runat="server" Text="Separation Reason :"></asp:Label>
                                                </td>
                                                <td class="style4">
                                                    <asp:Label ID="lblreason" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <%--<tr>
                          <td class="style6">
                              <asp:Label ID="Label24" runat="server" Text="Rate Basis :"></asp:Label>
                          </td>
                          <td class="style4">
                            <asp:Label ID="lblrbasis" runat="server" ></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label26" runat="server" Text="Pay Frequency :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblfrequency" runat="server" ></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label28" runat="server" Text="Current Base Pay Rate :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblcbpr" runat="server" ></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label30" runat="server" Text="Most Recent Change in Rate :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblmrcir" runat="server" ></asp:Label></td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label32" runat="server" Text="Avg Hours per Pay Period (If Hourly) :"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblhourly" runat="server"></asp:Label>
                          </td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label21" runat="server" Text="Gross Earnings YTD"></asp:Label>
                              &nbsp;<asp:Label ID="lblcyear" runat="server"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblytd" runat="server"></asp:Label>
                          </td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label25" runat="server" Text="Gross Earnings for"></asp:Label>
                              &nbsp;<asp:Label ID="lblpyear" runat="server"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblGE1" runat="server"></asp:Label>
                          </td>
                      </tr>
                      <tr>
                          <td class="style6">
                              <asp:Label ID="Label29" runat="server" Text="Gross Earnings for"></asp:Label>
                              &nbsp;<asp:Label ID="lbllyear" runat="server"></asp:Label>
                          </td>
                          <td class="style4">
                              <asp:Label ID="lblGE2" runat="server"></asp:Label>
                          </td>
                      </tr>--%>
                                            <tr runat="server" id="tr1" visible="false">
                                                <td colspan="2" class="style6">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr runat="server" id="tr2" visible="false">
                                                <td colspan="2" style="font-size: 12px; color: Red; text-align: center;">
                                                    A good-faith effort shall be made to retrieve and provide previous DOT record information, for verification purposes, free of charge, per part 382 of the DOT code, within the 30 day required time period.
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" class="style6">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style6">
                                        &nbsp;
                                    </td>
                                    <td class="style4">
                                        <asp:Button ID="BtnOk" runat="server" OnClick="BtnOk_Click" Text="OK" Width="57px"
                                            CssClass="text" />
                                        &nbsp;<input name="b_print" type="button" onclick="printdiv('ContentPlaceHolder1_div_print');"
                                            value=" Print " class="text">
                                        <%-- <input name="b_print1" type="button"   
                                  onClick="print();" value=" Print " 
                                  class="text">--%>
                                    </td>
                                </tr>
                            </table>
                            <td style="width: 40%">
                                <table width="100%">
                                    <tr>
                                        <td class="style4" width="40%" align="center" style="background-color: Silver; border-style: solid;
                                            border-color: Black; border-width: thin;">
                                            <b>Disclaimer</b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style4" rowspan="6" align="justify" style="border-style: solid; border-color: Black;
                                            border-width: thin;">
                                            The information provided in this verification is as current as the information provided
                                            to EV Advantage by the Employer on a routine basis. If you believe this information
                                            to be in error, or have additional questions, please do not hesitate to contact
                                            EV Advantage at info@evadvantage.com, toll free 877-783-0240. Or you may fax your
                                            requests to 866-710-3846.
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="clear">
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
