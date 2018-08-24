<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin_setting.jsp"%>
<html>
<head>
<title>관리자 페이지 - 광고관리</title>
</head>
<body>
	<div id="wrapper">

		<jsp:include page="./admin_nav.jsp"></jsp:include>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">광고관리</h1>
					<!-- 페이지 제목 -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-8">
					<!-- /.panel -->
					<div class="panel panel-default">
						<div class="panel-heading"
							style="background-color: #5b92cb78 !important">
							<div class="pull-right">
								<div class="btn-group">
									<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}">
								</div>
							</div>
						</div>

						<br>
						<div style="text-align: -webkit-right; margin-right: 10px;">

							<button type="button" class="btn btn-dark-blue" style="margin-left: 10px"
								onclick="window.location='adminEventAdd?pageNum=${pageNum}'">
								추가
							</button>
							<button type="button" class="btn btn-dark-blue"
								style="margin-left: 10px" onclick="eventDelCheck();">
								삭제
							</button>

						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-4">
									<div class="table-responsive">
										<table class="responstable">
											<thead>
												<tr>
													<th>
														<input type="checkbox" name="checkAll" id="checkAll">
													</th>
													<th>광고번호</th>
													<th>의사회원번호</th>
													<th>광고명</th>
													<th>신청일</th>
													<th>등록기간</th>
												</tr>
											</thead>
											<tbody>

												<c:if test="${cnt > 0}">

													<c:forEach var="dto" items="${dtos}">
														<tr>
															<td>
																<input type="checkbox" name="checkOne"
																	value="${dto.advertisementNo}">
															</td>
															<td onclick="window.location='eventModify?&advertisementNo=${dto.advertisementNo}&pageNum=${pageNum}&number=${number+1}'">${dto.advertisementNo}</td>
															<td onclick="window.location='eventModify?&advertisementNo=${dto.advertisementNo}&pageNum=${pageNum}&number=${number+1}'">
																<c:if test="${dto.doctorno!=0}">
																${dto.doctorno}
																</c:if> 
																<c:if test="${dto.doctorno==0}">
																admin
																</c:if>
															</td>
															<td onclick="window.location='eventModify?&advertisementNo=${dto.advertisementNo}&pageNum=${pageNum}&number=${number+1}'">${dto.advertisementTitle}</td>
															<td onclick="window.location='eventModify?&advertisementNo=${dto.advertisementNo}&pageNum=${pageNum}&number=${number+1}'">${dto.advertisementRegDate}</td>
															<td onclick="window.location='eventModify?&advertisementNo=${dto.advertisementNo}&pageNum=${pageNum}&number=${number+1}'">${dto.advertisementStart}
																~ ${dto.advertisementEnd}
															</td>
														</tr>
													</c:forEach>
												</c:if>
											</tbody>
										</table>

										<div class="pagination clearfix" style="display: table; margin: 0 auto;">
											<c:if test="${cnt>0}">
												<!-- 이전블록 -->
												<c:if test="${startPage > pageBlock }">
													<a href="eventRequestList"><<</a>
													<a href="eventRequestList?pageNum=${startPag - pageBlock}"><</a>
												</c:if>
												<!-- 페이지 블록 -->
												<c:forEach var="i" begin="${startPage }" end="${endPage }">
													<c:if test="${i == currentPage }">
														<strong>${i }</strong>
													</c:if>
													<c:if test="${i != currentPage }">
														<a href="eventRequestList?pageNum=${i}">${i }</a>
													</c:if>
												</c:forEach>
												<!-- 다음블록 -->
												<c:if test="${pageCnt > endPage }">
													<a href="eventRequestList?pageNum=${startPage + pageBlock}">></a>
													<a href="eventRequestList?pageNum=${pageCount}">>></a>
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
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->
</body>
</html>