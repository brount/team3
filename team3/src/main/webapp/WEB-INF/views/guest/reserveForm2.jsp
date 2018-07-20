<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
<!DOCTYPE html PUBLIC"-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

 -->

<html  class="no-js" lang="en" >
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> 사이트이름 </title>
<link href="/medical/resources/djcss/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
            $(function () {
                $("#datepicker").datepicker();
            });
</script>


<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />

<script  type="text/javascript" src="/medical/resources/djcss/css/calendar.js"></script>

</head>

<body>

<header>
   <%@ include file="../common/header.jsp" %>
</header>

<section>
<div class="container">
    <div class="row">
        <div class="col-sm-3 col-md-3">
        	<div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a href="reserveForm">병원예약</a>
                        </h4>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a href="reserveForm">클리닉예약</a>
                        </h4>
                    </div>
                </div>
            </div>
        </div>	
	 <div class="col-sm-9 col-md-9">

    <div class="well">
 		<form class="form-horizontal" action=" " method="post"  id="reg_form">
		    <fieldset>
		      <legend>진료 예약 </legend><a>김순영 소아과 032-544-8275</a>
		     <div style="margin: 20px 20px;">
		   
		  </div>
		      
		    <div class="form-group">
		    	
		        <label class="col-md-4 control-label">진료과</label>
		        <div class="col-md-6 selectContainer">
		          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
		            <select name="state" class="form-control selectpicker" >
		              <option value=" " >진료과</option>
		              <option>이비인후과</option>
		              <option>내과</option>
		        
		            </select>
		          </div>
		        </div>
		      </div> 
		        <div class="form-group">
		    	
		        <label class="col-md-4 control-label">예약구분</label>
		        <div class="col-md-6 selectContainer">
		          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
		            <select name="state" class="form-control selectpicker" >
		              <option value=" " >진료</option>
		              <option>진료</option>
		        
		            </select>
		          </div>
		        </div>
		      </div> 
		      
		      <!-- Text input-->
		      
		         <div class="form-group">
		        <label class="col-md-4 control-label">예약 일자</label>
		        <div class="col-md-6  inputGroupContainer">
		     <!--     <div id="calendarDiv" style="font-family:Gulim;font-size:9pt; margin-left: 40px;"></div>  -->
		     <div class="wrapper" style="z-index: 100">
		    <input type="text" id="datepicker" placeholder="날짜를 선택하세요." readonly="true" />
		    <i class="ion-calendar" ></i>
		  </div>
		
		        </div>
		      </div>
		         <div class="form-group">
		        <label class="col-md-4 control-label">예약시간</label>
		        <div class="col-md-6 selectContainer">
		          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
		            <select  class="form-control selectpicker" >
		              <option >시</option>
		              <option>오전 9시</option>
		              <option>오전 10시</option>
		              <option>오전 11시</option>
		              <option>오후 12시</option>
		              <option>오후 1시</option>
		              <option>오후 2시</option>
		              <option>오후 3시</option>
		              <option>오후 4시</option>
		              <option>오후 5시</option>
		              <option>오후 6시</option>
		        
		            </select>
		              <select  class="form-control selectpicker" >
		                <option>분</option>
		              	<option>00 분</option>
		                <option>10 분</option>
		                <option>20 분</option>
		                <option>30 분</option>
		                <option>40 분</option>
		                <option>50 분</option>                       
		            </select>
		          </div>
		        </div>
		      </div> 
		       </fieldset>
		       
		       <div>
		       	<legend> 추가입력 정보 </legend>
		        <fieldset>
		        
		         <div class="form-group">
		        <label class="col-md-4 control-label">증상 입력 </label>
		        <div class="col-md-6  inputGroupContainer">
		          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
		            <textarea class="form-control" name="comment" placeholder="About "></textarea>
		          </div>
		        </div>
		      </div>
		      
		         <div class="form-group">
		        <label class="col-md-4 control-label">증상 체크</label>
		        <div class="col-md-6  inputGroupContainer">
		          <div class="input-group"> 
		          
						<div style="margin-left: 10px;">
						
						  <label>
						    <input type="checkbox" class="option-input checkbox"  />
							두통
						  </label>
						  <label>
						    <input type="checkbox" class="option-input checkbox" />
							    발열
						  </label>
						  <label>
						    <input type="checkbox" class="option-input checkbox" />
						    기침
						  </label>
						 <label>
						    <input type="checkbox" class="option-input checkbox" />
						메스꺼움
						  </label>
						   <label>
						    <input type="checkbox" class="option-input checkbox" />
						   복통
						  </label>
						   <label>
						    <input type="checkbox" class="option-input checkbox" />
						    구토
						  </label>
		 					<label>
						    <input type="checkbox" class="option-input checkbox" />
						  설사
						  </label>
						   <label>
						    <input type="checkbox" class="option-input checkbox" />
						    근육통
						  </label>
						  <label>
						    <input type="checkbox" class="option-input checkbox" />
						    인후통
						  </label>
						  
		          </div>
		        </div>
		      </div>
		</div>
		    </div>
		  
		      <div class="form-group">
		        <div style="display:table; margin:0 auto">
		          <button type="submit" class="btn btn-warning">예약 <span class="glyphicon glyphicon-send"></span></button>
		        </div>
		      </div>
		    </fieldset>
		  </form>
		</div>
		
		<script>
		    $.datepicker.setDefaults({
		      closeText: "닫기",
		      prevText: "이전달",
		      nextText: "다음달",
		      currentText: "오늘",
		      monthNames: ["1월", "2월", "3월", "4월", "5월", "6월",
		        "7월", "8월", "9월", "10월", "11월", "12월"
		      ],
		      monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월",
		        "7월", "8월", "9월", "10월", "11월", "12월"
		      ],
		      dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
		      dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
		      dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
		      weekHeader: "주",
		      dateFormat: "yy년 m월 d일",
		      firstDay: 0,
		      isRTL: false,
		      showMonthAfterYear: true,
		      yearSuffix: "년"
		    })
		    $("#datepicker").datepicker({
		      minDate: 0,
		      /* to use in wix */
		      onSelect: function (selected, event) {
		        console.log(selected);
		        /* 
		         * wix-send-messages from html component
		         * https://support.wix.com/en/article/working-with-the-html-component-in-wix-code
		         */
		        window.parent.postMessage(selected, "*");
		      }
		    })
		  </script>

			</div>
              </div>                    
      </div>

</section>
<footer>
   <%@ include file="../common/footer.jsp" %>
</footer>



	<!-- <img src="resources/images/Demonstration/reserveForm.jpg">
	<input type="button" onclick="window.location='main'" value="메인페이지">
	<input type="button" onclick="window.location='reserveList'" value="등록">
	<input type="button" onclick="window.location='reserveList'" value="취소"> -->
</body>
</html>