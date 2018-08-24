<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin_setting.jsp"%>
<html>
<head>
<title>관리자 페이지 - 정보관리</title>
<style>
table tbody td {
	overflow: hidden;
	text-overflow: ellipsis;
	-webkit-line-clamp: 1; /* 라인수 */
	-webkit-box-orient: vertical;
	word-wrap: break-word;
	line-height: 1.2em;
	height: 3.6em;
	/* line-height 가 1.2em 이고 3라인을 자르기 때문에 height는 1.2em * 3 = 3.6em */
	width: 30px;
	height: 50;
	maxlength: 30px;
}
</style>
</head>
<body>
	<div id="wrapper">

		<jsp:include page="./admin_nav.jsp"></jsp:include>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">정보관리 - 질병정보목록</h1>
					<!-- 페이지 제목 -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<div class="col-lg-8">
				<!-- /.panel -->
				<div class="panel panel-default">
					<div class="panel-heading"
						style="background-color: #5b92cb78 !important">
						<div class="pull-right">
							<div class="btn-group">
							</div>
						</div>
					</div>
					<br>
					<!-- /.panel-heading -->
					<div style="text-align: -webkit-right; margin-right: 10px;">
						<button type="button" class="btn btn-dark-blue"
							onclick="window.location='diseaseAdd?pageNum=${pageNum}'">
							추가
						</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-dark-blue"
							onclick="diseasedeleteCheck()">삭제</button>
					</div>

					<div class="panel-body">
						<div class="col-lg-4">
							<div class="table-responsive">
								<table class="responstable">
									<thead>
										<tr>
											<th><input type="checkbox" name="checkAll" id="checkAll"></th>
											<th style="width: 8%;">질병코드</th>
											<th style="width: 10%;">병명</th>
											<th>정의</th>
											<!-- <th>증상</th>
											<th>진단</th>
											<th>치료</th>
											<th>경과/합병증</th>
											<th>예방</th> -->
										</tr>
									</thead>
									<tbody>
										<c:if test="${cnt > 0}">
											<c:forEach var="dto" items="${dtos}">
												<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}">
												<tr>
													<td class="center"><input type="checkbox" name="checkOne" value="${dto.diseaseCode}"></td>
													<td onclick="window.location='diseaseModify?diseaseCode=${dto.diseaseCode}&pageNum=${pageNum}&number=${number+1}'">${dto.diseaseCode}</td>
													<td onclick="window.location='diseaseModify?diseaseCode=${dto.diseaseCode}&pageNum=${pageNum}&number=${number+1}'">${dto.diseaseName}</td>
													<td onclick="window.location='diseaseModify?diseaseCode=${dto.diseaseCode}&pageNum=${pageNum}&number=${number+1}'">${dto.diseaseDefine}</td>
													<%-- <td onclick="window.location='diseaseModify?diseaseCode=${dto.diseaseCode}&pageNum=${pageNum}&number=${number+1}'">${dto.diseaseSymptom}</td>
													<td onclick="window.location='diseaseModify?diseaseCode=${dto.diseaseCode}&pageNum=${pageNum}&number=${number+1}'">${dto.diseaseDiagnosis}</td>
													<td onclick="window.location='diseaseModify?diseaseCode=${dto.diseaseCode}&pageNum=${pageNum}&number=${number+1}'">${dto.diseaseCure}</td>
													<td onclick="window.location='diseaseModify?diseaseCode=${dto.diseaseCode}&pageNum=${pageNum}&number=${number+1}'">${dto.complications}</td>
													<td onclick="window.location='diseaseModify?diseaseCode=${dto.diseaseCode}&pageNum=${pageNum}&number=${number+1}'">${dto.prevention}</td>
												 --%>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>

								<div class="pagination clearfix" style="display: table; margin: 0 auto;">
									<c:if test="${cnt>0}">
										<!-- 이전블록 -->
										<c:if test="${startPage > pageBlock }">
											<a href="diseaseList"><<</a>
											<a href="diseaseList?pageNum=${startPage -pageBlock}"><</a>
										</c:if>
										<!-- 페이지 블록 -->
										<c:forEach var="i" begin="${startPage }" end="${endPage }">
											<c:if test="${i == currentPage }">
												<strong>${i }</strong>
											</c:if>
											<c:if test="${i != currentPage }">
												<a href="diseaseList?pageNum=${i}">${i }</a>
											</c:if>
										</c:forEach>
										<!-- 다음블록 -->
										<c:if test="${pageCount > endPage }">
											<a href="diseaseList?pageNum=${startPage +pageBlock}">></a>
											<a href="diseaseList?pageNum=${pageCount}">>></a>
										</c:if>
									</c:if>
								</div>

								<form action="diseaseSearchList" class="search_box" method="post" name="searchForm" onsubmit="return searchChk()">
									<table align="center">
										<tr>
											<td>
												<select class="input" name="sc">
													<option value="0">질병코드</option>
													<option value="1">병명</option>
													<option value="2">증상</option>
													<option value="3">합병증</option>
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
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-4 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /#wrapper -->
</body>
</html>