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
<%@ include file="../common/line.jsp"%>

<section>
	<fieldset style="width: 800px; margin:0 auto">
		<legend>글 수정</legend>
		<table   class="table table-striped table-hover" border="1" align="center" id="board" >
			<tr>
				<th>작성자</th>	
				<td>
					
				</td>		
			</tr>		
			
			<tr>
				<th>비밀번호</th>	
				<td>
					<input class="input" type="password" name="pwd" maxlength="10">
				</td>		
			</tr>	
			
			<tr>
				<th>제목</th>	
				<td>
					<input class="input" type="text" name="subject" maxlength="50" style="width=270px">
				</td>		
			</tr>	
			
			<tr>
				<th>내용</th>	
				<td>
					<textarea  class="input" name="content" style="width=270px" rows="10" cols="40"></textarea>
				</td>		
			</tr>	
			
			
			<tr>
				<th colspan="2">
					<input  class="btn btn-dark-blue"  type="submit" value="작성">
					<input class="btn btn-dark-blue" type="reset" value="취소">
					<input  class="btn btn-dark-blue"  type="button" value="목록"
							onclick="window.location='boardList?pageNum=${pageNum }&category=${category }'">
 				</th>
			</tr>
		
		</table>
	
		</fieldset>
	</section>
  
 <footer>
   <%@ include file="../common/footer.jsp" %>
</footer>




<!-- 	<img src="resources/images/Demonstration/boardAdd.jpg">
	<input type="button" onclick="window.location='main'" value="메인페이지">
	<input type="button" onclick="window.location='boardList'" value="등록">
	<input type="button" onclick="window.location='boardList'" value="취소"> -->
	
	
	
</body>
</html>