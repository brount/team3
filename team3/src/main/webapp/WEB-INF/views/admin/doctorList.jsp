<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../admin_setting.jsp" %>
<html>
<head>
<title> 관리자 페이지 - 의사회원관리</title>
<body>
	<div id="wrapper">

	   <jsp:include page="./admin_nav.jsp"></jsp:include>
	
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
					<div class="panel-heading" style="background-color: #5b92cb78!important">
	                        <div class="pull-right">
	                            <div class="btn-group">
	                            	<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}">
	                            	<select class="btn btn-default btn-xs dropdown-toggle" onchange="location.href=this.value">
						 				<option value="doctorList">의사회원목록</option>
						 				<option value="doctorpermissionList">의사회원승인대기목록</option>
						 				<!-- <option value="doctorsanctionList">의사제제회원목록</option> -->
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
	                                    <table class="responstable">
	                                        <thead>
	                                        <tr>
	                                            <th>회원번호</th>			
	                                            <th>병원명</th>			
	                                            <th>회원ID</th>			
	                                            <th>회원명</th>			
	                                            <th>병원소재지</th>			
	                                            <th>병원연락처</th>			
	                                            <th>전문분야</th>			
												<th>포인트</th>			
	                                            <th>가입일</th>			
	                                        </tr>
	                                        </thead>
	                                        <tbody>
	                                        
	                                       <c:if test="${cnt > 0}">
	                                        	
	                                        	<c:set value="0" var="a"></c:set>
												<c:forEach var="dto" items="${dtos}">
													<tr onclick="window.location='doctorManage?&doctorid=${dto.doctorid}&pageNum=${pageNum}&number=${number+1}'">
													    <td>${dto.doctorno}</td>
														<td>${dtos2[a].hospitalname}</td>
														<td>${dto.doctorid}</td>
														<td>${dto.doctorname}</td>
														<td>${dtos2[a].hospitaladdr}</td>
														<td>${dtos2[a].hospitalphone}</td>
														<c:if test="${dto.doctorspecialism == 1}">
															<td>내과</td>
														</c:if>
														<c:if test="${dto.doctorspecialism == 2}">
															<td>이비인후과</td>
														</c:if>
														<c:if test="${dto.doctorspecialism == 3}">
															<td>정신의학과</td>
														</c:if>
														<c:if test="${dto.doctorspecialism == 4}">
															<td>외과</td>
														</c:if>
														<c:if test="${dto.doctorspecialism == 5}">
															<td>치과</td>
														</c:if>
														<td>${dto.point}</td>
														<td>${dto.doctorregstration}</td>
		                                        	</tr>
		                                        	<c:set var="a" value="${a+1 }"></c:set>
		                                       	</c:forEach>
		                                       </c:if>
	                                        </tbody>
	                                    </table>
	                                    
	                                     <div class="pagination clearfix" style="display: table; margin: 0 auto;">
                      						<c:if test="${cnt > 0}">
														<c:if test="${sc == null}">
															<!-- 맨끝[◀◀] / 이전[◀] -->
															<c:if test="${startPage > pageBlock}">
																<a href="doctorList"><<</a>
																<a href="doctorList?pageNum=${startPage - pageBlock}"><</a>
															</c:if>
										
															<c:forEach var="i" begin="${startPage}" end="${endPage}">
																<c:if test="${i == currentPage}">
																	<strong>${i}</strong>
																</c:if>
																<c:if test="${i != currentPage}">
																	<a href="doctorList?pageNum=${i}">${i}</a>
																</c:if>
															</c:forEach>
															
															<!-- 맨끝[▶▶] / 다음▶] -->
															<c:if test="${pageCount > endPage}">
																<a href="doctorList?pageNum=${startPage + pageBlock}">></a>
																<a href="doctorList?pageNum=${pageCount}">>></a>
															</c:if>
														</c:if>
														
														<c:if test="${sc != null}">
															<c:if test="${startPage > pageBlock}">
																<a href="doctorSearchList?sc=${sc}&search=${search}"><<</a>
																<a href="doctorSearchList?pageNum=${startPage - pageBlock}&sc=${sc}&search=${search}"><</a>
															</c:if>
										
															<c:forEach var="i" begin="${startPage}" end="${endPage}">
																<c:if test="${i == currentPage}">
																	<strong>${i}</strong>
																</c:if>
																<c:if test="${i != currentPage}">
																	<a href="doctorSearchList?pageNum=${i}&sc=${sc}&search=${search}">${i}</a>
																</c:if>
															</c:forEach>
															
															<c:if test="${pageCount > endPage}">
																<a href="doctorSearchList?pageNum=${startPage + pageBlock}sc=${sc}&search=${search}">></a>
																<a href="doctorSearchList?pageNum=${pageCount}sc=${sc}&search=${search}">>></a>
															</c:if>
														</c:if>
													</c:if>
            							         </div>  
	                                    
	                                    
										<form action="doctorSearchList" class="search_box" method="post" name="searchForm" onsubmit="return searchChk()">										
		                                    <table align="center">
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
								 						<input type="submit" class="btn btn-dark-blue" value="검색">
								 					</td>
							 					</tr>
							 				</table>
						 				</form>
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