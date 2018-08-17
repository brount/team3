<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/setting.jsp"%>
<html class="no-js" lang="en">
<link href="/medical/resources/djcss/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<!-- <link href="/medical/resources/djcss/css/bootstrap-theme.min.css"
	rel="stylesheet" type="text/css" /> -->
<link href="/medical/resources/djcss/css/style.css" rel="stylesheet"
	type="text/css" />

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
		<div class="container">
    <div class="row">
        <div class="col-sm-3 col-md-3">
            <%@ include file="../doctor/menuDoctor.jsp" %>
            </div>
            <div class="col-sm-9 col-md-9">
            <div class="well">
                <div>
				<form class="form-horizontal" action="modifyPro" method="post"
					name="reg_form" enctype="multipart/form-data">
					<input type="hidden" name="hiddenId" value="0"> <input
						type="hidden" name="hiddenEmail" value=0>

					<fieldset>

						<!-- Form Name -->
						<legend> 개인정보 수정 </legend>

						<!-- Text input-->

						<div class="form-group">
							<label class="col-md-4 control-label">아이디</label>

							<div class="col-md-6  inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-user"></i></span>
										<input name="id" class="form-control" type="text" value="${vo.doctorid}" readonly>
									
								</div>
							</div>
						</div>

						<div class="form-group has-feedback">
							<label for="password" class="col-md-4 control-label">
								비밀번호 </label>
							<div class="col-md-6  inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-home"></i></span> <input
										class="form-control" id="userPw" type="password"
										placeholder="비밀번호를 입력해주세요" name="password" data-minLength="5"
										data-error="some error" required /> <span
										class="glyphicon form-control-feedback"></span> <span
										class="help-block with-errors"></span>
								</div>
							</div>
						</div>

						<div class="form-group has-feedback">
							<label for="confirmPassword" class="col-md-4 control-label">
								비밀번호 확인 </label>
							<div class="col-md-6  inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-home"></i></span> <input
										class="form-control {$borderColor}" id="userPw2"
										type="password" placeholder="비밀번호를 다시 입력해주세요"
										name="confirmPassword" data-match="#confirmPassword"
										data-minLength="5" data-match-error="some error 2" required />
									<span class="glyphicon form-control-feedback"></span> <span
										class="help-block with-errors"></span>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">이름</label>
							<div class="col-md-6  inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-user"></i></span> <input name="name"
										placeholder="이름을 입력해주세요" class="form-control" type="text"
										value="${vo.doctorname}" readonly>
								</div>
							</div>
						</div>

						<!-- Text input-->

						<div class="form-group">
							<label class="col-md-4 control-label">휴대 전화</label>
							<div class="col-md-6  inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-earphone"></i></span> <input name="phone"
										placeholder=" '-' 없이 입력해 주세요" class="form-control" type="text"
										value="${vo.doctorphone}" maxlength="11" onkeydown="onlyNumber(this)">
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">이메일</label>
							<div class="col-md-6  inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-envelope"></i></span> <input name="email"
										placeholder="이메일을 입력해주세요" class="form-control" type="text" value="${vo.doctoremail}">
								</div>
							</div>
						</div>

						<!-- Text area -->

						<div class="form-group">
							<label class="col-md-4 control-label">전문분야</label>
							<div class="col-md-6  inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-pencil"></i></span>
										<select name = "specialism" >
											<option value = "1">내과</option>
											<option value = "2">이비인후과</option>
											<option value = "3">정신의학과</option>
											<option value = "4">외과</option>
											<option value = "5">치과</option>
										</select>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">의사 면허증</label>
							<div class="col-md-6  inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-pencil"></i></span> <input name="file"
										class="form-control" type="file" style="padding: 1px; font-size: 17px;" value="${vo.licence}">
								</div>
							</div>
						</div>

						 <!-- Button -->
				      <div class="form-group">
				        <label class="col-md-4 control-label"></label>
				        <div class="col-md-4">
				          <button type="submit"class="btn btn-dark-blue" >수정 <span class="glyphicon glyphicon-send"></span></button>
				          <button type="reset" class="btn btn-dark-blue" >취소 <span class="glyphicon glyphicon-send"></span></button>
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