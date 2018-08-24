<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin_setting.jsp"%>
<html>
<body>
	<c:if test="${deleteCnt == 0}">
		<script type="text/javascript">
			errorAlert("삭제할 질병을 선택하세요.");
		</script>
	</c:if>

	<c:if test="${deleteCnt != 0}">
		<script type="text/javascript">
			window.location = "diseaseList";
		</script>
	</c:if>
</body>
</html>