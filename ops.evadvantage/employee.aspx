<%@ Page Language="C#" MasterPageFile="EVAadmin.master" AutoEventWireup="true" CodeFile="employee.aspx.cs" Inherits="Admin_employee" Title="Employee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="http://fonts.cdnfonts.com/css/helvetica-2" rel="stylesheet"/>
        <link href="css/style.css" rel="stylesheet" />
    <style type="text/css">
        .style1
        {
            width: 125px;
        }
        .style5
        {
            height: 20px;
        }
        .style8
        {
            width: 91px;
        }
        .style12
        {
            width: 220px;
        }
        .style14
        {
            width: 92px;
        }
       
        .style15
        {
            width: 224px;
        }
        .style16
        {
            width: 91px;
            height: 26px;
        }
        .style17
        {
            width: 224px;
            height: 26px;
        }
        .style18
        {
            width: 92px;
            height: 26px;
        }
        .style19
        {
            width: 220px;
            height: 26px;
        }
        .style20
        {
            height: 26px;
            width: 127px;
        }
       
        .style21
        {
            width: 127px;
        }
       .modalProgressGreyBackground
        {
            background: #CCCCCC;
               opacity:.50;
              filter:alpha(opacity=50);
               -moz-opacity:0.5; 
            
            width:100%; 
           
	               
	        margin:0 auto;
	       
	        
	        height:100%;
	        
	        padding:10px 0 20px 0; 
	
            z-index:1000; 
            position:absolute; 
            top:100px; 
            bottom:0px; 
            left:0px; 
            right:0px;
           /* overflow:hidden; 
            padding:0; 
            margin:0;
            width:100%; 
            height:100%;
            background-color:#CCCCCC;  
            filter:alpha(opacity=60);
            opacity:0.6; */
           

        }
      
        .modalPopup
        {
            text-align: center;
            padding-top: 10px;
            border-style: solid;
            border-width: 1px;
            background-color: White;
            width: 300px;
            height: 130px;
              position:absolute;  
              top:200px;  
              left:350px; 
              
              
              z-index:1000; 
           /*   background-color:White;
              border-width: 1px;
              text-align: center;
              padding-top: 30px;
              border-style: solid;
              width: 300px; 
              height: 109px; */
              opacity:.100;
              filter:alpha(opacity=100);
               -moz-opacity:1.0; 
            
             
             
        }
         .style23
    {
        width: 100%;
    }
    .style25
    {
        height: 18px;
        width: 97px;
    }
    .style26
    {
        width: 97px;
    }
    .style27
    {
        height: 25px;
        width: 97px;
    }
    .style28
    {
        height: 25px;
    }
    </style>
      <SCRIPT type=text/javascript>
    function doClick(buttonName,e)
    {
//the purpose of this function is to allow the enter key to 

//point to the correct button to click.

        var key;

         if(window.event)
              key = window.event.keyCode;     //IE

         else
              key = e.which;     //firefox

    
        if (key == 13)
        {
            //Get the button the user wants to have clicked

            var btn = document.getElementById(buttonName);
            if (btn != null)
            { //If we find the button click it

                btn.click();
                event.keyCode = 0
            }
        }
   }
    </SCRIPT>

<link rel="stylesheet" href="../css/bubble-tooltip.css" media="screen">
	<script type="text/javascript" src="../Scripts/bubble-tooltip.js"></script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ScriptManagerProxy ID="scriptProxy" runat="server">
    </asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="upPanel" runat="server">
        <ContentTemplate>
