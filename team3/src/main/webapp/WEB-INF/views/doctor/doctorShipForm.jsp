<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/setting.jsp"%>
<html class="no-js" lang="en">
<link href="/medical/resources/djcss/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/style.css" rel="stylesheet" type="text/css" />

<script>
	// 키 입력시 한글 입력 불가
	function onlyNumber(obj) {
		$(obj).keyup(function(){
			// 한글 입력시 공백으로 변경
			$(this).val($(this).val().replace(/[^0-9]/g,""));
	    });
	}
</script>

<body>

	<header>
		<%@ include file="../common/header.jsp"%>
	</header>
	
	<%@ include file="../common/line.jsp"%>

	<section>
		<div style="display: table; margin: 0 auto;">
			<div class="well" style="width: 1021px;">
				<form class="form-horizontal" action="inputPro" method="post"
					name="reg_form" enctype="multipart/form-data" onsubmit="return inputCheck()">
					<input type="hidden" name="hiddenId" value="0"> 
					<input type="hidden" name="hiddenEmail" value=0>

					<fieldset>

						<!-- Form Name -->
						<legend> 회원 가입 </legend>

						<!-- Text input-->

						<div class="form-group" style="margin-top: 16px;">
							<label class="col-md-4 control-label">아이디</label>

							<div class="col-md-6  inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-user"></i></span>
									 <input name="id"placeholder="아이디를 입력해주세요"class="form-control"type="text">
									<input name="dupchk" type="button" value="중복확인" class="btn btn-dark-blue"
										onclick="doctorconfirmId();">
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
										placeholder="비밀번호를 입력해주세요" name="password" data-minLength="5"
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
										type="password" placeholder="비밀번호를 다시 입력해주세요"
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
									<input name="name" placeholder="이름을 입력해주세요" class="form-control" type="text">
								</div>
							</div>
						</div>

						<!-- Text input-->

						<div class="form-group">
							<label class="col-md-4 control-label">휴대 전화</label>
							<div class="col-md-6  inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon">
									<i class="glyphicon glyphicon-earphone"></i></span>
									<input name="phone" placeholder=" '-' 없이 입력해 주세요" class="form-control"
										type="text" maxlength="11" onkeydown="onlyNumber(this)">
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">이메일</label>
							<div class="col-md-6  inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon">
									<i class="glyphicon glyphicon-envelope"></i></span>
									<input name="email" placeholder="이메일을 입력해주세요" class="form-control" type="email">
									<input type="button" value="인증" class="btn btn-dark-blue" onclick="emailC();">
										<!-- <script type="text/javascript">
											function emailC(){
												window.open(url,"emailCheck",
														"menubar=no,width=300,height=200");
											}
										</script> -->
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-md-4 control-label">근무병원 찾기</label>
							<div class="col-md-6  inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span> 
									<input name="hospital"class="form-control" type="text" style="padding: 1px;">
									<input name="hospitalno" type="hidden" value="">
									<input name="hosSearch" type="button" value="병원찾기" class="btn btn-dark-blue"
										onclick="window.open('hosSearch','이름','menubar=no, width=500, height=700');">									
								</div>
							</div>
						</div>

						<!-- Text area -->

						<div class="form-group">
							<label class="col-md-4 control-label">전문분야</label>
							<div class="col-md-6  inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon">
									<i class="glyphicon glyphicon-pencil"></i></span>
										<select name = "specialism" >
											<option value = "1">내과</option>
											<option value = "2">이비인후과</option>
											<option value = "3">정신의학과</option>
											<option value = "4">외과</option>
											<option value = "5">치과</option>
										</select>
									<!-- <textarea class="form-control" name="specialism"
										placeholder="전문분야를 적어주세요 "></textarea> -->
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">의사 면허증</label>
							<div class="col-md-6  inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon">
									<i class="glyphicon glyphicon-pencil"></i></span>
									<input name="file" class="form-control" type="file" style="padding: 1px; font-size: 17px;">
								</div>
							</div>
						</div>

						<!-- Button -->
						<div class="form-group">
							<div style="margin: 0 auto; display: table;">
								<button type="submit" class="btn btn-dark-blue" style="margin-right: 5px;">
									회원 가입<span class="glyphicon glyphicon-send"></span>
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