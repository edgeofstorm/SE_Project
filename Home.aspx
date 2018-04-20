<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">

        <h1 class="my-4">Welcome Body
        </h1>

        <!-- Blog Post -->

        <%-- table class yerine table-responsive-sm. Table class kapsıyor mu malum--%>
        <asp:Repeater ID="RepBikes" runat="server" OnItemCommand="RepBikes_ItemCommand" ><%-- OnItemCommand="RepBikes_ItemCommand"--%>
            <HeaderTemplate>
                <table class="table table-striped table-responsive-sm">
                    <thead>
                        <tr>
                            <th scope="col"></th>
                            <th scope="col">Description</th>
                            <th scope="col">Weekly Price</th>
                            <th scope="col">Date</th>
                            <th scope="col">Location</th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <%--<a href="/BikeDescription.aspx?id=<%=DataBinder.Eval(Container.DataItem, "PhotoID")%>">--%>
                    <%--<a href="/BikeDescription.aspx">--%>
                            <%--<img style="width: 65px;" src="img/gay-bisiklet.jpg" alt="Card image cap">--%>
                        <%--<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# "data:Image/jpg;base64,"+ Convert.ToBase64String((byte[])Eval("Picture")) %>' CommandName="ImageClick" CommandArgument='<%# Eval("OwnerID") %>' Width="65" />--%>
                             <asp:ImageButton ID="phImage" runat="server" ImageUrl='<%# "data:Image/jpg;base64,"+ Convert.ToBase64String((byte[])Eval("Picture")) %>' CommandName="ImageClick" CommandArgument='<%# Eval("OwnerID")+","+ Eval("BikeID") %>' Width="65"/> <%--OnCommand="Image_Click" --%>
                       <%-- </a>--%>
                    &nbsp;&nbsp;&nbsp;</td>
                    <td>
                        <%# Eval("Description")%>
                    </td>
                    <td>
                        <%# Eval("Price")%><a> </a><%# Eval("Currency")%>
                    </td>
                    <td>
                        <%# Eval("AddingDate")%>
                    </td>
                    <td>
                        LOKASYON alincak yeni databeysle
                    </td>
                    <td> <%# Eval("OwnerID")%> </td>
                    <td>
                          <asp:Button ID="BikeView" runat="server" CssClass="btn btn-info" Text="Goruntule" OnClick="BikeView_Click" />
                    </td>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
        </table>
            </FooterTemplate>
        </asp:Repeater>

        <!-- Pagination -->
        <ul class="pagination justify-content-center mb-4">
            <li class="page-item">
                <a class="page-link" href="#">&larr; Older            
            <li class="page-item disabled">
                <a class="page-link" href="#">Newer &rarr;</a>
            </li>
        </ul>

    </div>


</asp:Content>

