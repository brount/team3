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
		            <%@ include file="../guest/menuGuest.jsp" %>
		        </div>	
			  		 <div class="col-sm-9 col-md-9">
			            <div class="well">
			                <div class="mail-box">
                  <aside class="lg-side">
                      <div class="inbox-head">
                          <h3>나의 예약 목록(${cnt})</h3>
                       
                      </div>
                      <div class="inbox-body">
                         <div class="mail-option">
                             

                               <table class="table table-inbox table-hover">
                                
                            <tbody>
                              <tr class="unread">
                                   
                     			  <td>예약번호</td>
                                  <td class="view-message">병원명</td>   
                                  <td></td>
                                  <td></td>                               
                                  <td>예약종류</td>
                                  <td>예약날짜</td>
								  <td>예약시간</td>
                                  
                                  
                             
                                        
                              </tr>
                              <c:if test="${cnt!=0 }">
                               <c:forEach var="dto" items="${dtos}" >
                              <tr class="">
               			  
                               <td>${dto.reservationNo}</td>
                                  <td colspan="3" class="view-message"><a href="hospitalInfo?hospitalno=${dto.hospitalno }">${dto.hospitalname }</a></td>
                                  <td><span class="label label-success">
                                  <c:if test="${dto.reservationKind==1}">
                                  	병원 예약
                                  </c:if>
                                  <c:if test="${dto.reservationKind==2}">
                                  	클리닉 예약
                                  </c:if>
                                  
                                  </span></td>
                                  <td class="view-message  text-left">${dto.reservationTime }</td>
                                  <td>${dto.clock }${dto.minute } </td>
                                  
                              </tr>
                              
                    	 </c:forEach>
                          </c:if>
                          <tr>
                          <td colspan="8" align="center" style="margin-top: 50;">	<button type="button"  class="btn btn-dark-blue" onclick="window.location='achospitalSeach?state=1'">
													병원을 예약해주세요~! <span class="glyphicon glyphicon-send"></span>
								</button> </td>
                          </tr>
                          </tbody>
                          </table>
                      </div>
                      </div>
           
                  </aside>
                  
                  
                  
                  
                  <!-- 페이지 컨트롤 -->
		<table style="width:1000px" align="center">
			<tr>
				<th align="center">
					<c:if test="${cnt>0 }">
						<!-- 처음[◀◀] / 이전[◀]  -->
						<c:if test="${startPage > pageBlock }">
							<a href="reserveList">[◀◀]</a>
							<a href="reserveList?pageNum=${startPage - pageBlock }">[◀]</a>
						</c:if>
						
						<c:forEach var="i" begin="${startPage }" end="${endPage }">
							<c:if test="${i == currentPage }">
								<span><b>[${i}]</b></span>
							</c:if>
							<c:if test="${i != currentPage}">
								<a href="reserveList?pageNum=${i }">[${i}]</a>
							</c:if>
						</c:forEach>
						
						<!-- 다음[▶] / 끝[▶▶]  -->	
						<c:if test="${pageCount > endPage }">
							<a href="reserveList?pageNum=${startPage + pageBlock }">[▶]</a>
							<a href="reserveList?pageNum=${pageCount}">[▶▶] </a>
						</c:if>
					</c:if>
				</th>
			</tr>
		
		</table>			
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  <!-- ul class="pagination" style="margin-top: 50px;margin-left:400px; ">
                  <li class="disabled"><span>«</span></li>
                  <li class="active"><span>1</span></li>
                  <li><a href="http://bootsnipp.com/search?q=page&page=2">2</a></li>
                  <li><a href="http://bootsnipp.com/search?q=page&page=3">3</a></li>
                  <li><a href="http://bootsnipp.com/search?q=page&page=4">4</a></li>
                  <li class="disabled"><span>...</span></li>
                  <li><a href="http://bootsnipp.com/search?q=page&page=22">5</a></li>
                  <li><a href="http://bootsnipp.com/search?q=page&page=2" rel="next">»</a></li>
                </ul> -->
            
					 </div>                    
                   <div style="margin-top: 50px;">
				                       ※ 병원에 대기하는 환자가 많거나 현재 시간 기준으로 + 30분은 예약 및 예약수정이 불가능합니다.<br>
						재예약을 원하시는 분은 신중히 취소해 주시기 바랍니다.<br>
						※ 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』 제 30조 2항(개인정보 이용내역의 통지)에 따라 메디클립 예약 서비스를 이용한 회원님의 개인정보 이용내역입니다.<br>
						※ ‘예약내역’ 에는 오늘 날짜 이후의 예약내역만 확인하실 수 있습니다.<br>
						※ 오늘 이전의 예약내역은 ‘지난예약내역’ 에서 확인하시기 바랍니다.<br>
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