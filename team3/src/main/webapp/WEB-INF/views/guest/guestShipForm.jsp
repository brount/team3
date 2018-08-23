<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html class="no-js" lang="en">
<title>사이트이름</title>
<link href="resources/djcss/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="resources/djcss/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/style.css" rel="stylesheet" type="text/css" />
<script src="/medical/resources/djcss/dj.js"></script>
<script type="text/javascript">

function inputCheck() {
	if (!document.inputform.id.value) {
		alert(msg_id);
		document.inputform.id.focus();
		return false;
	} else if (!document.inputform.password.value) {
		alert(msg_pwd);
		document.inputform.password.focus();
		return false;
	} else if (!document.inputform.confirmPassword.value) {
		alert(msg_repwd);
		document.inputform.confirmPassword.focus();
		return false;
	} else if (document.inputform.password.value != document.inputform.confirmPassword.value) {
		alert(msg_pwdChk);
		document.inputform.confirmPassword.focus();
		return false;
	} else if (!document.inputform.name.value) {
		alert(msg_name);
		document.inputform.name.focus();
		return false;
	} else if (!document.inputform.jumin1.value) {
		alert(msg_brith);
		document.inputform.jumin1.focus();
		return false;
	} else if (!document.inputform.jumin2.value) {
		alert(msg_brith);
		document.inputform.jumin2.focus();
		return false;
	} else if (!document.inputform.phone1.value) {
		alert(msg_hp);
		document.inputform.phone1.focus();
		return false;
	} else if (!document.inputform.phone2.value) {
		alert(msg_hp);
		document.inputform.phone2.focus();
		return false;
	} else if (!document.inputform.phone3.value) {
		alert(msg_hp);
		document.inputform.phone3.focus();
		return false;
	} else if (!document.inputform.email1.value) {
		alert(msg_email);
		document.inputform.email1.focus();
		return false;
		// email2값이 null일 때 && email3의 값이 직접입력일때
	} else if (!document.inputform.email2.value && document.inputform.email3.value == 0) {
		alert(msg_email);
		document.inputform.email2.focus();
		return false;
	} else if (!document.inputform.address1.value) {
		alert(msg_address);
		document.inputform.address1.focus();
		return false;

	} else if (!document.inputform.address2.value) {
		alert(msg_address);
		document.inputform.address2.focus();
		return false;
	} else if (!document.inputform.address3.value) {
		alert(msg_address);
		document.inputform.address3.focus();
		return false;

	} else if (document.inputform.hiddenEmail.value == 0) {
		alert("이메일 인증이 필요합니다~!");

		return false;

	} else if (document.inputform.hiddenId.value == 0) {
		alert(msg_confirmId);
		document.inputform.dupChk.focus();
		return false;
	}

}

