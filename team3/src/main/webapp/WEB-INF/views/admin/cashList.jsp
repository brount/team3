<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../admin_setting.jsp" %>
<html>
<head>
<title> 관리자 페이지 - 결산</title>
</head>
<body>
	<div id="wrapper">

	   <jsp:include page="./admin_nav.jsp"></jsp:include>
	
	    <div id="page-wrapper">
	        <div class="row">
	            <div class="col-lg-12">	
	                <h1 class="page-header">결산 - 현금결제목록</h1>		<!-- 페이지 제목 -->
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
	                            	<select class="input" name="btn btn-default btn-xs dropdown-toggle onchange=">
	                            		<option value="#">주간결산</option>
	                            		<option value="#">월간결산</option>
	                            		<option value="#">연간결산</option>
	                            	</select> 
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
													<th>이익금</th>
		                                        </tr>
	                                        </thead>
	                                        <tbody>
		                                        <tr>
		                                            <td>1,000,000원</td>
		                                        </tr>
	                                        </tbody>
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
	        <div class="row">
	            <div class="col-lg-8">
	                <!-- /.panel -->
	                <div class="panel panel-default">
	                    <div class="panel-heading">
	                        <div class="pull-right">
	                            <div class="btn-group">
	                            	<select class="input" name="btn btn-default btn-xs dropdown-toggle onchange=">
	                            		<option value="#">획득</option>
	                            		<option value="#">지출</option>
	                            	</select> 
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
		                                            <th>회원ID</th>
													<th>회원명</th>
		                                            <th>병원명</th>
		                                            <th>포인트내역</th>
													<th>누적포인트</th>
		                                        </tr>
	                                        </thead>
	                                        <tbody>
		                                        <tr>
		                                        	<td><input type="checkBox"></td>
		                                            <td>stoptalking</td>
		                                            <td>빵진</td>
		                                            <td>kosmo정신의학과</td>
		                                            <td>+15800pt</td>
													<td>32000pt</td>
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
								 						<option value="#">회원ID</option>
								 						<option value="#">회원명</option>
														<option value="#">병원명</option>
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