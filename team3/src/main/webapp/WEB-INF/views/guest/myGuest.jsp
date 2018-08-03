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
   
	<section style="    margin-bottom: 100px;">   
		<div class="container">
		    <div class="row">
		        <div class="col-sm-3 col-md-3">
		            <%@ include file="../guest/menuGuest.jsp" %>
		        </div>	
			  		 <div class="col-sm-9 col-md-9">
			           
	    <fieldset>
	
	
	
	
	      <h1>My Health</h1>
		 <c:if test="${selectcnt != 0 }">
	 
					 	 <table class="table table-inbox table-hover">
					 	 
					 	 	   <tr class="unread">
                                    <td class="view-message  dont-show">생년월일</td>
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
                                    <td class="view-message  dont-show">신장</td>
                                  <td class="view-message"> 
                                  	${vo.height}						            	
									<b>cm</b> 
                                  
                                  </td>                                  
                           
                              </tr>
					
					 <tr class="unread">
                                    <td class="view-message  dont-show">체중</td>
                                  <td class="view-message"> 
                                  	${vo.weight}						            	
									<b>kg</b> 
                                  
                                  </td>                                  
                           
                              </tr>
					
					 <tr class="unread">
                                    <td class="view-message  dont-show">혈액형</td>
                                  <td class="view-message"> 
                                  		  ${vo.bloodtype}	
                                  
                                  </td>                                  
                           
                              </tr>	
                              
                              	 <tr class="unread">
                                    <td class="view-message  dont-show">성별</td>
                                  <td class="view-message"> 
	                                 ${gender }
                                  </td>                                  
                           
                              </tr>
					
					
					
					 <tr class="unread">
                                    <td class="view-message  dont-show" colspan="2" align="center">
									<button type="button" class="btn btn-warning" onclick="window.location='personalMof'"> MyHealth 수정하기 <span class="glyphicon glyphicon-send"></span></button>

								</td>
                                    
                                    
                                  
                              </tr>	
					
					
						</table>
					</c:if>

		<c:if test="${selectcnt == 0} ">
	        <div style="display:table; margin:0 auto;">
				<div>
				
				<button type="button" class="btn btn-warning" onclick="window.location='personalAdd'"> MyHealth 등록하기 <span class="glyphicon glyphicon-send"></span></button>
	      </div>
	      </div>
	   
	    
		
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

	
