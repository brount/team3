<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="/medical/resources/common/css/memberLogin.css" rel="stylesheet">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="/medical/resources/common/js/memberLogin.js"></script>
<title>사이트 이름</title>
<body>
	<c:if test="${loginCnt!=0}">
		<script type="text/javascript">
			alert("로그인 성공");
			window.close();
			opener.location.href = "memberList";
		</script>
	</c:if>
	<c:if test="${loginCnt == -1}">
		<script type="text/javascript">
			alert("비밀번호가 틀렸습니다.");
			window.history.back();
		</script>
	</c:if>
	<c:if test="${loginCnt == 0}">
		<script type="text/javascript">
			alert("아이디가 틀렸습니다");
			window.history.back();
		</script>
	</c:if>
</body>
</html>