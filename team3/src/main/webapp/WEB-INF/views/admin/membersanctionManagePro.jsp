<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin_setting.jsp" %>

<html>
<body>

	<c:if test="${sanctions == 0}">
		<script type="text/javascript">
			window.location = "memberList?pageNum=" + ${pageNum};
		</script>
	</c:if>
	
	<c:if test="${sanctions != 0}">
		<script type="text/javascript">
			window.location = "membersanctionList?pageNum=" + ${pageNum};
		</script>
	</c:if>
	
</body>
</html>