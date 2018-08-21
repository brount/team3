<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html class="no-js" lang="en">

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
 <c:if test="${sessionScope.memberState != 1 }">
	<script type="text/javascript">
		alert('로그인이 필요한 서비스 입니다.');
		window.location="memberLogin";
	</script>
</c:if>


<header>
   <%@ include file="../common/header.jsp" %>
</header>
<%@ include file="../common/line.jsp"%>

<section style="margin-bottom: 100px;">
	<div class="container">
	    <div class="row">
	        <div class="col-sm-3 col-md-3">
	            <%@ include file="../common/menuCare.jsp" %>
	        </div>
  		 	<div class="col-sm-9 col-md-9">

		            <div class="container">
					
					
						  <form class="form-horizontal" action=" " method="post"  id="reg_form">
						    <fieldset>
						    <h1>개인건강관리</h1>
						<c:if test="${selectcnt!=0}">
						
						
						
						 
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
                                    <th class="view-message  dont-show">신장</th>
                                  <td class="view-message"> 
                                  	${vo.height}						            	
									<b>cm</b> 
                                  
                                  </td>                                  
                           
                              </tr>
					
					 <tr class="unread">
                                    <th class="view-message  dont-show">체중</th>
                                  <td class="view-message"> 
                                  	${vo.weight}						            	
									<b>kg</b> 
                                  
                                  </td>                                  
                           
                              </tr>
					
					 <tr class="unread">
                                    <th class="view-message  dont-show">나의 신체질량 BMI 지수</th>
                                  <td class="view-message"> 
                                  		  ${bmi}	
                                  
                                  </td>                                  
                           
                              </tr>	
						</table>
						
						
						
						
						    <!-- 추가해도되고안해도되고        <img src="/medical/resources/djcss/img/bmi.jpg" style="width:500px; height:400px;">  -->
						    
						</c:if>
						<div style="display:table; margin:0 auto;">
							<div>
							<c:if test="${selectcnt==0}">
								<button type="button"  class="btn btn-dark-blue"  onclick="window.location='personalAdd'"> 내 건강정보 등록하기 <span class="glyphicon glyphicon-send"></span></button>
						  		</c:if>
						  			<c:if test="${selectcnt!=0}">
								 <button type="button"  class="btn btn-dark-blue"  onclick="window.location='personalMof'"> 내 건강정보 수정하기 <span class="glyphicon glyphicon-send"></span></button>
						  		</c:if>
						  		<button type="button"  class="btn btn-dark-blue" onclick="window.location='caloryAdd'"> 음식 등록하기 <span class="glyphicon glyphicon-send"></span></button>
							</div>
						 </div>    
						  </fieldset>
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