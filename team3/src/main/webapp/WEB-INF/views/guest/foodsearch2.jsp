<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<html>
<head>
<title> 사이트이름 </title>
<link href="/medical/resources/djcss/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/style.css" rel="stylesheet" type="text/css" />
<script src="/medical/resources/djcss/dj.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
function calorie(calorie) {
	opener.document.cal.food2.value = calorie;

	self.close();

}
</script>
</head>
<body > 


<section>
  <div class="inbox-head">
                          <h3>Calorie</h3>
	<form action="foodsearch" method="post" name="foodsearch">


		<c:if test="${selectcnt== 1}">
             <table class="table table-inbox table-hover">
                     <c:forEach var="dto" items="${dtos}">
                     <tbody>
                            
				<tr>
					<th>음식 :</th>
					<td>${dto.food }</td>
				</tr>
					<tr>
					<th>칼로리 :</th>
					<td>${dto.foodcal }</td>
				</tr>
				<tr align="center">
					<th colspan="2" >
					 <input class="btn btn-warning"
						type="button" value="선택" onclick="calorie('${dto.foodcal}');">
						
					</th>
				</tr>
			</tbody>
			</c:forEach>
			</table>

		</c:if>

		<c:if test="${selectcnt != 1}">
			<table>
				<tr>
					<td align="center">검색된 음식이 없습니다~! 움식을 새로 추가해주세요!</td>
				<td>
					 <input class="btn btn-warning" type="button" value="확인" onclick="self.close()">
					 </td>
				</tr>
			
			</table>


		</c:if>

	</form>

</div>
</section>





</body>
</html>