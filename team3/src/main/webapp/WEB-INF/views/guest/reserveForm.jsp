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
<script  type="text/javascript" src="/medical/resources/djcss/css/calendar.js"></script>

<script language="JavaScript"> 
  function showCalendar(y,m,id){ 
    var text = '<table>\n<tr><td colspan=7 style="text-align:center">'; 
    text += '<span style=cursor:pointer title="1년 뒤로" onclick="showCalendar('+(y-1)+','+m+')"> ◀ </span>'; 
    text += '<span style=cursor:pointer title="1개월 뒤로" onclick="showCalendar('+(m==1?(y-1)+','+12:y+','+(m-1))+')"> ◁ </span>'; 
    text += '[' + y + '년 ' + ((m < 10) ? ('0' + m) : m) + '월]'; 
    text += '<span style=cursor:pointer title="1개월 앞으로" onclick="showCalendar('+(m==12?(y+1)+','+1:y+','+(m+1))+')"> ▷ </span>'; 
    text += '<span style=cursor:pointer title="1년 앞으로" onclick="showCalendar('+(y+1)+','+m+')"> ▶ </span>'; 
    text += '</td>'; 

    var d1 = (y+(y-y%4)/4-(y-y%100)/100+(y-y%400)/400 
          +m*2+(m*5-m*5%9)/9-(m<3?y%4||y%100==0&&y%400?2:3:4))%7; 
    for (i = 0; i < 42; i++) { 
        if (i%7==0) text += '</tr>\n<tr>'; 
        if (i < d1 || i >= d1+(m*9-m*9%8)/8%2+(m==2?y%4||y%100==0&&y%400?28:29:30)) 
            text += '<td> </td>'; 
        else 
            text += '<td' + (i%7 ? '' : ' style="color:red;"') + ' style=cursor:pointer onclick=document.getElementById("'+id+'").value='+y+((m<10)?('0'+m):m)+(((i+1-d1)<10)?('0'):'')+(i+1-d1)+';document.getElementById("calendarDiv").style.display="none">'+(i+1-d1)+'</td>';
    } 
    document.getElementById('calendarDiv').style.display='' 
    document.getElementById('calendarDiv').innerHTML = text + '</tr>\n</table>'; 
} 
</script> 

</head>

<body  onload="showCalendar(2018,8)">

<header>
   <%@ include file="../common/header.jsp" %>
</header>


<section>
<div class="container">
<div class="col-lg-9">
	        <br>
  <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- homeyLink -->
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-0173509626327009"
     data-ad-slot="9233259299"
     data-ad-format="link"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>
<br>
 <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function addressSearch() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var fullAddr = '';
						var extraAddr = '';
						if (data.userSelectedType === 'R') {
							fullAddr = data.roadAddress;
						} else {
							fullAddr = data.jibunAddress;
						}

						if (data.userSelectedType === 'R') {
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ','
										+ data.buildingName : data.buildingName);

							}
							fullAddr += (extraAddr !== '' ? '(' + extraAddr
									+ ')' : '');

						}
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById('sample6_address').value = fullAddr;

						document.getElementById('sample6_address2').focus();
					}
				}).open();

	}

</script>

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
        <div class="form-group" style="margin-top:50px;">
    	
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
      
         <div class="form-group" style="margin-top:50px;" >
        <label class="col-md-4 control-label">예약 일자</label>
        <div class="col-md-6  inputGroupContainer">
         <div id="calendarDiv" style="font-family:Gulim;font-size:9pt; margin-left: 40px;"></div> 

	<!-- 	<input   type="text" id="txtDate" value="" onclick="fnPopUpCalendar(txtDate,txtDate,'yyyy/mm/dd')" class='text_box1'> -->
         
        </div>
      </div>
     

         
         <div class="form-group" style="margin-top:50px;" >
    	
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
       	<legend> 추가입력 정보 </legend>
        <fieldset>
        
        
       
         <div class="form-group" style="margin-top:50px;" >
        <label class="col-md-4 control-label">증상 입력 </label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
            <textarea class="form-control" name="comment" placeholder="About "></textarea>
          </div>
        </div>
      </div>
      
         <div class="form-group" style="margin-top:50px;" >
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
    
      
  
      <div class="form-group" style="margin: 50px 50px;">
        <label class="col-md-4 control-label"></label>
        <div class="col-md-4">
          <button type="submit" class="btn btn-warning" >예약 <span class="glyphicon glyphicon-send"></span></button>
        </div>
      </div>
    </fieldset>
  </form>
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