<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<title> 사이트 이름 </title>
<body onload="dateC();">

<header>
	<%@ include file="../common/header.jsp" %>
</header>
<%@ include file="../common/line.jsp"%>

<section>
<div class="container" >
	    <div class="row">
	        <div class="col-sm-3 col-md-3">
	            <%@ include file="../common/menuEvent.jsp" %>
	        </div>
  		 	<div class="col-sm-9 col-md-9">
	            <div class="well">
		            <div>
					  <form class="form-horizontal" action="eventAdd" method="post" id="reg_form" enctype="multipart/form-data">
					      <input type="hidden" name="id" value="${id}">
					      <fieldset>
					      <!-- Form Name -->
					      <legend> 프로모션 신청 페이지 </legend>
					      <!-- Text input-->
					      아래 내용을 바탕으로 이벤트 페이지 및 배너 게재를 요청합니다<br><br>
					      
					      <div class="form-group">
					        <label class="col-md-3 control-label">제목</label>
					        <div class="col-md-7 inputGroupContainer">
					          <div class="input-group"> <span class="input-group-addon" style="width:40px;"><i class="glyphicon glyphicon-user"></i></span>
					            <input name="title" placeholder="제목을 입력해주세요" class="form-control" type="text" required>
					          </div>
					        </div>
					      </div>
					      
					      <div class="form-group">
					        <label class="col-md-3 control-label">이벤트 기간 </label>
					        <div class="col-md-7 inputGroupContainer">
					          <div class="input-group"> <span class="input-group-addon" style="width:40px;"><i class="glyphicon glyphicon-pencil"></i></span>
					             <input id="date1" name="date1" class="form-control" type="date" onchange="date();" style="font-size: 20px;" required>
					             <input id="date2" name="date2" class="form-control" type="date" style="font-size: 20px;" readonly="readonly">					           
					          </div>		
					             <input type="radio" name="point" value="1000" checked="checked">7일
					          	<input type="radio" name="point" value="2000" >15일
					          	<input type="radio" name="point" value="3500">30일		          
					          <script type="text/javascript">
								function dateC(){		
									var formattedDate = new Date();
									var d = formattedDate.getDate();
									var m = formattedDate.getMonth();
									
									(++m < 10)? m = "0" + m : m;
									(d < 10)? d = "0" + d : d;
									var y = formattedDate.getFullYear(); 
									$("#date1").val(y + "-" + m + "-" + d);
									var d2 = Number(d)+7;
									if( d2<10){
										d2 = "0"+d2;
									}
									$("#date2").val(y + "-" + m + "-" + d2);
					          	}
								function date(){
									var date1 = $("#date1").val();
									
									var y = date1.substr(0,4);
									var m = date1.substr(5,2);
									var d = date1.substr(8,2);
									
									var date = new Date(y,m,d);
									
									var formattedDate = new Date();
									var fy = formattedDate.getFullYear();
									var fm = formattedDate.getMonth();
									var fd = formattedDate.getDate();
									(++fm < 10)? fm = "0" + fm : fm;
									(fd < 10)? fd = "0" + fd : fd;
									
									if ((y*1) < (fy*1)) {
										alert("이전 연도 선택 불가능");
										$("#date1").val(fy + "-" + fm + "-" + fd);
										$("input[checked=checked]").prop('checked', true);
										var d2 = Number(fd)+7;
										if (d2<10){
											d2 = "0"+d2;
										}
										$("#date2").val(fy + "-" + fm + "-" + d2);
										return false;
									} else if ((m*1) < (fm*1)) {
										alert("이전 월 선택 불가능");
										$("#date1").val(fy + "-" + fm + "-" + fd);
										$("input[checked=checked]").prop('checked', true);
										var d2 = Number(fd)+7;
										if (d2<10){
											d2 = "0"+d2;
										}
										$("#date2").val(fy + "-" + fm + "-" + d2);
										return false;
									} else if ((d*1) < (fd*1)) {
										alert("이전 날짜 선택 불가능");
										$("#date1").val(fy + "-" + fm + "-" + fd);
										$("input[checked=checked]").prop('checked', true);
										var d2 = Number(fd)+7;
										if (d2<10){
											d2 = "0"+d2;
										}
										$("#date2").val(fy + "-" + fm + "-" + d2);
										return false;
									}
									
									$("input[checked=checked]").prop('checked', true);
									date.setDate(date.getDate()+7);  
									(d < 10)? d = "0" + d : d;
									
									 // year
								    var yyyy = '' + date.getFullYear();

								    // month
								    var mm = ('0' + (date.getMonth()));  // prepend 0 // +1 is because Jan is 0
								    mm = mm.substr(mm.length - 2);                  // take last 2 chars

								    // day
								    var dd = ('0' + date.getDate());         // prepend 0
								    dd = dd.substr(dd.length - 2);                  // take last 2 chars
								    
									var date2 = yyyy+"-"+mm+"-"+dd;
									$("#date2").val(date2);
								}
								$("input[name=point]").click(function(){
									var date1 = $("#date1").val();
									console.log(date1);
									var y = date1.substr(0,4);
									var m = date1.substr(5,2);
									var d = date1.substr(8,2);
									var date = new Date(y,m,d);
									switch($(this).val()){
										case "1000" :
											date.setDate(date.getDate()+7);  
											break;
										case "2000" :
											date.setDate(date.getDate()+15);  
											break;
										case "3500" :
											date.setDate(date.getDate()+30);
											break;
									}
									(d < 10)? d = "0" + d : d;
									
									 // year
								    var yyyy = '' + date.getFullYear();

								    // month
								    var mm = ('0' + (date.getMonth()));  // prepend 0 // +1 is because Jan is 0
								    mm = mm.substr(mm.length - 2);                  // take last 2 chars

								    // day
								    var dd = ('0' + date.getDate());         // prepend 0
								    dd = dd.substr(dd.length - 2);                  // take last 2 chars
								    
									var date2 = yyyy+"-"+mm+"-"+dd;
									$("#date2").val(date2);										
									
								})
								
					          </script>
					        </div>
					      </div>
					      
					      <div class="form-group">
					        <label class="col-md-3 control-label">썸네일 이미지</label>
					        <div class="col-md-7 inputGroupContainer">
					          <div class="input-group"> <span class="input-group-addon" style="width:40px;"><i class="glyphicon glyphicon-pencil"></i></span>
					            <input  name="thumbnail" class="form-control"  type="file" style="padding:1px; font-size: 16px;" required>
					          </div>
					        </div>
					      </div>
					      
					      <div class="form-group">
					        <label class="col-md-3 control-label">이벤트 이미지</label>
					        <div class="col-md-7 inputGroupContainer">
					          <div class="input-group"> <span class="input-group-addon" style="width:40px;"><i class="glyphicon glyphicon-pencil"></i></span>
					            <input  name="image" class="form-control"  type="file" style="padding:1px; font-size: 16px;" required>
					          </div>
					        </div>
					      </div>
					      
					      <div class="form-group">
					        <label class="col-md-3 control-label">이벤트 내용 </label>
					        <div class="col-md-7 inputGroupContainer">
					          <div class="input-group"> <span class="input-group-addon" style="width:40px;"><i class="glyphicon glyphicon-pencil"></i></span>
					            <textarea class="form-control" rows="8" name="content" placeholder="이벤트 내용을 적어주세요 " style="resize: none;" required></textarea>
					          </div>
					        </div>
					      </div>
					      
					      <input name="kind" type="hidden" value="1">		
					      <!-- Text input-->
					      
					      <!-- Button -->
					      <div class="form-group">
					        <div style="display:table; margin:0 auto;">
					          <button type="submit" class="btn btn-dark-blue" style="margin-right:5px;">신청 <span class="glyphicon glyphicon-send"></span></button>
					          <button type="reset" class="btn btn-dark-blue" >취소 <span class="glyphicon glyphicon-send"></span></button>
					          <button type="button" class="btn btn-dark-blue" style="margin-left:5px" onclick="window.location='eventList'">메인 <span class="glyphicon glyphicon-send"></span></button>
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
	<%@ include file="../common/footer.jsp"%>
</footer>
</body>
</html>
