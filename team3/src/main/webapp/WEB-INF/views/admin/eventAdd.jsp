<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../admin_setting.jsp" %>
<html>
<head>
<title>관리자 페이지 - 광고관리</title>
</head>
<body>
	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	        <div class="navbar-header">
	            <a class="navbar-brand" href="memberList"> 관리자 </a>
	        </div>
	
	        <ul class="nav navbar-right navbar-top-links">
	        	<li onclick="main">Main</a></li>
	            <li onclick="main"><i class="fa fa-sign-out fa-fw"></i> Logout </a></li>
	        </ul>
	        <!-- /.navbar-top-links -->
	
	        <div class="navbar-default sidebar" role="navigation">
	            <div class="sidebar-nav navbar-collapse">
	                <ul class="nav" id="side-menu">
	                    <li>
                        	<a href="#">회원관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="memberList">일반회원목록</a>
                                </li>
                                <li>
                                    <a href="doctorList">의사회원목록</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
	                    <li>
	                        <a href="hospitalList">병원관리</a>
	                    </li>
	                    
	                    <li>
                        	<a href="#">정보관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="drugList">약정보목록</a>
                                </li>
                                <li>
                                    <a href="diseaseList">질병정보목록</a>
                                </li>
                                <li>
                                    <a href="exerciseList">운동정보목록</a>
                                </li>
                                <li>
                                    <a href="foodList">음식정보목록</a>
                                </li>
                                <li>
                                    <a href="apreventionList">예방정보목록</a>
                                </li>
                                <li>
                                    <a href="requestList">요구사항목록</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
	                    <li>
	                        <a href="eventRequestList">광고관리</a>
	                    </li>
	                    <li>
	                    	<a href="#">결산<span class="fa arrow"></span></a>
	                    	<ul class="nav nav-second-level">
                                <li>
                                    <a href="pointList">포인트결제내역목록</a>
                                </li>
                                <li>
                                    <a href="cashList">현금결제내역목록</a>
                                </li>
                            </ul>
	                    </li>
	                </ul>
	            </div>
	        </div>
	    </nav>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">광고게시</h1>
					<!-- 페이지 제목 -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<section style="padding:2rem 0;">

				<div class="container">
					<div class="col-lg-9">
						<br> <br>


						<form class="form-horizontal" action="adminEventAddPro" method="post" id="reg_form" enctype="multipart/form-data">
					  						      
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
					             <input id="date1"  name="date1" class="form-control" type="date" onchange="date();">
					             <input id="date2" name="date2" class="form-control" type="date">					           
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
									console.log(date1);
									var y = date1.substr(0,4);
									var m = date1.substr(5,2);
									var d = date1.substr(8,2);
									
									var date = new Date(y,m,d);
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
				<div class="row" align="left"></div>
				</section>
				<!-- /.row -->
			</div>
			<!-- /#page-wrapper -->

		</div>
		<!-- /#wrapper -->
	</div>
</body>
</html>