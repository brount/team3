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
	            <div class="well">
		            <div class="container">
					  <form class="form-horizontal" action=" " method="post"  id="reg_form">
					  <fieldset>
					      <legend>My Calory</legend>
						 <div class="form-group">
					        <label class="col-md-4 control-label" >음식</label>
					        <div class="col-md-6  inputGroupContainer">
					          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
					            <input name="phone1" placeholder="음식작성" class="form-control" type="text" style="width:30px; margin-right: 10px;">
					          	 <button type="submit" class="btn btn-warning" style="width:50x; height: 35px; margin-left: 20px;">검색 <span class="glyphicon glyphicon-send"></span></button>
					          </div>
					        </div>
					      </div>
					     	<legend> 새 음식 추가하기 </legend>
					        <fieldset>
						 <div class="form-group">
					        <label class="col-md-4 control-label">음식 </label>
					       <div class="col-md-6  inputGroupContainer">
					          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
					            <input  name="first_name" placeholder="음식이름 작성" class="form-control"  type="text" style="hegint:70px;"> 
					            
					          </div>
					        </div>
					        
					        <div style="margin-top: 70px;">
					    <label class="col-md-4 control-label" >1인분당 칼로리 </label>
					       <div class="col-md-6  inputGroupContainer">
					       
					          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
					            <input  name="first_name" placeholder="1인분당 칼로리 작성" class="form-control"  type="text" style="hegint:70px;"> 
					           
					                        	<b style="margin-left: 20px;">kcal</b> 
					             <button type="submit" class="btn btn-warning" style="width:50x; height: 35px; margin-left: 20px;"onclick="window.location='personalCare'" >저장 <span class="glyphicon glyphicon-send"></span></button>
					          </div>
					        </div>
					      </div>
					      </div>
					      </fieldset>
					   
					   </fieldset>
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