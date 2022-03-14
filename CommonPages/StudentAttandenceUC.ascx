<%@ Control Language="C#" AutoEventWireup="true" CodeFile="StudentAttandenceUC.ascx.cs" Inherits="CommonPages_StudentAttandenceUC" %>


<div  class="container p-md-4 p-sm-10">
            <div>
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </div>


            <h2 class="text-center">Student Attandance Details</h2>

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
                   <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Subject is Required" ControlToValidate="ddlSubject"
                        Display="Dynamic" ForeColor="Red" InitialValue="Select Subject" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
               </div>
            
            
            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                    <div class="col-md-3">
                   <label for="txtRollNo">Roll Number</label>
                       <asp:TextBox ID="txtRollNo" runat="server" CssClass="form-control" placeholder="Enter Student Roll Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Roll Number is Required." ControlToValidate="txtRollNo" Display="Dynamic" 
                         ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
               </div>

               <div class="col-md-3">
                   <label for="txtMonth">Month</label>
                  <asp:TextBox ID="txtMonth" runat="server" CssClass="form-control" TextMode="Month"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Month Number is Required." ControlToValidate="txtMonth" Display="Dynamic" 
                         ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
               </div>

            


            <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-2 col-md-offset-0 mb-3"><br />
                    <asp:Button ID="btnCheckAttendance" runat="server" Text="Check Attendance" CssClass="btn btn-primary btn-block" BackColor="#5558c9" OnClick="btnCheckAttendance_Click"/>

                </div>
           </div>


           </div>

            <div class="row mb-3 mr-lg-5 ml-lg-5">
               <div class="col-md-12">

                  <asp:GridView ID="GridView1" runat="server" CssClass="table-hover table-bordered-1" 
                       EmptyDataText="No Record To Display" AutoGenerateColumns="False">
                       <Columns>
                           <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                           <ItemStyle HorizontalAlign="Center" />
                           </asp:BoundField>

                           <asp:BoundField DataField="StudentName" HeaderText="Student Name">
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
               </div>
