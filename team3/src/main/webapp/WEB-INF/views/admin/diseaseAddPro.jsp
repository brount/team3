<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin_setting.jsp" %>
<html>
<body>
	<c:if test="${insertCnt == 0}">
		<script type="text/javascript">
			errorAlert("입력실패.");
		</script>
	</c:if>

	<c:if test="${insertCnt != 0}">
		<c:redirect url="diseaseList"></c:redirect>
	</c:if>
</body>
</html>