<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- jQuery -->
<script src="./resources/pyj/js/jquery.min.js"/></script>

<!-- Bootstrap Core JavaScript -->
<script src="./resources/pyj/js/bootstrap.min.js"/></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="./resources/pyj/js/metisMenu.min.js"/></script>

<!-- Custom Theme JavaScript -->
<script src="./resources/pyj/js/startmin.js"/></script>


<title> 관리자 페이지 - 제제회원관리</title>

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/pyj/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/pyj/css/metisMenu.min.css" rel="stylesheet">

<!-- Timeline CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/pyj/css/timeline.css" rel="stylesheet">

<!-- Custom CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/pyj/css/startmin.css" rel="stylesheet">

<!-- Custom Fonts -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/pyj/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
    </head>
<body>
	<div id="wrapper">

	    <!-- Navigation -->
	    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	        <div class="navbar-header">
	            <a class="navbar-brand" href="memberList"> 관리자 </a>
	        </div>
	
	        <ul class="nav navbar-right navbar-top-links">
	        	<li><a href="main">Main</a></li>
	            <li><a href="main"><i class="fa fa-sign-out fa-fw"></i> Logout </a></li>
	        </ul>
	        <!-- /.navbar-top-links -->
	
	        <div class="navbar-default sidebar" role="navigation">
	            <div class="sidebar-nav navbar-collapse">
	                <ul class="nav" id="side-menu">
	                    <li>
                        	<a href="#">회원관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="memberList">일반회원목록</a>
                                </li>
                                <li>
                                    <a href="doctorList">의사회원목록</a>
                                </li>
                                <li>
                                    <a href="sanctionList">제제회원목록</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
	                    <li>
	                        <a href="hospitalList">병원관리</a>
	                    </li>
	                    
	                    <li>
                        	<a href="#">정보관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="drugList">약정보목록</a>
                                </li>
                                <li>
                                    <a href="diseaseList">질병정보목록</a>
                                </li>
                                <li>
                                    <a href="exerciseList">운동정보목록</a>
                                </li>
                                <li>
                                    <a href="foodList">음식정보목록</a>
                                </li>
                                <li>
                                    <a href="apreventionList">예방정보목록</a>
                                </li>
                                <li>
                                    <a href="requestList">요구사항목록</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
	                    <li>
	                        <a href="eventRequestList">광고관리</a>
	                    </li>
	                    <li>
	                    	<a href="#">결산<span class="fa arrow"></span></a>
	                    	<ul class="nav nav-second-level">
                                <li>
                                    <a href="pointList">포인트결제내역목록</a>
                                </li>
                                <li>
                                    <a href="cashList">현금결제내역목록</a>
                                </li>
                            </ul>
	                    </li>
	                </ul>
	            </div>
	        </div>
	    </nav>
	
	    <div id="page-wrapper">
	        <div class="row">
	            <div class="col-lg-12">	
	                <h1 class="page-header">회원관리 - 제제회원목록</h1>		<!-- 페이지 제목 -->
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
	                            	<select class="btn btn-default btn-xs dropdown-toggle">
						 				<option value="#">일반회원</option>
						 				<option value="#">의사회원</option>
						 				<option value="#">탈퇴회원</option>
						 			</select>
						 			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
	                                            <th>회원번호</th>
	                                            <th>병원명</th>
	                                            <th>회원ID</th>
	                                            <th>회원명</th>
	                                            <th>병원소재지</th>
	                                            <th>병원연락처</th>
	                                            <th>전문분야</th>
	                                            <th>승인여부</th>
												<th>제재단계</th>
												<th>포인트</th>
	                                            <th>가입일</th>
	                                        </tr>
	                                        </thead>
	                                        <tbody>
	                                        <tr>
	                                        	<td><input type="checkBox"></td>
	                                            <td>3333</td>
	                                            <td>kosmo정신의학과</td>
	                                            <td>살려줘</td>
	                                            <td>빵진</td>
	                                            <td>서울시 금천구 가산동</td>
	                                            <td>02-0000-0000</td>
	                                            <td>정신과</td>
	                                            <td>O</td>
												<td>0</td>
												<td>15000</td>
	                                            <td>2018-07-18</td>
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