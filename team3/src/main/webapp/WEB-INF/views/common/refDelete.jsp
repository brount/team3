<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> 사이트이름 </title>
<link href="/medical/resources/djcss/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/medical/resources/css/css/default.css" />
</head>
<body>

<section>
<form action="refDeletePro" method="get">
	<input type="hidden" name="kind" value="${kind}">
	<input type="hidden" name="num" value="${num}">
	<input type="hidden" name="number" value="${number}">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<fieldset style="width: 800px; margin:0 auto">
		<legend>비밀번호 확인</legend>
		<table class="table table-striped table-hover" border="1" align="center" id="board" style="width: 450px; margin: 0;">
			<tr>
				<th>비밀번호</th>	
				<td>
				<input name="boardpwd" type="password" required>
				</td>		
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
				 <input type="submit" class="btn btn-dark-blue" value="확인">
				 <input type="button" class="btn btn-dark-blue" value="취소" onclick="window.close();">
				</td>
			</tr>		
		</table>
	
		</fieldset>
		</form>
	</section>
  
	
</body>
</html>