</script>
<body>
	<header>
		<%@ include file="../common/header.jsp"%>
	</header>
	
	<%@ include file="../common/line.jsp"%>

	<section>
		<div style="display: table; margin: 0 auto;">
			<div class="well">

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
														+ data.buildingName
														: data.buildingName);

											}
											fullAddr += (extraAddr !== '' ? '('
													+ extraAddr + ')' : '');

										}
										document
												.getElementById('sample6_postcode').value = data.zonecode;
										document
												.getElementById('sample6_address').value = fullAddr;

										document.getElementById(
												'sample6_address2').focus();
									}
								}).open();

					}
					
					function onlyNumber(obj) {
						$(obj).keyup(function(){
							$(this).val($(this).val().replace(/[^0-9]/g,""));
					    });
					}
				</script>

				<form class="form-horizontal" action="guestShipPro" method="post"
					id="reg_form" name="inputform" onsubmit="return inputCheck();">
					<input type="hidden" name="hiddenId" value="0">
					<input type="hidden" name="hiddenEmail" value="0">
					<fieldset>

						<!-- Form Name -->
						<legend>회원가입</legend>

						<!-- 아이디-->

						<div class="form-group">
							<label class="col-md-4 control-label">아이디</label>

							<div class="col-md-6  inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon">
									<i class="glyphicon glyphicon-user"></i></span>
									<input name="id" placeholder="아이디 입력" class="form-control" type="text"
										style="hegint: 70px;" required>
									<input type="button"  class="btn btn-dark-blue" value="중복확인" name="dupChk"
										onclick="confirmId();">
								</div>
							</div>
						</div>

						<div class="form-group has-feedback">
							<label for="password" class="col-md-4 control-label">
								비밀번호 </label>
							<div class="col-md-6  inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon">
									<i class="glyphicon glyphicon-home"></i></span>
									<input class="form-control" id="userPw" type="password"
										placeholder="패스워드 입력" name="password" data-minLength="5"
										data-error="some error" required /> 
									<span class="glyphicon form-control-feedback"></span>
									<span class="help-block with-errors"></span>
								</div>
							</div>
						</div>

						<div class="form-group has-feedback">
							<label for="confirmPassword" class="col-md-4 control-label">
								비밀번호 확인 </label>
							<div class="col-md-6  inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon">
									<i class="glyphicon glyphicon-home"></i></span>
									<input class="form-control {$borderColor}" id="userPw2"
										type="password" placeholder="패스워드 재입력"
										name="confirmPassword" data-match="#confirmPassword"
										data-minLength="5" data-match-error="some error 2" required />
									<span class="glyphicon form-control-feedback"></span> 
									<span class="help-block with-errors"></span>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">이름</label>

							<div class="col-md-6  inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon">
									<i class="glyphicon glyphicon-user"></i></span>
									<input name="name" placeholder="이름 입력" class="form-control" type="text"
										style="hegint: 70px;" required>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">주민등록번호</label>
							<div class="col-md-6  inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon">
									<i class="glyphicon glyphicon-earphone"></i></span>
									<input name="jumin1" placeholder="주민번호 입력" class="form-control" type="text"
										style="width: 30px;" maxlength="6" onkeyup="nextJumin1();" onkeydown="onlyNumber(this)" required>
									- 
									<input name="jumin2" placeholder="*******"
										class="form-control" type="password" style="width: 50px;"
										maxlength="7" onkeyup="nextJumin2();" onkeydown="onlyNumber(this)" required>
								</div>
							</div>
						</div>
						
					</fieldset>
					<legend> 추가입력 정보</legend>
					<fieldset>
						<div class="form-group">
							<label class="col-md-4 control-label">연락처</label>
							<div class="col-md-6  inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon">
									<i class="glyphicon glyphicon-earphone"></i></span>
									<input name="phone1" placeholder="전화 " class="form-control" type="text"
										style="width: 30px;" maxlength="3" onkeyup="nextHp1();" onkeydown="onlyNumber(this)" required>
									- 
									<input name="phone2" placeholder="번호" class="form-control" type="text"
										style="width: 50px;" maxlength="4" onkeyup="nextHp2();" onkeydown="onlyNumber(this)" required> 
									- 
									<input name="phone3" placeholder="입력" class="form-control" type="text" style="width: 50px;"
										maxlength="4" onkeyup="nextHp3();" onkeydown="onlyNumber(this)" required>
								</div>
							</div>
						</div>

						<!-- Text input-->

						<div class="form-group">
							<label class="col-md-4 control-label">주소</label>
							<div class="col-md-6  inputGroupContainer">
								<input type="button" onclick="addressSearch();" value="주소찾기"
									 class="btn btn-dark-blue" > 
								<input type="text" name="address1" id="sample6_postcode" placeholder="우편번호"
									size="6" style="padding: 3px" class="form-control" style="width:30px" required>
								<input name="address2" id="sample6_address" placeholder="주소" class="form-control"
									type="text">

								<div class="input-group">
									<span class="input-group-addon">
									<i class="glyphicon glyphicon-home"></i></span>
									<input name="address3" id="sample6_address2" placeholder="상세주소" class="form-control"
										type="text" onchange="addinput();">
									<input type="hidden" name="address">
								</div>
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label">이메일</label>
							<div class="col-md-6  inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon" style="height: 35px;">
									<i class="glyphicon glyphicon-envelope"></i></span>
									<input name="email1" class="form-control" type="text" placeholder="이메일 입력" style="height: 35px;" required> 
									@ 
									<input class="input" type="text" name="email2" style="height: 35px;" required>
									<select name="email3" class="form-control selectpicker" style="width: 200px;" onchange="SelectEmailChk();">
										<option value="0">직접입력</option>
										<option value="gmail.com">구글</option>
										<option value="daum.net">다음</option>
										<option value="naver.com">네이버</option>
									</select> 
									<input  class="btn btn-dark-blue" type="button" value="이메일인증"
										name="echk" onclick="emailchk();">
								</div>
							</div>
						</div>

						<!-- Button -->
						<div class="form-group" style="margin-top: 10px;">
							<div style="display: table; margin: 0 auto;">
								<button type="submit"  class="btn btn-dark-blue" >
									회원가입 <span class="glyphicon glyphicon-send"></span>
								</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>

		</div>
	</section>

	<footer>
		<%@ include file="../common/footer.jsp"%>
	</footer>

</body>
</html>
