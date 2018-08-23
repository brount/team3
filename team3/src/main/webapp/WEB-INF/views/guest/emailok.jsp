<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="/medical/resources/css/css/default.css" />
<link rel="stylesheet" type="text/css" href="/medical/resources/css/css/table.css" />
    
<script type="text/javascript">
function keycnt(){

	opener.document.inputform.hiddenEmail.value="1";
	self.close();
	

}

</script>

<body>



<form action="emailok" method="post">
	<c:if test="${keycnt == 0}">
		<c:if test="${equal==0 }">
		<script type="text/javascript">
			alert("이메일 인증에 실패했습니다. 인증키를 다시 확인하세요. ")
			
			window.history.back();
		</script>
		</c:if>
	</c:if>

	<c:if test="${keycnt != 0}">
		<script type="text/javascript">
		
			
			
		</script>
		
		<tr>
				
				<th><b>이메일 인증에 성공하였습니다.</b></th>
				<th colspan="2">
				<input  class="btn btn-dark-blue"  type="button"
					value="확인" onclick="keycnt();">
		</th>

	</c:if>

</form>
</html>