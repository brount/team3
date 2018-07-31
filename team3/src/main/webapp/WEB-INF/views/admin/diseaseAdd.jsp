<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../admin_setting.jsp" %>
<html>
<head>
<title> 관리자 페이지 - 정보관리</title>
</head>
<body>
	<div id="wrapper">

	    <!-- Navigation -->
	    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	        <div class="navbar-header">
	            <a class="navbar-brand" href="memberList"> 관리자 </a>
	        </div>
	
	        <ul class="nav navbar-right navbar-top-links">
	        	<li onclick="main">Main</a></li>
	            <li onclick="main"><i class="fa fa-sign-out fa-fw"></i> Logout </a></li>
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
	                	<h1 class="page-header">질병정보추가</h1>		<!-- 페이지 제목 -->
	            	</div>
	            	<!-- col-lg-12 -->
	            	
							<div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <form role="form" action="diseaseAddPro" onsubmit="return diseaseChk()" name="diseaseForm">
                                        	<input type="hidden" name="pageNum" value="${pageNum}">
                                        	<div class="form-group input-group">
                                            	<label>병명</label>
                                                <input type="text" class="form-control" name="diseaseName"> 
                                            </div>
                                            
                                            <div class="form-group">
                                                <label>정의</label>
                                                <textarea class="form-control" rows="3" placeholder="'내용1','내용2',..." name="diseaseDefine"></textarea>
                                            </div>
                                            
                                           <div class="form-group">
                                                <label>원인</label>
                                                <textarea class="form-control" rows="3" placeholder="'내용1','내용2',..." name="diseaseCause"></textarea>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label>증상</label>
                                                <textarea class="form-control" rows="3" placeholder="'내용1','내용2',..." name="diseaseSymptom"></textarea>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label>자가진단</label>
                                                <textarea class="form-control" rows="3" placeholder="'내용1','내용2',..." name="diseaseDiagnosis"></textarea>
                                            </div>
                                      		
                                            <div class="form-group">
                                                <label>치료법</label>
                                                <textarea class="form-control" rows="3" placeholder="'내용1','내용2',..." name="diseaseCure"></textarea>
                                            </div>
                                      		
                                      		<div class="form-group">
                                                <label>경과/합병증</label>
                                                <textarea class="form-control" rows="3" placeholder="'내용1','내용2',..." name="complications"></textarea>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label>예방법</label>
                                                <textarea class="form-control" rows="3" placeholder="'내용1','내용2',..." name="prevention"></textarea>
                                            </div>
                                            
	                                        <button type="submit" class="btn btn-default">등록</button>
                                            <button type="reset" class="btn btn-default" onclick="window.location='diseaseList'">취소</button>
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