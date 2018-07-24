<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/setting.jsp" %>
<html>
<body>
		
	<c:if test="${insertCnt==0}">
	
	<script type="text/javascript">
		alert("실패~");/* errorAlert(insertError); */
		
	</script>
	
	</c:if>
	<c:if test="${insertCnt!=0}">	
		<script type="text/javascript">
		alert("마이 병원이 등록되었습니다");
		window.location="myDoctor"		
		</script>
	
	</c:if>
</body>
</html>