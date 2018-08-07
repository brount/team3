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
		                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">병원검색</a>
		                        </h4>
		                    </div>
		                    <div id="collapseOne" class="panel-collapse collapse">
		                        <div class="panel-body">
		                            <table class="table">
		                                <tr>
		                                    <td>
		                                       <a href="hospitalSeach">병원</a>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                        <a href="achospitalSeach?state=1">제휴병원</a>
		                                    </td>
		                                </tr>
		                            </table>
		                        </div>
		                    </div>
		                </div>
		                <div class="panel panel-default">
		                    <div class="panel-heading">
		                        <h4 class="panel-title">
		                            <a  href="drugStoreSeach">약국 검색</a>
		                        </h4>
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
								<img src="/medical/resources/images/licence/${vo.hospitalimage}" width="500px" height="380px">
								
							</div>
			               <div class="panel panel-primary">
			                   
			                   <table class="table" >
			                       <tr>
			                          <th style="background: lightcyan">병원이름</th>
			                          <td>${vo.hospitalname}</td>
			                       </tr>
			                       <tr>
			                          <th style="background: lightcyan">병원주소</th>
			                          <td>
			                             ${vo.hospitaladdr}<br>
			                          </td>
			                       </tr>
			                       <tr>
			                          <th style="background: lightcyan">전화번호</th>
			                          <td>${vo.hospitalphone}</td>
			                       </tr>
			                      <tr>
			                          <th style="background: lightcyan">병원 소개</th>
			                          <td>${vo.hospitalinstruction}</td>
			                       </tr>
			                      <tr>
			                          <th style="background: lightcyan">진료시간</th>
			                          <td>월 : ${vo.mon}<br>
							                             화 : ${vo.tues}<br>
							                             수 : ${vo.wed}<br>
							                             목 : ${vo.thurs}<br>
							                             금 : ${vo.fri}<br>
							                             토 : ${vo.sat}<br>
							                             일 : ${vo.sun}<br>
							                             공휴일  : ${vo.holi}<br>
			                          </td>
			                       </tr>
			                        <tr>
			                        	<td style="background: lightcyan" align=center colspan=2>
			                        		<button type="button" class="btn btn-primary" value="" style="margin-left:30px; padding:0px;">예약</button>
			                        		<button type="button" class="btn btn-primary" value="" style="margin-left:30px; padding:0px;">즐겨찾는 병원 등록</button>
			                        	</td>
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