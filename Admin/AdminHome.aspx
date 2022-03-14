<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="Admin_AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </div>
            <h2 class="text-center text-primary">Admin Page</h2>
       </div>
    <br />
    
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                     <div class="col-md-12" style="background-color:whitesmoke;padding:10px;">
                        <h3 class="text-center text-primary">Total Number Of Studnets</h3>
                             <div class="text-center text-danger" style="font-size:300%;">
                                <asp:Label ID="lblNS" runat="server"></asp:Label>
                              </div>
                      </div>

                      <div class="col-md-12" style="background-color:whitesmoke; margin-left:30%;margin-top:3%;padding:10px;">
                        <h3 class="text-center text-primary">Total Number Of Teachers</h3>
                             <div class="text-center text-danger" style="font-size:300%;">
                                 <asp:Label ID="lblNT" runat="server"></asp:Label>
                            </div>
                        </div>

                    <div class="col-md-12" style="background-color:whitesmoke;margin-left:60%;margin-top:3%;padding:10px;">
                        <h3 class="text-center text-primary">Total Number Of Classes</h3>
                             <div class="text-center text-danger" style="font-size:300%;">
                                 <asp:Label ID="lblNC" runat="server"></asp:Label>
                            </div>
                        </div>
                </div>
            </div>
        </div>
           
    

    

</asp:Content>

