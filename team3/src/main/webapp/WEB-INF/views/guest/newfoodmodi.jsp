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

<c:if test="${foodcnt == 0 }">
			<script type ="text/javascript">
			alert('다시 추가해주세요')
			</script>
		</c:if>
	<c:if test="${foodcnt != 0 }">
	<script type ="text/javascript">
				
		alert('음식이 저장되었습니다. 검색 가능합니다.')
		window.location="caloryAddModi";
			</script>
			
			
		</c:if>
</body>
</html>