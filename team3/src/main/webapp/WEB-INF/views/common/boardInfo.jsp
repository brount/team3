<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<title> 사이트 이름 </title>
<body>
   
   <header>
   <%@ include file="../common/header.jsp" %>
   </header>
   
   <section>
     <div class="container">
 <div class="mail-box">
                  <aside class="lg-side">
                      <div class="inbox-head">
                          <h3>질문게시판</h3>
                          <form action="#" class="pull-right position">
                              <div class="input-append">
                                  <input type="text" class="sr-input" placeholder="검색">
                                  <button class="btn sr-btn" type="button"><i class="fa fa-search"></i></button>
                              </div>
                          </form>
                      </div>
                         <div class="mail-option">
                             

                               <table class="table table-inbox table-hover">
                                
                            <tbody>
	                           <tr>
									<th style="width:150px">글번호</th>
									<td style="width:150px">${number }</td>
								</tr>
								<tr>
									
									<th style="width:150px">작성자</th>
									<td style="width:150px">${dto.boardwriter } </td>
									
									<th style="width:150px">작성일</th>
									<td style="width:150px">
										<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.boarddate }"/>
									</td>			
								</tr>
								<tr>									
									<th >글제목</th>
									<td colspan=3 >${dto.boardtitle }</td>
								</tr>
								<tr>									
									<th >글내용</th>
									<td colspan=3 >${dto.boardcontent }</td>
								</tr>
                          </tbody>
                          </table>
                          <table style="width:1000px" align="center">			
							<tr>
								<th style="width:20%">작성자</th>
								<th style="width:65%">댓글내용</th>
								<th style="width:15%">작성일</th>
							</tr>
							<c:forEach var="dt" items="${dtos }">
								<tr>
									<td align="center">	
										${dt.boardwriter }
									</td>
									<td>
										${dt.boardcontent }
									</td>
									<td align="center">
										<fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${dt.boarddate }"/>
										
										<c:if test="${sessionScope.id==dt.boardwriter}">
											<c:if test="${sessionScope.memberState==2 }">
												<button onclick="window.open('refDelete?num=${dt.boardno }&kind=${dto.boardno }&pageNum=${pageNum }&number=${number }','로그인창','width=450px,height=420px,screenX=700px,screenY=400px');">삭제</button>
											</c:if>
										</c:if>
										<c:if test="${sessionScope.id!=dt.boardwriter}">
											
											<button onclick="window.open('refDelete?num=${dt.boardno }&kind=${dto.boardno }&pageNum=${pageNum }&number=${number }','로그인창','width=450px,height=420px,screenX=700px,screenY=400px');">신고</button>
											
										</c:if>
									</td>							
								</tr>
							</c:forEach>			
						</table>
							<c:if test="${sessionScope.memberState ==2 }">
							<form action="inputre" method="post" name="reform" onclick="return reChk();">
								<input type="hidden" name="kind" value="2">
								<input type="hidden" name="ref" value="${dto.boardno }">
								<input type="hidden" name="num" value="${dto.boardno }">
								<input type="hidden" name="number" value="${number }">
								<input type="hidden" name="pageNum" value="${pageNum }">
								<table>						
									<tr>
										<td rowspan=3>
											<c:if test="${sessionScope.id != null }">
												${sessionScope.id }
												<input type="hidden" name="boardwriter" value="${sessionScope.id }">
											</c:if>
											<c:if test="${sessionScope.id == null }">
												<input type="text" name="boardwriter">
											</c:if>
											
										</td>
										<td rowspan=3 >
											<textarea rows="3" cols="100" name="boardcontent"></textarea>
										</td>
										<td>
											<input type="submit" value="댓글작성">	
										</td>
									</tr>
									<tr>
										<td>
											댓글 비밀번호
										</td>
									</tr>
									<tr>
										<td>
											<input type="password" name="boardpwd">
										</td>
									</tr>									
								</table>	
							</form>
						</c:if>
						<table>
							<tr>
								<th colspan=4>
									<c:if test="${sessionScope.id==dto.boardwriter}">
									<input class="inputButton" type="button" value="글수정"
									 onclick="window.location='boardModify?num=${dto.boardno}&pageNum=${pageNum }&kind=1'">
									 <input class="inputButton" type="button" value="글삭제"
									 onclick="window.location='boardDelete?num=${dto.boardno}&pageNum=${pageNum }&kind=1'">
									 </c:if>
									 <input class="inputButton" type="button" value="목록보기"
									 onclick="window.location='boardList?pageNum=${pageNum }'">
								</th>
							</tr>
						</table>
                      </div>
                  </aside>                 
              </div>                    
		</div>		
   </section>
   
   
   <footer>
   <%@ include file="../common/footer.jsp" %>
   </footer>


</body>
</html>