<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/TeacherMaster.master" AutoEventWireup="true" CodeFile="StudentAttandanceDetails.aspx.cs" Inherits="Teacher_StudentAttendanceDetails" %>


<%@ Register Src="~/CommonPages/StudentAttandenceUC.ascx" TagPrefix="uc" TagName="StudentAttendanceDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc:StudentAttendanceDetails runat="server" ID="StudentAttendanceDetails1" />

</asp:Content>

