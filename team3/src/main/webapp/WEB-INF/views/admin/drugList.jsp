<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin_setting.jsp"%>
<html>
<head>
<title>관리자 페이지 - 정보관리</title>
</head>
<body>
	<div id="wrapper">

		<jsp:include page="./admin_nav.jsp"></jsp:include>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">정보관리 - 약정보목록</h1>
					<!-- 페이지 제목 -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-8">
					<!-- /.panel -->
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-4">
									<div class="table-responsive">
										<table class="responstable">
											<thead>
												<tr>
													<th>약번호</th>
													<th>약이름</th>
													<th>제조업체</th>
													<th>약효분류코드</th>
													<th>약효분류</th>
													<th>전문/일반</th>
													<th>허가일자</th>
													<th>등록일자</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${cnt > 0}">
													<c:forEach var="dto" items="${dtos}">
														<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}">
														<tr>
															<td onclick="window.location='drugModify?drugCode=${dto.drugCode}&pageNum=${pageNum}&number=${number+1}'">${dto.drugCode}</td>
															<td onclick="window.location='drugModify?drugCode=${dto.drugCode}&pageNum=${pageNum}&number=${number+1}'">${dto.drugName}</td>
															<td onclick="window.location='drugModify?drugCode=${dto.drugCode}&pageNum=${pageNum}&number=${number+1}'">${dto.drugCompany}</td>
															<td onclick="window.location='drugModify?drugCode=${dto.drugCode}&pageNum=${pageNum}&number=${number+1}'">${dto.drugGroupCode}</td>
															<td onclick="window.location='drugModify?drugCode=${dto.drugCode}&pageNum=${pageNum}&number=${number+1}'">${dto.drugGroup}</td>
															<td onclick="window.location='drugModify?drugCode=${dto.drugCode}&pageNum=${pageNum}&number=${number+1}'">${dto.pro_Usual}</td>
															<td onclick="window.location='drugModify?drugCode=${dto.drugCode}&pageNum=${pageNum}&number=${number+1}'">${dto.admitDate}</td>
															<td onclick="window.location='drugModify?drugCode=${dto.drugCode}&pageNum=${pageNum}&number=${number+1}'">${dto.registDate}</td>
														</tr>
													</c:forEach>
												</c:if>
											</tbody>
										</table>

										<br>

										<div class="pagination clearfix" style="display: table; margin: 0 auto;">
											<c:if test="${cnt>0}">
												<!-- 이전블록 -->
												<c:if test="${startPage > pageBlock }">
													<a href="drugList"><<</a>
													<a href="drugList?pageNum=${startPage-pageBlock}"><</a>
												</c:if>
												<!-- 페이지 블록 -->
												<c:forEach var="i" begin="${startPage }" end="${endPage }">
													<c:if test="${i == currentPage }">
														<strong>${i }</strong>
													</c:if>
													<c:if test="${i != currentPage }">
														<a href="drugList?pageNum=${i}">${i }</a>
													</c:if>
												</c:forEach>
												<!-- 다음블록 -->
												<c:if test="${pageCount > endPage }">
													<a href="drugList?pageNum=${startPage+pageBlock}">></a>
													<a href="drugList?pageNum=${pageCount}">>></a>
												</c:if>
											</c:if>
										</div>
										<br>

										<form action="drugSearchList" class="search_box" method="post"
											name="searchForm" onsubmit="return searchChk()">
											<table align="center">
												<tr>
													<td>
														<select class="input" name="sc">
															<option value="0">약 번호</option>
															<option value="1">약 이름</option>
															<option value="2">제조업체</option>
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