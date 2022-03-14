<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Subject.aspx.cs" Inherits="Admin_Subject" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


     <div  class="container p-md-4 p-sm-10">
            <div>
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </div>
            <h2 class="text-center">New Subject</h2>

           <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                    <div class="col-md-3">
                   <label for="ddlClass">Class</label>
                        <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Class is Required." ControlToValidate="ddlClass" Display="Dynamic" 
                         ForeColor="Red" InitialValue="Select Class" SetFocusOnError="True"></asp:RequiredFieldValidator>
               </div>

               <div class="col-md-3">
                   <label for="txtSubject">Subject</label>
                   <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Enter Subject" required="true"></asp:TextBox>
               </div>
           </div>

           <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-2 col-md-offset-0 mb-3"><br />
                    <asp:Button ID="btnAdd" runat="server" Text="Add Subject" CssClass="btn btn-primary btn-block" BackColor="#5558c9" OnClick="btnAdd_Click" />

                </div>
               
           
           </div>

            <div class="row mb-3 mr-lg-5 ml-lg-5" >
               <div class="col-md-6 mr-lg-10">
                   <asp:GridView ID="GridView1" runat="server" CssClass="table-hover table-bordered-1" 
                       EmptyDataText="No Record To Display" AutoGenerateColumns="False" AllowPaging="True" PageSize="8" 
                       OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" DataKeyNames="SubjectId"
                        OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                       <Columns>
                           <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="true">
                           <ItemStyle HorizontalAlign="Center" />
                           </asp:BoundField>
                           <asp:TemplateField HeaderText="Class">
                               <EditItemTemplate>
                                   <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="ClassName" 
                                       DataValueField="ClassId" SelectedValue='<%# Eval("ClassId") %>' CssClass="form-control">
                                   </asp:DropDownList>
                                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Schoolcs %>" SelectCommand="SELECT * FROM [Class]"></asp:SqlDataSource>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="Label2" runat="server" Text='<%# Eval("ClassName") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="Subject">
                               <EditItemTemplate>
                                   <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("SubjectName") %>' CssClass="form-control"></asp:TextBox>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="Label1" runat="server" Text='<%# Eval("SubjectName") %>'></asp:Label>
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

