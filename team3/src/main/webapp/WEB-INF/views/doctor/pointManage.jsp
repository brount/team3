<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="/medical/resources/css/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<body>
<header>
	<%@ include file="../common/header.jsp" %>
</header>
<%@ include file="../common/line.jsp"%>

<section>
<input type="hidden" value="${doctorno}" name="doctorno">
<div class="container">
    <div class="row">
        <div class="col-sm-3 col-md-3">
            <%@ include file="../doctor/menuDoctor.jsp" %>
        </div>	
	  		 <div class="col-sm-9 col-md-9">
	            <div class="well">
					<div class="mail-box">
                  <aside class="lg-side">
                      <div class="inbox-head">
                          <h3 style="margin-bottom: 20px;">내 포인트</h3>
                          <h5>현재 포인트 : ${docDto.point}</h5>
                      </div>
                      <div class="inbox-body">
                         <div class="mail-option">

                               <table class="responstable">
                                
                            <tbody>
                              <tr class="unread">
                                  <th class="view-message">포인트번호</th>
                                  <th class="view-message">획득/사용 포인트</th>
                                  <th class="view-message">여부</th>
                                  <th class="view-message ">획득/사용일</th>
                              </tr>
                              <c:if test="${cnt>0 }">
                               <c:set value="0" var="b"></c:set>
								<c:forEach var="dto" items="${dtos}">
									<tr>
										<td>
											${dto.pointNo}
											<c:set var="number" value="${number-1 }"></c:set>
										</td>					
										<td>${dto.point}</td>
										<td>
											<c:if test="${dto.status==1}">획득</c:if>
											<c:if test="${dto.status==2}">사용</c:if>
										</td>	
										<td >
											<fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${dto.cum_date}"/>
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
               
                  <div class="pagination clearfix" style="display: table; margin: 0 auto;">
                        <c:if test="${cnt>0}">
                           <!-- 이전블록 -->
                           <c:if test="${startPage > pageBlock }">
                              <a href="pointManage?pageNum=${startPage-pageBlock}"><</a>
                           </c:if>
                           <!-- 페이지 블록 -->
                           <c:forEach var="i" begin="${startPage }" end="${endPage }">
                              <c:if test="${i == currentPage }">
                                 <strong>${i }</strong>
                              </c:if>
                              <c:if test="${i != currentPage }">
                                 <a href="pointManage?pageNum=${i}">${i }</a>
                              </c:if>
                           </c:forEach>
                           <!-- 다음블록 -->
                           <c:if test="${pageCnt > endPage }">
                              <a href="pointManage?pageNum=${startPage+pageBlock}">></a>
                           </c:if>
                        </c:if>
          </div>
                  
              
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