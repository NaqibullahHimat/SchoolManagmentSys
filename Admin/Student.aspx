<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Student.aspx.cs" Inherits="Admin_Student" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



     <div  class="container p-md-4 p-sm-10">
            <div>
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </div>
            <h2 class="text-center">Add Student</h2>

           <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                    <div class="col-md-3">
                   <label for="txtName">Name</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Name" required="true"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Name Should be in Characters" ForeColor="Red" ValidationExpression="^[a-zA-Z\s]+$" Display="Dynamic" 
                            SetFocusOnError="true" ControlToValidate="txtName"></asp:RegularExpressionValidator>
               </div>

               <div class="col-md-3">
                   <label for="txtFName">Father Name</label>
                        <asp:TextBox ID="txtFName" runat="server" CssClass="form-control" placeholder="Enter Father Name" required="true"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Father Name Should be in Characters" ForeColor="Red" ValidationExpression="^[a-zA-Z\s]+$" Display="Dynamic" 
                            SetFocusOnError="true" ControlToValidate="txtFName"></asp:RegularExpressionValidator>
               </div>

               <div class="col-md-3">
                   <label for="txtDOB">Date Of Birth</label>
                   <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" TextMode="Date" required="true"></asp:TextBox>
               </div>

                <div class="col-md-3">
                   <label for="txtTazkira">Tazkira No</label>
                   <asp:TextBox ID="txtTazkira" runat="server" CssClass="form-control" TextMode="Number" placeholder="Tazkira No" required="true"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Invalid Tazkira No" 
                    ForeColor="Red" ValidationExpression="[0-9]" Display="Dynamic" 
                SetFocusOnError="true" ControlToValidate="txtTazkira"></asp:RegularExpressionValidator>
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
                   <label for="txtMobile">Contact Number</label>
                   <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" TextMode="Number" placeholder="10 Digits Mobile No" required="true"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Mobile No" 
                    ForeColor="Red" ValidationExpression="[0-9]{10}" Display="Dynamic" 
                SetFocusOnError="true" ControlToValidate="txtMobile"></asp:RegularExpressionValidator>
               </div>
                
            <div class="col-md-3">
                   <label for="txtParentContact">Parents Contact Number</label>
                   <asp:TextBox ID="txtParentContact" runat="server" CssClass="form-control" TextMode="Number" placeholder="10 Digits Mobile No" required="true"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid Mobile No" 
                    ForeColor="Red" ValidationExpression="[0-9]{10}" Display="Dynamic" 
                SetFocusOnError="true" ControlToValidate="txtParentContact"></asp:RegularExpressionValidator>
               </div>

            <div class="col-md-3">
                   <label for="ddlClass">Class</label>
                   <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged"></asp:DropDownList>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Class is Required." ControlToValidate="ddlClass" Display="Dynamic" 
                         ForeColor="Red" InitialValue="Select Class" SetFocusOnError="True"></asp:RequiredFieldValidator>
               </div>
                
           </div>
         <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                    <div class="col-md-3">
                   <label for="txtRoll">Roll Number</label>
                  <asp:TextBox ID="txtRoll" runat="server" CssClass="form-control" required="true" ReadOnly="True">S</asp:TextBox>
                        
               </div>

                 <div class="col-md-3">
                 <label for="Photo">Photo</label>
                 <asp:FileUpload ID="photo" runat="server" />
             </div>

             <div class="col-md-6">
                 <label for="Documents">Documents</label>
                 <asp:FileUpload ID="Documents" runat="server" />
             </div>

           </div>

         <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                    <div class="col-md-6">
                   <label for="txtAddress">Address</label>
                  <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Address" TextMode="MultiLine" required="true"></asp:TextBox>
                        
               </div>

             <div class="col-md-2 col-md-offset-0 mb-3"><br />
                    <asp:Button ID="btnAdd" runat="server" Text="Add Student" CssClass="btn btn-primary btn-block" BackColor="#5558c9" OnClick="btnAdd_Click" />

                </div>
           </div>
         <br />

            <div class="row mb-3 mr-lg-5 ml-lg-5" >
               <div class="col-md-6 mr-lg-10">
                   <asp:GridView ID="GridView1" runat="server" CssClass="table-hover table-bordered-1" 
                       EmptyDataText="No Record To Display" AutoGenerateColumns="False" AllowPaging="True" PageSize="8" 
                       OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" DataKeyNames="StudentId"
                        OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDataBound="GridView1_RowDataBound">
                       <Columns>
                           <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="true">
                           <ItemStyle HorizontalAlign="Center" />
                           </asp:BoundField>

                           <asp:TemplateField HeaderText="Name">
                               <EditItemTemplate>
                                   <asp:TextBox ID="txtNameG" runat="server" Text='<%# Eval("StudentName") %>' CssClass="form-control" Width="100px"></asp:TextBox>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="lblNameG" runat="server" Text='<%# Eval("StudentName") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>

                           <asp:TemplateField HeaderText="Mobile">
                               <EditItemTemplate>
                                   <asp:TextBox ID="txtMobile" runat="server" Text='<%# Eval("Mobile") %>' CssClass="form-control" Width="100px"></asp:TextBox>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="lblMobile" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>

                           <asp:TemplateField HeaderText="Roll Number">
                                <EditItemTemplate>
                                   <asp:TextBox ID="txtRollNo" runat="server" Text='<%# Eval("RollNo") %>' CssClass="form-control" Width="100px"></asp:TextBox>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="lblRollNo" runat="server" Text='<%# Eval("RollNo") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>

                           <asp:TemplateField HeaderText="Class">
                               <EditItemTemplate>
                                   <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" Width="120px"></asp:DropDownList>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="lblClass" runat="server" Text='<%# Eval("ClassName") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>

                           <asp:TemplateField HeaderText="Address">
                               <EditItemTemplate>
                                   <asp:TextBox ID="txtAddress" runat="server" Text='<%# Eval("Address") %>' CssClass="form-control" Width="200px" TextMode="MultiLine"></asp:TextBox>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>

                           <asp:CommandField CausesValidation="false" HeaderText="Operation" ShowEditButton="True">
                           <ItemStyle HorizontalAlign="Center" />
                           </asp:CommandField>
                       </Columns>
                       <HeaderStyle BackColor="#5558C9" ForeColor="White" />
                   </asp:GridView>
               </div>
                </div>
        </div>

</asp:Content>

