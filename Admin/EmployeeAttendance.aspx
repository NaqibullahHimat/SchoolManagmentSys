<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="EmployeeAttendance.aspx.cs" Inherits="Admin_EmployeeAttendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div  class="container p-md-4 p-sm-10">
            <div>
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </div>

        <div class="ml-auto text-right">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="1000"></asp:Timer>
                    <asp:Label ID="lblTime" runat="server" Font-Bold="true" ></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

            <h2 class="text-center">Teachers Attandance</h2>

            <div class="row mb-3 mr-lg-5 ml-lg-5">
               <div class="col-md-12">

                   <asp:GridView ID="GridView1" runat="server" CssClass="table tab-hover table-bordered" 
                    EmptyDataText="No Record To Display" >
                       <Columns>
                          
                           <asp:TemplateField HeaderText="Class">
                               
                               <ItemTemplate>
                                   <div class="form-check form-check-inline">
                                       <asp:RadioButton ID="RadioButton1" runat="server" Text="Present" Checked="true" GroupName="attendance" CssClass="form-check-input" />
                                        <asp:RadioButton ID="RadioButton2" runat="server" Text="Absent" GroupName="attendance" CssClass="form-check-input" />
                                   </div>


                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>


                           
                       </Columns>
                       <HeaderStyle BackColor="#5558C9" ForeColor="White" />
                   </asp:GridView>
               </div>
                </div>

        <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-6 col-lg-4 col-xl-3 col-md-offset-2 col-md-offset-2 mb-3"><br />
                    <asp:Button ID="btnMarkAttendance" runat="server" Text="Mark Attendance" CssClass="btn btn-primary btn-block" BackColor="#5558c9" 
                        OnClick="btnMarkAttendance_Click" />

                </div>
               </div>


        </div>


</asp:Content>

