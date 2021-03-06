<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin_setting.jsp"%>
<html>
<head>
<title>신고게시판</title>
</head>
<body>
	<div id="wrapper">

		<jsp:include page="./admin_nav.jsp"></jsp:include>

		<div id="page-wrapper">
			<div class="row">
				<!-- /.col-lg-12 -->
				<div class="col-lg-12">
					<!-- 페이지 제목 -->
					<h1 class="page-header">신고목록</h1>
				</div>
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-8">
					<!-- /.panel -->
				</div>
				<div class="panel panel-default">
					<div class="panel-heading"
						style="background-color: #5b92cb78 !important">

						<div class="">

							<div class="pull-right"></div>
							<br>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-4">
										<div class="table-responsive">

											<br>
											<div style="text-align: -webkit-right;">
												<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}">
												<button type="button" class="btn btn-dark-blue"
													onclick="window.location='adminReportAdd?kind=3'">
													추가
												</button>
												<button type="button" class="btn btn-dark-blue" style="margin-left: 10px;"
													onclick="adminReportDeleteChek()">삭제</button>
											</div>
											<table class="responstable">
												<thead>
													<tr>
														<th>
															<input type="checkbox" name="checkAll" id="checkAll">
														</th>
														<th>글번호</th>
														<th>분류</th>
														<th>제목</th>
														<th>작성자</th>
														<th>등록일</th>
													</tr>
												</thead>
												<tbody>

													<c:if test="${cnt > 0}">
														<c:forEach var="dto" items="${dtos}">
															<tr>
																<td style="width: 5%">
																	<input type="checkbox" name="checkOne" value="${dto.boardno}">
																</td>
																<td onclick="window.location='adminReportInfo?num=${dto.boardno}&pageNum=${pageNum}&number=${number+1}'">
																	${number} <c:set var="number" value="${number-1}"></c:set>
																</td>
																<td onclick="window.location='adminReportInfo?num=${dto.boardno}&pageNum=${pageNum}&number=${number+1}'">
																	<c:if test="${dto.kind == 3}"> 공지 </c:if>
																	<c:if test="${dto.kind == 4}"> 신고 </c:if>
																</td>
																<td onclick="window.location='adminReportInfo?num=${dto.boardno}&pageNum=${pageNum}&number=${number+1}'">${dto.boardtitle}</td>
																<td onclick="window.location='adminReportInfo?num=${dto.boardno}&pageNum=${pageNum}&number=${number+1}'">${dto.boardwriter}</td>
																<td onclick="window.location='adminReportInfo?num=${dto.boardno}&pageNum=${pageNum}&number=${number+1}'">${dto.boarddate}</td>
															</tr>
														</c:forEach>
													</c:if>
												</tbody>
											</table>

											<div class="pagination clearfix"
												style="display: table; margin: 0 auto;">
												<c:if test="${cnt>0}">
													<!-- 이전블록 -->
													<c:if test="${startPage > pageBlock }">
														<a href="adminReportList"><<</a>
														<a href="adminReportList?pageNum=${startPage-pageBlock}"><</a>
													</c:if>
													<!-- 페이지 블록 -->
													<c:forEach var="i" begin="${startPage }" end="${endPage }">
														<c:if test="${i == currentPage }">
															<strong>${i }</strong>
														</c:if>
														<c:if test="${i != currentPage }">
															<a href="adminReportList?pageNum=${i}">${i }</a>
														</c:if>
													</c:forEach>
													<!-- 다음블록 -->
													<c:if test="${pageCnt > endPage }">
														<a href="adminReportList?pageNum=${startPage+pageBlock}">></a>
														<a href="adminReportList?pageNum=${pageCount}">>></a>
													</c:if>
												</c:if>
											</div>
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
			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->
</body>
</html>