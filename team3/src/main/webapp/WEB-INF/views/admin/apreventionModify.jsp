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


<title> 관리자 페이지 - 정보관리</title>

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
	
			<!-- section -->
	    	<div id="page-wrapper">
	    		<!-- /.row -->
	        	<div class="row">
	        		<!-- col-lg-12 -->
	            	<div class="col-lg-12">	
	                	<h1 class="page-header">예방정보수정</h1>		<!-- 페이지 제목 -->
	            	</div>
	            	<!-- col-lg-12 -->
	            	
							<div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <form role="form" action="apreventionList">
                                            
                                            <div class="form-group">
                                                <label>국가번호</label>
                                                <select class="form-control">
                                                    <option>+82 대한민국</option>
                                                    <option>+01 미국</option>
                                                </select>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label>예방접종종류</label>
                                                <select class="form-control">
                                                    <option>파상풍</option>
                                                    <option>자궁경부암예방주사</option>
                                                </select>
                                            </div>
                                            
                                            <div class="form-group input-group">
                                            	<label>질병등록번호</label>
                                                <input type="text" class="form-control"> 	<!-- 검색창 -->
                                            </div>
                                            
                                            <div class="form-group">
                                                <label>내용</label>
                                                <textarea class="form-control" rows="3"></textarea>
                                            </div>
                                            
	                                        <button type="submit" class="btn btn-default">수정</button>
                                            <button type="reset" class="btn btn-default" onclick="window.location='apreventionList'">취소</button>
                                        </form>
                                    </div>
                                    <!-- /.col-lg-6 (nested) -->
                                </div>
                                <!-- /.row (nested) -->
                            </div>
                            <!-- /.panel-body -->
															 
	    		</div>
	    		<!-- /.row -->
			</div>
			<!-- section -->
		</div>
	<!-- /#wrapper -->
    </body>
</html>