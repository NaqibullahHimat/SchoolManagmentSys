<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="FinanceMaster.aspx.cs" Inherits="Admin_FinanceMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div  class="container p-md-4 p-sm-10">
            <div>
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </div>
            <h2 class="text-center">Add Finance Master Data</h2>

           <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                    <div class="col-md-3">
                   <label for="txtType">Type Of Fees</label>
                        <asp:TextBox ID="txtType" runat="server" CssClass="form-control" placeholder="Enter Type Of Fees" required="true"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Type Should be in Characters" ForeColor="Red" ValidationExpression="^[a-zA-Z\s]+$" Display="Dynamic" 
                            SetFocusOnError="true" ControlToValidate="txtType"></asp:RegularExpressionValidator>
               </div>

                <div class="col-md-3">
                   <label for="txtfeesAmount">Fees Amount</label>
                   <asp:TextBox ID="txtfeesAmount" runat="server" CssClass="form-control" TextMode="Number" placeholder="Enter Fees Amount" required="true"></asp:TextBox>
                <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server" ErrorMessage="Invalid Fees Amount" 
                    ForeColor="Red" ValidationExpression="[0-9]{5}" Display="Dynamic" 
                SetFocusOnError="true" ControlToValidate="txtfeesAmount"></asp:RegularExpressionValidator>--%>
               </div>

           </div>


        <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                    <div class="col-md-3">
                   <label for="ddlDuration">Duration</label>
                        <asp:DropDownList ID="ddlDuration" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0">Select Duration</asp:ListItem>
                            <asp:ListItem>Monthly</asp:ListItem>
                            <asp:ListItem>Yearly</asp:ListItem>
                            <asp:ListItem>Other</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ErrorMessage="Duration is Required" ForeColor="Red" ControlToValidate="ddlDuration" Display="Dynamic" SetFocusOnError="true" InitialValue="Select Duration">
                        </asp:RequiredFieldValidator>
               </div>

               
            <div class="col-md-3">
                   <label for="ddlClass">Class</label>
                   <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged1"></asp:DropDownList>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Class is Required." ControlToValidate="ddlClass" Display="Dynamic" 
                         ForeColor="Red" InitialValue="Select Class" SetFocusOnError="True"></asp:RequiredFieldValidator>
               </div>

            <div class="col-md-3">
                   <label for="txtCategory">Category</label>
                        <asp:TextBox ID="txtCategory" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
               </div>


           </div>
         <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
         
         </div>

           <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-2 col-md-offset-0 mb-3"><br />
                    <asp:Button ID="btnAdd" runat="server" Text="Register" CssClass="btn btn-primary btn-block" BackColor="#5558c9" OnClick="btnAdd_Click" />

                </div>
               
           
           </div>
        <br />
            <div class="row mb-3 mr-lg-5 ml-lg-5" >
               <div class="col-md-6 mr-lg-10">
                   <asp:GridView ID="GridView1" runat="server" CssClass="table-hover table-bordered-1" 
                       EmptyDataText="No Record To Display" AutoGenerateColumns="False" AllowPaging="True" PageSize="8" 
                       OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" DataKeyNames="FinanceMasterId"
                        OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDataBound="GridView1_RowDataBound">
                       <Columns>
                           <asp:BoundField DataField="No" HeaderText="No" ReadOnly="true">
                           <ItemStyle HorizontalAlign="Center" />
                           </asp:BoundField>

                           <asp:TemplateField HeaderText="Type Of Fees">
                               <EditItemTemplate>
                                   <asp:TextBox ID="txtType" runat="server" Text='<%# Eval("FinanceMasterType") %>' CssClass="form-control" Width="100px"></asp:TextBox>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="lblType" runat="server" Text='<%# Eval("FinanceMasterType") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>

                           <asp:TemplateField HeaderText="Fees Amount">
                               <EditItemTemplate>
                                   <asp:TextBox ID="txtfeesAmount" runat="server" Text='<%# Eval("FinanceMasterAmount") %>' CssClass="form-control" Width="100px"></asp:TextBox>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="lblfeesAmount" runat="server" Text='<%# Eval("FinanceMasterAmount") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>

                          
                           <asp:TemplateField HeaderText="Duration">
                               <EditItemTemplate>
                                   <asp:DropDownList ID="ddlDuration" runat="server" CssClass="form-control" Width="120px"></asp:DropDownList>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="lblDuration" runat="server" Text='<%# Eval("FinanceMasterDuration") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>

                           <asp:TemplateField HeaderText="Class">
                               <EditItemTemplate>
                                   <asp:DropDownList ID="ddlClassG" runat="server" CssClass="form-control" Width="120px" OnSelectedIndexChanged="ddlClassG_SelectedIndexChanged2"></asp:DropDownList>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="lblClassG" runat="server" Text='<%# Eval("ClassName") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>


                             <asp:TemplateField HeaderText="Category">
                               <EditItemTemplate>
                                   <asp:TextBox ID="txtCategoryG" runat="server" Text='<%# Eval("Category") %>' CssClass="form-control" Width="100px"></asp:TextBox>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="lblCategory" runat="server" Text='<%# Eval("Category") %>'></asp:Label>
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

