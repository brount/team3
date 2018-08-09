<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../admin_setting.jsp" %>
<html>
<head>
<title> 관리자 페이지 - 정보관리</title>
</head>
<body>
	<div id="wrapper">

	    <jsp:include page="./admin_nav.jsp"></jsp:include>
	
	    <div id="page-wrapper">
	        <div class="row">
	            <div class="col-lg-12">	
	                <h1 class="page-header">정보관리 - 운동정보목록</h1>		<!-- 페이지 제목 -->
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
                                    <button type="button" onclick="window.location='exerciseAdd?pageNum=${pageNum}'">
                                    	추가
                                    </button>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                   <button type="button" onclick="exerciseDeleteCheck()">
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
		                                        	<th><input type="checkbox" name="checkAll" id="checkAll"></th>
		                                            <th>운동명</th>
		                                            <th>운동정의</th>
		                                            <th>운동방법</th>
													<th>운동부위</th>
		                                            <th>주의할점</th>
		                                        </tr>
	                                        </thead>
	                                        <tbody>
		                                        <c:if test="${cnt > 0}">
		                                       	 	<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}">
													<c:forEach var="dto" items="${dtos}">
														<tr >
															<td class="center">
															<input type="checkbox" name="checkOne" value="${dto.exerciseName}"></td>
															<td onclick="window.location='exerciseModify?exerciseName=${dto.exerciseName}&pageNum=${pageNum}&number=${number+1}'">${dto.exerciseName}</td>
															<td onclick="window.location='exerciseModify?exerciseName=${dto.exerciseName}&pageNum=${pageNum}&number=${number+1}'">${dto.exerciseDefine}</td>
															<td onclick="window.location='exerciseModify?exerciseName=${dto.exerciseName}&pageNum=${pageNum}&number=${number+1}'">${dto.exerciseMethod}</td>
															<td onclick="window.location='exerciseModify?exerciseName=${dto.exerciseName}&pageNum=${pageNum}&number=${number+1}'">${dto.exercisePart}</td>
															<td onclick="window.location='exerciseModify?exerciseName=${dto.exerciseName}&pageNum=${pageNum}&number=${number+1}'">${dto.exerciseCaution}</td>
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
																<a href="exerciseList">[맨앞]</a>
																<a href="exerciseList?pageNum=${startPage - pageBlock}">[이전]</a>
															</c:if>
										
															<c:forEach var="i" begin="${startPage}" end="${endPage}">
																<c:if test="${i == currentPage}">
																	<span><b>[${i}]</b></span>
																</c:if>
																<c:if test="${i != currentPage}">
																	<a href="exerciseList?pageNum=${i}">[${i}]</a>
																</c:if>
															</c:forEach>
															
															<!-- 맨끝[▶▶] / 다음▶] -->
															<c:if test="${pageCount > endPage}">
																<a href="exerciseList?pageNum=${startPage + pageBlock}">[다음]</a>
																<a href="exerciseList?pageNum=${pageCount}">[맨뒤]</a>
															</c:if>
														</c:if>
														
														<c:if test="${sc != null}">
															<c:if test="${startPage > pageBlock}">
																<a href="exerciseSearchList?sc=${sc}&search=${search}">[맨앞]</a>
																<a href="exerciseSearchList?pageNum=${startPage - pageBlock}&sc=${sc}&search=${search}">[이전]</a>
															</c:if>
										
															<c:forEach var="i" begin="${startPage}" end="${endPage}">
																<c:if test="${i == currentPage}">
																	<span><b>[${i}]</b></span>
																</c:if>
																<c:if test="${i != currentPage}">
																	<a href="exerciseSearchList?pageNum=${i}&sc=${sc}&search=${search}">[${i}]</a>
																</c:if>
															</c:forEach>
															
															<c:if test="${pageCount > endPage}">
																<a href="exerciseSearchList?pageNum=${startPage + pageBlock}sc=${sc}&search=${search}">[다음]</a>
																<a href="exerciseSearchList?pageNum=${pageCount}sc=${sc}&search=${search}">[맨뒤]</a>
															</c:if>
														</c:if>
													</c:if>
												</th>
											</tr>
										</table>

										<table align="center">
											<form action="exerciseSearchList" class="search_box" method="post">
												<tr>
													<td>
														<select class="input" name="sc">
															<option value="0">운동명</option>
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