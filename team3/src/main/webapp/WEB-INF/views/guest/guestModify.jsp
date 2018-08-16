<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> 사이트이름 </title>
<link href="/medical/resources/djcss/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- <link href="/medical/resources/djcss/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
 --><link href="/medical/resources/djcss/css/style.css" rel="stylesheet" type="text/css" />

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

<script type="text/javascript">
	function check() {
		
	}



</script>






</head>

<body>

<header>
   <%@ include file="../common/header.jsp" %>
</header>
<%@ include file="../common/line.jsp"%>


<!-- 
	2018/07/23 주민, 이메일 , 연락처 컬럼 수정
 -->


<section>
<div class="container">
    <div class="row">
        <div class="col-sm-3 col-md-3">
            <%@ include file="../guest/menuGuest.jsp" %>
        </div>	
	  		 <div class="col-sm-9 col-md-9">
	            <div class="well">
	    <form class="form-horizontal" action="guestModifyPro" method="post"  id="reg_form" onsubmit="return check();">
    <fieldset>
      
      <legend>회원정보수정</legend>
    
      <!-- 아이디-->
      
      <div class="form-group" >
        <label class="col-md-3 control-label" style="font-size: 30;
    font-family: 'Do Hyeon', sans-serif;">아이디</label>
     		${vo.getGuestid()}
      </div>
  
        <div class="form-group has-feedback">
            <label for="password"  class="col-md-3 control-label"> 
             		      비밀번호
                </label>
                <div class="col-md-6  inputGroupContainer">
                <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
            <input class="form-control" id="userPw" type="password" placeholder="password" 
                     value="${vo.getGuestpwd()}"  name="password" data-minLength="5"
                       data-error="some error"
                       required/>
                <span class="glyphicon form-control-feedback"></span>
                <span class="help-block with-errors"></span>
                </div>
             </div>
        </div>
     
        <div class="form-group has-feedback">
            <label for="confirmPassword"  class="col-md-3 control-label">
         		           비밀번호 확인
                </label>
                 <div class="col-md-6  inputGroupContainer">
                <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
            <input class="form-control {$borderColor}" id="userPw2" type="password" placeholder="Confirm password" 
                      value="${vo.getGuestpwd()}"  name="confirmPassword" data-match="#confirmPassword" data-minLength="5"
                       data-match-error="some error 2"
                       required/>
                <span class="glyphicon form-control-feedback"></span>
                <span class="help-block with-errors"></span>
      			 </div>
             </div>
        </div>
     
         <div class="form-group" >
        <label class="col-md-3 control-label">이름</label>
  		
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  	${vo.getGuestname()}
          </div>
        </div>
      </div>
        
        
        
         <div class="form-group">
        <label class="col-md-3 control-label">주민등록번호</label>
                 
        
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
		  ${vo.getJumin()}       
  </div>
        </div>
      </div>
        
        
       </fieldset>
       	<legend> 추가입력 정보</legend>
        <fieldset>
          <div class="form-group">
        <label class="col-md-3 control-label">연락처</label>
        <div class="col-md-6  inputGroupContainer">
  	        <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
	<c:if test="${vo.getGuesttel() == null}">
		 					<input class="input" type="text" name = "phone1" maxlength="3" style="width:80px">
		 					-
		 					<input class="input" type="text" name = "phone2" maxlength="3" style="width:80px">
		 					-
		 					<input class="input" type="text" name = "phone3" maxlength="3" style="width:80px">
		 				</c:if>
		 				<c:if test="${vo.getGuesttel() != null}">
		 				<c:set var="hpArr" value="${fn:split(vo.getGuesttel(),'-')}" />
		 					
		 					<input class="input" type="text" name = "phone1" maxlength="3" style="width:80px"
		 						value="${hpArr[0]}">
		 					-
		 					<input class="input" type="text" name = "phone2" maxlength="4" style="width:80px"
		 						value="${hpArr[1]}">
		 					-
		 					<input class="input" type="text" name = "phone3" maxlength="4" style="width:80px"
		 						value="${hpArr[2]}">
		 					
		 			</c:if>
	   </div>
        </div>
      </div>
    
      
      <div class="form-group">
        <label class="col-md-3 control-label">주소</label>
        <div class="col-md-6  inputGroupContainer">
       
         <input type="button" onclick="addressSearch();" value="주소찾기"  class="btn btn-dark-blue" >
         <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
        <input type="text" value="${vo.getAddress1()}" name="address1" id="sample6_postcode" placeholder="우편번호" size="6" style="padding:3px"class="form-control" style="width:30px" >
		 <input value="${vo.getAddress2()}" name="address2" id="sample6_address" placeholder="주소" class="form-control" type="text">
          <div class="input-group"> 
           
             <input name="address3"value="${vo.getAddress3()}"   id="sample6_address2"  placeholder="상세주소" class="form-control" type="text" onchange="addinput();">
             <input type="hidden" name="address">
          </div>
        </div>
      </div>
      
        <!-- Text input-->
      <div class="form-group">
        <label class="col-md-3 control-label">이메일</label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
           
		 			<c:set var="emailArr" value="${fn:split(vo.getGuestemail(),'@')}" />	
		 				
		 				<input class="input" type="text" name="email1" maxlength="10"
		 						style="width:100px" value="${emailArr[0]}">
		 				@
		 				<input class="input" type="text" name="email2" maxlength="20"
		 						style="width:150px" value="${emailArr[1]}" >
           
           
           
		 <select name="state" class="form-control selectpicker"  onchange="SelectEmailChk();">
		 
				 			<option value="0">직접입력</option>
		 					<option value="gmail.com">구글</option>
		 					<option value="daum.net">다음</option>
		 					<option value="naver.com">네이버</option>
		 </select>
		 <input   class="btn btn-dark-blue"   type="button" value="이메일인증" name="echk" onclick="emailchk();">
          </div>
        </div>
      </div>
   
      <!-- Button -->
      <div class="form-group">
        <label class="col-md-3 control-label"></label>
        <div class="col-md-4">
          <button type="submit"  class="btn btn-dark-blue"  >수정완료 <span class="glyphicon glyphicon-send"></span></button>
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


<!-- 
<h2>회원정보 수정 폼 페이지</h2>




	<img src="resources/images/Demonstration/guestModify.jpg">
	<br/>
	<input type="button" onclick="window.location='myPage'" value="회원정보수정">
	<input type="button" onclick="window.location='myPage'" value="수정취소">
	<input type="button" onclick="window.location='main'" value="메인페이지">
</body>
</html> -->