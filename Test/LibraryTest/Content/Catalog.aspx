<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Catalog.aspx.cs" Inherits="LibraryTest.Content.Catalog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>&nbsp;AFM BOOKS</h1>
    All books:
    <asp:GridView ID="allbooksGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="3" DataSourceID="sqlDataAllBooks" GridLines="Horizontal" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Title" SortExpression="Name" />
            <asp:BoundField DataField="FirstNameAuthor" HeaderText="Author First Name" SortExpression="FirstNameAuthor" />
            <asp:BoundField DataField="LastNameAuthor" HeaderText="Author Last Name" SortExpression="LastNameAuthor" />
            <asp:BoundField DataField="DscCategory" HeaderText="Category" SortExpression="DscCategory" />
        </Columns>
        <EmptyDataTemplate>
            There are no books
        </EmptyDataTemplate>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" />
    </asp:GridView>
    <br />


    <asp:SqlDataSource ID="sqlDataAllBooks" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="getCatalog" SelectCommandType="StoredProcedure"></asp:SqlDataSource>


    <br />
    <br />


    Search books by Author:
    <asp:TextBox ID="searchAuthortext" runat="server"></asp:TextBox>
    <asp:Button ID="searchAuthorBotton" runat="server" Text="Search" />
    <br />
    <br />
    <br />
    <asp:GridView ID="gridBooksByAuthor" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="sqlDataBooksByAuthor" GridLines="Horizontal">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Title" SortExpression="Name" />
            <asp:BoundField DataField="FirstNameAuthor" HeaderText="Author First Name" SortExpression="FirstNameAuthor" />
            <asp:BoundField DataField="LastNameAuthor" HeaderText="Author Last Name" SortExpression="LastNameAuthor" />
            <asp:BoundField DataField="DscCategory" HeaderText="Category" SortExpression="DscCategory" />
        </Columns>
        <EmptyDataTemplate>
            There are no books for the Author
        </EmptyDataTemplate>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" />
    </asp:GridView>

    <br />
    <asp:SqlDataSource ID="sqlDataBooksByAuthor" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="getAuthor" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="searchAuthortext" DefaultValue="*" Name="Author" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <hr />
    <br />
    Search books by Category:<br />
    <br />
    <asp:GridView ID="gridViewCategory" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="IDCategory" DataSourceID="sqlDataCategory" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
            <asp:BoundField DataField="IDCategory" HeaderText="IDCategory" InsertVisible="False" ReadOnly="True" SortExpression="IDCategory" Visible="False" />
            <asp:BoundField DataField="DscCategory" HeaderText="Category" SortExpression="DscCategory" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="sqlDataBooksByCategory" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="getBook" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="gridViewCategory" DefaultValue="0" Name="IDCategory" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="sqlDataCategory" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="getCategory" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:GridView ID="gridViewBooksByCategory" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="sqlDataBooksByCategory" GridLines="Horizontal">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Title" SortExpression="Name" />
            <asp:BoundField DataField="FirstNameAuthor" HeaderText="Author First Name" SortExpression="FirstNameAuthor" />
            <asp:BoundField DataField="LastNameAuthor" HeaderText="Author Last Name" SortExpression="LastNameAuthor" />
        </Columns>
        <EmptyDataTemplate>
            There are no books for the category
        </EmptyDataTemplate>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" />
    </asp:GridView>
    <br />

    <br />
    <hr />
    

    </asp:Content>
