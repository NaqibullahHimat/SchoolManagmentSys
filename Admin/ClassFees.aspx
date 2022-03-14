<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ClassFees.aspx.cs" Inherits="Admin_ClassFees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div  class="container p-md-4 p-sm-10">
            <div>
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </div>
            <h2 class="text-center">New Fees</h2>

           <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                    <div class="col-md-3">
                   <label for="ddlClass">Class</label>
                        <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Class is Required." ControlToValidate="ddlClass" Display="Dynamic" 
                         ForeColor="Red" InitialValue="Select Class" SetFocusOnError="True"></asp:RequiredFieldValidator>
               </div>

               <div class="col-md-3">
                   <label for="txtFeeAmount">Fees(Annual)</label>
                   <asp:TextBox ID="txtFeeAmount" runat="server" CssClass="form-control" placeholder="Enter Fees Amount" TextMode="Number" required="true"></asp:TextBox>
               </div>
           </div>

           <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-2 col-md-offset-0 mb-3"><br />
                    <asp:Button ID="btnAdd" runat="server" Text="Add Class" CssClass="btn btn-primary btn-block" BackColor="#5558c9" OnClick="btnAdd_Click" />

                </div>
               
           
           </div>

            <div class="row mb-3 mr-lg-5 ml-lg-5">
               <div class="col-md-6 mr-lg-10">
                   <asp:GridView ID="GridView1" runat="server" CssClass="table-hover table-bordered-1" 
                       EmptyDataText="No Record To Display" AutoGenerateColumns="False" AllowPaging="True" PageSize="8" 
                       OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" DataKeyNames="FeesId"
                       OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                       <Columns>
                           <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                           <ItemStyle HorizontalAlign="Center" />
                           </asp:BoundField>
                           <asp:BoundField DataField="ClassName" HeaderText="Class" ReadOnly="True">
                           <ItemStyle HorizontalAlign="Center" />
                           </asp:BoundField>
                           <asp:TemplateField HeaderText="Fees(Annual)">
                               <EditItemTemplate>
                                   <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("FeesAmount") %>' CssClass="form-control"></asp:TextBox>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="Label1" runat="server" Text='<%# Eval("FeesAmount") %>'></asp:Label>
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

