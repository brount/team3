<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="/medical/resources/css/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<body>
<header>
	<%@ include file="../common/header.jsp" %>
</header>

<section>
<input type="hidden" value="${doctorno}" name="doctorno">
<div class="container">
    <div class="row">
        <div class="col-sm-3 col-md-3">
            <%@ include file="../common/menuCheckup.jsp" %>
        </div>	
	  		 <div class="col-sm-9 col-md-9">
	            <div class="well">
					<div class="mail-box">
                  <aside class="lg-side">
                      <div class="inbox-head">
                          <h3>건강검진 목록</h3>
                          <small>*환자 이름을 클릭하세요</small>
                          <form action="#" class="pull-right position">
                              <div class="input-append">
                                  <input type="text" class="sr-input" placeholder="검색">
                                  <button class="btn btn-dark-blue" type="button"><i class="fa fa-search"></i></button>
                              </div>
                          </form>
                      </div>
                      <div class="inbox-body">
                         <div class="mail-option">

                               <table class="table table-inbox table-hover">
                                
                            <tbody>
                              <tr class="unread">
                                  <td class="view-message">검진번호</td>
                                  <td class="view-message">환자명</td> 
                                  <td class="view-message  text-left">등록일</td>
                              </tr>
                              <c:if test="${cnt>0 }">
                               <c:set value="0" var="b"></c:set>
								<c:forEach var="dto" items="${dtos}">
									<tr>
										<td>
											${dto.checkup}
											<c:set var="number" value="${number-1 }"></c:set>
										</td>					
										<td ><a onclick="window.location='checkupResult?pageNum=${pageNum}&number=${number+1}&checkup=${dto.checkup}&doctorno=${doctorno}'">${guestList[b].guestname}</a></td>
											
										<td >
											<fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${dto.checkup_date}"/>
										</td>
									</tr>
									<c:set var="b" value="${b+1 }"></c:set>
								</c:forEach>
							</c:if>
							<!-- 게시글이 없으면 -->
							<c:if test="${cnt==0 }">
								<tr>
									<td colspan="6" align="center">
										게시글이 없습니다. 글을 작성해 주세요.!!
									</td>
								</tr>
							</c:if>
                          </tbody>
                          </table> 
                          </div>
                      </div>
                  </aside>
                  <table align="center">
				<tr>
					<th align="center">
						<c:if test="${cnt>0}">
							<!-- 처음[◀◀] / 이전블록 [◀] -->
							<c:if test="${startPage > pageBlock }">
								<a href="checkupResultList">[◀◀]</a>
								<a href="checkupResultList?pageNum=${startPage-pageBlock}">[◀]</a>	
							</c:if>
							<!-- 페이지 블록 -->
							<c:forEach var="i" begin="${startPage }" end="${endPage }">
								<c:if test="${i == currentPage }">
									<span> <b>[${i }]</b></span>
								</c:if>
								<c:if test="${i != currentPage }">
									<a href="checkupResultList?pageNum=${i}">[${i }]</a>
								</c:if>
							</c:forEach>										
							<!-- 다음블록[▶] / 끝[▶▶] -->
							<c:if test="${pageCnt > endPage }">
								<a href="checkupResultList?pageNum=${startPage+pageBlock}">[▶]</a>
								<a href="checkupResultList?pageNum=${pageCnt}">[▶▶]</a>
							</c:if>
						</c:if>
					</th>
				</tr>
			</table>
              </div>                    
		</div>
  		</div>
  	</div>
  </div>
  
  
 </section>
   

<footer>
	<%@ include file="../common/footer.jsp" %>
</footer>
</body>
</html>