<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin_setting.jsp" %>
<html>
<body>
	<c:if test="${selectCnt == 0}">
		<script type="text/javascript">
			errorAlert("삭제할 회원을 선택하세요.");
		</script>
	</c:if>

	<c:if test="${selectCnt != 0 }">
		<c:if test="${deleteCnt != 0}">
			<c:redirect url="membersecessionList"></c:redirect>
		</c:if>
	</c:if>
</body>
</html>