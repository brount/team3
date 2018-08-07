<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../common/setting.jsp" %>
    
<html lang="en">
<title>근무병원 찾기</title>
<body>

	<table class="table table-inbox table-hover">
		<tbody>
			
			<tr class="unread">
				<td class="view-message">병원명</td>

				<td class="view-message">주소</td>
			</tr>
			<c:if test="${cnt>0 }">
				<c:forEach var="dto" items="${dtos}">
					<tr onclick="setHos(${dto.hospitalno},'${dto.hospitalname }');">						
						<td>${dto.hospitalname}</td>
						<td>${dto.hospitaladdr }</td>
					</tr>
				</c:forEach>
			</c:if>
			<!-- 게시글이 없으면 -->
			<c:if test="${cnt==0 }">
				<tr>
					<td colspan="6" align="center">게시글이 없습니다. 글을 작성해 주세요.!!</td>
				</tr>
			</c:if>
		</tbody>
	</table>

	   <table align="center">
      <tr>
         <th align="center"><c:if test="${cnt>0}">
               <!-- 처음[◀◀] / 이전블록 [◀] -->
               <c:if test="${startPage > pageBlock }">
                  <a href="hosSearch_sub?sc=${sc }&select=${select}">[◀◀]</a>
                  <a href="hosSearch_sub?pageNum=${startPage-pageBlock}&sc=${sc }&select=${select}">[◀]</a>
               </c:if>
               <!-- 페이지 블록 -->
               <c:forEach var="i" begin="${startPage }" end="${endPage }">
                  <c:if test="${i == currentPage }">
                     <span> <b>[${i }]</b></span>
                  </c:if>
                  <c:if test="${i != currentPage }">
                     <a href="hosSearch_sub?pageNum=${i}&sc=${sc }&select=${select}">[${i }]</a>
                  </c:if>
               </c:forEach>
               <!-- 다음블록[▶] / 끝[▶▶] -->
               <c:if test="${pageCnt > endPage }">
                  <a href="hosSearch_sub?pageNum=${startPage+pageBlock}&sc=${sc }&select=${select}">[▶]</a>
                  <a href="hosSearch_sub?pageNum=${pageCnt}&sc=${sc }&select=${select}">[▶▶]</a>
               </c:if>
            </c:if></th>
      </tr>
   </table>

</body>
</html>