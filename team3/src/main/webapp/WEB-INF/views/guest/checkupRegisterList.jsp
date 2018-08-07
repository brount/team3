<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>


<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>  </title>
<link href="/medical/resources/djcss/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>



<header>
   <%@ include file="../common/header.jsp" %>
</header>

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
                          <h3>나의 검진서 목록(${cnt})</h3>
                       
                      </div>
                      <div class="inbox-body">
                         <div class="mail-option">
                             

                               <table class="table table-inbox table-hover">
                                
                            <tbody>
                              <tr class="unread">
                                   
                     			  <td>등록번호</td>
                               
                                  <td></td>
                                  <td></td>                               
                                  <td>검진날짜</td>
                            
								 
                                  
                                  
                             
                                        
                              </tr>
                               <c:forEach var="dto" items="${dtos}" >
                              <tr class="">
               			  
                               <td><a href="checkAnalyze?col=${dto.COL}">${dto.COL}</a></td>
                                 <td></td>
                                 <td></td>
                                  <td><span class="label label-success">
      			               <a href="checkAnalyze?col=${dto.COL}">${dto.examinationday}</a>
                                  
                                  </span></td>
                                
                              </tr>
                     </c:forEach>
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