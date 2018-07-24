<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/setting.jsp" %>
<html>
<body>
		<h2> 회원가입 - 처리페이지</h2>
	<c:if test="${insertCnt==0}">
	
	<script type="text/javascript">
		alert("실패~");/* errorAlert(insertError); */
		
	</script>
	
	</c:if>
	<c:if test="${insertCnt!=0}">	
		<script type="text/javascript">
		alert("가입을 축하드립니다");
		window.location="memberLogin"		
		</script>
	
	</c:if>
</body>
</html>