<div class="content1">
<table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td >
                            <asp:Label ID="Label16" runat="server" CssClass="label" 
                                Text="Search employee and view/change the status of employee."></asp:Label>
                        </td>
                        <td align="right">
                             <asp:Label ID="Label18" runat="server" Font-Bold="True" ForeColor="Red" 
                                Text="*"></asp:Label>
                            <asp:Label ID="Label17" runat="server" 
                                Text="Marked fields are mandatory." Font-Italic="True"></asp:Label></td>
                    </tr>
                </table>
 <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                 <tr>
                        <td align="left" class="style16" >
           
                </td>
                 <td align="left" class="style17" >
           
                </td>
                        <td align="left" class="style18">
                        </td>
                        <td align="left" class="style19">
                        </td>
                        <td align="left" class="style20">
                        </td>
                </tr>
                <tr>
                    <td align="left" class="style8">
                        <asp:Label ID="Label25" runat="server" Font-Bold="True" ForeColor="Red" 
                            Text="*"></asp:Label>
                        <asp:Label ID="Label23" runat="server" Text="Search By :"></asp:Label>
                    </td>
                    <td align="left" class="style15">
                        <asp:DropDownList ID="ddlSearch" runat="server" CssClass="textbox" 
                            Width="192px">
                            <asp:ListItem Value="-1">-Select-</asp:ListItem>
                            <asp:ListItem Value="1">Company</asp:ListItem>
                            <asp:ListItem Value="2">Employee Name</asp:ListItem>
                            <asp:ListItem Value="3">Social Security #</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="ddlSearch" ErrorMessage="Please select Search By option" 
                            InitialValue="-1">*</asp:RequiredFieldValidator>
                    </td>
                    <td align="left" class="style14">
                        <asp:Label ID="Label26" runat="server" Font-Bold="True" ForeColor="Red" 
                            Text="*"></asp:Label>
                        <asp:Label ID="Label24" runat="server" Text="Search For :"></asp:Label>
                    </td>
                    <td align="left" class="style12">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="textbox" Width="194px"></asp:TextBox>
                        
                    </td>
                    <td align="left" class="style21">
                        <asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" 
                            Text="Search" Width="57px" />
                        &nbsp;<asp:Button ID="btnClear" runat="server" CausesValidation="False" 
                            onclick="btnClear_Click" Text="Clear" Width="57px" />
                    </td>
                     <td align="left">
                       &nbsp;<img src="../images/action_help.gif" onmousemove="showToolTip(event,'To search all the employees please select Search By option and enter * in Search For.');return false" onmouseout="hideToolTip()"/>
                                     <div id="bubble_tooltip">
	<div class="bubble_top"><span></span></div>
	<div class="bubble_middle"><span id="bubble_tooltip_content"></span></div>
	<div class="bubble_bottom"></div>
