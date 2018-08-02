<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../admin_setting.jsp" %>
<html>
<head>
<title> 관리자 페이지 - 병원관리</title>
</head>
<body>
	<div id="wrapper">

	    <jsp:include page="./admin_nav.jsp"></jsp:include>
	
	    <div id="page-wrapper">
	        <div class="row">
	            <div class="col-lg-12">	
	                <h1 class="page-header">병원관리</h1>		<!-- 페이지 제목 -->
	            </div>
	            <!-- /.col-lg-12 -->
	        </div>
	        <!-- /.row -->
	        <div class="row">
	            <div class="col-lg-8">
	                <!-- /.panel -->
	                <div class="panel panel-default">
	                    <div class="panel-heading">
	                        <div class="pull-right">
	                            <div class="btn-group">
                                    <button type="button" onclick="window.location='hospitalAddForm'">
                                    	추가
                                    </button>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <button type="button">
                                    	삭제
                                    </button>
	                            </div>
	                        </div>
	                    </div>
	                    <!-- /.panel-heading -->
	                    <div class="panel-body">
	                        <div class="row">
	                            <div class="col-lg-4">
	                                <div class="table-responsive">
	                                    <table class="table table-bordered table-hover table-striped">
	                                        <thead>
		                                        <tr>
		                                        	<th><input type="checkBox"></th>
		                                            <th>병원번호</th>
		                                            <th>병원명</th>
		                                            <th>병원연락처</th>
													<th>병원소재지</th>
		                                            <th>전문분야</th>
		                                            <th>진료시간</th>
													<th>휴무일</th>
		                                        </tr>
	                                        </thead>
	                                        <tbody>
		                                        <tr>
		                                        	<td><input type="checkBox"></td>
		                                            <td type="button" onclick="window.location='hospitalModifyForm'">123123</td>
		                                            <td>kosmo정신의학과</td>
		                                            <td>02-0000-0000</td>
													<td>서울시 금천구 가산동</td>
		                                            <td>정신과</td>
		                                            <td>09:00 ~ 19:00</td>
													<td>매주 화요일,금요일,공휴일</td>
		                                        </tr>
	                                        </tbody>
	                                    </table>
	                                    
	                                    
	                                    <!-- 페이지 컨트롤 -->
										<table align="center">
											<tr align="center">
												<th>[≪]</th>
												<th>[<]</th>
												<th>1</th>
												<th>[>]</th>
												<th>[≫]</th>
											</tr>
										</table>
	                                    <table align="center">
                                  			<tr>
                                       			<td>
	                                        		<select class="input" name="btn btn-default btn-xs dropdown-toggle onchange=">
								 						<option value="#">병원명</option>
								 						<option value="#">소재지</option>
								 						<option value="#">전문분야</option>
								 					</select>
							 					</td>
							 					<td>
							 						<input type="search" id="search">
							 					</td>
							 					<td>
							 						<input type="button" value="검색">
							 					</td>
						 					</tr>
						 				</table>
	                                </div>
	                                <!-- /.table-responsive -->
	                            </div>
	                        </div>
	                        <!-- /.row -->
	                    </div>
	                    <!-- /.panel-body -->
	                </div>
	                <!-- /.panel -->
	            </div>
	            <!-- /.col-lg-4 -->
	        </div>
	        <!-- /.row -->
	    </div>
	    <!-- /#page-wrapper -->
	
	</div>
	<!-- /#wrapper -->
    </body>
</html>