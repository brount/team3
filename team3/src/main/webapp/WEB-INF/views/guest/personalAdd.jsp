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
	            <div class="panel-group" id="accordion">
	                <div class="panel panel-default">
	                    <div class="panel-heading">
	                        <h4 class="panel-title">
	                            <a href="exerciseInfoList">운동정보</a>
	                        </h4>
	                    </div>                   
	                </div>
	                <div class="panel panel-default">
	                    <div class="panel-heading">
	                        <h4 class="panel-title">
	                            <a href="foodInfoList">음식정보</a>
	                        </h4>
	                    </div>
	                </div>
	                <div class="panel panel-default">
	                    <div class="panel-heading">
	                        <h4 class="panel-title">
	                            <a href="personalCare">개인건강관리</a>
	                        </h4>
	                    </div>
	                </div>
	            </div>
	        </div>
  		 	<div class="col-sm-9 col-md-9">
	            <div class="well">
		            <div class="container">
						  <form class="form-horizontal" action=" " method="post"  id="reg_form">
						    <fieldset>
						
						      <legend>나의 건강정보 등록하기</legend>
						 
						   <div class="form-group" >
						        <label class="col-md-4 control-label">성별</label>
						        <div class="col-md-6  inputGroupContainer">
						          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
						          
						            <label style="margin-left: 10px;margin-right: 10px;">
									    <input type="radio" class="option-input radio" name="m" checked />
									  여자
									  </label>
									    <label style="margin-left: 10px;margin-right: 10px;">
									    <input type="radio" class="option-input radio" name="m" />
									  남자
									  </label>
									  
						          </div>
						        </div>
						      </div>
						   
						      <div class="form-group" >
						        <label class="col-md-4 control-label">신장</label>
						        <div class="col-md-6  inputGroupContainer">
						          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
						            <input  name="first_name" placeholder="163" class="form-control"  type="text" style="hegint:70px;"> 
						            	<b>cm</b> 
						            
						          </div>
						        </div>
						      </div>
						      
						         <div class="form-group" >
						        <label class="col-md-4 control-label">체중</label>
						        <div class="col-md-6  inputGroupContainer">
						          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
						            <input  name="first_name" placeholder="46" class="form-control"  type="text" style="width:50px;"> 
						            	<b>kg</b> 
						            
						          </div>
						        </div>
						      </div>
						  
						         <div class="form-group" >
						        <label class="col-md-4 control-label">나이</label>
						        <div class="col-md-6  inputGroupContainer">
						          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
						            <input  name="first_name" placeholder="25" class="form-control"  type="text" style="width:50px;"> 
						            	<b>세(만)</b> 
						            
						          </div>
						        </div>
						      </div>
						 
						   <div class="form-group">
						        <label class="col-md-4 control-label"></label>
						        <div class="col-md-4">
						          <button type="submit" class="btn btn-warning" >등록하기<span class="glyphicon glyphicon-send"></span></button>
						        </div>
						      </div>
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
 

<!-- 


	<img src="resources/images/Demonstration/personalAdd.jpg">
	<input type="button" onclick="window.location='main'" value="등록">
	<input type="button" onclick="window.location='main'" value="취소">
	<input type="button" onclick="window.location='personalCare'" value="이전">
	<input type="button" onclick="window.location='main'" value="메인페이지"> -->
</body>
</html>