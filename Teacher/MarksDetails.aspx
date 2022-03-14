<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/TeacherMaster.master" AutoEventWireup="true" CodeFile="MarksDetails.aspx.cs" Inherits="Teacher_MarksDetails" %>


<%@ Register Src="~/CommonPages/MarksDetailUserControl.ascx" TagPrefix="uc" TagName="MarksDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    <uc:MarksDetail runat="server" ID="MarksDetail1" />

</asp:Content>

