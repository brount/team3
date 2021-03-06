<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>사이트이름</title>
<link href="/medical/resources/djcss/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<!-- <link href="/medical/resources/djcss/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
 -->
<link href="/medical/resources/djcss/css/style.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript">
	function check() {
		if (!document.mof.birth1.value) {
			alert('생년월일을 입력해주세요.');
			document.mof.birth1.focus();
			return false;
			if (document.mof.birth1.value.length < 4) {
				alert('년도는 4자리 입니다.');
				document.mof.birth1.focus();
				return false;
			} else if (document.mof.birth1.value.length > 5) {
				alert('년도는 4자리 입니다.');
				document.mof.birth1.focus();
				return false;
			}
			return false;
		} else if (!document.mof.birth2.value) {
			alert('생년월일을 입력해주세요.');
			document.mof.birth2.focus();

			return false;
		} else if (!document.mof.birth3.value) {
			alert('생년월일을 입력해주세요.');
			document.mof.birth3.focus();

			return false;
		} else if (!document.mof.height.value) {
			alert('신장을 입력해주세요.');
			document.mof.height.focus();

			return false;
		} else if (!document.mof.weight.value) {
			alert('신장 입력해주세요.');
			document.mof.weight.focus();
			return false;
		} else if (!document.mof.bloodtype.value) {
			alert('혈액형을 선택해주세요.');

			return false;
		} else if (!document.mof.gender.value) {
			alert('성별을 선택해주세요.');

			return false;
		} else if (!document.mof.age.value) {
			alert('나이를  입력해주세요.');
			document.mof.age.focus();

			return false;
		}
	}
</script>

</head>

<body>

	<header>
		<%@ include file="../common/header.jsp"%>
	</header>
	<%@ include file="../common/line.jsp"%>

	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3 col-md-3">
					 <%@ include file="../guest/menuGuest.jsp" %>
				</div>
				<div class="col-sm-9 col-md-9">
					<div class="well">
						<form class="form-horizontal" action="personalMofPro"
							method="post" id="" name="mof" onsubmit="return check();">
							<fieldset style="font-size: 20;">

								<h3 style="margin-bottom: 50px">My Health 수정</h3>

								<div class="form-group">
									<label class="col-md-3 control-label">생년월일</label>
									<div class="col-md-8  inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-pencil"></i></span> <input name="birth1"
												value="${vo.birth1}" class="form-control" type="text"
												style="width: 30px;">
											<b>년</b> <input name="birth2" value="${vo.birth2}"
												class="form-control" type="text"
												style="width: 30px; margin-left: 10px;">
											<b>월</b> <input name="birth3" value="${vo.birth3}"
												class="form-control" type="text"
												style="width: 30px; margin-left: 10px;">
											<b>일</b>
										</div>
									</div>

								</div>


								<div class="form-group">
									<label class="col-md-3 control-label">신장</label>
									<div class="col-md-8 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-pencil"></i></span> <input name="height"
												value="${vo.height}" class="form-control" type="text"
												style="hegint: 50px; width: 30px;"> <b>cm</b>

										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-3 control-label">체중</label>
									<div class="col-md-8 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-pencil"></i></span> <input name="weight"
												value="${vo.weight}" class="form-control" type="text"
												style="width: 30px; hegint: 50px;"> <b>kg</b>

										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-3 control-label">혈액형</label>
									<div class="col-md-9  inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-pencil"></i></span> <label
												style="margin-left: 10px; margin-right: 10px;"> <input
												type="radio" class="option-input radio" name="bloodtype"
												value="A" /> A형
											</label> <label style="margin-left: 10px; margin-right: 10px;">
												<input type="radio" class="option-input radio"
												name="bloodtype" value="B" /> B형
											</label> <label style="margin-left: 10px; margin-right: 10px;">
												<input type="radio" class="option-input radio"
												name="bloodtype" value="AB" /> AB형
											</label> <label style="margin-left: 10px; margin-right: 10px;">
												<input type="radio" class="option-input radio"
												name="bloodtype" value="O" /> O형
											</label>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-3 control-label">성별</label>
									<div class="col-md-8  inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-pencil"></i></span> <label
												style="margin-left: 10px; margin-right: 10px;"> <input
												type="radio" class="option-input radio" name="gender"
												value="1" /> 여자
											</label> <label style="margin-left: 10px; margin-right: 10px;">
												<input type="radio" class="option-input radio" name="gender"
												value="2" /> 남자
											</label>

										</div>
									</div>
								</div>


								<div class="form-group">
									<label class="col-md-3 control-label">나이</label>
									<div class="col-md-8  inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-pencil"></i></span> <input name="age"
												value="${vo.age}" class="form-control" type="text"
												style="width: 30px; hegint: 50px;"> <b>세(만)</b>

										</div>
									</div>
								</div>

								<div class="form-group">
									<div style="text-align: center;">
										<button type="submit" class="btn btn-dark-blue">
											수정하기<span class="glyphicon glyphicon-send"></span>
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