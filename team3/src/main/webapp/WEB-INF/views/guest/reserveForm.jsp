<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	function simple() {

		var count = 0;
		var chk = document.getElementsByName("symptomchk");
		var symptomchk = "";

		//선택된거 체크
		for (var i = 0; i < chk.length; i++) {
			if (chk[i].checked == true) {
				count++;
				if (symptomchk == "") {
					symptomchk += chk[i].value;
				} else {
					symptomchk += "," + chk[i].value;
				}
			}
		}

		if (symptomchk == "") {
			alert("증상을 선택하세요");
			return false;
		} else {
			alert("예약이 완료되었습니다.");
			
			window.location = "reservePro?symptomchk=" + symptomchk;
		}
	}
</script>
<script type="text/javascript">
	$(function() {
		$("#datepicker").datepicker();
	});
</script>

<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script
	src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />

<script type="text/javascript"
	src="/medical/resources/djcss/css/calendar.js"></script>

</head>

<body>
	<c:if test="${sessionScope.memberState != 1 }">
		<script type="text/javascript">
			alert('로그인이 필요한 서비스 입니다.');
			window.location = "memberLogin";
		</script>
	</c:if>
	<header>
		<%@ include file="../common/header.jsp"%>
	</header>
	<%@ include file="../common/line.jsp"%>

	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3 col-md-3">
					<%@ include file="../common/menuMedical.jsp"%>
				</div>
				<div class="col-sm-9 col-md-9">

					<div class="well">
						<form class="form-horizontal" action="reservePro" method="post"
							id="reg_form" onsubmit="return simple();">

							<input type="hidden" name="hospitalno" value="${vo.hospitalno}">
							<input type="hidden" name="doctorNo" value="doctorNo"> <input
								type="hidden" name="guestNo" value="guestNo">

							<fieldset>
								<h3>진료 예약 </h3>
								<div style="margin: 20px 20px;"></div>
								<div class="form-group">
									<label class="col-md-4 control-label">병원</label>
									<div class="col-md-6 selectContainer">
											<div class="input-group">
												<label style="font-weight: bold;font-size:18px;color: #178b89;">${vo.hospitalname} ☏ ${vo.hospitalphone}</label>
											</div>
									</div>		
								</div>	



								<div class="form-group">
									<label class="col-md-4 control-label">진료과</label>
									<div class="col-md-6 selectContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-list"></i></span>
												<select name="hospitalkind" class="form-control selectpicker" required>
												<option selected disabled value="">진료과</option>
												<option>${vo.hospitalkind}</option>
											</select>
										</div>
									</div>
								</div>
								<div class="form-group">

									<label class="col-md-4 control-label">예약구분</label>
									<div class="col-md-6 selectContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-list"></i></span> <select
												class="form-control selectpicker" name="reservationKind">
												<option value="1">병원예약</option>
												<option value="2">클리닉예약</option>
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
											<input type="text" id="datepicker" placeholder="날짜를 선택하세요."
												readonly="true" name="reservationTime" required/>
											<i class="ion-calendar"></i>
										</div>

									</div>
								</div>
								<div class="form-group">
									<label class="col-md-4 control-label">예약시간</label>
									<div class="col-md-6 selectContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-list"></i></span>
											<select class="form-control selectpicker" name="clock" required>
												<option selected disabled value="">시</option>
												<option value="오전 9시">오전 9시</option>
												<option value="오전10시">오전 10시</option>
												<option value="오전 11시">오전 11시</option>
												<option value="오후 12시">오후 12시</option>
												<option value="오후2시">오후 2시</option>
												<option value="오후 3시">오후 3시</option>
												<option value="오후 4시">오후 4시</option>
												<option value="오후 5시">오후 5시</option>
												<option value="오후 6시">오후 6시</option>

											</select> <select class="form-control selectpicker" name="minute" required>
												<option selected disabled value="">분</option>
												<option value="00분">00 분</option>
												<option value="10분">10 분</option>
												<option value="20분">20 분</option>
												<option value="30분">30 분</option>
												<option value="40분">40 분</option>
												<option value="50분">50 분</option>
											</select>
										</div>
									</div>
								</div>
							</fieldset>

							<div>
								<h3> 추가입력 정보 </h3>
								<fieldset>

									<div class="form-group">
										<label class="col-md-4 control-label">증상 입력 </label>
										<div class="col-md-6  inputGroupContainer">
											<div class="input-group">
												<span class="input-group-addon"><i
													class="glyphicon glyphicon-pencil"></i></span>
												<textarea class="form-control" name="symptom"
													placeholder="증상을 입력해주세요." rows="5" style="resize: none;" required></textarea>
											</div>
										</div>
									</div>

									<div class="form-group">
										<label class="col-md-4 control-label">증상 체크</label>
										<div class="col-md-6  inputGroupContainer">
											<div class="input-group">
												<div style="margin-left: 10px;">
													<label> <input type="checkbox"
														class="option-input checkbox" name="symptomchk"
														value="head" /> 두통
													</label> <label> <input type="checkbox"
														class="option-input checkbox" name="symptomchk"
														value="fever" /> 발열
													</label> <label> <input type="checkbox"
														class="option-input checkbox" name="symptomchk"
														value="cough" /> 기침
													</label> <label> <input type="checkbox"
														class="option-input checkbox" name="symptomchk"
														value="disgusted" /> 메스꺼움
													</label> <label> <input type="checkbox"
														class="option-input checkbox" name="symptomchk"
														value="stomachache" /> 복통
													</label> <label> <input type="checkbox"
														class="option-input checkbox" name="symptomchk"
														value="vomit" /> 구토
													</label> <label> <input type="checkbox"
														class="option-input checkbox" name="symptomchk"
														value="diarrhea" /> 설사
													</label> <label> <input type="checkbox"
														class="option-input checkbox" name="symptomchk"
														value="musclepain" /> 근육통
													</label> <label> <input type="checkbox"
														class="option-input checkbox" name="symptomchk"
														value="sorethroat" /> 인후통
													</label>

												</div>
											</div>
										</div>
									</div>
								</fieldset>
							</div>

							<div class="form-group">
								<div style="display: table; margin: 0 auto">
									<button type="submit" class="btn btn-dark-blue">
										예약 <span class="glyphicon glyphicon-send"></span>
									</button>
								</div>
							</div>

						</form>
					</div>

					<script>
						$.datepicker
								.setDefaults({
									closeText : "닫기",
									prevText : "이전달",
									nextText : "다음달",
									currentText : "오늘",
									monthNames : [ "1월", "2월", "3월", "4월",
											"5월", "6월", "7월", "8월", "9월",
											"10월", "11월", "12월" ],
									monthNamesShort : [ "1월", "2월", "3월", "4월",
											"5월", "6월", "7월", "8월", "9월",
											"10월", "11월", "12월" ],
									dayNames : [ "일요일", "월요일", "화요일", "수요일",
											"목요일", "금요일", "토요일" ],
									dayNamesShort : [ "일", "월", "화", "수", "목",
											"금", "토" ],
									dayNamesMin : [ "일", "월", "화", "수", "목",
											"금", "토" ],
									weekHeader : "주",
									dateFormat : "yy-m-d",

									firstDay : 0,
									isRTL : false,
									showMonthAfterYear : true,
									yearSuffix : "년"
								})
						$("#datepicker").datepicker({
							minDate : 0,
							/* to use in wix */
							onSelect : function(selected, event) {
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
		<%@ include file="../common/footer.jsp"%>
	</footer>

</body>
</html>