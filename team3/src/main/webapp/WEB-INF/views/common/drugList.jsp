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
                               <table class="responstable">
                                
                            <tbody>
                              <tr class="unread">
                                    <th class="view-message" style="text-align: center;">약품번호</th>
                                  <th class="view-message" style="text-align: center;width: 45%;">약이름</th> 
                                    <th>
                                        <span style="text-align: center;">제약회사</span>
                                    </th>
                                  <th class="view-message" style="text-align: center;">등록일</th>
                              </tr>
                              <c:if test="${cnt>0 }">
								<c:forEach var="dto" items="${dtos}">
									<tr>
										<td style="text-align: center;">
											${dto.drugCode}
										</td>					
										<td >
											<a href="drugInfo?" style="font-family: 'Nanum Gothic', sans-serif; font-size: 20px;">${dto.drugName}</a>
										</td>
										<td >${dto.drugCompany}</td>
										<td style="text-align: center;">
											<fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${dto.registDate}"/>
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
                  
                  
                  
         
           
                  
                  
                  <div class="pagination clearfix" style="display: table; margin: 0 auto;">
                        <c:if test="${cnt>0}">
                           <!-- 이전블록 -->
                           
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
									</c:forEach>&drugName=${drugName}&drugCompany=${drugCompany}"><<</a>
                           
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
									</c:forEach>&drugName=${drugName}&drugCompany=${drugCompany}"><</a>	
                        
                        
                        
                        
                           </c:if>
                           <!-- 페이지 블록 -->
                           <c:forEach var="i" begin="${startPage }" end="${endPage }">
								<c:if test="${i == currentPage }">
									 <strong>${i }</strong>
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
									</c:forEach>&drugName=${drugName}&drugCompany=${drugCompany}" >${i }</a>
								</c:if>
							</c:forEach>										
                           <!-- 다음블록 -->
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
									</c:forEach>&drugName=${drugName}&drugCompany=${drugCompany}">></a>
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
									</c:forEach>&drugName=${drugName}&drugCompany=${drugCompany}" style="font-size: 15px;">>></a>
									</c:if>
                        </c:if>
                     </div>
               
              </div>                    
		</div>
   </section>
   
   <footer>
   <%@ include file="../common/footer.jsp" %>
   </footer>

</body>
</html>