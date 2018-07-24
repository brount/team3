<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="../common/setting.jsp" %>
</head>
<body>
	<h2> 회원정보 수정처리 페이지</h2>
	
	<c:if test="${updateCnt ==0} ">
	
	<%-- <%
		int updateCnt = (Integer)request.getAttribute("updateCnt");
	
		if(updateCnt ==0){
	%> --%>
		<script type="text/javascript">
			errorAlert(updateError);
		</script>
	<%-- <%
			
		}else{
	%> --%>
	</c:if>
	<c:if test="${updateCnt !=0}">
		<script type="text/javascript">
			alert("회원정보가 수정됨");
			window.location="main";
		</script>
	</c:if>
	<%-- <%		
		}
	%> --%>
</body>
</html>