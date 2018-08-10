<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin_setting.jsp" %>
<html>
<body>
	<c:if test="${updateCnt == 0}">
		<script type="text/javascript">
			alert("수정실패");
		</script>
	</c:if>

	<c:if test="${updateCnt != 0}">
		<script type="text/javascript">
			window.location="hospitalList";
		</script>
	</c:if>
</body>
</html>