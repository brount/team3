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
	                	<h1 class="page-header">약추가</h1>		<!-- 페이지 제목 -->
	            	</div>
	            	<!-- col-lg-12 -->
	            	
							<div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <form role="form" action="drugList">
                                      		<!-- 검색 -->
                                            <div class="form-group input-group">
                                            	<label>약이름</label>
                                                <input type="text" class="form-control"> 	<!-- 검색창 -->
                                                
                                                <span class="input-group-btn" style="top:13px">
                                                    <button class="btn btn-default" type="button" style="padding-bottom:9px; padding-top:9px'"><i class="fa fa-search"></i> <!-- 검색버튼 -->
                                                    </button>
                                                </span>
                                            </div>
                                            <!-- 검색 -->
                                            
                                            <!-- 검색 -->
                                            <div class="form-group input-group">
                                            	<label>업체명</label>
                                                <input type="text" class="form-control"> 	<!-- 검색창 -->
                                                
                                                <span class="input-group-btn" style="top:13px">
                                                    <button class="btn btn-default" type="button" style="padding-bottom:9px; padding-top:9px'"><i class="fa fa-search"></i> <!-- 검색버튼 -->
                                                    </button>
                                                </span>
                                            </div>
                                            <!-- 검색 -->
                                            
                                            <!-- 검색 -->
                                            <div class="form-group input-group">
                                            	<label>약효분류코드</label>
                                                <input type="text" class="form-control"> 	<!-- 검색창 -->
                                                
                                                <span class="input-group-btn" style="top:13px">
                                                    <button class="btn btn-default" type="button" style="padding-bottom:9px; padding-top:9px'"><i class="fa fa-search"></i> <!-- 검색버튼 -->
                                                    </button>
                                                </span>
                                            </div>
                                            <!-- 검색 -->
                                            
                                            <!-- 검색 -->
                                            <div class="form-group input-group">
                                            	<label>약효분류</label>
                                                <input type="text" class="form-control"> 	<!-- 검색창 -->
                                                
                                                <span class="input-group-btn" style="top:13px">
                                                    <button class="btn btn-default" type="button" style="padding-bottom:9px; padding-top:9px'"><i class="fa fa-search"></i> <!-- 검색버튼 -->
                                                    </button>
                                                </span>
                                            </div>
                                            <!-- 검색 -->
                                            
                                            <div class="form-group">
                                                <label>전문/일반</label>
                                                <select class="form-control">
                                                    <option value="전문">전문</option>
                                                    <option value="일반">일반</option>
                                                </select>
                                            </div>
                                      		
                                            <div class="form-group input-group">
                                            	<label>허가일자</label>
                                                <input type="text" class="form-control">
                                            </div>
                                      		
                                      		<div class="form-group">
                                                <label>성상</label>
                                                <textarea class="form-control" rows="3"></textarea>
                                            </div>
	                                        
	                                        <div class="form-group">
                                                <label>약 제형</label>
                                                <select class="form-control">
                                                    <option value="경질캡슐">경질캡슐</option>
                                                    <option value="연질캡슐">연질캡슐</option>
                                                </select>
                                            </div>
	                                        
	                                        <div class="form-group">
                                                <label>낱알이미지</label>
                                                <input type="file">
                                            </div>
	                                        
	                                        <div class="form-group">
                                                <label>표시(앞)</label>
                                                <select class="form-control">
                                                    <option value="십자">십자</option>
                                                    <option value="직선">직선</option>
                                                </select>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label>표시(뒤)</label>
                                                <select class="form-control">
                                                    <option value="십자">십자</option>
                                                    <option value="직선">직선</option>
                                                </select>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label>약 모양</label>
                                                <select class="form-control">
                                                    <option value="경질캡슐">원</option>
                                                    <option value="연질캡슐">삼각</option>
                                                </select>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label>색상(앞)</label>
                                                <select class="form-control">
                                                    <option value="red">red</option>
                                                    <option value="blue">blue</option>
                                                </select>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label>색상(뒤)</label>
                                                <select class="form-control">
                                                    <option value="red">red</option>
                                                    <option value="blue">blue</option>
                                                </select>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label>분할선(앞)</label>
                                                <select class="form-control">
                                                    <option value="직선">직선</option>
                                                    <option value="사선">사선</option>
                                                </select>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label>분할선(뒤)</label>
                                                <select class="form-control">
                                                    <option value="직선">직선</option>
                                                    <option value="사선">사선</option>
                                                </select>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label>크기(장축)</label>
                                                <select class="form-control">
                                                    <option value="15">15</option>
                                                    <option value="20">20</option>
                                                </select>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label>크기(단축)</label>
                                                <select class="form-control">
                                                    <option value="5">5</option>
                                                    <option value="10">10</option>
                                                </select>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label>크기(두께)</label>
                                                <select class="form-control">
                                                    <option value="15">15</option>
                                                    <option value="20">20</option>
                                                </select>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label>마크내용(앞)</label>
                                                <select class="form-control">
                                                    <option value="제조사">제조사</option>
                                                    <option value="비타민">비타민</option>
                                                </select>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label>마크내용(뒤)</label>
                                                <select class="form-control">
                                                    <option value="제조사">제조사</option>
                                                    <option value="비타민">비타민</option>
                                                </select>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label>마크이미지(앞)</label>
                                                <input type="file">
                                            </div>
                                            
                                            <div class="form-group">
                                                <label>마크이미지(뒤)</label>
                                                <input type="file">
                                            </div>
                                            
                                            <div class="form-group input-group">
                                            	<label>마크코드(앞)</label>
                                                <input type="text" class="form-control">
                                            </div>
                                            
                                            <div class="form-group input-group">
                                            	<label>마크코드(뒤)</label>
                                                <input type="text" class="form-control">
                                            </div>
                                            
	                                        <button type="submit" class="btn btn-default">등록</button>
                                            <button type="reset" class="btn btn-default" onclick="window.location='drugList'">취소</button>
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