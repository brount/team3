<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/setting.jsp"%>
<html class="no-js" lang="en">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="/medical/resources/css/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<style>
span {
	width: 10% !important;
}
</style>
<body>

	<header>
		<%@ include file="../common/header.jsp"%>
	</header>

	<%@ include file="../common/line.jsp"%>

	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3 col-md-3">
					<%@ include file="../doctor/menuDoctor.jsp"%>
				</div>
				<div class="col-sm-9 col-md-9">
					<div class="well">

						<form class="form-horizontal" action="myHospitalUpdatePro"
							method="post" name="reg_form" enctype="multipart/form-data">
							<input type="hidden" name="hiddenId" value="0">
							<input type="hidden" name="hiddenEmail" value="0">

							<fieldset>

								<!-- Form Name -->
								<legend> 내 병원정보 수정 </legend>

								<!-- Text input-->

								<div class="form-group">
									<label class="col-md-4 control-label">병원 이름</label>
									<div class="col-md-6  inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-user"></i></span> <input
												name="hospitalname" readonly="readonly"
												placeholder="${hosDto.hospitalname}" class="form-control"
												type="text">
										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-4 control-label">병원 주소</label>
									<div class="col-md-6  inputGroupContainer">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-user"></i></span> <input
											name="hospitaladdr" readonly="readonly"
											placeholder="${hosDto.hospitaladdr}" class="form-control"
											type="text"><br>

									</div>
								</div>

								<div class="form-group">
									<label class="col-md-4 control-label">병원 전화번호</label>
									<div class="col-md-6  inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-user"></i></span> <input
												name="hospitalphone" value="${hosDto.hospitalphone}"
												class="form-control" type="text" required>
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
												rows="4" style="resize: none;" required
											>${hosDto.hospitalinstruction}</textarea>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-4 control-label">병원 진료시간 </label>
									<div class="col-md-6  inputGroupContainer">

										월 : <br> <input name="mon" readonly="readonly"
											placeholder="${hosDto.mon}" class="form-control" type="text">
										화 : <br> <input name="tues" readonly="readonly"
											placeholder="${hosDto.tues}" class="form-control" type="text">
										수 : <br> <input name="wed" readonly="readonly"
											placeholder="${hosDto.wed}" class="form-control" type="text">
										목 : <br> <input name="thur" readonly="readonly"
											placeholder="${hosDto.thurs}" class="form-control"
											type="text"> 금 : <br> <input name="fri"
											readonly="readonly" placeholder="${hosDto.fri}"
											class="form-control" type="text"> 토 : <br> <input
											name="sat" readonly="readonly" placeholder="${hosDto.sat}"
											class="form-control" type="text"> 일 : <br> <input
											name="sun" readonly="readonly" placeholder="${hosDto.sun}"
											class="form-control" type="text">

									</div>
								</div>

								<div class="form-group">
									<label class="col-md-4 control-label">병원 휴무일</label>
									<div class="col-md-6  inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-user"></i></span> <input name="holi"
												readonly="readonly" placeholder="${hosDto.holi}"
												class="form-control" type="text">
										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-4 control-label">병원 이미지</label>
									<div class="col-md-6  inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-user"></i></span> <input
												name="hospitalimage" class="form-control" type="file"
												style="padding: 1px; font-size: 17px;">
										</div>
									</div>
								</div>

								<!-- Button -->
								<div class="form-group">
									<label class="col-md-4 control-label"></label>
									<div class="col-md-4">
										<button type="submit" class="btn btn-dark-blue">
											수정<span class="glyphicon glyphicon-send"></span>
										</button>
										<button type="reset" class="btn btn-dark-blue">
											취소<span class="glyphicon glyphicon-send"></span>
										</button>
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
		<%@ include file="../common/footer.jsp"%>
	</footer>

</body>
</html>