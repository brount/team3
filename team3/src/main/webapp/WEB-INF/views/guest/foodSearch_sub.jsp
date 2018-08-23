<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../common/setting.jsp" %>
<html lang="en">
<title>근무병원 찾기</title>
<body>
<table class="responstable">
		<tbody>
			
			<tr class="unread">
				<th  style="width:15%;">식품군</th>
				<th style="width:20%;">식품이름</th>
				<th>1회 섭취량(g)</th>
				<th>칼로리(kcal)</th>
				<th>탄수화물(g)</th>
				<th>단백질(g)</th>
				<th>지방(g)</th>
				<th>당류(g)</th>
				<th>나트륨(g)</th>
				<th>콜레스테롤(mg)</th>
				<th>포화지방산(g)</th>
				<th>트랜스지방산(g)</th>
				<th></th>
			</tr>
			<c:if test="${cnt>0 }">
				<c:forEach var="dto" items="${dtos}">
					<tr >
						<td id="foodkind">${dto.foodkind}</td>
						<td id="foodname">${dto.foodname}</td>
						<td id="gram">${dto.gram}</td>
						<td id="kcal">${dto.kcal}</td>
						<td id="carbohydrate">${dto.carbohydrate}</td>
						<td id="protein">${dto.protein}</td>
						<td id="fat">${dto.fat}</td>
						<td id="sugars">${dto.sugars}</td>
						<td id="salt">${dto.salt}</td>
						<td id="cholesterol">${dto.cholesterol}</td>
						<td id="sfa">${dto.sfa}</td>
						<td id="tfa">${dto.tfa}</td>
						<td>
						<input type="button" style="width: 100%" value="선택"	  class="btn btn-dark-blue"
					onclick="setFood('${dto.foodkind}','${dto.foodname}','${dto.gram}','${dto.kcal}','${dto.carbohydrate}','${dto.protein}','${dto.fat}','${dto.sugars}'
					,'${dto.salt}','${dto.cholesterol}','${dto.sfa}','${dto.tfa}');"> 
					
					</td>
					</tr>
				</c:forEach>
			</c:if>
			<!-- 게시글이 없으면 -->
			<c:if test="${cnt==0 }">
				<tr>
					<td colspan="11" align="center">검색결과가 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>
	
	
		<div class="pagination clearfix" style="display: table; margin: 0 auto;">
                        <c:if test="${cnt>0}">
                           <!-- 이전블록 -->
                           <c:if test="${startPage > pageBlock }">
                             <a href="foodSearch?sc=${sc }&select=${select}"><<</a>
                              <a href="foodSearch?pageNum=${startPage-pageBlock}&sc=${sc }&select=${select}"><</a>
                           </c:if>
                           <!-- 페이지 블록 -->
                           <c:forEach var="i" begin="${startPage }" end="${endPage }">
                              <c:if test="${i == currentPage }">
                                 <strong>${i }</strong>
                              </c:if>
                              <c:if test="${i != currentPage }">
                                 <a href="foodSearch?pageNum=${i}&sc=${sc }&select=${select}">${i }</a>
                              </c:if>
                           </c:forEach>
                           <!-- 다음블록 -->
                           <c:if test="${pageCnt > endPage }">
                              <a href="foodSearch?pageNum=${startPage+pageBlock}&sc=${sc }&select=${select}">></a>
                              <a href="foodSearch?pageNum=${pageCnt}&sc=${sc }&select=${select}">>></a>
                              
                           </c:if>
                        </c:if>
                     </div>
	
	

</body>
</html>