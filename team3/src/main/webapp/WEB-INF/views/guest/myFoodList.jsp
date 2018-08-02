<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>


<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> 사이트이름 </title>
<link href="/medical/resources/djcss/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function modi() {
	if (!document.foodlist.foodcal.value) {
		alert('수정할 칼로리를 입력해주세요.');
	
}

</script>


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
			                <div class="mail-box">
			     <form name="foodlist" action="myFoodModi" onsubmit="return modi();">
                  <aside class="lg-side">
                      <div class="inbox-head">
                          <h3>나만의 음식 목록(${cnt})</h3>
                       
                      </div>
                      <div class="inbox-body">
                         <div class="mail-option">
                             

                               <table class="table table-inbox table-hover" style="font-size: 25px;">
                                
                            <tbody>
                              <tr class="unread">
                          <!--       <td>  <input type="checkbox" class="toption-input checkbox" /></td> -->
                     			 
                                  <td class="view-message">음식</td>   
                                  <td></td>
                                  <td></td>                               
                                  <td>칼로리</td>
                                  <td>gram</td>
								 
                                  <td></td>
                                  
                             
                                        
                              </tr>
                              
                               <c:forEach var="dto" items="${dtos}" >
                               <input type="hidden" value="${dto.foodno }" name="foodno">
                             
                              <tr class="">
               			 <!--   <td>  <input type="checkbox" class="toption-input checkbox" /></td> -->
                              
                                  <td colspan="3" class="view-message">${dto.food }</td>
                                 
                                  <td><span class="label label-success">
                               
                               <input type="text" placeholder=" ${dto.foodcal }" name="foodcal" style="background-color: #5cb85c;  width: 80px;" >
                                   Kcal
                                  </span></td>
                               
                               <td><span class="label label-success">
                               
                               <input type="text" placeholder="${dto.foodgram}" name="foodgram" style="background-color: #5cb85c;  width: 80px;" >
                                   g
                                  </span></td>
                                  
                                  
                                 <td>
                                	 <input type="submit" class="btn" value="수정" >
           	                         <input type="button" class="btn" value="삭제" onclick="window.location='myFoodDelete?foodno=${dto.foodno }'">
                                  </td>
                              </tr>
                                
                     </c:forEach>
                 	<tr>
                     
                          </tbody>
                          </table>
                      </div>
                      </div>
           
                                             
           	
           	
                  </aside>
                  
                  
                  </form>
                  
                  <!-- 페이지 컨트롤 -->
		<table style="width:1000px" align="center">
			<tr>
				<th align="center">
					<c:if test="${cnt>0 }">
						<!-- 처음[◀◀] / 이전[◀]  -->
						<c:if test="${startPage > pageBlock }">
							<a href="myFoodList">[◀◀]</a>
							<a href="myFoodList?pageNum=${startPage - pageBlock }">[◀]</a>
						</c:if>
						
						<c:forEach var="i" begin="${startPage }" end="${endPage }">
							<c:if test="${i == currentPage }">
								<span><b>[${i}]</b></span>
							</c:if>
							<c:if test="${i != currentPage}">
								<a href="myFoodList?pageNum=${i }">[${i}]</a>
							</c:if>
						</c:forEach>
						
						<!-- 다음[▶] / 끝[▶▶]  -->	
						<c:if test="${pageCount > endPage }">
							<a href="myFoodList?pageNum=${startPage + pageBlock }">[▶]</a>
							<a href="myFoodList?pageNum=${pageCount}">[▶▶] </a>
						</c:if>
					</c:if>
				</th>
			</tr>
		
		</table>			
                  
       
            
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