<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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

<%@ include file="../common/line.jsp"%>

<section style="padding-top: 100px;
    padding-bottom: 80px;">
<div class="container">
	<div class="well" >
			<div class="row" style="margin-top:20px">
					    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
			
		<form action="boardInfo">


	<input type="hidden" name="kind" value="1">
	<input type="hidden" name="num" value="${num}">
	<input type="hidden" name="number" value="${number}">
	<input type="hidden" name="pageNum" value="${pageNum}">
	
	<fieldset >
		<h3>비밀번호 확인</h3>
		<table   class="responstable"id="board" >
			<tr>
				<th style="text-align: center;">비밀번호</th>	
				
			</tr>
			<tr>	
				<td>
				<input name="boardpwd" type="password" required>
				</td>		
			</tr>
			
					
		</table>
				<center>
				 <input type="submit" class="btn btn-dark-blue" value="확인">
				 <input type="button" class="btn btn-dark-blue" value="취소" onclick="window.history.back();">
				</center>
	
		</fieldset>
	
		</form>
		</div>
		</div>
		</div>
		</div>	
	</section>
  
 <footer>
   <%@ include file="../common/footer.jsp" %>
</footer>
	
</body>
</html>