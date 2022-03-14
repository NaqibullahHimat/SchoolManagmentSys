<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/TeacherMaster.master" AutoEventWireup="true" CodeFile="StudentAttandance.aspx.cs" Inherits="Teacher_StudentAttandance" %>

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

            <h2 class="text-center">Student Attandance</h2>

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
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Subject is Required" ControlToValidate="ddlSubject"
                        Display="Dynamic" ForeColor="Red" InitialValue="Select Subject" SetFocusOnError="true"></asp:RequiredFieldValidator>
               </div>

            <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-2 col-md-offset-0 mb-3"><br />
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" BackColor="#5558c9" OnClick="btnSubmit_Click" />

                </div>
           </div>


           </div>

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
                    <asp:Button ID="btnMarkAttendance" runat="server" Text="Mark Attendance" CssClass="btn btn-primary btn-block" BackColor="#5558c9" OnClick="btnMarkAttendance_Click" 
                        />

                </div>
               </div>


        </div>

</asp:Content>