</div>                                   
                    </td>
     </tr>
                </table>
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td >
                           
                            &nbsp;</td>
                      
                        <td>
                            &nbsp;</td>
                      
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label20" runat="server" 
                                style="font-size: small; font-weight: 700; text-decoration: underline; color: #003399" 
                                Text="Employee List"></asp:Label>
                        </td>
                       
                            <td align="right">
                                      <asp:Image ID="Image5" runat="server" ImageUrl="~/images/ratingplus.gif" />
                                      <asp:Label ID="Label1" runat="server" style="font-size: small" Text="Active"></asp:Label>
                                      &nbsp;
                                      <asp:Image ID="Image6" runat="server" ImageUrl="~/images/ratingminus.gif" />
                                      <asp:Label ID="Label2" runat="server" style="font-size: small" Text="Inactive"></asp:Label>
                                  </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:GridView ID="gvEmployee" runat="server" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                                EmptyDataText="There is no data to display." ForeColor="#333333" 
                                GridLines="None" style="margin-top: 0px" Width="100%" 
                                onpageindexchanging="gvEmployee_PageIndexChanging" 
                                onsorting="gvEmployee_Sorting" 
                                onselectedindexchanging="gvEmployee_SelectedIndexChanging">
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <Columns>
                                 <asp:BoundField DataField="UserId" HeaderText="UserId"  Visible="false" ReadOnly="True" 
                                        SortExpression="UserId">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="email" HeaderText="email"  Visible="false" ReadOnly="True" 
                                        SortExpression="email">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="UserName" HeaderText="User Name" ReadOnly="True" 
                                        SortExpression="UserName">
                                        <HeaderStyle HorizontalAlign="Left" Width="120px" />
                                        <ItemStyle HorizontalAlign="Left" Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="SSN" HeaderText="Social Security#" ReadOnly="True" 
                                        SortExpression="SSN">
                                        <HeaderStyle HorizontalAlign="Left" Width="220px" />
                                        <ItemStyle HorizontalAlign="Left" Width="220px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Name" SortExpression="Name">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="200px" />
                                        <ItemStyle HorizontalAlign="Left" Width="200px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="DateOfBirth" HeaderText="Birth Date" 
                                        ReadOnly="True" SortExpression="DateOfBirth">
                                        <HeaderStyle HorizontalAlign="Left" Width="100px" />
                                        <ItemStyle HorizontalAlign="Left" Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Companyname" HeaderText="Company " 
                                        SortExpression="Companyname">
                                        <HeaderStyle HorizontalAlign="Left" Width="250px" />
                                        <ItemStyle HorizontalAlign="Left" Width="250px" />
                                    </asp:BoundField>
                                      <asp:TemplateField HeaderText="Active?" SortExpression="IsActive">
                                                  <EditItemTemplate>
                                                      <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("IsActive") %>'></asp:TextBox>
                                                  </EditItemTemplate>
                                                  <ItemTemplate>
                                                      <asp:Image ID="imgUsed1" runat="server" 
                                                          ImageUrl='<%# GetStatusImageUrl(Eval("IsActive")) %>' />
                                                    
                                                  </ItemTemplate>
                                                  <HeaderStyle HorizontalAlign="Left" Width="30px" />
                                                  <ItemStyle HorizontalAlign="Left" Width="30px" />
                                              </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                               CommandName="Select"  Text="Select" Font-Size="11px" OnCommand="GetUserId"  CommandArgument='<%# Bind("UserId") %>'  ></asp:LinkButton>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="30px" />
                                        <ItemStyle HorizontalAlign="Left" Width="30px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Reset" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkReset" runat="server" CausesValidation="False" OnClientClick="return confirm('Are you sure you want to reset the password?');"
                                             CommandArgument='<%# Bind("email") %>' OnCommand="ResetPwd" CommandName='<%# Bind("UserId") %>' Text="Reset Pwd" Font-Size="11px" ></asp:LinkButton>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" Width="110px" />
                                        <ItemStyle HorizontalAlign="Left" Width="110px" />
                                    </asp:TemplateField>
                                               <asp:TemplateField HeaderText="Status">
                                                 
                                                  <ItemTemplate>
                                                       <asp:LinkButton ID="lnkChange" runat="server" 
                                                           OnCommand="ChangeStatus1" CommandName='<%# Bind("UserId") %>' CommandArgument='<%# Bind("IsActive") %>'
                                                          Text="Change" Font-Size="11px" CausesValidation="false" ></asp:LinkButton>
                                                    
                                                  </ItemTemplate>
                                                  <HeaderStyle HorizontalAlign="Left" Width="50px" />
                                                  <ItemStyle HorizontalAlign="Left" Width="50px" />
                                              </asp:TemplateField>
                                </Columns>
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                                    Font-Size="Small" />
                                <EditRowStyle BackColor="#999999" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
                 <table id="tblcode" runat="server" cellpadding="0" cellspacing="0" class="style1">
                  <tr>
                      <td align="left">
                          <table cellpadding="0" cellspacing="0" width="100%">
                              <tr>
                                  <td class="style5">
                                  </td>
                                  <td align="right" class="style5">
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                      <%--<asp:Label ID="Label3" runat="server" 
                                          style="font-size: small; font-weight: 700; text-decoration: underline; color: #003399" 
                                          Text="Active Codes"></asp:Label>--%>
                                          <asp:Label ID="Label3" runat="server" 
                                          style="font-size: small; font-weight: 700; text-decoration: underline; color: #003399" 
                                          Text="Active Salary Authorization Codes"></asp:Label>
                                  </td>
                                  <td align="right">
                                      <asp:Image ID="Image1" runat="server" ImageUrl="~/images/ratingplus.gif" />
                                      <asp:Label ID="Label14" runat="server" style="font-size: small" Text="Enable"></asp:Label>
                                      &nbsp;
                                      <asp:Image ID="Image2" runat="server" ImageUrl="~/images/ratingminus.gif" />
                                      <asp:Label ID="Label5" runat="server" style="font-size: small" Text="Disable"></asp:Label>
                                  </td>
                              </tr>
                          </table>
                      </td>
                  </tr>
                  <tr>
                      <td align="left">
                          &nbsp;</td>
                  </tr>
                  <tr>
                      <td align="left">
                          <table cellpadding="0" cellspacing="0" class="style1">
                              <tr>
                                  <td>
                                      <asp:GridView ID="gvActiveCode" runat="server" AutoGenerateColumns="False" 
                                          CellPadding="4" DataSourceID="SqlDataSource2" 
                                          EmptyDataText="No code is active." 
                                          ForeColor="#333333" GridLines="None" Width="798px">
                                          <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                          <Columns>
                                              <asp:BoundField DataField="AuthCodeId" HeaderText="AuthCodeId" 
                                                  InsertVisible="False" ReadOnly="True" SortExpression="AuthCodeId" 
                                                  Visible="False" />
                                              <asp:BoundField DataField="AuthCodeNo" HeaderText="Auth Code" 
                                                  SortExpression="AuthCode">
                                                  <HeaderStyle HorizontalAlign="Left" />
                                                  <ItemStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                              <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" 
                                                  Visible="False" />
                                              <asp:BoundField DataField="IssueDate" HeaderText="Created Date" 
                                                  SortExpression="IssueDate">
                                                  <HeaderStyle HorizontalAlign="Left" />
                                                  <ItemStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                              <asp:BoundField DataField="ExpiredDate" HeaderText="Expiry Date" 
                                                  SortExpression="Expired Date">
                                                  <HeaderStyle HorizontalAlign="Left" />
                                                  <ItemStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                              <asp:TemplateField HeaderText="Status" SortExpression="Status">
                                                  <EditItemTemplate>
                                                      <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                                                  </EditItemTemplate>
                                                  <ItemTemplate>
                                                      <asp:Image ID="img" runat="server" 
                                                          ImageUrl='<%# GetImageUrl(Eval("Status")) %>' />
                                                      <%-- <asp:Label ID="Label1" runat="server" Text='<%# Bind("Status") %>'></asp:Label>--%>
                                                  </ItemTemplate>
                                                  <HeaderStyle HorizontalAlign="Left" />
                                                  <ItemStyle HorizontalAlign="Left" />
                                              </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Change Status">
                                                  <HeaderStyle HorizontalAlign="Left" />
                                                  <ItemStyle HorizontalAlign="Left" />
                                                  <ItemTemplate>
                                                      <asp:LinkButton ID="lnkChange" runat="server" 
                                                           OnCommand="ChangeStatus" CommandName='<%# Bind("AuthCodeId") %>' CommandArgument='<%# Bind("Status") %>'
                                                          Text="Change Status" Font-Size="11px"></asp:LinkButton>
                                                  </ItemTemplate>
                                              </asp:TemplateField>
                                              <asp:TemplateField ShowHeader="False" HeaderText="Delete">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName='<%# Bind("AuthCodeId") %>'  OnCommand="DeleteCode"  OnClientClick="return confirm('Are you sure you want to delete?');"  Text="Delete" Font-Size="11px" ></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" />
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                                          </Columns>
                                          <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                          <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                          <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                                              Font-Size="Small" />
                                          <EditRowStyle BackColor="#999999" />
                                          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                      </asp:GridView>
                                      <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                          ConnectionString="<%$ ConnectionStrings:MemeberShipConnectionString %>" 
                                          SelectCommand="Sp_Get_ActiveCode" SelectCommandType="StoredProcedure">
                                          <SelectParameters>
                                              <asp:SessionParameter Name="userid" SessionField="emp" Type="Int32" />
                                          </SelectParameters>
                                      </asp:SqlDataSource>
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                      &nbsp;</td>
                              </tr>
                              <tr>
                                  <td>
                                      <table cellpadding="0" cellspacing="0" width="100%">
                                          <tr>
                                              <td>
                                                  <%--<asp:Label ID="Label4" runat="server" 
                                                      style="font-size: small; font-weight: 700; text-decoration: underline; color: #003399" 
                                                      Text="Used/Expired Code"></asp:Label>--%>
                                                  <asp:Label ID="Label4" runat="server" 
                                                      style="font-size: small; font-weight: 700; text-decoration: underline; color: #003399" 
                                                      Text="Used/Expired Salary Authorization Code"></asp:Label>
                                              </td>
                                              <td align="right">
                                                  <asp:Image ID="Image3" runat="server" ImageUrl="~/images/DNNExplorer_OK.gif" />
                                                  &nbsp;<asp:Label ID="Label6" runat="server" style="font-size: small" Text="Used"></asp:Label>
                                                  &nbsp;&nbsp;
                                                  <asp:Image ID="Image4" runat="server" 
                                                      ImageUrl="~/images/DNNExplorer_Cancel.gif" />
                                                  &nbsp;<asp:Label ID="Label7" runat="server" style="font-size: small" Text="Expired"></asp:Label>
                                              </td>
                                          </tr>
                                      </table>
                                  </td>
                              </tr>
                              <tr>
                                  <td>
                                      &nbsp;</td>
                              </tr>
                              <tr>
                                  <td>
                                      <asp:GridView ID="gvUsed" runat="server" AllowPaging="True" 
                                          AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" 
                                          EmptyDataText="No codes are used/expired." ForeColor="#333333" 
                                          GridLines="None" Width="798px">
                                          <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                          <Columns>
                                              <asp:BoundField DataField="AuthCodeId" HeaderText="AuthCodeId" 
                                                  InsertVisible="False" ReadOnly="True" SortExpression="AuthCodeId" 
                                                  Visible="False">
                                                  <HeaderStyle HorizontalAlign="Left" />
                                                  <ItemStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                              <asp:BoundField DataField="AuthCodeNo" HeaderText="Auth Code" 
                                                  SortExpression="AuthCodeNo">
                                                  <HeaderStyle HorizontalAlign="Left" />
                                                  <ItemStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                              <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" 
                                                  Visible="False">
                                                  <HeaderStyle HorizontalAlign="Left" />
                                                  <ItemStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                              <asp:BoundField DataField="IssueDate" HeaderText="Created Date" 
                                                  ReadOnly="True" SortExpression="IssueDate">
                                                  <HeaderStyle HorizontalAlign="Left" />
                                                  <ItemStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                              <asp:TemplateField HeaderText="Status" SortExpression="Status">
                                                  <EditItemTemplate>
                                                      <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                                                  </EditItemTemplate>
                                                  <ItemTemplate>
                                                  <asp:Image ID="imgUsed" runat="server" 
                                                          ImageUrl='<%# GetUsedImageUrl(Eval("Status")) %>' />
                                                      <%--<asp:Label ID="Label1" runat="server" Text='<%# Bind("Status") %>'></asp:Label>--%>
                                                  </ItemTemplate>
                                                  <HeaderStyle HorizontalAlign="Left" />
                                                  <ItemStyle HorizontalAlign="Left" />
                                              </asp:TemplateField>
                                              <asp:BoundField DataField="ExpiredDate" HeaderText="Used/Expiry Date" 
                                                  ReadOnly="True" SortExpression="ExpiredDate">
                                                  <HeaderStyle HorizontalAlign="Left" />
                                                  <ItemStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                              <asp:BoundField DataField="FirstName" HeaderText="Verifier" 
                                                  SortExpression="FirstName">
                                                  <HeaderStyle HorizontalAlign="Left" />
                                                  <ItemStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                          </Columns>
                                          <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                          <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                          <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                                              Font-Size="Small" />
                                          <EditRowStyle BackColor="#999999" />
                                          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                      </asp:GridView>
                                      <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                                          ConnectionString="<%$ ConnectionStrings:MemeberShipConnectionString %>" 
                                          SelectCommand="Sp_Get_UsedCode" SelectCommandType="StoredProcedure">
                                          <SelectParameters>
                                              <asp:SessionParameter Name="userid" SessionField="emp" Type="Int32" />
                                          </SelectParameters>
                                      </asp:SqlDataSource>
                                  </td>
                              </tr>
                          </table>
                      </td>
                  </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
    <div class="clear">
     <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" style="margin-left: 0px" />
    </div> <div class="modalProgressGreyBackground" id="divmain" runat="server"></div>
     <div class="modalPopup" id="divpop" runat="server">
                   <table cellpadding="0" cellspacing="0" class="style23">
                       <tr>
                           <td align="left" class="style27">
                               &nbsp;
                               <asp:Label ID="Label27" runat="server" Text="User Name :"></asp:Label>
                           </td>
                           <td align="left" class="style28">
                               &nbsp;
                               <asp:Label ID="lblUser" runat="server"></asp:Label>
                           </td>
                       </tr>
                       <tr>
                           <td align="left" class="style26">
                               &nbsp;
                               <asp:Label ID="Label28" runat="server" Text="Password :"></asp:Label>
                           </td>
                           <td align="left">
                               <asp:TextBox ID="txtpass" runat="server" CssClass="textbox"></asp:TextBox>
                           </td>
                       </tr>
                       <tr>
                           <td align="left" class="style26">
                               &nbsp;
                               <asp:Label ID="Label29" runat="server" Text="Email :"></asp:Label>
                           </td>
                           <td align="left">
                               <asp:TextBox ID="txtemail" runat="server" CssClass="textbox"></asp:TextBox>
                           </td>
                       </tr>
                       <tr>
                           <td align="left" class="style25">
                               </td>
                           <td align="left" class="style21">
                               <asp:TextBox ID="txtuserid" runat="server" Visible="False"></asp:TextBox>
                               </td>
                       </tr>
                       <tr>
                           <td align="left" class="style26">
                               &nbsp;</td>
                           <td align="left">
                               <asp:Button ID="btnSubmit" runat="server" Text="Submit" Width="56px" 
                                   onclick="btnSubmit_Click" />
                               &nbsp;<asp:Button ID="btnClose" runat="server" CausesValidation="false" 
                                   onclick="btnClose_Click" Text="Close" Width="56px" />
                           </td>
                       </tr>
                   </table>
                
            </div>
</div></ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

