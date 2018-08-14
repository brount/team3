<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../admin_setting.jsp" %>
<html>
<head>
<title> 관리자 페이지 - 일반회원관리</title>
</head>
<body>
	<div id="wrapper">
	    <jsp:include page="./admin_nav.jsp"></jsp:include>
	
	    <div id="page-wrapper">
	        <div class="row">
	            <div class="col-lg-12">	
	                <h1 class="page-header">회원관리 - 탈퇴회원목록</h1>		<!-- 페이지 제목 -->
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
	                            	<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}">
	                            	<select class="btn btn-default btn-xs dropdown-toggle" onchange="location.href=this.value">
						 				<option value="membersecessionList">탈퇴회원목록</option>
						 				<option value="memberList">일반회원목록</option>
						 				<option value="membersanctionList">제제회원목록</option>
						 			</select>
                                    <button type="button" onclick="return memberdeleteCheck();">
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
													<th>회원번호</th>
													<th>회원ID</th>
													<th>회원명</th>
													<th>회원주소</th>
													<th>회원연령</th>
													<th>회원연락처</th>
													<th>제재단계</th>
													<th>가입일</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${cnt > 0}">
												
													<c:forEach var="dto" items="${dtos}">
														<tr>
															<td class="center">
															<input type="checkbox" name="checkOne" value="${dto.guestNo}"></td>
															<td>${dto.guestNo}</td>
															<td>${dto.guestid}</td>
															<td>${dto.guestname}</td>
															<td>${dto.address2}</td>
															<td>${dto.guestage}</td>
															<td>${dto.guesttel}</td>
															<td>${dto.sanctions}</td>
															<td>${dto.guestdate}</td>
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
																<a href="membersecessionList">[맨앞]</a>
																<a href="membersecessionList?pageNum=${startPage - pageBlock}">[이전]</a>
															</c:if>
										
															<c:forEach var="i" begin="${startPage}" end="${endPage}">
																<c:if test="${i == currentPage}">
																	<span><b>[${i}]</b></span>
																</c:if>
																<c:if test="${i != currentPage}">
																	<a href="membersecessionList?pageNum=${i}">[${i}]</a>
																</c:if>
															</c:forEach>
															
															<!-- 맨끝[▶▶] / 다음▶] -->
															<c:if test="${pageCount > endPage}">
																<a href="membersecessionList?pageNum=${startPage + pageBlock}">[다음]</a>
																<a href="membersecessionList?pageNum=${pageCount}">[맨뒤]</a>
															</c:if>
														</c:if>
														
														
														
														<c:if test="${sc != null}">
															<c:if test="${startPage > pageBlock}">
																<a href="membersecessionSearchList?sc=${sc}&search=${search}">[맨앞]</a>
																<a href="membersecessionSearchList?pageNum=${startPage - pageBlock}&sc=${sc}&search=${search}">[이전]</a>
															</c:if>
										
															<c:forEach var="i" begin="${startPage}" end="${endPage}">
																<c:if test="${i == currentPage}">
																	<span><b>[${i}]</b></span>
																</c:if>
																<c:if test="${i != currentPage}">
																	<a href="memberSecessionSearchList?pageNum=${i}&sc=${sc}&search=${search}">[${i}]</a>
																</c:if>
															</c:forEach>
															
															<c:if test="${pageCount > endPage}">
																<a href="membersecessionSearchList?pageNum=${startPage + pageBlock}sc=${sc}&search=${search}">[다음]</a>
																<a href="membersecessionSearchList?pageNum=${pageCount}sc=${sc}&search=${search}">[맨뒤]</a>
															</c:if>
														</c:if>
													</c:if>
												</th>
											</tr>
										</table>

										<form action="membersecessionSearchList" class="search_box" method="post" name="searchForm" onsubmit="return searchChk()">
											<table align="center">
												<tr>
													<td>
														<select class="input" name="sc">
															<option value=0>회원번호</option>
															<option value=1>회원명</option>
															<option value=2>회원ID</option>
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