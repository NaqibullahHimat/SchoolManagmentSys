<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="AddClass.aspx.cs" Inherits="Admin_AddClass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

       <div  class="container p-md-4 p-sm-10">
            <div>
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </div>
            <h2 class="text-center">New Class</h2>

           <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
               <div class="col-md-3">
                   <label for="txtClass">Class Name</label>
                   <asp:TextBox ID="txtClass" runat="server" CssClass="form-control" placeholder="Enter Class Name" required="true"></asp:TextBox>
               </div>

                <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                    <div class="col-md-3">
                   <label for="ddlCCategory">Category</label>
                        <asp:DropDownList ID="ddlCCategory" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0">Select Category</asp:ListItem>
                            <asp:ListItem>Primary</asp:ListItem>
                            <asp:ListItem>Secondary</asp:ListItem>
                            <asp:ListItem>Higher</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ErrorMessage="Category is Required" ForeColor="Red" ControlToValidate="ddlCCategory" Display="Dynamic" SetFocusOnError="true" InitialValue="Select Category">
                        </asp:RequiredFieldValidator>
               </div>
           </div>

           </div>

           <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-2 col-md-offset-0 mb-3"><br />
                    <asp:Button ID="btnAdd" runat="server" Text="Add Class" CssClass="btn btn-primary btn-block" BackColor="#5558c9" OnClick="btnAdd_Click1" />

                </div>
               
           
           </div><br /><br />

            <div class="row mb-3 mr-lg-5 ml-lg-5">
               <div class="col-md-3">

                   <asp:GridView ID="GridView1" runat="server" CssClass="table tab-hover table-bordered" DataKeyNames="ClassId" AutoGenerateColumns="False"
                    EmptyDataText="No Record To Display" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" 
                       OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" AllowPaging="True" PageSize="8">
                       <Columns>
                           <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                           <ItemStyle HorizontalAlign="Center" />
                           </asp:BoundField>
                           <asp:TemplateField HeaderText="Class">
                               <EditItemTemplate>
                                   <asp:TextBox ID="txtClassEdit" runat="server" Text='<%# Eval("ClassName") %>' CssClass="form-control"></asp:TextBox>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="lblClassName" runat="server" Text='<%# Eval("ClassName") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>

                           <asp:TemplateField HeaderText="Category">
                               <EditItemTemplate>

                                  <%-- <asp:DropDownList ID="ddlCCategory" runat="server" CssClass="form-control" Width="120px"></asp:DropDownList>--%>

                                   <asp:DropDownList ID="ddlCCategoryG" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0">Select Category</asp:ListItem>
                                       <asp:ListItem>Primary</asp:ListItem>
                                       <asp:ListItem>Secondary</asp:ListItem>
                                       <asp:ListItem>Higher</asp:ListItem>
                                    </asp:DropDownList>

                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="lblCCategory" runat="server" Text='<%# Eval("Category") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>

                           <asp:CommandField CausesValidation="False" HeaderText="Operation" ShowEditButton="True" >
                           <ItemStyle HorizontalAlign="Center" />
                           </asp:CommandField>
                       </Columns>
                       <HeaderStyle BackColor="#5558C9" ForeColor="White" />
                   </asp:GridView>
               </div>
                </div>
        </div>
</asp:Content>

