<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../common/setting.jsp" %>
<html>
<body>
				
	<!-- 비밀번호가 다른 경우 : '삭제 에러' 메세지 -->	
	<c:if test = "${selectCnt==0 }">
	<script type="text/javascript">
		errorAlert(pwdError);
	</script>
	</c:if>
	
	<!-- 비밀번호가 일치하는 경우-->
	<c:if test="${selectCnt!=0 }">	
		<!--  삭제실패 -->
		<c:if  test = "${deleteCnt==0 }">
			<script type="text/javascript">
			errorAlert(deleteError);	
			</script>
		</c:if>
		
		<!--  '삭제성공' 메세지 -->
		<c:if  test = "${deleteCnt!=0 }">
			<script type="text/javascript">
			errorAlert("탈퇴되었습니다");	
			window.location="logout"
					
			</script>
		</c:if>
	</c:if>
	
</body>
</html>
