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
</head>
<body>

<header>
   <%@ include file="../common/header.jsp" %>
</header>

<section>
<form action="boardDeletePro">
	<input type="hidden" name="kind" value="1">
	<input type="hidden" name="num" value="${num }">
	<input type="hidden" name="number" value="${number }">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<fieldset style="width: 800px; margin:0 auto">
		<legend>비밀번호 확인</legend>
		<table   class="table table-striped table-hover" border="1" align="center" id="board" >
			<tr>
				<th>비밀번호</th>	
				<td>
				<input name="boardpwd" type="password">
				</td>		
			</tr>
			<tr>
				<td colspan="2">
				 <input class="btn btn-dark-blue" type="submit" value="확인">
				 <input class="btn btn-dark-blue" type="button" value="취소" onclick="window.history.back();">
				</td>
			</tr>		
		</table>
	
		</fieldset>
		</form>
	</section>
  
 <footer>
   <%@ include file="../common/footer.jsp" %>
</footer>
	
</body>
</html>