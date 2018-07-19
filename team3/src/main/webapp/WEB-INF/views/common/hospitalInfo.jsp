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
	
	<section>
		<div class="container">
		    <div class="row">
		        <div class="col-sm-3 col-md-3">
		            <div class="panel-group" id="accordion">
		                <div class="panel panel-default">
		                    <div class="panel-heading">
		                        <h4 class="panel-title">
		                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">병원 검색</a>
		                        </h4>
		                    </div>
		                    <div id="collapseOne" class="panel-collapse collapse">
		                        <div class="panel-body">
		                            <table class="table">
		                                <tr>
		                                    <td>
		                                       <a href="#">자외선지수</a>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                        <a href="#">식중독지수</a>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                       <a href="#">기타</a>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                        <a href="#">기타</a>
		                                    </td>
		                                </tr>
		                            </table>
		                        </div>
		                    </div>
		                </div>
		                <div class="panel panel-default">
		                    <div class="panel-heading">
		                        <h4 class="panel-title">
		                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">약국 검색</a>
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
		            </div>
		        </div>
		        <div class="col-sm-9 col-md-9">
		            <div class="well">
		            	<div class='form container'>
		            	
							<div>
								<h3 style="display:block;">병원정보</h3>
								<hr>
							</div>
						
							<div>
								병원명
								<button type="button" class="btn btn-primary" value="" style="margin-left:30px; padding:0px;">즐겨찾는 병원 등록</button>
							</div>
							<table class='table'>
								<tr>
									<th>전화번호</th>
									<td>내용</td>
								</tr>
								<tr>
									<th>주소</th>
									<td>내용</td>
								</tr>
								<tr>
									<th>진료시간</th>
									<td>내용</td>
								</tr>
								<tr>
									<th>휴무일</th>
									<td>내용</td>
								</tr>
								<tr>
									<th>소개글</th>
									<td>내용</td>
								</tr>
								<tr>
									<th>이미지</th>
									<td>내용</td>
								</tr>
							</table>
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