<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin_setting.jsp" %>
<html>
<body>
	<c:if test="${updateCnt == 0}">
		<script type="text/javascript">
			errorAlert("승인할 회원을 선택하세요.");
		</script>
	</c:if>


	<c:if test="${updateCnt != 0}">
		<script type="text/javascript">
			window.location="doctorList";
		</script>
	</c:if>
</body>
</html>