<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ExpenseDetails.aspx.cs" Inherits="Admin_ExpenseDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.datatables.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.20/css/jquery.datatables.css" rel="stylesheet" type="text/javascript" />

    <script type="text/javascript">

        $(document).ready(function () {
            $('#<%=GridView1.ClientID%>').prepend($("<thead></thead").append($(this).find("tr:first"))).DataTable({"paging":true,"ordering":true,"searching":true})

        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <div  class="container p-md-4 p-sm-10">
            
            <h2 class="text-center">Expense Details</h2>

            <div class="row mb-3 mr-lg-5 ml-lg-5" >
               <div class="col-md-12">
                   <asp:GridView ID="GridView1" runat="server" CssClass="table-hover table-bordered-1" 
                       EmptyDataText="No Record To Display" AutoGenerateColumns="False">
                       <Columns>
                           <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                           <ItemStyle HorizontalAlign="Center" />
                           </asp:BoundField>

                           <asp:BoundField DataField="ClassName" HeaderText="Class">
                           <ItemStyle HorizontalAlign="Center" />
                           </asp:BoundField>

                           <asp:BoundField DataField="SubjectName" HeaderText="Subject">
                           <ItemStyle HorizontalAlign="Center" />
                           </asp:BoundField>

                           <asp:BoundField DataField="ChargeAmount" HeaderText="Charge Amount.(Per Lecture)">
                           <ItemStyle HorizontalAlign="Center" />
                           </asp:BoundField>


                           
                       </Columns>
                       <HeaderStyle BackColor="#5558C9" ForeColor="White" />
                   </asp:GridView>
               </div>
                </div>
        </div>


</asp:Content>

