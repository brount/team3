<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${modifyCnt == 0}">
		<script type="text/javascript">
			alert("입력한 정보를 다시 확인하세요~!");
			window.history.back();
		</script>
	</c:if>

	<c:if test="${modifyCnt != 0}">
		<script type="text/javascript">
			alert("수정 성공하였습니다~!");

			window.location = "adminReportList";
		</script>
	</c:if>
</body>
</html>