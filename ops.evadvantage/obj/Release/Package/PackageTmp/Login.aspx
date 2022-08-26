<%@ Page Language="C#" MasterPageFile="EVAadmin.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" Title="Welcome to Admin module of EVAdvantage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../style.css" rel="stylesheet" type="text/css" />
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="http://fonts.cdnfonts.com/css/helvetica-2" rel="stylesheet"/>
        <link href="css/style.css" rel="stylesheet" />
    <style type="text/css">
        .style1
        {
            width: 133px;
        }
        .style3
        {
            height: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManagerProxy ID="scriptProxy" runat="server">
    </asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="upPanel" runat="server">
        <ContentTemplate>

  <section class="loginPage">

                <div class="container">

                    <div class="formInner">
                        <h2 id="H1" runat="server">Admin Login</h2>
                        <ul>
                            <span>- Enable or Disable Employee and Verifier Account</span>
                            <span>- Search Employee by Company</span>
                        </ul>

                       <%-- <form id="form1" runat="server">--%>
                            <label for="uname" id="Label18" runat="server">Username <span class="gfield_required"><span id="Label19" runat="server" class="gfield_required gfield_required_text">(Required)</span></span></label>
                            <%-- <input type="text" placeholder="Enter Username" name="uname" required=""><br />--%>
                             <asp:TextBox ID="txtUser" runat="server" CssClass="textbox"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                              ControlToValidate="txtUser" ErrorMessage="Please enter User Name.">*</asp:RequiredFieldValidator>
                            <br />
                            <label for="psw" id="Label1" runat="server">Password <span class="gfield_required"><span id="Label20" runat="server" class="gfield_required gfield_required_text">(Required)</span></span></label>
                            <%-- <input type="password" placeholder="Enter Password" name="psw" required="">--%>

                            <asp:TextBox ID="txtPwd" runat="server" CssClass="textbox" TextMode="Password"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                              ControlToValidate="txtPwd" ErrorMessage="Please enter Password.">*</asp:RequiredFieldValidator>

                         <%--<button type="submit" id="imgbtnVLogin" runat="server" onclick="imgbtnVLogin_Click"
                                validationgroup="verifier">
                                Login</button>--%>

                        <%-- <asp:LinkButton ID="imgbtnVLogin"  type="submit" runat="server" CausesValidation="False" 
                               Text="Login" 
                              onclick="imgbtnVLogin_Click" ValidationGroup="verifier"></asp:LinkButton>--%>
                  
                   <%--        <asp:ImageButton ID="imgbtnVLogin" runat="server" ImageUrl="images/login_btn.jpg" 
                          width="110" height="34" onclick="imgbtnVLogin_Click" align="center"
                          ValidationGroup="verifier" />--%>
                        <br />
                        <div id="button1" runat="server" align="center">
                        <asp:Button ID="imgbtnLogin" runat="Server" onclick="imgbtnLogin_Click"   Font-Bold="true"   ValidationGroup="verifier" Text="Login"/>
                            </div>
                            <div class="bottomForm">
                                <%--<p class="form-content">Request your <a href="#">(VWE)</a> Verification of Wage and Employment (annual disclosure)</p>--%>

                               
                          

                               <%--  <asp:ImageButton ID="imgbtnNewUserVerif" runat="server" ImageUrl="images/newUser.gif" 
                          CausesValidation="False" 
                          ValidationGroup="verifier" onclick="imgbtnNewUserVerif_Click" />--%>

                                <br />
                                <br />
                                <%--<p id="lnkForgetVeri" runat="server" causesvalidation="False" class="forgotPassword" onclick="lnkForgetVeri_Click" validationgroup="verifier"><a href="#">Forgot Password?</a></p>--%>
                                     
                            </div>
                          <div class="clear">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        ShowMessageBox="True" ShowSummary="False" />

                      <%--  </form>--%>

                    </div>
                </div>
            </section>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
