<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../admin_setting.jsp" %>
<html>
<head>
<title> 관리자 페이지 - 의사회원관리</title>
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
	                <h1 class="page-header">회원관리 - 의사회원목록</h1>		<!-- 페이지 제목 -->
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
	                            	<select class="btn btn-default btn-xs dropdown-toggle" onchange="location.href=this.value">
						 				<option value="doctorList">의사회원목록</option>
						 				<option value="doctorpermissionList">의사회원승인대기목록</option>
						 				<option value="doctorsanctionList">의사제제회원목록</option>
						 				<option value="doctorsecessionList">의사탈퇴회원목록</option>
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
	                                        <c:if test="${cnt > 0}">
												<c:forEach var="dto" items="${dtos}">
													<tr>
													    <td onclick="window.location='doctorsanctionManage'">${dto.doctorno}</td>
														<td onclick="window.location='doctorsanctionManage'">${dto.hospitalname}</td>
														<td onclick="window.location='doctorsanctionManage'">${dto.doctorid}</td>
														<td onclick="window.location='doctorsanctionManage'">${dto.doctorname}</td>
														<td onclick="window.location='doctorsanctionManage'">${dto.hospitaladdress3}</td>
														<td onclick="window.location='doctorsanctionManage'">${dto.hospitalphone}</td>
														<td onclick="window.location='doctorsanctionManage'">${dto.doctorspecialism}</td>
														<td onclick="window.location='doctorsanctionManage'">${dto.doctorappro}</td>
														<td onclick="window.location='doctorsanctionManage'">${dto.sanctions}</td>
														<td onclick="window.location='doctorsanctionManage'">${dto.point}</td>
														<td onclick="window.location='doctorsanctionManage'">${dto.doctorregstration}</td>
		                                        	</tr>
		                                       	</c:forEach>
		                                       </c:if>
	                                        </tbody>
	                                    </table>
	                                    
	                                    
	                                    <!-- 페이지 컨트롤 -->
										<table align="center">
											<tr>
												<th align="center">
													<c:if test="${cnt > 0}">
														<!-- 맨끝[◀◀] / 이전[◀] -->
														<c:if test="${startPage > pageBlock}">
															<a href="doctorList">[맨앞]</a>
															<a href="doctorList?pageNum=${startPage - pageBlock}">[이전]</a>
														</c:if>
									
														<c:forEach var="i" begin="${startPage}" end="${endPage}">
															<c:if test="${i == currentPage}">
																<span><b>[${i}]</b></span>
															</c:if>
															<c:if test="${i != currentPage}">
																<a href="doctorList?pageNum=${i}">[${i}]</a>
															</c:if>
														</c:forEach>
														
														<!-- 맨끝[▶▶] / 다음▶] -->
														<c:if test="${pageCount > endPage}">
															<a href="doctorList?pageNum=${startPage + pageBlock}">[다음]</a>
															<a href="doctorList?pageNum=${pageCount}">[맨뒤]</a>
														</c:if>
													</c:if>
												</th>
											</tr>
										</table>
										
	                                    <table align="center">
	                                    	<form action="doctorSearchList" class="search_box" method="post">
                                  			<tr>
                                       			<td>
	                                        		<select class="input" name="sc" >
								 						<option value=0>회원ID</option>
								 						<option value=1>회원명</option>
								 						<option value=2>병원명</option>
								 						<option value=3>전문분야</option>
								 					</select>
							 					</td>
							 					<td>
							 						<input type="text" id="search" name="search">
							 					</td>
							 					<td>
							 						<input type="submit" value="검색">
							 					</td>
						 					</tr>
						 					</form>
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