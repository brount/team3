<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> 사이트이름 </title>
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
	            <%@ include file="../common/menuCare.jsp" %>
	        </div>
	        
  		 	<div class="col-sm-9 col-md-9">
	        
		            <div class="container">
					  <form class="form-horizontal" action="todaycal" method="post"  id="reg_form" name="cal">
				 
					 	 <table class="table table-inbox table-hover">
					 	 		 <h1>PersonalCare</h1>
					 	 
					 	 	   <tr class="unread">
                                    <td class="view-message  dont-show">오늘 하루 나의 섭취 칼로리</td>
                                  <td class="view-message"> ${vo.todaycal}</td>                                  
                               
                                    
                              </tr>
					 	 
					 	 	   <tr class="unread">
                                    <td class="view-message  dont-show">나의 기초 대사량</td>
                                  <td class="view-message"> ${basalmetabolism}</td>                                  
                                    
                              </tr>
					 	 	   <tr class="unread">
                                    <td class="view-message  dont-show">나의 권장 칼로리</td>
                                  <td class="view-message"> ${encouragecal}</td>                                  
                                    
                              </tr>
                              <c:if test="${alertcnt==1}">
					 	   <tr class="unread">
                                    <td rowspan="2" class="view-message  dont-show">
                                    	    
					 			
					 			 나의   일일 권장칼로리에 비해 음식섭취량이 많으므로 
					 			  	식이조절이 필요합니다.
					 			  
					 			
                                    </td>
                                    
                               
                                    
                	              </tr>
				
							</c:if>
							<tr class="unread" align="center">
                                    <td class="view-message  dont-show" colspan="2">					  
                                       <input type="button" class="btn btn-warning" value="PersonalCare 메인" onclick="window.location='caloryAddModi'" >
									</td>
                                                            
                                    
                              </tr>
                              
							</table>
					   </form>
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