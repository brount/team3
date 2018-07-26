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
						
						      <legend>개인건강관리페이지</legend>
						<c:if test="${selectcnt!=0}">
							 <div class="form-group">
						        <label class="col-md-4 control-label">생년월일</label>
						        <div class="col-md-6  inputGroupContainer">
									<div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
						           ${vo.birth1}
						         		<b>년</b> 
						           ${vo.birth2}
						    		       <b>월</b> 	
						           ${vo.birth3}
						             	<b>일</b> 
						         </div>
						        </div>
						     
						      </div>
						        
						   
						      <div class="form-group" >
						        <label class="col-md-4 control-label">신장</label>
						        <div class="col-md-6  inputGroupContainer">
						          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
									${vo.height}						            	
									<b>cm</b> 
						            
						          </div>
						        </div>
						      </div>
						      
						         <div class="form-group" >
						        <label class="col-md-4 control-label">체중</label>
						        <div class="col-md-6  inputGroupContainer">
						          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
						            	    ${vo.weight}
						            	<b>kg</b> 
						            
						          </div>
						        </div>
						      </div>
						  
						         <div class="form-group" >
						        <label class="col-md-4 control-label"> 나의 신체질량지수(BMI)</label>
						        <div class="col-md-6  inputGroupContainer">
						          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
						          ${vo.weight/(vo.height*vo.height)}		
						          </div>
						        </div>
						      </div>
						</c:if>
						<div style="display:table; margin:0 auto;">
							<div>
							<c:if test="${selectcnt==0}">
								<button type="button" class="btn btn-warning" onclick="window.location='personalAdd'"> 내 건강정보 등록하기 <span class="glyphicon glyphicon-send"></span></button>
						  		</c:if>
						  			<c:if test="${selectcnt!=0}">
								 <button type="button" class="btn btn-warning" onclick="window.location='personalMof'"> 내 건강정보 수정하기 <span class="glyphicon glyphicon-send"></span></button>
						  		</c:if>
						  		<button type="button" class="btn btn-warning" onclick="window.location='caloryAdd'"> 음식 등록하기 <span class="glyphicon glyphicon-send"></span></button>
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
 


</body>
</html>