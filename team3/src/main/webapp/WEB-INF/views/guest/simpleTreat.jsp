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
<link rel="stylesheet" type="text/css" href="/medical/resources/css/css/default.css" />

<script type="text/javascript">
function simple(){
	   var count = 0;
	   var chk = document.getElementsByName("symptomchk");
	   var symptomchk = "";
	 
	   //선택된거 체크
	   for(var i = 0; i < chk.length; i++){
	      if(chk[i].checked == true){
	         count++;
	         if(symptomchk == ""){
	        	 symptomchk += chk[i].value;
	         }else{
	        	 symptomchk += "," + chk[i].value;
	         }
	      }
	   }
	   
	   if(count == null){
	      alert("증상을 선택하세요");
	      return false;
	   }else{
		   window.location="simpleTreatPro?symptomchk="+symptomchk;
	   }
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
		            <%@ include file="../common/menuHygiene.jsp" %>
		        </div>	
			  		 <div class="col-sm-9 col-md-9">
			            <div class="well">
	        <br>
  <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
  <form class="form-horizontal" action="simpleTreatPro" method="post"  id="reg_form" onsubmit="simple();">
    <fieldset>
      <legend>간단 진료</legend>
   <div class="form-group" >
        <label class="col-md-3 control-label">성별</label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
          
            <label style="margin-left: 10px;margin-right: 10px;">
			    <input type="radio" class="option-input radio"name="gender" value="여자" checked />
			  여자
			  </label>
			    <label style="margin-left: 10px;margin-right: 10px;">
			    <input type="radio" class="option-input radio" name="gender" value="남자" />
			  남자
			  </label>
			  
          </div>
        </div>
      </div>
  
		 <div class="form-group">
	        <label class="col-md-3 control-label">생년월일</label>
	        <div class="col-md-6  inputGroupContainer">
	          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
	            <input name="birth1" placeholder="1994" class="form-control" type="text" style="width:30px; margin-right: 10px;">
	          		<b>년</b> 
	             <input name="birth2" placeholder="01" class="form-control" type="text" style="width:50px; margin-right: 10px;" >
	     		       <b>월</b> 	
	              <input name="birth3" placeholder="13" class="form-control" type="text" style="width:50px; margin-right: 10px;">
	              	<b>일</b> 
	          </div>
	        </div>
	     
	      </div>
         <div class="form-group" >
        <label class="col-md-3 control-label">증상</label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> 
				<div style="margin-left: 10px;">
				 
				  <label>
				    <input type="checkbox" class="option-input checkbox"name="symptomchk" value="두통"/>
					두통
				  </label>
				  <label>
				    <input type="checkbox" class="option-input checkbox"name="symptomchk"  value="발열" />
					    발열
				  </label>
				  <label>
				    <input type="checkbox" class="option-input checkbox"name="symptomchk"  value="기침" />
				    기침
				  </label>
				 <label>
				    <input type="checkbox" class="option-input checkbox"name="symptomchk"  value="메스꺼움"/>
				메스꺼움
				  </label>
				   <label>
				    <input type="checkbox" class="option-input checkbox"name="symptomchk"  value="복통"/>
				   복통
				  </label>
				   <label>
				    <input type="checkbox" class="option-input checkbox"name="symptomchk"  value="구토"/>
				    구토
				  </label>
 					<label>
				    <input type="checkbox" class="option-input checkbox"name="symptomchk"  value="설사"/>
				  설사
				  </label>
				   <label>
				    <input type="checkbox" class="option-input checkbox"name="symptomchk"  value="근육통"/>
				    근육통
				  </label>
				  <label>
				    <input type="checkbox" class="option-input checkbox"name="symptomchk"  value="인후통"/>
				    인후통
				  </label>
	
          </div>
        </div>
      </div>
</div>
 
      <div style="margin:0 auto; display:table;">
      
      
         <button type="button" class="btn btn-dark-blue" onclick="simple();">검색 <span class="glyphicon glyphicon-send"></span></button>
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