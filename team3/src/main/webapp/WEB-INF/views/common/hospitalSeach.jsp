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
                          <h3>병원검색</h3>
                          <form action="#" class="pull-right position">
                              <div class="input-append">
                              	  <select name="hospitalKind">
                              	  	<option value="1">내과</option>
                              	  	<option value="2">외과</option>
                              	  	<option value="3">이비인후과</option>
                              	  	<option value="4">치과</option>
                              	  	<option value="5">정신의학과</option>
                              	  </select>
                                  <input type="text" class="sr-input" placeholder="예 ) 연세내과">
                                  <button class="btn sr-btn" type="button"><i class="fa fa-search"></i></button>
                              </div>
                              <div>                              	
                              </div>
                          </form>
                      </div>
                      <div class="inbox-body">
                         <div class="mail-option">
                               <table class="table table-inbox table-hover">                                
                            <tbody>
                              <c:if test="${cnt>0 }">
								<c:forEach var="dto" items="${dtos }">
										<tr>
											<th onclick="hospitalMove();"><h1>${number }.</h1> ${dto.hospitalname}</th>										
										</tr>
										<tr>
											<td>
												▶ 전화번호 : ${dto.hospitalphone }
											</td>										
										</tr>
										<tr>
											<td>
												▶ 주소 : ${dto.hospitaladdress1 }
											</td>										
										</tr>
										<tr>
											<td>
												▶진료과목 : ${dt.hospitalphone }
											</td>										
										</tr>
										<tr>
											<td>
												<button class="btn btn-primary">예약</button>	
											</td>										
										</tr>
									 <script type="text/javascript">
										function hospitalMove(){
											window.location="hospitalInfo?hospitalphone=${dto.hospitalphone}&pageNum=${pageNum}";
										}	
									  </script>
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
                  <table style="width:1000px"align="center">
				<tr>
					<th align="center">
						<c:if test="${cnt>0 }">
							<!-- 처음[◀◀] / 이전블록 [◀] -->
							<c:if test="${startPage > pageBlock }">
								<a href="bookList.hs">[◀◀]</a>
								<a href="bookList.hs?pageNum=${startPage-pageBlock}">[◀]</a>	
							</c:if>
							<!-- 페이지 블록 -->
							<c:forEach var="i" begin="${startPage }" end="${endPage }">
								<c:if test="${i == currentPage }">
									<span> <b>[${i }]</b></span>
								</c:if>
								<c:if test="${i != currentPage }">
									<a href="bookList.hs?pageNum=${i}">[${i }]</a>
								</c:if>
							</c:forEach>										
							<!-- 다음블록[▶] / 끝[▶▶] -->
							<c:if test="${pageCnt > endPage }">
								<a href="bookList.hs?pageNum=${startPage+pageBlock}">[▶]</a>
								<a href="bookList.hs?pageNum=${pageCnt}">[▶▶]</a>
							</c:if>
						</c:if>
					</th>
				</tr>
			</table>
              </div>                    
		</div>
   </section>
   
   <footer>
   <%@ include file="../common/footer.jsp" %>
   </footer>

</body>
</html>