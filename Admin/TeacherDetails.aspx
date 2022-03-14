<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="TeacherDetails.aspx.cs" Inherits="Admin_TeacherDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div  class="container p-md-4 p-sm-10">
            <div>
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </div>
            <h2 class="text-center">Teacher Details</h2>

           <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                    <div class="col-md-3">
                   <label for="txtName">Name</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Name" required="true"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Name Should be in Characters" ForeColor="Red" ValidationExpression="^[a-zA-Z\s]+$" Display="Dynamic" 
                            SetFocusOnError="true" ControlToValidate="txtName"></asp:RegularExpressionValidator>
               </div>

               <div class="col-md-3">
                   <label for="txtDOB">Date Of Birth</label>
                   <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" TextMode="Date" required="true"></asp:TextBox>
               </div>

               <div class="col-md-3">
                   <label for="txtJD">Joining Date</label>
                   <asp:TextBox ID="txtJD" runat="server" CssClass="form-control" TextMode="Date" required="true"></asp:TextBox>
               </div>
           </div>


        <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                    <div class="col-md-3">
                   <label for="ddlGender">Gender</label>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0">Select Gender</asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                            <asp:ListItem>Other</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ErrorMessage="Gender is Required" ForeColor="Red" ControlToValidate="ddlGender" Display="Dynamic" SetFocusOnError="true" InitialValue="Select Gender">
                        </asp:RequiredFieldValidator>
               </div>

               <div class="col-md-3">
                   <label for="txtMobile">Mobile</label>
                   <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" TextMode="Number" placeholder="10 Digits Mobile No" required="true"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Mobile No" 
                    ForeColor="Red" ValidationExpression="[0-9]{10}" Display="Dynamic" 
                SetFocusOnError="true" ControlToValidate="txtMobile"></asp:RegularExpressionValidator>
               </div>

               <div class="col-md-3">
                   <label for="ddlQu">Qualification</label>
                        <asp:DropDownList ID="ddlQu" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0">Select Qualification</asp:ListItem>
                            <asp:ListItem>School Graduate</asp:ListItem>
                            <asp:ListItem>Bachelor</asp:ListItem>
                            <asp:ListItem>Master</asp:ListItem>
                            <asp:ListItem>PHD</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ErrorMessage="Qualification is Required" ForeColor="Red" ControlToValidate="ddlQu" Display="Dynamic" SetFocusOnError="true" InitialValue="Select Qualification">
                        </asp:RequiredFieldValidator>
               </div>

           </div>
         <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                    <div class="col-md-3">
                   <label for="txtEmail">Email</label>
                  <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email" TextMode="Email" required="true"></asp:TextBox>
                        
               </div>

               <div class="col-md-3">
                   <label for="txtPassword">password</label>
                   <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control"  placeholder="Enter Password" required="true" TextMode="Password"></asp:TextBox>
               </div>

             <div class="col-md-3">
                   <label for="txtE">Experiance In Year</label>
                  <asp:TextBox ID="txtE" runat="server" CssClass="form-control" placeholder="Enter Experiance" required="true" TextMode="Number"></asp:TextBox>
                        
               </div>
           </div>

         <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                    <div class="col-md-6">
                   <label for="txtAddress">Address</label>
                  <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Address" TextMode="MultiLine" required="true"></asp:TextBox>
                        
               </div>

             <div class="col-md-6">
                 <label for="Photo">Photo</label>
                 <asp:FileUpload ID="photo" runat="server" />
             </div>
           </div>

           <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-2 col-md-offset-0 mb-3"><br />
                    <asp:Button ID="btnsearch" runat="server" Text="Search Teacher" CssClass="btn btn-primary btn-block" BackColor="#5558c9" OnClick="btnsearch_Click" />

                </div>
               
           
           </div>
        </div>

</asp:Content>

