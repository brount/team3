<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>


<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> 사이트이름 </title>
<link href="/medical/resources/djcss/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- <link href="/medical/resources/djcss/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
 --><link href="/medical/resources/djcss/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>



<header>
   <%@ include file="../common/header.jsp" %>
</header>
<%@ include file="../common/line.jsp"%>

<section>
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
                          <h3>검진 예약 목록</h3>
                          <small>*환자 이름을 클릭하세요</small>
                          <form action="patientListSearch" class="pull-right position">
                              <div class="input-append">
                                  <input type="text" class="sr-input" placeholder="검색">
                                  <button class="btn btn-dark-blue" type="submit" name="patientListSearch"><i class="fa fa-search"></i></button>
                              </div>
                          </form>
                         
                      </div>
                      <div class="inbox-body">
                         <div class="mail-option">
                             
 
                               <table class="table table-inbox table-hover">
                                
                            <tbody>
                              <tr class="unread">

                     			  <td>예약번호</td>
                                  <td>환자명</td>
                                  <td class="view-message">병원명</td>   
                                  <td>예약종류</td>
                                  <td>예약시간</td>
                             
                                        
                              </tr>
                              <c:if test="${cnt>0 }">
                               <c:set value="0" var="a"></c:set>
                               <c:set value="0" var="b"></c:set>
								<c:forEach var="dto" items="${dtos}">
									<tr>
										<td>
											${dto.reservationNo}
											<c:set var="number" value="${number-1 }"></c:set>
										</td>	
										<td ><a onclick="window.location='patientInfo?pageNum=${pageNum}&number=${number+1}&reservationNo=${dto.reservationNo}'">${guestList[b].guestname}</a></td>
										<td>${hospitalList[a].hospitalname}</td>
										<c:if test="${dto.reservationKind==1 }">
											<td >
											<span class="label label-success">병원예약</span></td>
										</c:if>
										<c:if test="${dto.reservationKind==2 }">
											<td >
											<span class="label label-success">클리닉예약</span></td>
										</c:if>
										<td >
											<fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${dto.reservationTime}"/>
										</td>
									</tr>
									<c:set var="b" value="${b+1 }"></c:set>
									<c:set var="a" value="${a+1 }"></c:set>
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
								<a href="patientList">[◀◀]</a>
								<a href="patientList?pageNum=${startPage-pageBlock}">[◀]</a>	
							</c:if>
							<!-- 페이지 블록 -->
							<c:forEach var="i" begin="${startPage }" end="${endPage }">
								<c:if test="${i == currentPage }">
									<span> <b>[${i }]</b></span>
								</c:if>
								<c:if test="${i != currentPage }">
									<a href="patientList?pageNum=${i}">[${i }]</a>
								</c:if>
							</c:forEach>										
							<!-- 다음블록[▶] / 끝[▶▶] -->
							<c:if test="${pageCnt > endPage }">
								<a href="patientList?pageNum=${startPage+pageBlock}">[▶]</a>
								<a href="patientList?pageNum=${pageCnt}">[▶▶]</a>
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