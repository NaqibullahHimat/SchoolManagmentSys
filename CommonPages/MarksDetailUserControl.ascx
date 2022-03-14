<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MarksDetailUserControl.ascx.cs" Inherits="CommonPages_MarksDetailUserControl" %>


<div  class="container p-md-4 p-sm-10">
            <div>
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </div>
            <h2 class="text-center">Marks Detail</h2>

           <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                    <div class="col-md-3">
                   <label for="ddlClass">Class</label>
                        <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Class is Required." ControlToValidate="ddlClass" Display="Dynamic" 
                         ForeColor="Red" InitialValue="Select Class" SetFocusOnError="True"></asp:RequiredFieldValidator>
               </div>

               <div class="col-md-3">
                   <label for="txtRoll">Student Roll Number</label>
                   <asp:TextBox ID="txtRoll" runat="server" CssClass="form-control" placeholder="Enter Student Roll Number" required="true"></asp:TextBox>
               </div>
           </div>

           <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-2 col-md-offset-0 mb-3"><br />
                    <asp:Button ID="btnAdd" runat="server" Text="Get Marks" CssClass="btn btn-primary btn-block" BackColor="#5558c9" OnClick="btnAdd_Click" />

                </div>
               
           
           </div>

            <div class="row mb-3 mr-lg-5 ml-lg-5">
               <div class="col-md-12">
                   <asp:GridView ID="GridView1" runat="server" CssClass="table-hover table-bordered-1" 
                       EmptyDataText="No Record To Display" AutoGenerateColumns="False" AllowPaging="true" PageSize="8" 
                       OnPageIndexChanging="GridView1_PageIndexChanging">
                       <Columns>
                           <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                           <ItemStyle HorizontalAlign="Center" />
                               </asp:BoundField>


                               <asp:BoundField DataField="ExamId" HeaderText="ExamId">
                           <ItemStyle HorizontalAlign="Center" />
                           </asp:BoundField>


                           <asp:BoundField DataField="ClassName" HeaderText="Class">
                           <ItemStyle HorizontalAlign="Center" />
                           </asp:BoundField>

                           <asp:BoundField DataField="SubjectName" HeaderText="Subject">
                           <ItemStyle HorizontalAlign="Center" />
                           </asp:BoundField>


                           <asp:BoundField DataField="RollNo" HeaderText="Roll Number">
                           <ItemStyle HorizontalAlign="Center" />
                           </asp:BoundField>

                           <asp:BoundField DataField="TotalMarks" HeaderText="Total Marks">
                           <ItemStyle HorizontalAlign="Center" />
                           </asp:BoundField>


                           <asp:BoundField DataField="outofMarks" HeaderText="Out Of Marks">
                           <ItemStyle HorizontalAlign="Center" />
                           </asp:BoundField>

                           
                       </Columns>
                       <HeaderStyle BackColor="#5558C9" ForeColor="White" />
                   </asp:GridView>
               </div>
                </div>
        </div>