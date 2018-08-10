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
	                            	<select class="btn btn-default btn-xs dropdown-toggle" onchange="location.href=this.value">
	                            		<option value="hospitalList?hospitalChoice=1">제휴병원</option>
	                            		<option value="hospitalList_none?hospitalChoice=0">비제휴병원</option>
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
		                                            <th>병원번호</th>
		                                            <th>병원명</th>
		                                            <th>병원연락처</th>
													<th>병원소재지</th>
		                                            <th>전문분야</th>
													<th>소개글</th>
		                                        </tr>
	                                        </thead>
	                                        <tbody>
		                                        <c:if test="${cnt > 0}">
		                                        	<input type="hidden" name="pageNum" value="${pageNum}">
													<c:forEach var="dto" items="${dtos}">
														<tr>
															<td onclick="window.location='hosModify?hospitalno=${dto.hospitalno}&pageNum=${pageNum}&number=${number+1}'">${dto.hospitalno}</td>
															<td onclick="window.location='hosModify?hospitalno=${dto.hospitalno}&pageNum=${pageNum}&number=${number+1}'">${dto.hospitalname}</td>
															<td onclick="window.location='hosModify?hospitalno=${dto.hospitalno}&pageNum=${pageNum}&number=${number+1}'">${dto.hospitalphone}</td>
															<td onclick="window.location='hosModify?hospitalno=${dto.hospitalno}&pageNum=${pageNum}&number=${number+1}'">${dto.hospitaladdr}</td>
															<td onclick="window.location='hosModify?hospitalno=${dto.hospitalno}&pageNum=${pageNum}&number=${number+1}'">${dto.hospitalkind}</td>
															<td onclick="window.location='hosModify?hospitalno=${dto.hospitalno}&pageNum=${pageNum}&number=${number+1}'">
																<c:if test="${dto.hospitalinstruction == null}">
																	X
																</c:if>
																<c:if test="${dto.hospitalinstruction != null}">
																	O
																</c:if>
															</td>
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
														<c:if test="${sc == null}">
															<!-- 맨끝[◀◀] / 이전[◀] -->
															<c:if test="${startPage > pageBlock}">
																<a href="hospitalList">[맨앞]</a>
																<a href="hospitalList?pageNum=${startPage - pageBlock}">[이전]</a>
															</c:if>
										
															<c:forEach var="i" begin="${startPage}" end="${endPage}">
																<c:if test="${i == currentPage}">
																	<span><b>[${i}]</b></span>
																</c:if>
																<c:if test="${i != currentPage}">
																	<a href="hospitalList?pageNum=${i}">[${i}]</a>
																</c:if>
															</c:forEach>
															
															<!-- 맨끝[▶▶] / 다음▶] -->
															<c:if test="${pageCount > endPage}">
																<a href="hospitalList?pageNum=${startPage + pageBlock}">[다음]</a>
																<a href="hospitalList?pageNum=${pageCount}">[맨뒤]</a>
															</c:if>
														</c:if>
														
														<c:if test="${sc != null}">
															<c:if test="${startPage > pageBlock}">
																<a href="hospitalSearchList?sc=${sc}&search=${search}">[맨앞]</a>
																<a href="hospitalSearchList?pageNum=${startPage - pageBlock}&sc=${sc}&search=${search}">[이전]</a>
															</c:if>
										
															<c:forEach var="i" begin="${startPage}" end="${endPage}">
																<c:if test="${i == currentPage}">
																	<span><b>[${i}]</b></span>
																</c:if>
																<c:if test="${i != currentPage}">
																	<a href="hospitalSearchList?pageNum=${i}&sc=${sc}&search=${search}">[${i}]</a>
																</c:if>
															</c:forEach>
															
															<c:if test="${pageCount > endPage}">
																<a href="hospitalSearchList?pageNum=${startPage + pageBlock}sc=${sc}&search=${search}">[다음]</a>
																<a href="hospitalSearchList?pageNum=${pageCount}sc=${sc}&search=${search}">[맨뒤]</a>
															</c:if>
														</c:if>
													</c:if>
												</th>
											</tr>
										</table>
										
										<form action="hospitalSearchList" class="search_box" method="post" name="searchForm" onsubmit="return searchChk()">
	                                    	<table align="center">
												<tr>
													<td>
														<select class="input" name="sc">
															<option value="0">병원명</option>
															<option value="1">소재지</option>
															<option value="2">분야</option>
														</select>
													</td>
													<td>
														<input type="text" id="search" name="search">
													</td>
													<td>
														<input type="submit" value="검색">
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