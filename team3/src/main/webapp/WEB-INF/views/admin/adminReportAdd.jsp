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
					<form action="adminReportAddPro">
						<input type="hidden" name="kind" value="3">
						<input type="hidden" name="ref" value="${ref}">
						<input type="hidden" name="num" value="${num}">
						<input type="hidden" name="number" value="${number}">
						<input type="hidden" name="pageNum" value="${pageNum}">
						<input type="hidden" name="boardpwd" value="admin">
						<fieldset style="width: 800px; margin: 0 auto;">

							<legend>글 작성</legend>

							<table class="table table-striped table-hover" border="1" align="center" id="board">
								<tr>
									<th>작성자</th>
									<td>${sessionScope.id}</td>
								</tr>
								<tr>
									<th>제목</th>
									<td><input class="input" type="text" name="boardtitle" maxlength="50" style=""></td>
								</tr>

								<tr>
									<th>내용</th>
									<td><textarea class="input" name="boardcontent" style="" rows="10" cols="40"></textarea></td>
								</tr>


								<tr>
									<th colspan="2">
										<input class="inputButton" type="submit" value="작성">
										<input class="inputButton" type="reset" value="취소">
										<input class="inputButton" type="button" value="목록"
											onclick="window.location='adminReportList?pageNum=${pageNum}'">
									</th>
								</tr>

							</table>

						</fieldset>
					</form>
				</div>
				<!-- /.col-lg-4 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->

	</div>
</body>
</html>