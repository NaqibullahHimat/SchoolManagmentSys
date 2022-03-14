<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="StudentAttendanceDetails.aspx.cs" Inherits="Admin_StudentAttendanceDetails" %>


<%@ Register Src="~/CommonPages/StudentAttandenceUC.ascx" TagPrefix="uc" TagName="StudentAttendanceDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <uc:StudentAttendanceDetails runat="server" ID="StudentAttendanceDetails1" />

</asp:Content>

