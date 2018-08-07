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
	                <h1 class="page-header">회원관리 - 의사탈퇴회원목록 </h1>		<!-- 페이지 제목 -->
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
	                            		<option value="doctorsecessionList">의사탈퇴회원목록</option>
						 				<option value="doctorList">의사회원목록</option>
						 				<option value="doctorpermissionList">의사회원승인대기목록</option>
						 				<!-- <option value="doctorsanctionList">의사제제회원목록</option> -->
						 			</select>
						 			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <button type="button" onclick="doctordeleteCheck();">
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
	                                        	<th>전체선택&nbsp;<input type="checkbox" name="checkAll" id="checkAll"></th>
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
	                                        	<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}">
												<input type="hidden" id="pageDivision" name="pageDivision" value="sec">
	                                        	<c:set value="0" var="a"></c:set>
												<c:forEach var="dto" items="${dtos}">
													<tr>
														<td><input type="checkbox" name="checkOne" value="${dto.doctorno}"></td>
													    <td>${dto.doctorno}</td>
														<td>${dtos2[a].hospitalname}</td>
														<td>${dto.doctorid}</td>
														<td>${dto.doctorname}</td>
														<td>${dtos2[a].hospitaladdr}</td>
														<td>${dtos2[a].hospitalphone}</td>
														<td>${dto.doctorspecialism}</td>
														<td>${dto.doctorappro}</td>
														<td>${dto.sanctions}</td>
														<td>${dto.point}</td>
														<td>${dto.doctorregstration}</td>
		                                        	</tr>
		                                        	<c:set var="a" value="${a+1 }"></c:set>
		                                       	</c:forEach>
		                                       </c:if>
	                                        </tbody>
	                                    </table>
	                                    
	                                    
	                                    <!-- 페이지 컨트롤 -->
										<table align="center">
											<tr>
												<th align="center">
													<c:if test="${cnt > 0}">
														<c:if test="${sc == null}">
															<!-- 맨끝[◀◀] / 이전[◀] -->
															<c:if test="${startPage > pageBlock}">
																<a href="doctorsecessionList">[맨앞]</a>
																<a href="doctorsecessionList?pageNum=${startPage - pageBlock}">[이전]</a>
															</c:if>
										
															<c:forEach var="i" begin="${startPage}" end="${endPage}">
																<c:if test="${i == currentPage}">
																	<span><b>[${i}]</b></span>
																</c:if>
																<c:if test="${i != currentPage}">
																	<a href="doctorsecessionList?pageNum=${i}">[${i}]</a>
																</c:if>
															</c:forEach>
															
															<!-- 맨끝[▶▶] / 다음▶] -->
															<c:if test="${pageCount > endPage}">
																<a href="doctorsecessionList?pageNum=${startPage + pageBlock}">[다음]</a>
																<a href="doctorsecessionList?pageNum=${pageCount}">[맨뒤]</a>
															</c:if>
														</c:if>
														
														<c:if test="${sc != null}">
															<c:if test="${startPage > pageBlock}">
																<a href="doctorsecessionSearchList?sc=${sc}&search=${search}">[맨앞]</a>
																<a href="doctorsecessionSearchList?pageNum=${startPage - pageBlock}&sc=${sc}&search=${search}">[이전]</a>
															</c:if>
										
															<c:forEach var="i" begin="${startPage}" end="${endPage}">
																<c:if test="${i == currentPage}">
																	<span><b>[${i}]</b></span>
																</c:if>
																<c:if test="${i != currentPage}">
																	<a href="doctorsecessionSearchList?pageNum=${i}&sc=${sc}&search=${search}">[${i}]</a>
																</c:if>
															</c:forEach>
															
															<c:if test="${pageCount > endPage}">
																<a href="doctorsecessionSearchList?pageNum=${startPage + pageBlock}sc=${sc}&search=${search}">[다음]</a>
																<a href="doctorsecessionSearchList?pageNum=${pageCount}sc=${sc}&search=${search}">[맨뒤]</a>
															</c:if>
														</c:if>
													</c:if>
												</th>
											</tr>
										</table>
										
	                                    <table align="center">
	                                    	<form action="doctorsecessionSearchList" class="search_box" method="get">
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