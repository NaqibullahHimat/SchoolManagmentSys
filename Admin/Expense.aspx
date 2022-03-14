<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Expense.aspx.cs" Inherits="Admin_Expense" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div  class="container p-md-4 p-sm-10">
            <div>
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </div>
            <h2 class="text-center">Add Expense</h2>

           <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                    <div class="col-md-3">
                   <label for="ddlClass">Class</label>
                        <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" AutoPostBack="true" 
                            OnSelectedIndexChanged="ddlClass_SelectedIndexChanged"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Class is Required." ControlToValidate="ddlClass" Display="Dynamic" 
                         ForeColor="Red" InitialValue="Select Class" SetFocusOnError="True"></asp:RequiredFieldValidator>
               </div>

               <div class="col-md-3">
                   <label for="ddlSubject">Subject</label>
                   <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Subject is Required." ControlToValidate="ddlSubject" Display="Dynamic" 
                         ForeColor="Red" InitialValue="Select Subject" SetFocusOnError="True"></asp:RequiredFieldValidator>
               </div>

               <div class="col-md-3">
                   <label for="txtExpenseAmt">Charge Amount(Per Lecture)</label>
                   <asp:TextBox ID="txtExpenseAmt" runat="server" CssClass="form-control" placeholder="Enter Charge Amount" TextMode="Number" required="true"></asp:TextBox>
                        
               </div>

           </div>

           <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-2 col-md-offset-0 mb-3"><br />
                    <asp:Button ID="btnAdd" runat="server" Text="Add Expense" CssClass="btn btn-primary btn-block" BackColor="#5558c9" OnClick="btnAdd_Click" />

                </div>
           </div>

            <div class="row mb-3 mr-lg-5 ml-lg-5" >
               <div class="col-md-6">
                   <asp:GridView ID="GridView1" runat="server" CssClass="table-hover table-bordered-1" 
                       EmptyDataText="No Record To Display" AutoGenerateColumns="False" AllowPaging="True" PageSize="8" 
                       OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" DataKeyNames="ExpenseId"
                        OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" OnRowDataBound="GridView1_RowDataBound">
                       <Columns>
                           <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="true">
                           <ItemStyle HorizontalAlign="Center" />
                           </asp:BoundField>


                           <asp:TemplateField HeaderText="Class">
                               <EditItemTemplate>
                                   <asp:DropDownList ID="ddlClassGV" runat="server" DataSourceID="SqlDataSource1" DataTextField="ClassName" 
                                       DataValueField="ClassId" SelectedValue='<%# Eval("ClassId") %>' CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlClassGV_SelectedIndexChanged">
                                       <asp:ListItem>Select Class</asp:ListItem>
                                   </asp:DropDownList>
                                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Schoolcs %>" 
                                       SelectCommand="SELECT * FROM [Class]"></asp:SqlDataSource>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="Label2" runat="server" Text='<%# Eval("ClassName") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>


                           <asp:TemplateField HeaderText="Subject">
                               <EditItemTemplate>
                                   <asp:DropDownList ID="ddlSubjectGV" runat="server" CssClass="form-control">
                                   </asp:DropDownList>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="Label1" runat="server" Text='<%# Eval("SubjectName") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>

                           <asp:TemplateField HeaderText="Charge Af(Per Lecture)">
                               <EditItemTemplate>
                                   <asp:TextBox ID="txtExpenseAmt" runat="server" CssClass="form-control" Text='<%# Eval("ChargeAmount") %>' TextMode="Number"></asp:TextBox>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="Label2" runat="server" Text='<%# Eval("ChargeAmount") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>

                           <asp:TemplateField HeaderText="Operation" ShowHeader="False">
                               <EditItemTemplate>
                                   <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                   &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                   &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete');"></asp:LinkButton>
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

