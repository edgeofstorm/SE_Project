<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="BikeDescription.aspx.cs" Inherits="BikeDescription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <div class="container">
        <div class="row">
            <h1 class="col-md-12">İlan Başlığı</h1>
            <div class="col-sm-7">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100" style="height:300px;" src="img/at.jpg" alt="First slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" style="height:300px;" src="img/at.jpg" alt="Second slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" style="height:300px;" src="img/gay-bisiklet.jpg" alt="Third slide">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <br />
                <div class="row">
                    <div class="offset-md-3 col-md-6">
                        <button type="button" class="btn btn-warning btn-md" data-toggle="modal" data-target="#myModal1">
                            Hemen ilan sahibiyle
                        <br />
                            iletişime geç!</button>
                    </div>
                    <div id="myModal1" class="modal fade" role="dialog">
						<div class="modal-dialog">

							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<h3>Mesaj Gonder</h3>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
								<div class="modal-body">
									

									<!-- Password input-->
									<div class="form-group">
										<label class="col-md-4 control-label" for="messageinput">Mesaj</label>
										<div class="col-md-8">
											
                                            <asp:TextBox ID="txtMessage" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
										</div>
									</div>
                                    <div class="form-group">
										<div class="col-md-8">
                                            <asp:Button ID="btnMessage" runat="server" CssClass="btn btn-warning" OnClick="SaveBtnPass_Click" Text="Mesaj Gonder"/>
											<%--<button id="singlebutton" name="singlebutton" class="btn btn-warning">Mesaj Gonder</button>--%>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								</div>
							</div>

						</div>
					</div>
                </div>
                <br />
            </div>
            <div class="col-sm-5">
                <h3>99999999 $</h3>
                <br />
                <div id="accordion">
                    <div class="card">
                        <div class="card-header">
                            <a class="card-link" data-toggle="collapse" href="#collapseOne">Contact Information
                            </a>
                        </div>
                        <div id="collapseOne" class="collapse" data-parent="#accordion">
                            <div class="card-body">
                                <asp:Repeater ID="RepUser" runat="server">
                                <HeaderTemplate>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Contact</th>
                                            <th scope="col">Info</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td>name surname</td>
                                            <td><%# Eval("Name") %> <br /><%# Eval("Surname") %></td>
                                        </tr>
                                        <tr>
                                            <td>Username</td>
                                            <td><%# Eval("Username") %></td>
                                        </tr>
                                        <tr>
                                            <td>Email</td>
                                            <td><%# Eval("Email") %></td>
                                        </tr>
                                        <tr>
                                            <td>Phone</td>
                                            <td><%# Eval("Phone") %></td>
                                        </tr>
                                        <tr>
                                            <td>Address</td>
                                            <td><%# Eval("Address") %></td>
                                        </tr>
                                        </ItemTemplate>
                                    <FooterTemplate>
                                    </tbody>
                                </table>
                                    </FooterTemplate>
                                    </asp:Repeater>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo">Annotation</a>
                        </div>
                        <div id="collapseTwo" class="collapse" data-parent="#accordion">
                            <div class="card-body">
                               <asp:Label ID="lblAnno" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <br />
        <br />

        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#home" aria-controls="home" aria-selected="true">Bisikletin Özellikleri</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#yorum" aria-controls="yorum" aria-selected="false">Ürün Hakkındaki Yorumlar</a>
            </li>
        </ul>

        <div class="tab-content" id="myTabContent">
            <div id="home" class="tab-pane fade show active" role="tabpanel" aria-labelledby="home-tab">
                <h3>Bisikletin özellikleri</h3>
                <p>İyi yanlar</p>
            </div>
            <div id="yorum" class="tab-pane fade" role="tabpanel" aria-labelledby="yorum-tab">
                <nav class="navbar navbar-default navbar-fixed-top">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-4">
                                <h4>Average user rating</h4>
                                <h2 class="bold padding-bottom-7">4.3 <small>/ 5</small></h2>
                                <button type="button" class="btn btn-warning btn-sm" aria-label="Left Align">
                                    <span class="fa fa-star" aria-hidden="true"></span>
                                </button>
                                <button type="button" class="btn btn-warning btn-sm" aria-label="Left Align">
                                    <span class="fa fa-star" aria-hidden="true"></span>
                                </button>
                                <button type="button" class="btn btn-warning btn-sm" aria-label="Left Align">
                                    <span class="fa fa-star" aria-hidden="true"></span>
                                </button>
                                <button type="button" class="btn btn-default btn-grey btn-sm" aria-label="Left Align">
                                    <span class="fa fa-star" aria-hidden="true"></span>
                                </button>
                                <button type="button" class="btn btn-default btn-grey btn-sm" aria-label="Left Align">
                                    <span class="fa fa-star" aria-hidden="true"></span>
                                </button>
                            </div>
                            <div class="col-sm-5">
                                <h4>Rating breakdown</h4>
                                <div class="pull-left">
                                    <div class="pull-left" style="width: 35px; line-height: 1;">
                                        <div style="height: 9px; margin: 5px 0;">5 <span class="fa fa-star"></span></div>
                                    </div>
                                    <div class="pull-left" style="width: 180px;">
                                        <div class="progress" style="height: 9px; margin: 8px 0;">
                                            <div class="progress-bar progress-bar-striped progress-bar-success" role="progressbar" aria-valuenow="5" aria-valuemin="0" aria-valuemax="5" style="width: 1000%">
                                                <span class="sr-only">80% Complete (danger)</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="pull-right" style="margin-left: 10px;">1</div>
                                </div>
                                <div class="pull-left">
                                    <div class="pull-left" style="width: 35px; line-height: 1;">
                                        <div style="height: 9px; margin: 5px 0;">4 <span class="fa fa-star"></span></div>
                                    </div>
                                    <div class="pull-left" style="width: 180px;">
                                        <div class="progress" style="height: 9px; margin: 8px 0;">
                                            <div class="progress-bar bg-success progress-bar-striped progress-bar-primary" role="progressbar" aria-valuenow="4" aria-valuemin="0" aria-valuemax="5" style="width: 80%">
                                                <span class="sr-only">80% Complete (danger)</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="pull-right" style="margin-left: 10px;">1</div>
                                </div>
                                <div class="pull-left">
                                    <div class="pull-left" style="width: 35px; line-height: 1;">
                                        <div style="height: 9px; margin: 5px 0;">3 <span class="fa fa-star"></span></div>
                                    </div>
                                    <div class="pull-left" style="width: 180px;">
                                        <div class="progress" style="height: 9px; margin: 8px 0;">
                                            <div class="progress-bar bg-info progress-bar-striped" role="progressbar" aria-valuenow="3" aria-valuemin="0" aria-valuemax="5" style="width: 60%">
                                                <span class="sr-only">80% Complete (danger)</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="pull-right" style="margin-left: 10px;">0</div>
                                </div>
                                <div class="pull-left">
                                    <div class="pull-left" style="width: 35px; line-height: 1;">
                                        <div style="height: 9px; margin: 5px 0;">2 <span class="fa fa-star"></span></div>
                                    </div>
                                    <div class="pull-left" style="width: 180px;">
                                        <div class="progress" style="height: 9px; margin: 8px 0;">
                                            <div class="progress-bar bg-warning progress-bar-striped" role="progressbar" aria-valuenow="2" aria-valuemin="0" aria-valuemax="5" style="width: 40%">
                                                <span class="sr-only">80% Complete (danger)</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="pull-right" style="margin-left: 10px;">0</div>
                                </div>
                                <div class="pull-left">
                                    <div class="pull-left" style="width: 35px; line-height: 1;">
                                        <div style="height: 9px; margin: 5px 0;">1 <span class="fa fa-star"></span></div>
                                    </div>
                                    <div class="pull-left" style="width: 180px;">
                                        <div class="progress" style="height: 9px; margin: 8px 0;">
                                            <div class="progress-bar bg-danger progress-bar-striped" role="progressbar" aria-valuenow="1" aria-valuemin="0" aria-valuemax="5" style="width: 20%">
                                                <span class="sr-only">80% Complete (danger)</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="pull-right" style="margin-left: 10px;">0</div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <table class="table table-striped table-responsive-sm">
                                <tr>
                                    <td>
                                        <img src="http://dummyimage.com/60x60/666/ffffff&text=No+Image" class="img-rounded">
                                        <div class="review-block-name"><a href="#"><asp:Label ID="lblUserFeedback" runat="server"></asp:Label></a></div>
                                        <div class="review-block-date">
                                            <asp:Label ID="lblFeedbackDate" runat="server"></asp:Label><br />
                                            1 day ago
                                        </div>
                                    </td>
                                    <td class="col-sm-9">
                                        <div class="review-block-rate">
                                            <button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
                                                <span class="fa fa-star" aria-hidden="true"></span>
                                            </button>
                                            <button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
                                                <span class="fa fa-star" aria-hidden="true"></span>
                                            </button>
                                            <button type="button" class="btn btn-warning btn-xs" aria-label="Left Align">
                                                <span class="fa fa-star" aria-hidden="true"></span>
                                            </button>
                                            <button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
                                                <span class="fa fa-star" aria-hidden="true"></span>
                                            </button>
                                            <button type="button" class="btn btn-default btn-grey btn-xs" aria-label="Left Align">
                                                <span class="fa fa-star" aria-hidden="true"></span>
                                            </button>
                                        </div>
                                        <div class="review-block-title">this was nice in buy</div>
                                        <div class="review-block-description"><asp:Label ID="lblFeedback" runat="server"></asp:Label></div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!-- /container -->
                </nav>
            </div>
        </div>
    </div>
</asp:Content>
