<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	                	<h1 class="page-header">운동정보수정</h1>		<!-- 페이지 제목 -->
	            	</div>
	            	<!-- col-lg-12 -->
	            	<div class="panel-body">
						<div class="row">
							<div class="col-lg-6">
								<form role="form" action="exerciseModifyPro" onsubmit="return exerciseChk()" name="exerciseForm">
									<input type="hidden" name="pageNum" value="${pageNum}">
									<input type="hidden" name="exerciseName" value="${dto.exerciseName}">
									<div class="form-group input-group">
										<label>운동명</label>
										<input type="text" class="form-control" name="exerciseName" value="${dto.exerciseName}" readonly > 
									</div>
						   
									<div class="form-group">
										<label>운동방법</label>
										<textarea class="form-control" rows="3" name="exerciseMethod">${dto.exerciseMethod}</textarea>
									</div>
									
									<div class="form-group">
										<label>목적</label>
										<textarea class="form-control" rows="3" name="exercisePurpose">${dto.exercisePurpose}</textarea>
									</div>
						   
									<div class="form-group">
										<label>장점</label>
										<textarea class="form-control" rows="3" name="exerciseMerit">${dto.exerciseMerit}</textarea>
									</div>
						   
									<div class="form-group">
									    <label>단점</label>
									    <textarea class="form-control" rows="3" name="exerciseDemerits">${dto.exerciseDemerits}</textarea>
									</div>
						   
									<div class="form-group">
									    <label>주의할점</label>
									    <textarea class="form-control" rows="3" name="exerciseCaution">${dto.exerciseCaution}</textarea>
									</div>
						   
									<button type="submit" class="btn btn-default">수정</button>
									<button type="reset" class="btn btn-default" onclick="window.location='exerciseList'">취소</button>
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