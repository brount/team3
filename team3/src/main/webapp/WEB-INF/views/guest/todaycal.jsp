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
	            <%@ include file="../common/menuCare.jsp" %>
	        </div>
	        
  		 	<div class="col-sm-9 col-md-9">
	            <div class="well">
		            <div class="container">
					  <form class="form-horizontal" action="todaycal" method="post"  id="reg_form" name="cal">
				
					      <legend>My Calory</legend>
						 <div class="form-group">
						  <div style="margin-top:20px; margin-bottom:20px; ">
						  <label class="col-md-4 control-label">${vo.day}  </label>
					       <div class="col-md-6  inputGroupContainer">
					          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
					 		
					 			${vo.todaycal }	kcal
					         <input type="button" onclick="foodsearch1()" class="btn btn-warning" style="width:50x; height: 35px; margin-left: 20px;" value="검색 "><span class="glyphicon glyphicon-send"></span>
					            
					          </div>
					        </div>
					        </div>
					        
					       
						  
						 
					      
					   </div>
					     <input type="submit" class="btn btn-warning" value="저장" >
					     	
					     	
					     
			
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