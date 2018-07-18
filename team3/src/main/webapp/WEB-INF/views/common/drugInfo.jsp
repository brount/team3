<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<html lang="en">
<title> 사이트 이름 </title>
<body>
	<header>
	<%@ include file="../common/header.jsp" %>
	</header>
	
	<section style="padding:2rem;">
		<div class="container">
		    <div class="row">
		        <div class="col-sm-3 col-md-3">
		            <div class="panel-group" id="accordion">
		                <div class="panel panel-default">
		                    <div class="panel-heading">
		                        <h4 class="panel-title">
		                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">날씨(보건기상지수)</a>
		                        </h4>
		                    </div>
		                    <div id="collapseOne" class="panel-collapse collapse">
		                        <div class="panel-body">
		                            <table class="table">
		                                <tr>
		                                    <td>
		                                       <a href="#" style="color:#007bff;">자외선지수</a>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                        <a href="#" style="color:#007bff;">식중독지수</a>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                       <a href="#" style="color:#007bff;">기타</a>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                        <a href="#" style="color:#007bff;">기타</a>
		                                    </td>
		                                </tr>
		                            </table>
		                        </div>
		                    </div>
		                </div>
		                <div class="panel panel-default">
		                    <div class="panel-heading">
		                        <h4 class="panel-title">
		                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">예방정보</a>
		                        </h4>
		                    </div>
		                    <div id="collapseTwo" class="panel-collapse collapse">
		                        <div class="panel-body">
		                            <table class="table">
		                                <tr>
		                                    <td>
		                                        <a href="#">Orders</a>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                        <a href="#">Invoices</a>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                        <a href="#">Shipments</a>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                        <a href="#">Tex</a>
		                                    </td>
		                                </tr>
		                            </table>
		                        </div>
		                    </div>
		                </div>
		                <div class="panel panel-default">
		                    <div class="panel-heading">
		                        <h4 class="panel-title">
		                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">10대질병</a>
		                        </h4>
		                    </div>
		                    <div id="collapseThree" class="panel-collapse collapse">
		                        <div class="panel-body">
		                            <table class="table">
		                                <tr>
		                                    <td>
		                                        <a href="#">Change Password</a>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                        <a href="#">Notifications</a> 
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                        <a href="#">Import/Export</a>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                       <a href="#">Delete Account</a>
		                                    </td>
		                                </tr>
		                            </table>
		                        </div>
		                    </div>
		                </div>
		                <div class="panel panel-default">
		                    <div class="panel-heading">
		                        <h4 class="panel-title">
		                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour">간단진료</a>
		                        </h4>
		                    </div>
		                    <div id="collapseFour" class="panel-collapse collapse">
		                        <div class="panel-body">
		                            <table class="table">
		                                <tr>
		                                    <td>
		                                       <a href="#">Sales</a>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                       <a href="#">Customers</a>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                       <a href="#">Products</a>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                       <a href="#">Shopping Cart</a>
		                                    </td>
		                                </tr>
		                            </table>
		                        </div>
		                    </div>
		                </div>
		                <div class="panel panel-default">
		                    <div class="panel-heading">
		                        <h4 class="panel-title">
		                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseFive">약검색</a>
		                        </h4>
		                    </div>
		                    <div id="collapseFive" class="panel-collapse collapse in collapse show">
		                        <div class="panel-body">
		                            <table class="table">
		                                <tr>
		                                    <td>
		                                        <a href="#" style="color:#007bff;">Sales</a>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                        <a href="#" style="color:#007bff;">Customers</a>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                        <a href="#" style="color:#007bff;">Products</a>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                        <a href="#" style="color:#007bff;">Shopping Cart</a>
		                                    </td>
		                                </tr>
		                            </table>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		        <div class="col-sm-9 col-md-9">
		            <div class="well">
		            	<div class='form container'>
						<div>
							<div class="row" style="margin-bottom:20px;">
							<div class="center-block clearfix">
							<img src="/medical/resources/common/images/testDrug.jpg">
							</div>
							</div>
							<table class='table'>
								<tr>
									<th>약품명</th>
									<td>내용</td>
								</tr>
								<tr>
									<th>성분정보</th>
									<td>내용</td>
								</tr>
								<tr>
									<th>저장방법</th>
									<td>내용</td>
								</tr>
								<tr>
									<th>효능효과</th>
									<td>내용</td>
								</tr>
								<tr>
									<th>용법용량</th>
									<td>내용</td>
								</tr>
								<tr>
									<th>사용상 주의사항</th>
									<td>내용</td>
								</tr>
							</table>
							</div>
						</div>
		            </div>
		        </div>
		    </div>
		</div>
	</section>
	
	<footer>
	<%@ include file="../common/footer.jsp" %>
	</footer>
</body>
</html>