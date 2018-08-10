<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/setting.jsp"%>
<html class="no-js" lang="en">
<link href="/medical/resources/djcss/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/bootstrap-theme.min.css"
	rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/style.css" rel="stylesheet"
	type="text/css" />
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
<body>

	<header>
		<%@ include file="../common/header.jsp"%>
	</header>

	<section>
		<div style="width: 45%; margin: 0 auto;">
			<div class="well">
				<form class="form-horizontal" action="myHospitalInputPro" method="post" name="reg_form" enctype="multipart/form-data">
					<input type="hidden" name="hiddenId" value="0"> <input
						type="hidden" name="hiddenEmail" value=0>

					<fieldset>

						<!-- Form Name -->
						<legend> 내 병원정보 입력 </legend>

						<!-- Text input-->

						<div class="form-group">
							<label class="col-md-4 control-label">병원 이름</label>

							<div class="col-md-6  inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-home"></i></span> <input
										name="hospitalname" placeholder="병원 이름을 입력해주세요"
										class="form-control" type="text">
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">주소</label>
							<div class="col-md-6  inputGroupContainer">
								<input type="button" class="btn btn-dark-blue" onclick="addressSearch();" value="주소찾기"
									class="btn btn-warning"> <input type="text"
									name="hospitaladdress1" id="sample6_postcode"
									placeholder="우편번호" size="6" style="padding: 3px"
									class="form-control" style="width:30px"> <input
									name="hospitaladdress2" id="sample6_address" placeholder="주소"
									class="form-control" type="text">

								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-home"></i></span> <input
										name="hospitaladdress3" id="sample6_address2"
										placeholder="상세주소" class="form-control" type="text"
										onchange="addinput();"> <input type="hidden"
										name="address">
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">병원 전화번호</label>
							<div class="col-md-6  inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-user"></i></span> <input
										name="hospitalphone" placeholder="병원 전화번호를 입력해주세요"
										class="form-control" type="text" maxlength="30">
								</div>
							</div>
						</div>

						<!-- Text area -->

						<div class="form-group">
							<label class="col-md-4 control-label">병원 소개글 </label>
							<div class="col-md-6  inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-pencil"></i></span>
									<textarea class="form-control" name="hospitalinstruction"
										placeholder="병원 소개글을 적어주세요 " maxlength="255"></textarea>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">병원 진료시간 </label>
							<div class="col-md-6  inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-user"></i></span> 
										<input name="hospitaltime1" class="form-control" type="time">
										~
										<input name="hospitaltime2" class="form-control" type="time">
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">병원 휴무일</label>
							<div class="col-md-6  inputGroupContainer">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-user"></i></span> <input
										name="hospitalholiday" placeholder="병원 휴무일을 입력해주세요"
										class="form-control" type="text">
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">병원 이미지</label>
							<div class="col-md-6  inputGroupContainer">
								<div class="input-group">
									<input name="hospitalimage" class="" type="file">
								</div>
							</div>
						</div>

						<!-- Button -->
						<div class="form-group">
							<label class="col-md-4 control-label"></label>
							<div class="col-md-4">
								<button type="submit" class="btn btn-dark-blue">
									병원 등록<span class="glyphicon glyphicon-send"></span>
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