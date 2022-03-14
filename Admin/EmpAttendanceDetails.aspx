<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="EmpAttendanceDetails.aspx.cs" Inherits="Admin_EmpAttendanceDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div  class="container p-md-4 p-sm-10">
            <div>
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </div>
            <h2 class="text-center">Teacher Attendance Details</h2>

           <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                    <div class="col-md-3">
                   <label for="ddlTeacher">Teacher</label>
                   <asp:DropDownList ID="ddlTeacher" runat="server" CssClass="form-control"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Teacher is Required." ControlToValidate="ddlTeacher" Display="Dynamic" 
                         ForeColor="Red" InitialValue="Select Teacher" SetFocusOnError="True"></asp:RequiredFieldValidator>
               </div>


               <div class="col-md-3">
                   <label for="ddlSubject">Month</label>
                   <asp:TextBox ID="txtMonth" runat="server" CssClass="form-control" required="true" TextMode="Month"></asp:TextBox>
               </div>


           </div>

           <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-2 col-md-offset-0 mb-3"><br />
                    <asp:Button ID="btnCheckAttendance" runat="server" Text="Check Attendance" CssClass="btn btn-primary btn-block" BackColor="#5558c9" OnClick="btnCheckAttendance_Click" />
                </div>
           </div>

           <div class="row mb-3 mr-lg-5 ml-lg-5" >
               <div class="col-md-12">
                   <asp:GridView ID="GridView1" runat="server" CssClass="table-hover table-bordered-1" 
                       EmptyDataText="No Record To Display" AutoGenerateColumns="False">
                       <Columns>
                           <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                           <ItemStyle HorizontalAlign="Center" />
                           </asp:BoundField>

                           <asp:BoundField DataField="Name" HeaderText="Name">
                           <ItemStyle HorizontalAlign="Center" />
                           </asp:BoundField>

                           <%--<asp:BoundField DataField="Status" HeaderText="Status">
                           <ItemStyle HorizontalAlign="Center" />
                           </asp:BoundField>--%>

                           <asp:TemplateField HeaderText="Status">
                               <ItemTemplate>
                                   <asp:Label runat="server" ID="lbl1" Text='<%# Boolean.Parse(Eval("Status").ToString()) ? "Present" : "Absent" %>'></asp:Label>
                               </ItemTemplate>
                           </asp:TemplateField>

                           <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:dd MMMM yyyy}">
                           <ItemStyle HorizontalAlign="Center" />
                           </asp:BoundField>


                           
                       </Columns>
                       <HeaderStyle BackColor="#5558C9" ForeColor="White" />
                   </asp:GridView>
               </div>
                </div>
        </div>

</asp:Content>

