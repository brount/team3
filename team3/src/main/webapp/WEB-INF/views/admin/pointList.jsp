<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../admin_setting.jsp" %>
<html>
<head>
<title> 관리자 페이지 - 결산</title>
</head>
<body>
	<div id="wrapper">
	
		<jsp:include page="./admin_nav.jsp"></jsp:include>
	
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">	
					<h1 class="page-header">결산 - 포인트목록</h1>		<!-- 페이지 제목 -->
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
									<select class="input" name="btn btn-default btn-xs dropdown-toggle onchange=">
										<option value="#">주간결산</option>
										<option value="#">월간결산</option>
										<option value="#">연간결산</option>
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
													<th>누적포인트</th>
												</tr>
											</thead>
											
											<tbody>
												<tr>
													<td>1,000,000pt</td>
												</tr>
											</tbody>
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
			
			<div class="row">
				<div class="col-lg-8">
				<!-- /.panel -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="pull-right">
								<div class="btn-group">
									<select class="input" name="status">
										<option value="0">전체</option>
										<option value="1">획득</option>
										<option value="2">사용</option>
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
	                                            <th>회원번호</th>			
	                                            <th>회원ID</th>
	                                            <th>일자</th>
	                                            <th>사용/획득</th>
	                                            <th>누적포인트</th>
	                                        </tr>
	                                        </thead>
	                                        <tbody>
	                                        
	                                        <c:if test="${cnt > 0}">
	                                        	<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}">
	                                        	<c:set value="0" var="a"></c:set>
												<c:forEach var="dto" items="${dtos}">
													<tr>
													    <td>${dtos2[a].doctorno}</td>
														<td>${dtos2[a].doctorid}</td>
														<td>${dto.cum_date}</td>
														<td>
															<c:if test="${dto.status == 1}">
																+
															</c:if>
															<c:if test="${dto.status == 2}">
																-
															</c:if>
															${dto.point}
														</td>
														<td>${cum_point}</td>
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
														
														<c:if test="${sc != null}">
															<c:if test="${startPage > pageBlock}">
																<a href="doctorSearchList?sc=${sc}&search=${search}">[맨앞]</a>
																<a href="doctorSearchList?pageNum=${startPage - pageBlock}&sc=${sc}&search=${search}">[이전]</a>
															</c:if>
										
															<c:forEach var="i" begin="${startPage}" end="${endPage}">
																<c:if test="${i == currentPage}">
																	<span><b>[${i}]</b></span>
																</c:if>
																<c:if test="${i != currentPage}">
																	<a href="doctorSearchList?pageNum=${i}&sc=${sc}&search=${search}">[${i}]</a>
																</c:if>
															</c:forEach>
															
															<c:if test="${pageCount > endPage}">
																<a href="doctorSearchList?pageNum=${startPage + pageBlock}sc=${sc}&search=${search}">[다음]</a>
																<a href="doctorSearchList?pageNum=${pageCount}sc=${sc}&search=${search}">[맨뒤]</a>
															</c:if>
														</c:if>
													</c:if>
												</th>
											</tr>
										</table>
										
	                                    <table align="center">
	                                    	<form action="doctorSearchList" class="search_box" method="get">
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