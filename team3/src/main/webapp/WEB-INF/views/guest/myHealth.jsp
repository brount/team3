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
	                            <a data-toggle="collapse" data-parent="#accordion" href="#">마이페이지</a>
	                        </h4>
	                    </div>
	                    <div id="collapseOne" class="panel-collapse collapse in collapse show">
	                        <div class="panel-body">
	                            <table class="table">
	                                <tr>
	                                    <td>
	                                        <a href="myHealth">내 건강정보</a>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td>
	                                        <a href="checkupRegister">검진서등록</a>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td>
	                                        <a href="checkAnalyze">내 검진결과</a>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td>
	                                       <a href="#">내 질문목록</a>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td>
	                                        <a href="reserveList">예약목록</a>
	                                    </td>
	                                </tr>
	                            </table>
	                        </div>
	                    </div>
	                </div>
	                <div class="panel panel-default">
	                    <div class="panel-heading">
	                        <h4 class="panel-title">
	                            <a href="bookMark">즐겨찾는병원</a>
	                        </h4>
	                    </div>
	                </div>
	                <div class="panel panel-default">
	                    <div class="panel-heading">
	                        <h4 class="panel-title">
	                            <a href="guestModify">회원정보수정</a>
	                        </h4>
	                    </div>
	                </div>
	                <div class="panel panel-default">
	                    <div class="panel-heading">
	                        <h4 class="panel-title">
	                            <a href="memberExit">회원탈퇴</a>
	                        </h4>
	                    </div>
	                </div>
	            </div>
	        </div>	
		  		 <div class="col-sm-9 col-md-9">
		            <div class="well">
		                <form class="form-horizontal" action=" " method="post"  id="reg_form">
	    <fieldset>
	
	      <legend>My Health</legend>뿌링클
	    
		 <div class="form-group">
	        <label class="col-md-3 control-label">생년월일</label>
	        <div class="col-md-6  inputGroupContainer">
	          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
	            <input name="phone1" placeholder="1994" class="form-control" type="text" style="width:30px; margin-right: 10px;">
	          		<b>년</b> 
	             <input name="phone2" placeholder="01" class="form-control" type="text" style="width:50px; margin-right: 10px;" >
	     		       <b>월</b> 	
	              <input name="phone3" placeholder="13" class="form-control" type="text" style="width:50px; margin-right: 10px;">
	              	<b>일</b> 
	          </div>
	        </div>
	     
	      </div>
	        
	   
	      <div class="form-group" >
	        <label class="col-md-3 control-label">신장</label>
	        <div class="col-md-6  inputGroupContainer">
	          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
	            <input  name="first_name" placeholder="163" class="form-control"  type="text" style="hegint:70px;"> 
	            	<b>cm</b> 
	            
	          </div>
	        </div>
	      </div>
	      
	         <div class="form-group" >
	        <label class="col-md-3 control-label">체중</label>
	        <div class="col-md-6  inputGroupContainer">
	          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
	            <input  name="first_name" placeholder="46" class="form-control"  type="text" style="width:50px;"> 
	            	<b>kg</b> 
	            
	          </div>
	        </div>
	      </div>
	 
	         <div class="form-group" >
	        <label class="col-md-3 control-label">혈액형</label>
	        <div class="col-md-7  inputGroupContainer">
	          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
	          
	            <label style="margin-left: 10px;margin-right: 10px;">
				    <input type="radio" class="option-input radio" name="b" checked />
				    A형
				  </label>
				    <label style="margin-left: 10px;margin-right: 10px;">
				    <input type="radio" class="option-input radio" name="b" />
				  B형
				  </label>
				     <label style="margin-left: 10px;margin-right: 10px;">
				    <input type="radio" class="option-input radio" name="b" />
				   AB형
				  </label>
				   <label style="margin-left: 10px;margin-right: 10px;">
				    <input type="radio" class="option-input radio" name="b" />
				   O형
				  </label>
	          </div>
	        </div>
	      </div>
	  
	   <div class="form-group" >
	        <label class="col-md-3 control-label">성별</label>
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