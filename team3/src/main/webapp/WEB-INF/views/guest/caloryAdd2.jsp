<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	            
		            <div class="container">
		             <form class="form-horizontal" action="todaycal" method="post"  id="reg_form" name="cal" onsubmit="return check();">
		             <c:if test="${cnt == 0 }">
					 
					  <fieldset>
					      <legend>My Calory</legend>
					     
						 <div class="form-group">
					<!-- 	  <div style="margin-top:20px; margin-bottom:20px; ">
						  <label class="col-md-4 control-label">아침 </label>
					       <div class="col-md-6  inputGroupContainer">
					          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
					            <input  name="food1" placeholder="음식이름 작성" class="form-control"  type="text" style="hegint:70px;"> 
					 				kcal
					         <input type="button" onclick="foodsearch1()"  class="btn btn-dark-blue" style="width:50x; height: 35px; margin-left: 20px;" value="검색 ">
					            
					          </div>
					        </div>
					        </div>
					         -->
					        
					        
					        
					        
					      
					        <label class="col-md-4 control-label">아침 </label>
					       <div class="col-md-6  inputGroupContainer">
					          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
					             <input  name="food1" placeholder="음식이름 작성" class="form-control"  type="text" style="hegint:70px;"> 
					 					<b style="margin-left: 20px;">kcal</b> 
					         <input type="button" onclick="foodsearch1()"  class="btn btn-dark-blue" style="width:50x; height: 35px; margin-left: 20px;" value="검색 ">
					            
					            
					          </div>
					        </div>
					        
					        <br>
					        
					         <div style="margin-top: 70px;">
					       <label class="col-md-4 control-label">점심 </label>
					       <div class="col-md-6  inputGroupContainer">
					          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
					             <input  name="food2" placeholder="음식이름 작성" class="form-control"  type="text" style="width:70px;"> 
					 					<b style="margin-left: 20px;">kcal</b> 
					         <input type="button" onclick="foodsearch2()"  class="btn btn-dark-blue" style="width:50x; height: 35px; margin-left: 20px;" value="검색 ">
					            
					            
					          </div>
					        </div>
					        </div>  
					        
					        <br><br>
					        
					       <label class="col-md-4 control-label" style=" margin-top: 35px;">저녁 </label>
					       <div class="col-md-6  inputGroupContainer" style=" margin-top: 35px;">
					          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
					             <input  name="food3" placeholder="음식이름 작성" class="form-control"  type="text" > 
					 				<b style="margin-left: 20px;">kcal</b> 
					         <input type="button" onclick="foodsearch3()"  class="btn btn-dark-blue" style="width:50x; height: 35px; margin-left: 20px;" value="검색 ">
					            
					            
					          </div>
					        </div>
					       
					        
					        
					        
					        <br>
					        
					        <!-- <div style="margin-top:20px; margin-bottom:20px; ">
					        <label class="col-md-4 control-label">점심 </label>
					       <div class="col-md-6  inputGroupContainer" style="margin-top: 20px;">
					          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
					            <input  name="food2" placeholder="음식이름 작성" class="form-control"  type="text" style="hegint:70px;"> 
					      		kcal
					      		<input type="button"  onclick="foodsearch2()" type="button"  class="btn btn-dark-blue" style="width:50x; height: 35px; margin-left: 20px;"value="검색 "> 
					            
					          </div>
					        </div>
					        </div> -->
					        
					  <!--     <div style="margin-top:20px; margin-bottom:20px; ">
					        <label class="col-md-4 control-label" >저녁 </label>
					       <div class="col-md-6  inputGroupContainer">
					          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
					            <input  name="food3" placeholder="음식이름 작성" class="form-control"  type="text" style="hegint:70px;"> 
					         	kcal
					         <input type="button"  onclick="foodsearch3()" type="button"  class="btn btn-dark-blue" style="width:50x; height: 35px; margin-left: 20px;"value="검색 ">
					            
					          </div>
					        </div>
						</div>
						   -->
						 
					      
					   </div>
					 					   </fieldset>
					 
					   	<br>
		
					     <input type="submit"  class="btn btn-dark-blue" style="display: table;margin: auto;" value="저장" >
					  
					      
					      
					   <br>
					     	<legend> 나만의 음식 추가하기 </legend>
					        <fieldset>
						 <div class="form-group">
					        <label class="col-md-4 control-label">음식 </label>
					       <div class="col-md-6  inputGroupContainer">
					          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
					            <input  name="food" placeholder="음식이름 작성" class="form-control"  type="text" style="hegint:70px;"> 
					            
					          </div>
					        </div>
					        <br>
					        <div style="margin-top: 70px;">
					    <label class="col-md-4 control-label" >1인분당 칼로리 </label>
					       <div class="col-md-6  inputGroupContainer">
					       
					          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
					            <input  name="foodcal" placeholder="1인분당 칼로리 작성" class="form-control"  type="text" style="hegint:70px;"> 
					           
					                        	<b style="margin-left: 20px;">kcal</b> 
					             
					          </div>
					        </div>
					      </div>
						<br>
					        <div style="margin-top: 70px;">
					    <label class="col-md-4 control-label"  style=" margin-top: 35px;" >gram </label>
					       <div class="col-md-6  inputGroupContainer">
					       
					          <div class="input-group" style=" margin-top: 35px;"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
					            <input  name="gram" placeholder="100 g" class="form-control"  type="text" > 
					           
					                        	<b style="margin-left: 20px;">g</b> 
					             
					          </div>
					          
					           <input type="button"  class="btn btn-dark-blue" style="width:50x; height: 35px; margin-left: 20px;margin-top: 35px;" onclick="newfoodinsert()" value="저장">
					          <input type="button"  class="btn btn-dark-blue" style="width:50x; height: 35px; margin-left: 20px;margin-top: 35px;" onclick="window.location='myFoodList'" value="나만의 음식 목록">
					          
					        </div>
					      </div>
					      </div>
					      </fieldset>
					 
					      </c:if> 	
					     	
					 	<c:if test="${cnt!=0 }">
						  
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
                                    <td colspan="4" class="view-message  dont-show">
                                    	    
					 			
					 			 나의   일일 권장칼로리에 비해 음식섭취량이 많으므로 
					 			  	식이조절이 필요합니다.
					 			  
					 			
                                    </td>
                                    
                               
                                    
                              </tr>
                                </c:if>
                              
                              
                             
                              
                              
					 	 </table>
					 					<div style="text-align: center;">
                                       <input type="button"  class="btn btn-dark-blue" value="하루 칼로리 수정하기" onclick="window.location='caloryAddModi'" >
							               </div>  
                           
					      </c:if> 	
					     	
					    
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