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
	<c:if test="${insertcnt == 0 }">
			<script type ="text/javascript">
			 errorAlert(insertError);
			</script>
		</c:if>
	<c:if test="${insertcnt != 0 }">
	<script type ="text/javascript">
			alert("회원가입에 성공하였습니다.");
			</script>
			
			<c:redirect url="main"/>
		</c:if>
</body>
</html>