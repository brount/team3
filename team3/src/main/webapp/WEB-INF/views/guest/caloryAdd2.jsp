<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/setting.jsp" %>
<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> 사이트이름 </title>
<link href="/medical/resources/djcss/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- <link href="/medical/resources/djcss/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
 --><link href="/medical/resources/djcss/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function foodsearch1() {
	if (!document.cal.food1.value) {
		alert('음식을 입력해주세요.');
		document.cal.food1.focus();
		return false;
	}
	var url = "foodsearch1?food=" + document.cal.food1.value; 


	window.open(url, "foodsearch", "menubar=no,width=500,height=400");
}
function foodsearch2() {
	if (!document.cal.food2.value) {
		alert('음식을 입력해주세요.');
		document.cal.food2.focus();
		return false;
	}
	var url = "foodsearch2?food=" + document.cal.food2.value; 


	window.open(url, "foodsearch", "menubar=no,width=500,height=400");
}
function foodsearch3() {
	if (!document.cal.food3.value) {
		alert('음식을 입력해주세요.');
		document.cal.food3.focus();
		return false;
	}
	var url = "foodsearch3?food=" + document.cal.food3.value; 


	window.open(url, "foodsearch", "menubar=no,width=500,height=400");
}
function newfoodinsert(){
	if (!document.cal.food.value) {
		alert('음식을 입력해주세요.');
		document.cal.food.focus();
		return false;
	}
	else if (!document.cal.foodcal.value) {
		alert('해당음식의 칼로리를 입력해주세요.');
		document.cal.foodcal.focus();
		return false;
	}
	else if (!document.cal.gram.value) {
		alert('해당음식의 양(gram)을 입력해주세요.');
		document.cal.gram.focus();
		return false;
	}
	
	var food = document.cal.food.value;
	var foodcal = document.cal.foodcal.value;
	var foodgram = document.cal.gram.value;

	window.location="newfood?food="+food+"&foodcal="+foodcal+"&foodgram="+foodgram;

	
}

function check() {
var food1=document.cal.food1.value;
var food2=document.cal.food2.value;
var food3= document.cal.food3.value;


 
  if(isNaN(food1) == true ||food1=="") {
	  
			alert("움식의 칼로리를 숫자로 입력해주세요.");
		
		document.cal.food1.focus();
		return false;
 }else if(isNaN(food2) == true||food2=="") {
			alert("움식의 칼로리를 숫자로 입력해주세요.");
			
		
		document.cal.food2.focus();
		return false;
 }else if(isNaN(food3) == true||food3=="") {
			alert("움식의 칼로리를 숫자로 입력해주세요.");
			
		document.cal.food3.focus();
		return false;
 }
} 

</script>
<style type="text/css">
#xxx > tbody > tr:first-child {
	display:none;
}
</style>
</head>

<body>

<header>
   <%@ include file="../common/header.jsp" %>
</header>
<%@ include file="../common/line.jsp"%>





<section  style="margin-bottom: 300px;" >
	<div class="container">
	    <div class="row">
	        <div class="col-sm-3 col-md-3">
	            <%@ include file="../common/menuCare.jsp" %>
	        </div>
	        
  		 	<div class="col-sm-9 col-md-9">
	            <div class="well">
		            <div class="container">
		             <form class="form-horizontal" action="todaycal" method="get"  id="reg_form" name="cal" onsubmit="return check();">

					 
					  <fieldset>
					      <h3>음식 검색</h3>
					     
						 <table class="responstable" border="1"
											id="xxx">
											<thead>
												<tr>
													<th>식품군</th>
													<th>식품이름</th>
													<th>1회 섭취량(g)</th>
													<th>칼로리(kcal)</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><input type="text" style="width: 100%"name="foodkind"></td>
													<td><input type="text" style="width: 100%"name="foodname"></td>
													<td><input type="text" style="width: 100%"name="gram"></td>
													<td><input type="text" style="width: 100%"name="kcal"></td>										
												</tr>
												
												<!-- var lastTrObj = tableObj.find("tbody:eq(0)").find("tr:eq(0)")
														.parent().children().last(); -->
										</table>  
					 					   </fieldset>
					   	<br>	<hr style="border-top: 2px solid rgba(91, 146, 203, 0.98);">
					   				<div style="margin: 0 auto; display: table;">
					   			
										<input type="button" class="btn btn-dark-blue" value="검색" name="btnsear">
					     				<input type="submit"  class="btn btn-dark-blue" style="margin-left: 15px;" value="저장" >
									  </div>
					      <script type="text/javascript">
													$("input[name=btnsear]").click(function (){
														
														window.open('foodSearch' ,'이름','menubar=no, width=1210, height=700');	
													});
												
												</script>
					      
					   <br>
					     	<table class="responstable">
					 	 		 <h3>나의 칼로리 정보</h3>
					 	 
					 	 	   <tr class="unread">
                                    <th class="view-message  dont-show" style="width: 36%;">오늘 하루 나의 섭취 칼로리</th>
                                  <td class="view-message">
                                   	${todaykcal} kcal
                                  </td>     
                              </tr>
					 	 
					 	 	   <tr class="unread">
                                    <th class="view-message  dont-show">나의 기초 대사량</th>
                                  <td class="view-message"> ${basalmetabolism} kcal </td>                                  
                                    
                              </tr>
					 	 	   <tr class="unread">
                                    <th class="view-message  dont-show">나의 권장 칼로리</th>
                                  <td class="view-message"> ${encouragecal} kcal</td>                                  
                                    
                              </tr>
                              <c:if test="${alertcnt==1}">
					 	   <tr class="unread">
                                    <td colspan="4" class="view-message  dont-show">
                                    	    
					 			
					 			 나의   일일 권장칼로리에 비해 음식섭취량이 많으므로 
					 			  	식이조절이 필요합니다.
					 			  
					 			
                                    </td>
                                    
                               
                                    
                              </tr>
                                </c:if>
                              
                              
                             
                              
                              
					 	 </table>
					 
					     	
					    
					</form>
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