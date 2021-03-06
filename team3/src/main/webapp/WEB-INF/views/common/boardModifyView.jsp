<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메디 클립</title>
<link href="/medical/resources/djcss/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<header>
		<%@ include file="../common/header.jsp"%>
	</header>

	<%@ include file="../common/line.jsp"%>

	<section>
		<c:if test="${pwdCnt == 0}">
			<script type="text/javascript">
				alert("입력한 정보를 다시 확인하세요~!");
				window.history.back();
			</script>
		</c:if>

		<c:if test="${pwdCnt != 0}">
			<form action="boardModifyPro">
				<input type="hidden" name="kind" value="1">
				<input type="hidden" name="num" value="${num}">
				<input type="hidden" name="number" value="${number}">
				<input type="hidden" name="pageNum" value="${pageNum}">
				<fieldset style="width: 800px; margin: 0 auto">
					<legend>글 수정</legend>
					<table class="table table-striped table-hover" border="1" align="center" id="board">
						<tr>
							<th style="text-align: center; width: 20%">작성자</th>
							<td>${dto.boardwriter}</td>
						</tr>

						<tr>
							<th style="text-align: center;">비밀번호</th>
							<td>
								<input class="input" type="password" name="boardpwd"
									maxlength="10" required>
							</td>
						</tr>

						<tr>
							<th style="text-align: center;">제목</th>
							<td>
								<input class="input" type="text" name="boardtitle"
									maxlength="50" style="width: 100%" value="${dto.boardtitle}" required>
							</td>
						</tr>

						<tr>
							<th style="text-align: center;">내용</th>
							<td>
								<textarea class="input" name="boardcontent"
									style="resize: none; width: 100%" rows="10" required>${dto.boardcontent}</textarea>
							</td>
						</tr>

						<tr>
							<th colspan="2" style="text-align: center;">
								<input class="btn btn-dark-blue" type="submit" value="작성">
								<input class="btn btn-dark-blue" type="reset" value="취소">
								<input class="btn btn-dark-blue" type="button" value="목록"
									onclick="window.location='boardList?pageNum=${pageNum}&category=${category}'">
							</th>
						</tr>
					</table>
				</fieldset>
			</form>
		</c:if>
	</section>

	<footer>
		<%@ include file="../common/footer.jsp"%>
	</footer>

</body>
</html>