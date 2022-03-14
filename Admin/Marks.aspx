﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Marks.aspx.cs" Inherits="Admin_Marks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div  class="container p-md-4 p-sm-10">
            <div>
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </div>
            <h2 class="text-center">Add Marks</h2>

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
                   <label for="ddlRoll">Student Roll Number</label>
                   <asp:DropDownList ID="ddlRoll" runat="server" CssClass="form-control"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Roll Number is Required." ControlToValidate="ddlRoll" Display="Dynamic" 
                         ForeColor="Red" InitialValue="Select Roll Number" SetFocusOnError="True"></asp:RequiredFieldValidator>
               </div>

                    <div class="col-md-3">
                   <label for="ddlExamType">Exam Type</label>
                        <asp:DropDownList ID="ddlExamType" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0">Select Exam Type</asp:ListItem>
                            <asp:ListItem>Mid Term</asp:ListItem>
                            <asp:ListItem>Final Term</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ErrorMessage="Exam Type Required" ForeColor="Red" ControlToValidate="ddlExamType" Display="Dynamic" SetFocusOnError="true" InitialValue="Select Exam Type">
                        </asp:RequiredFieldValidator>
               </div>

                  <div class="col-md-3">
                   <label for="txtExamDate">Date Of Exam</label>
                   <asp:TextBox ID="txtExamDate" runat="server" CssClass="form-control" TextMode="Date" required="true"></asp:TextBox>
               </div>
           

                <div class="col-md-3">
                   <label for="txtStudentMarks">Total Marks(Student Marks)</label>
                   <asp:TextBox ID="txtStudentMarks" runat="server" CssClass="form-control" placeholder="Total Marks(Student Marks)" TextMode="Number" required="true"></asp:TextBox>
                        
               </div>

               <div class="col-md-3">
                   <label for="txtOutOfMarks">Out Of Marks</label>
                   <asp:TextBox ID="txtOutOfMarks" runat="server" CssClass="form-control" placeholder="Out Of Marks" TextMode="Number" required="true"></asp:TextBox>
                        
               </div>

           </div>

           <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-2 col-md-offset-0 mb-3"><br />
                    <asp:Button ID="btnAdd" runat="server" Text="Add Marks" CssClass="btn btn-primary btn-block" BackColor="#5558c9" OnClick="btnAdd_Click" />

                </div>
           </div>

            <div class="row mb-4 mr-lg-5 ml-lg-5" >
               <div class="col-md-12">
                   <asp:GridView ID="GridView1" runat="server" CssClass="table-hover table-bordered-1" 
                       EmptyDataText="No Record To Display" AutoGenerateColumns="False" AllowPaging="True" PageSize="8" 
                       OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" DataKeyNames="ExamId"
                        OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDataBound="GridView1_RowDataBound">
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

                           <asp:TemplateField HeaderText="Student Roll Number">
                               <EditItemTemplate>
                                   <asp:DropDownList ID="dllRollGV" runat="server" CssClass="form-control">
                                   </asp:DropDownList>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="Label1" runat="server" Text='<%# Eval("RollNo") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>

                          <%-- <asp:TemplateField HeaderText="Student Roll Number">
                               <EditItemTemplate>
                                   <asp:TextBox ID="txtRollNumberGV" runat="server" CssClass="form-control" Text='<%# Eval("RollNo") %>'></asp:TextBox>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="Label2" runat="server" Text='<%# Eval("RollNo") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>--%>

                           <asp:TemplateField HeaderText="Total Marks">
                               <EditItemTemplate>
                                   <asp:TextBox ID="txtStudentMarksGV" runat="server" CssClass="form-control" Text='<%# Eval("TotalMarks") %>'></asp:TextBox>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="Label2" runat="server" Text='<%# Eval("TotalMarks") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>


                           <asp:TemplateField HeaderText="Out Of Marks">
                               <EditItemTemplate>
                                   <asp:TextBox ID="txtOutOfMarksGV" runat="server" CssClass="form-control" Text='<%# Eval("outofMarks") %>'></asp:TextBox>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="Label2" runat="server" Text='<%# Eval("outofMarks") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>

                           <asp:TemplateField HeaderText="Exam Type">
                               <EditItemTemplate>
                                  <asp:DropDownList ID="ddlExamTypeGV" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0">Select Exam Type</asp:ListItem>
                            <asp:ListItem>Mid Term</asp:ListItem>
                            <asp:ListItem>Final Term</asp:ListItem>
                        </asp:DropDownList>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="Label2" runat="server" Text='<%# Eval("ExamType") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>


                           <asp:TemplateField HeaderText="Exam Date">
                               <EditItemTemplate>
                                   <asp:TextBox ID="txtExamDateGV" runat="server" CssClass="form-control" TextMode="Date" required="true"></asp:TextBox>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="Label2" runat="server" Text='<%# Eval("ExamDate") %>'></asp:Label>
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

