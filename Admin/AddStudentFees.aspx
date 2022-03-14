<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="AddStudentFees.aspx.cs" Inherits="Admin_AddStudentFees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div  class="container" style="margin:2%;">
            <div>
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </div>
            <h2 class="text-center">Add Student Fees</h2>

           <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                    <div class="col-md-3">
                   <label for="txtsearch">Search Student ID (RollNo)</label>
                        <asp:TextBox ID="txtsearch" runat="server" CssClass="form-control" placeholder="Enter Student ID (RollNo)" required="true"></asp:TextBox>
               </div>
               <br />

               <div class="col-md-1">
                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-success" OnClick="btnSearch_Click"  />
                </div>

               <div class="col-md-3">
                <a href="../Admin/AddStudentFeesByClass.aspx">Add Student Fees By Class</a>
               </div>


               </div>
               
        <br /><br />

           


        <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-3">
                   <label id="StudentN">First Name Of Student</label>
               </div>

               <div class="col-md-3">
                   <label id="StudentFN">Student Father Name</label>
               </div>

           </div>
        <br />
         <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
            
             <div class="col-md-3">
                   <label for="ddlPaymentT">Payment Type</label>
                   <asp:DropDownList ID="ddlPaymentT" runat="server" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Payment Type is Required." ControlToValidate="ddlPaymentT" Display="Dynamic" 
                         ForeColor="Red" InitialValue="Select Payment Type" SetFocusOnError="True"></asp:RequiredFieldValidator>
               </div>

             <div class="col-md-3">
                   <label for="txtAmount">Amount</label>
                        <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
               </div>

             <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-3">
                   <label for="txtDiscount">Discount</label>
                        <asp:TextBox ID="txtDiscount" runat="server" CssClass="form-control" placeholder="Discount" TextMode="Number"></asp:TextBox>
               </div>
           </div>

         </div>
        <br />

        <div class="col-md-2">
         <asp:Button ID="btnAdd" runat="server" Text="Add Fees" CssClass="btn btn-primary btn-block" BackColor="#5558c9" />

        </div>
 </div>



</asp:Content>


