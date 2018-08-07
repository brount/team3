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
				<div class="col-lg-12">
					<h1 class="page-header">신고게시판</h1>
					<!-- 페이지 제목 -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-8">
					<div class="mail-box">
						<aside class="lg-side">
							<div class="inbox-head">
								<h3>고객센터</h3>
							</div>
							<div class="mail-option">
								<table class="table table-inbox table-hover">
									<tbody>
										<tr>
											<th style="width: 150px">글번호</th>
											<td style="width: 150px">${number}</td>
											
											<th style="width: 150px">작성일</th>
											<td style="width: 150px"><fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.boarddate}" /></td>
										</tr>
										<tr>
											<th>작성자</th>
											<td colspan=3>${dto.boardwriter}</td>
										</tr>
										<tr>
											<th>글제목</th>
											<td colspan=3>${dto.boardtitle}</td>
										</tr>
										<tr>
											<th>글내용</th>
											<td colspan=3>${dto.boardcontent}</td>
										</tr>
									</tbody>
								</table>
								<table>
									<tr>
										<th colspan=4>
										<c:if test="${dto.kind == 3}">
										<input class="inputButton" type="button" value="글수정"
											onclick="window.location='adminReportModifyView?num=${dto.boardno}&pageNum=${pageNum}&kind=3'">
										<input class="inputButton" type="button" value="글삭제"
											onclick="window.location='adminReportDeletePro?num=${dto.boardno}&pageNum=${pageNum}&kind=3'">
										</c:if>
										<c:if test="${dto.kind == 4}">
										<input class="inputButton" type="button" value="글삭제"
											onclick="window.location='adminReportDeletePro?num=${dto.boardno}&pageNum=${pageNum}&kind=4'">
										</c:if>
										<input class="inputButton" type="button" value="목록보기"
											onclick="window.location='adminReportList?pageNum=${pageNum}'">
										</th>
									</tr>
								</table>
							</div>
						</aside>
					</div>
				</div>
				<!-- /.col-lg-4 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->

	</div>
</body>
</html>