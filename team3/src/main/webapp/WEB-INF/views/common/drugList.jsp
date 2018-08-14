<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<title> 사이트 이름 </title>
<body>
   
   <header>
   <%@ include file="../common/header.jsp" %>
   </header>
   <%@ include file="../common/line.jsp"%>
   
   <section>
      <div class="container">
 <div class="mail-box">
                  <aside class="lg-side">
                      <div class="inbox-head">
                          <h3>약 검색목록</h3>
                      </div>
                      <div class="inbox-body">
                         <div class="mail-option">
								검색갯수 : ${cnt }
                               <table class="table table-inbox table-hover">
                                
                            <tbody>
                              <tr class="unread">
                                    <td class="view-message">약품번호</td>
                                  <td class="view-message">약이름</td> 
                                    <td>
                                        <span>제약회사
                                        </span>
                                    </td>
                                  <td class="view-message">등록일</td>
                              </tr>
                              <c:if test="${cnt>0 }">
								<c:forEach var="dto" items="${dtos}">
									<tr>
										<td>
											${dto.drugCode}
										</td>					
										<td >
											<a href="drugInfo?">${dto.drugName}</a>
										</td>
										<td >${dto.drugCompany}</td>
										<td >
											<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.registDate}"/>
										</td>
									</tr>
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
								<a href="drugSeachList?sign=${sign}&sign_flag=${sign_flag}
									<c:forEach var="item" items="${shape}">
										&shape=${item}
									</c:forEach>
									&shape_etc=${shape_etc}
									<c:forEach var="item" items="${drugForm}">
										&drugForm=${item}
									</c:forEach>
									&drugForm_etc=${drugForm_etc}
									<c:forEach var="item" items="${color}">
										&color=${item}
									</c:forEach>
									<c:forEach var="item" items="${splitlineF}">
										&splitlineF=${item}
									</c:forEach>
									<c:forEach var="item" items="${splitlineB}">
										&splitlineB=${item}
									</c:forEach>&drugName=${drugName}&drugCompany=${drugCompany}">[◀◀]</a>
								<a href="drugSeachList?pageNum=${startPage-pageBlock}&sign=${sign}&sign_flag=${sign_flag}
									<c:forEach var="item" items="${shape}">
										&shape=${item}
									</c:forEach>
									&shape_etc=${shape_etc}
									<c:forEach var="item" items="${drugForm}">
										&drugForm=${item}
									</c:forEach>
									&drugForm_etc=${drugForm_etc}
									<c:forEach var="item" items="${color}">
										&color=${item}
									</c:forEach>
									<c:forEach var="item" items="${splitlineF}">
										&splitlineF=${item}
									</c:forEach>
									<c:forEach var="item" items="${splitlineB}">
										&splitlineB=${item}
									</c:forEach>&drugName=${drugName}&drugCompany=${drugCompany}">[◀]</a>	
							</c:if>
							<!-- 페이지 블록 -->
							<c:forEach var="i" begin="${startPage }" end="${endPage }">
								<c:if test="${i == currentPage }">
									<span> <b>[${i }]</b></span>
								</c:if>
								<c:if test="${i != currentPage }">
									<a href="drugSeachList?pageNum=${i}&sign=${sign}&sign_flag=${sign_flag}
									<c:forEach var="item" items="${shape}">
										&shape=${item}
									</c:forEach>
									&shape_etc=${shape_etc}
									<c:forEach var="item" items="${drugForm}">
										&drugForm=${item}
									</c:forEach>
									&drugForm_etc=${drugForm_etc}
									<c:forEach var="item" items="${color}">
										&color=${item}
									</c:forEach>
									<c:forEach var="item" items="${splitlineF}">
										&splitlineF=${item}
									</c:forEach>
									<c:forEach var="item" items="${splitlineB}">
										&splitlineB=${item}
									</c:forEach>&drugName=${drugName}&drugCompany=${drugCompany}">[${i }]</a>
								</c:if>
							</c:forEach>										
							<!-- 다음블록[▶] / 끝[▶▶] -->
							<c:if test="${pageCnt > endPage }">
								<a href="drugSeachList?pageNum=${startPage+pageBlock}&sign=${sign}&sign_flag=${sign_flag}
									<c:forEach var="item" items="${shape}">
										&shape=${item}
									</c:forEach>
									&shape_etc=${shape_etc}
									<c:forEach var="item" items="${drugForm}">
										&drugForm=${item}
									</c:forEach>
									&drugForm_etc=${drugForm_etc}
									<c:forEach var="item" items="${color}">
										&color=${item}
									</c:forEach>
									<c:forEach var="item" items="${splitlineF}">
										&splitlineF=${item}
									</c:forEach>
									<c:forEach var="item" items="${splitlineB}">
										&splitlineB=${item}
									</c:forEach>&drugName=${drugName}&drugCompany=${drugCompany}">[▶]</a>
								<a href="drugSeachList?pageNum=${pageCnt}&sign=${sign}&sign_flag=${sign_flag}
									<c:forEach var="item" items="${shape}">
										&shape=${item}
									</c:forEach>
									&shape_etc=${shape_etc}
									<c:forEach var="item" items="${drugForm}">
										&drugForm=${item}
									</c:forEach>
									&drugForm_etc=${drugForm_etc}
									<c:forEach var="item" items="${color}">
										&color=${item}
									</c:forEach>
									<c:forEach var="item" items="${splitlineF}">
										&splitlineF=${item}
									</c:forEach>
									<c:forEach var="item" items="${splitlineB}">
										&splitlineB=${item}
									</c:forEach>&drugName=${drugName}&drugCompany=${drugCompany}">[▶▶]</a>
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