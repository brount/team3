<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${updatecnt == 0 }">
			<script type ="text/javascript">
			alert("회원탈퇴 실패");
			</script>
		</c:if>
	<c:if test="${updatecnt != 0 }">
	<script type ="text/javascript">
			alert("회원탈퇴처리 되었습니다.");
			</script>
			
			<c:redirect url="main"/>
		</c:if>
</body>
</html>