<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>사이트이름</title>
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
		<form action="reportBoardAddPro">
			<input type="hidden" name="kind" value="4">
			<input type="hidden" name="ref" value="${ref}">
			<input type="hidden" name="num" value="${num}">
			<input type="hidden" name="number" value="${number}">
			<input type="hidden" name="pageNum" value="${pageNum}">
			<fieldset style="width: 800px; margin: 0 auto;">
			<div class="well">
				<legend>글 작성</legend>
				<table class="responstable" align="center" id="board">
					<tr>
						<th style="width: 20%;">작성자</th>
						<td style="text-align: left;"">${sessionScope.id}</td>
					</tr>

					<tr>
						<th >비밀번호</th>
						<td style="text-align: left;" ><input class="input" type="password" name="boardpwd" maxlength="10" required></td>
					</tr>

					<tr>
						<th style="text-align: center;">제목</th>
						<td><input class="input" type="text" name="boardtitle" maxlength="50" style="width: 100%;" required></td>
					</tr>

					<tr>
						<th style="text-align: center;">내용</th>
						<td><textarea class="input" name="boardcontent" style="resize: none; width: 100%" rows="10" required></textarea></td>
					</tr>

				</table>
						<center>
							<input class="btn btn-dark-blue" type="submit" value="작성">
							<input class="btn btn-dark-blue" type="reset" value="취소">
							<input class="btn btn-dark-blue" type="button" value="목록" onclick="window.location='reportBoardList?pageNum=${pageNum}'">
							</center>
				</div>
			</fieldset>
		</form>
	</section>

	<footer>
		<%@ include file="../common/footer.jsp"%>
	</footer>

</body>
</html>