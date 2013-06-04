<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="myStreet._Default" %>

 <asp:Content ContentPlaceHolderID="HeadContentBootstrap" runat="server">
        <%--<link href="/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen" type="text/css" />--%>
        <%--<link href="/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />--%>
        <script src="/Scripts/OpenLayers.js" type="text/javascript" />
        <%--<script src="/Scripts/jquery-1.4.1.js" type="text/javascript" />--%>
        <%--<script src="/bootstrap/js/bootstrap.js" type="text/javascript" />--%>
 </asp:Content>

<asp:Content ID="Title" runat="server" ContentPlaceHolderID="TitleContent">
    Pagina default
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome to ASP.NET!
    </h2>
    <p>
        To learn more about ASP.NET visit <a href="http://www.asp.net" title="ASP.NET Website">
            www.asp.net</a>.
    </p>
    <p>
        You can also find <a href="http://go.microsoft.com/fwlink/?LinkID=152368&amp;clcid=0x409"
            title="MSDN ASP.NET Docs">documentation on ASP.NET at MSDN</a>.
    </p>
    <div id="myStreetMap" style="height: 500px">
    </div>
    <asp:Button ID="teste" OnClick=/>
</asp:Content>
