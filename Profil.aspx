<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Profil.aspx.cs" Inherits="Profil"  MaintainScrollPositionOnPostBack="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script>
        // show the given page, hide the rest
        function show(elementID) {
            // try to find the requested page and alert if it's not found
            var ele = document.getElementById(elementID);
            if (!ele) {
                alert("no such element");
                return;
            }
            
            // get all pages, loop through them and hide them
            var pages = document.getElementsByClassName('container1');
            for (var i = 0; i < pages.length; i++) {
                if (pages[i])
                    pages[i].style.display = 'none';
            }

            // then show the requested page
            ele.style.display = 'block';
            return false;
        }
    </script>

    <script>
        $(document).ready(function () {
            //$('.nav-tabs a:first').tab('show');
            $(".nav-tabs a").click(function () {
                $(this).tab('show');
                $(this).tab('active');
            });


            //$("#sidebarr").remove();//does not work!!!


            $(".listgroup button").on("click", function () {
                $(".listgroup button").removeClass("active");
                $(this).addClass("active");
            });
        });
    </script>

    <script>
        // Get the container element
        var btnContainer = document.getElementById("myDIV");

        // Get all buttons with class="btn" inside the container
        var btns = btnContainer.getElementsByClassName("btn");

        // Loop through the buttons and add the active class to the current/clicked button
        for (var i = 0; i < btns.length; i++) {
            btns[i].addEventListener("click", function () {
                var current = document.getElementsByClassName("active");
                current[0].className = current[0].className.replace(" active", "");
                this.className += " active";
            });
        }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <br />
            <br />
            <!-- ilanlar -->
            <div class="container1" id="ilanlar">
                <asp:Repeater ID="RepIlan" runat="server" OnItemCommand="RepIlan_ItemCommand">
                    <HeaderTemplate>
                        <table class="table table-striped table-responsive-sm">
                            <thead>
                                <tr>
                                    <th>Picture</th>
                                    <th>Description</th>
                                    <th>Price</th>
                                    <th>Goruntulenme</th>
                                    <th>Duzenle</th>

                                </tr>
                            </thead>

                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>

                            <td>
                                <img src="img/gay-bisiklet.jpg" width:"75px" />
                            </td>
                            <td>
                                <%# Eval("Description")%>
                                <br />
                                <%# Eval("AddingDate")%>
                                <br />
                                <%# Eval("Availability")%>
								
                            </td>
                            <td><%# Eval("Price")%><%# Eval("Currency")%><a> /hafta</a></td>
                            <td>

                                <i class="material-icons">remove_red_eye</i>
                                <span>Goruntulenme </span><span class="badge" <%--style="margin-left:6px;font-size:13px;"--%>>32</span>
                                <br />
                                <i class="material-icons">stars</i>
                                <span>Favoriler</span><span class="badge" <%--style="margin-left:6px;font-size:13px;"--%>>2</span>
                            </td>
                            <td>
                                <span class="btn btn-primary" style="margin-top: 30px; width: 100%;">Guncelle</span>
                                <br />
                                <span class="btn btn-danger" style="margin-top: 10px; width: 100%;">Kaldir</span>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </tbody>

				</table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>


            <!-- ayarlar -->
            <div class="container1" id="settings" style="display: none;">
                <%--				<div class="container-fluid">
					<div class="row">--%>

                <h2 style="margin-top: 30px;">Hesabim</h2>
                <ul class="nav nav-tabs">
                    <%-- <li class="active"><a href="#ayarlar-profil">Profil</a></li>
						<li><a href="#ayarlar-sifre">Sifre Degistir</a></li>--%>
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#ayarlar-profil">Profil</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#ayarlar-sifre">Sifre Degistir </a>
                    </li>
                </ul>

                <div class="tab-content">
                    <div id="ayarlar-profil" class="tab-pane active" style="margin-top: 15px;" role="tabpanel">
                        <div class="offset-md-1 col-md-10 ">
                            <div class="form-group">
                                <label for="inputdefault">Isim</label>
                                <asp:TextBox ID="NameInput" runat="server" CssClass="form-control" placeholder="Enes"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="inputdefault">Soyisim</label>
                                <asp:TextBox ID="SurnameInput" runat="server" CssClass="form-control" placeholder="Ekinci"></asp:TextBox>
                            </div>
                             <div class="form-group">
                                <label for="disabledInput" class="control-label">UserName</label>
                                <input class="form-control" id="uNameInput" type="text" placeholder="haQQi96" disabled>
                            </div>
                            <div class="form-group">
                                <label for="disabledInput" class="control-label">E-mail</label>
                                <input class="form-control" id="emailInput" type="text" placeholder="enesekinci1907@gmail.com" disabled>
                            </div>
                            <div class="form-group">
                                <label for="inputdefault">Phone Number</label>
                                <asp:TextBox ID="PhoneInput" runat="server" CssClass="form-control" placeholder="05063857439"></asp:TextBox>
                            </div>
                             <div class="form-group">
                                <label for="inputdefault">Address</label>
                                <asp:TextBox ID="AddressInput" runat="server" CssClass="form-control" placeholder="Easdgadfgnes"></asp:TextBox>
                            </div>
                             <div class="form-group">
                                <label for="inputdefault">IBAN (Optional)</label>
                                <asp:TextBox ID="IBANInput" runat="server" CssClass="form-control" placeholder="000-0000-0000000"></asp:TextBox>
                            </div>
                               <div class="form-group">
                                <label for="inputdefault">TC (Optional)</label>
                                <asp:TextBox ID="TCInput" runat="server" CssClass="form-control" placeholder="12374689973"></asp:TextBox>
                            </div>
              
                               <div class="form-group">
                                <label for="inputdefault">Annotation (Optional)</label>
                                <asp:TextBox ID="AnnotationInput" runat="server" CssClass="form-control" placeholder="NOT NOT NOT "></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="inputdefault" class="control-label">Profil Resmini Degistir</label>
                                <div class="custom-file" id="customFile" lang="es">
                                    <input type="file" class="custom-file-input" id="exampleInputFile" aria-describedby="fileHelp">
                                    <label class="custom-file-label" for="exampleInputFile">
                                        Resim Sec...
                                    </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputdefault">Konum</label>
                                <br />
                                *Insert Map HERE* 
								<label style="margin-left: 20px; margin-right: 10px;">ve ya</label>
                                <span class="btn btn-success" style="display: inline;">konumumu sec</span>
                            </div>
                            <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-primary" OnClick="SaveBtn_Click" Text="Guncelle" style="margin: 10px 0 0 0; width: 100%;"/>
                            <button class="btn btn-danger" id="btnCancel" style="margin: 10px 0 0 0; width: 100%;">Vazgec</button>
                            <asp:Label ID="lblStatus" Visible="false" CssClass="inputdefault" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div id="ayarlar-sifre" class="tab-pane fade" role="tabpanel">

                        <div class="form-group" style="margin-top: 15px;">
                            <label for="inputdefault">Mevcut Sifreyi Giriniz</label>
                            <asp:TextBox ID="txtOldPw" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>

                            <%--<span class="input-group-btn">
								<button class="btn btn-default" type="submit" style="padding-bottom:0px;">
									<i class="glyphicon glyphicon-eye-open"></i>                          FA FA EYE KULLAN OCLAR GLYPHICONU KALDRIMIS
								 </button>
							</span>--%>
                        </div>
                        <div class="form-group">
                            <label for="inputdefault">Yeni Sifre</label>
                            <asp:TextBox ID="txtPw" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="disabledInput" class="control-label">Yeni Sifre(tekrar)</label>
                            <asp:TextBox ID="txtPwControl" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            <asp:Label ID="lblPwStatus" Visible="false" CssClass="inputdefault" runat="server"></asp:Label>
                        </div>
                        <asp:Button ID="btnPwUpdate" runat="server" CssClass="btn btn-primary" OnClick="SaveBtnPass_Click" Text="Guncelle" autopostback="false" style="margin: 10px 0 0 0; width: 100%;"/>
                        <button class="btn btn-danger" id="btnpassCancel" style="margin: 10px 0 0 0; width: 100%;">Vazgec</button>

                    </div>

                </div>
            </div>

            <!-- favoriler -->
            <!--<div class="container1" id="favoriler" style="display: none;">
               
            <!-- mesajlarim -->
            <div class="container1" id="inbox" style="display: none;">
                <div class="mail-box" <%--style="border:2px solid;"--%>>
                    <aside class="lg-side">
                        <asp:Repeater ID="RepMessage" runat="server">
                            <HeaderTemplate>
                                <table class="table table-inbox table-hover">
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr class="unread">
                                    <td class="inbox-small-cells">
                                        <input type="checkbox" class="mail-checkbox">
                                    </td>
                                    <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                                    <td class="view-message  dont-show"><%# Eval("TargetID") %></td> <%--senderusername yap databasede veya--%>
                                    <td class="view-message "><%# Eval("Message") %></td>
                                    <td class="view-message  inbox-small-cells"><i class="fa fa-paperclip"></i></td>
                                    <td class="view-message  text-right"><%# Eval("SendDate") %></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>       
                        </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </aside>
                </div>

            </div>

        </div>
    </div>
</asp:Content>

