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
<script type="text/javascript">

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

	window.location="newfoodAdd?food="+food+"&foodcal="+foodcal+"&foodgram="+foodgram;

	
}

</script>

</head>

<body>

<header>
   <%@ include file="../common/header.jsp" %>
</header>





<section  style="margin-bottom: 300px;" >
	<div class="container">
	    <div class="row">
	        <div class="col-sm-3 col-md-3">
	            <%@ include file="../common/menuCare.jsp" %>
	        </div>
	        
  		 	<div class="col-sm-9 col-md-9">
	            
		            <div class="container">
		   
		      
		<form action="" name="cal">
					     	<legend> 나만의 음식 추가하기 </legend>
					        <fieldset>
						 <div class="form-group">
					        <label class="col-md-4 control-label">음식 </label>
					       <div class="col-md-6  inputGroupContainer">
					          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
					            <input  name="food" placeholder="음식이름 작성" class="form-control"  type="text" style="hegint:70px;"> 
					            
					          </div>
					        </div>
					        
					        <div style="margin-top: 70px;">
					    <label class="col-md-4 control-label" >1인분당 칼로리 </label>
					       <div class="col-md-6  inputGroupContainer">
					       
					          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
					            <input  name="foodcal" placeholder="1인분당 칼로리 작성" class="form-control"  type="text" style="hegint:70px;"> 
					           
					                        	<b style="margin-left: 20px;">kcal</b> 
					             
					          </div>
					        </div>
					      </div>
					
					        <div style="margin-top: 70px;">
					    <label class="col-md-4 control-label"  style=" margin-top: 35px;" >gram </label>
					       <div class="col-md-6  inputGroupContainer">
					       
					          <div class="input-group" style=" margin-top: 35px;"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
					            <input  name="gram" placeholder="100 g" class="form-control"  type="text" > 
					           
					                        	<b style="margin-left: 20px;">g</b> 
					             
					          </div>
					          
					           <input type="button"  class="btn btn-dark-blue"  style="width:50x; height: 35px; margin-left: 20px;margin-top: 35px;" onclick="newfoodinsert()" value="저장">
					          <input type="button"  class="btn btn-dark-blue"  style="width:50x; height: 35px; margin-left: 20px;margin-top: 35px;" onclick="window.location='myFoodList'" value="나만의 음식 목록">
					          
					        </div>
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