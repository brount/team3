<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin_setting.jsp"%>
<html>
<head>
<title>관리자 페이지 - 일반회원관리</title>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="./admin_nav.jsp"></jsp:include>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">회원관리 - 제제회원목록</h1>
					<!-- 페이지 제목 -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-8">
					<!-- /.panel -->
					<div class="panel panel-default">
						<div class="panel-heading" style="background-color: #5b92cb78 !important">
							<div class="pull-right">
								<div class="btn-group">
									<select class="btn btn-default btn-xs dropdown-toggle" onchange="location.href=this.value">
										<option value="membersanctionList">제제회원목록</option>
										<option value="memberList">일반회원목록</option>
										<option value="membersecessionList">탈퇴회원목록</option>
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
															<td onclick="window.location='membersanctionManage?&guestNo=${dto.guestNo}&pageNum=${pageNum}&number=${number+1}'">${dto.guestNo}</td>
															<td onclick="window.location='membersanctionManage?&guestNo=${dto.guestNo}&pageNum=${pageNum}&number=${number+1}'">${dto.guestid}</td>
															<td onclick="window.location='membersanctionManage?&guestNo=${dto.guestNo}&pageNum=${pageNum}&number=${number+1}'">${dto.guestname}</td>
															<td onclick="window.location='membersanctionManage?&guestNo=${dto.guestNo}&pageNum=${pageNum}&number=${number+1}'">${dto.address2}</td>
															<td onclick="window.location='membersanctionManage?&guestNo=${dto.guestNo}&pageNum=${pageNum}&number=${number+1}'">${dto.guestage}</td>
															<td onclick="window.location='membersanctionManage?&guestNo=${dto.guestNo}&pageNum=${pageNum}&number=${number+1}'">${dto.guesttel}</td>
															<td onclick="window.location='membersanctionManage?&guestNo=${dto.guestNo}&pageNum=${pageNum}&number=${number+1}'">${dto.sanctions}</td>
															<td onclick="window.location='membersanctionManage?&guestNo=${dto.guestNo}&pageNum=${pageNum}&number=${number+1}'">${dto.guestdate}</td>
														</tr>
													</c:forEach>
												</c:if>
											</tbody>
										</table>

										<div class="pagination clearfix" style="display: table; margin: 0 auto;">
											<c:if test="${cnt > 0}">
												<c:if test="${sc == null}">
													<!-- 맨끝[◀◀] / 이전[◀] -->
													<c:if test="${startPage > pageBlock}">
														<a href="membersanctionList"><<</a>
														<a href="membersanctionList?pageNum=${startPage - pageBlock}"><</a>
													</c:if>

													<c:forEach var="i" begin="${startPage}" end="${endPage}">
														<c:if test="${i == currentPage}">
															<strong>${i}</strong>
														</c:if>
														<c:if test="${i != currentPage}">
															<a href="membersanctionList?pageNum=${i}">${i}</a>
														</c:if>
													</c:forEach>

													<!-- 맨끝[▶▶] / 다음▶] -->
													<c:if test="${pageCount > endPage}">
														<a href="membersanctionList?pageNum=${startPage + pageBlock}">></a>
														<a href="membersanctionList?pageNum=${pageCount}">>></a>
													</c:if>
												</c:if>

												<c:if test="${sc != null}">
													<c:if test="${startPage > pageBlock}">
														<a href="membersanctionSearchList?sc=${sc}&search=${search}"><<</a>
														<a href="membersanctionSearchList?pageNum=${startPage - pageBlock}&sc=${sc}&search=${search}"><</a>
													</c:if>

													<c:forEach var="i" begin="${startPage}" end="${endPage}">
														<c:if test="${i == currentPage}">
															<strong>${i}</strong>
														</c:if>
														<c:if test="${i != currentPage}">
															<a href="membersanctionSearchList?pageNum=${i}&sc=${sc}&search=${search}">${i}</a>
														</c:if>
													</c:forEach>

													<c:if test="${pageCount > endPage}">
														<a href="membersanctionSearchList?pageNum=${startPage + pageBlock}sc=${sc}&search=${search}">></a>
														<a href="membersanctionSearchList?pageNum=${pageCount}sc=${sc}&search=${search}">>></a>
													</c:if>
												</c:if>
											</c:if>
										</div>

										<br>

										<form action="membersanctionSearchList" class="search_box"
											method="post" name="searchForm" onsubmit="return searchChk()">
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