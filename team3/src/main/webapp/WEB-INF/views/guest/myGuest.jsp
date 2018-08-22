<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<title> 사이트 이름 </title>
<body>
   
   <header>
   <%@ include file="../common/header.jsp" %>
   </header>
   <%@ include file="../common/line.jsp"%>
   
	<section style="    margin-bottom: 100px;">   
		<div class="container">
		    <div class="row">
		        <div class="col-sm-3 col-md-3">
		            <%@ include file="../guest/menuGuest.jsp" %>
		        </div>	
			  		 <div class="col-sm-9 col-md-9">
		        <div class="well">
			           
	    <fieldset>
	
	
	
	
	      <h3>나의 건강정보</h3>
	      <c:if test="${selectcnt==0}">
	        <div style="display:table; margin:0 auto;">
				<div>
				
				<button type="button" class="btn btn-dark-blue"  onclick="window.location='personalAdd'"> MyHealth 등록하기 <span class="glyphicon glyphicon-send"></span></button>
	      </div>
	      </div>
	   
	    
		
		</c:if>
	
		 <c:if test="${selectcnt!=0 }">
	 
					 	 <table class="responstable">
					 	 
					 	 	   <tr class="unread">
                                    <th class="view-message  dont-show" style="width: 20%;">생년월일</th>
                                  <td class="view-message"> 
                                  ${vo.birth1}
						         		<b>년</b> 
						           ${vo.birth2}
						    		       <b>월</b> 	
						           ${vo.birth3}
						             	<b>일</b> 
                                  
                                  </td>                                  
                           
                              </tr>
					 	  <tr class="unread">
                                    <th class="view-message  dont-show" style="width: 20%;">신장</th>
                                  <td class="view-message"> 
                                  	${vo.height}						            	
									<b>cm</b> 
                                  
                                  </td>                                  
                           
                              </tr>
					
					 <tr class="unread">
                                    <th class="view-message  dont-show" style="width: 20%;">체중</th>
                                  <td class="view-message"> 
                                  	${vo.weight}						            	
									<b>kg</b> 
                                  
                                  </td>                                  
                           
                              </tr>
					
					 <tr class="unread">
                                    <th class="view-message  dont-show" style="width: 20%;">혈액형</th>
                                  <td class="view-message"> 
                                  		  ${vo.bloodtype}	
                                  
                                  </td>                                  
                           
                              </tr>	
                              
                              	 <tr class="unread">
                                    <th class="view-message  dont-show" style="width: 20%;">성별</th>
                                  <td class="view-message"> 
	                                 ${gender }
                                  </td>                                  
                           
                              </tr>
					
					
					
						</table>
						<center>
			<button type="button" class="btn btn-dark-blue" onclick="window.location='personalMof'" > MyHealth 수정하기 <span class="glyphicon glyphicon-send"></span></button>
						</center>
					</c:if>

		
	  </fieldset>
			            
			            
			            
			    </div>
			        </div>
			</div> 
  		 </section>

  
   
   
   <footer>
   <%@ include file="../common/footer.jsp" %>
   </footer>


</body>
</html>

	
