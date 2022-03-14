<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Teacher.aspx.cs" Inherits="Admin_Teacher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div  class="container p-md-4 p-sm-10">
            <div>
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </div>
            <h2 class="text-center">Teacher Registration</h2>

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
                   <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control"  placeholder="Enter Password" TextMode="Password" required="true"></asp:TextBox>
               </div>

             <div class="col-md-3">
                   <label for="txtE">Experiance In Year</label>
                  <asp:TextBox ID="txtE" runat="server" CssClass="form-control" placeholder="Enter Experiance" TextMode="Number" required="true"></asp:TextBox>
                        
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
                    <asp:Button ID="btnAdd" runat="server" Text="Add Teacher" CssClass="btn btn-primary btn-block" BackColor="#5558c9" OnClick="btnAdd_Click" />
                </div>
                
           </div>

            <div class="row mb-4" >
               <div class="col-md-10">
                   <asp:GridView ID="GridView1" runat="server" CssClass="table-hover table-bordered-1" 
                       EmptyDataText="No Record To Display" AutoGenerateColumns="False" AllowPaging="True" PageSize="8" 
                       OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" DataKeyNames="TeacherId"
                        OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting">
                       <Columns>
                           <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="true">
                           <ItemStyle HorizontalAlign="Center" />
                           </asp:BoundField>

                           <asp:TemplateField HeaderText="Name">
                               <EditItemTemplate>
                                   <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("Name") %>' CssClass="form-control" Width="100px"></asp:TextBox>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>

                           <asp:TemplateField HeaderText="Date Of Birth">
                               <EditItemTemplate>
                                   <asp:TextBox ID="txtDOBG" runat="server" Text='<%# Eval("DOB") %>' CssClass="form-control" Width="100px"></asp:TextBox>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="lblDOBG" runat="server" Text='<%# Eval("DOB") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>

                            <asp:TemplateField HeaderText="Joining Date">
                               <EditItemTemplate>
                                   <asp:TextBox ID="txtJDG" runat="server" Text='<%# Eval("JoiningD") %>' CssClass="form-control" Width="100px"></asp:TextBox>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="lblJDG" runat="server" Text='<%# Eval("JoiningD") %>'></asp:Label>
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

                           <asp:TemplateField HeaderText="Email">
                               <ItemTemplate>
                                   <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>

                           <asp:TemplateField HeaderText="Password">
                               <EditItemTemplate>
                                   <asp:TextBox ID="txtPassword" runat="server" Text='<%# Eval("Password") %>' CssClass="form-control" Width="100px"></asp:TextBox>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="lblPassword" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>

                           <asp:TemplateField HeaderText="Address">
                               <EditItemTemplate>
                                   <asp:TextBox ID="txtAddress" runat="server" Text='<%# Eval("Address") %>' CssClass="form-control" Width="100px" TextMode="MultiLine"></asp:TextBox>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>

                             <%--<asp:TemplateField HeaderText="Photo">
                               <%--<EditItemTemplate>
                                   <image src="TeacherPhoto/<%# Eval("Photo") %>>" height="150" width="100" />
                               </EditItemTemplate>--%>
                               <%--<ItemTemplate>
                                   <image src="TeacherPhoto/<%# Eval("photo") %>" height="150" width="100" />
                                   <%--<asp:Label ID="lblPhoto" runat="server" Text='<%# Eval("Photo") %>'></asp:Label>--%>
                               <%--</ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />--%>
                         <%--  </asp:TemplateField>--%>


                           <asp:TemplateField HeaderText="Operation" ShowHeader="False">
                               <EditItemTemplate>
                                   <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                   <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                  <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete');"></asp:LinkButton>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>
                       </Columns>
                       <HeaderStyle BackColor="#5558C9" ForeColor="White" />
                   </asp:GridView>
               </div>
                </div>
        </div>


</asp:Content>

