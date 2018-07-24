<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<title> 사이트 이름 </title>
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
	                            <a href="eventList">이벤트</a>
	                        </h4>
	                    </div>                   
	                </div>
	             </div>
	        </div>
  		 	<div class="col-sm-9 col-md-9">
	            <div class="well">
		            <div>
					  <form class="form-horizontal" action="eventAdd" method="post" id="reg_form" enctype="multipart/form-data">
					  	
					      <input type="hidden" name="id" value="${id}">
					      
					      <fieldset>
					      
					      <!-- Form Name -->
					      <legend> 이벤트 신청 페이지 </legend>
					    
					      <!-- Text input-->
					      아래 내용을 바탕으로 이벤트 페이지 및 배너 게재를 요청합니다<br><br>
					      
					      <div class="form-group">
					        <label class="col-md-4 control-label">제목</label>
					        <div class="col-md-6  inputGroupContainer">
					          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
					            <input name="title" placeholder="제목을 입력해주세요" class="form-control" type="text">
					          </div>
					        </div>
					      </div>
					      
					      <div class="form-group">
					        <label class="col-md-4 control-label">이벤트 기간 </label>
					        <div class="col-md-6  inputGroupContainer">
					          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
					             <input  name="date1" class="form-control" type="date">
					             <input  name="date2" class="form-control" type="date">
					          </div>
					        </div>
					      </div>
					      
					      <div class="form-group">
					        <label class="col-md-4 control-label">이벤트 썸네일 이미지</label>
					        <div class="col-md-6  inputGroupContainer">
					          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
					            <input  name="thumbnail" class="form-control"  type="file" style="padding:1px;">
					          </div>
					        </div>
					      </div>
					      
					      <div class="form-group">
					        <label class="col-md-4 control-label">이벤트 이미지</label>
					        <div class="col-md-6  inputGroupContainer">
					          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
					            <input  name="image" class="form-control"  type="file" style="padding:1px;">
					          </div>
					        </div>
					      </div>
					      
					      <div class="form-group">
					        <label class="col-md-4 control-label">이벤트 내용 </label>
					        <div class="col-md-6  inputGroupContainer">
					          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
					            <textarea class="form-control" rows="8" name="content" placeholder="이벤트 내용을 적어주세요 " style="resize: none;"></textarea>
					          </div>
					        </div>
					      </div>
					      
					        <div class="form-group">
					        <label class="col-md-4 control-label">이벤트 종류</label>
					        <div class="col-md-6 selectContainer">
					          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
					            <select name="kind" class="form-control selectpicker" >
					              <option value="" >이벤트 종류를 선택해주세요</option>
					              <option value="1">광고</option> <!-- 광고 신청중  -->
					              <option value="2">배너</option>
					            </select>
					          </div>
					        </div>
					      </div>
					    
					      <!-- Text input-->
					      
					      <!-- Button -->
					      <div class="form-group">
					        <div style="display:table; margin:0 auto;">
					          <button type="submit" class="btn btn-warning" style="margin-right:5px;">신청 <span class="glyphicon glyphicon-send"></span></button>
					          <button type="reset" class="btn btn-warning" >취소 <span class="glyphicon glyphicon-send"></span></button>
					          <button type="button" class="btn btn-warning" style="margin-left:5px" onclick="window.location='eventList'">메인 <span class="glyphicon glyphicon-send"></span></button>
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
</body>
</html>
