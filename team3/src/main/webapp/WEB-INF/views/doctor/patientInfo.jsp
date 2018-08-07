<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
<!DOCTYPE html PUBLIC"-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

 -->

<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/medical/resources/djcss/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/bootstrap-theme.min.css"
	rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/style.css" rel="stylesheet"
	type="text/css" />
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

	<header>
		<%@ include file="../common/header.jsp"%>
	</header>

	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3 col-md-3">
					<%@ include file="../common/menuCheckup.jsp"%>
				</div>
				<div class="col-sm-9 col-md-9">

					<div class="well">
						<form class="form-horizontal" action="checkupRequest?reservationNo=${ReservDto.reservationNo}" method="post"
							id="reg_form">

							<fieldset>
								<legend>환자 정보 </legend>
								<div style="margin: 20px 20px;"></div>

								<table class="table">
									<tr>
										<td>성명 : ${gusDto.guestname}</td>
										<td>주민등록번호 : ${gusDto.jumin}</td>
									</tr>

									<tr>
										<td>연락처 : ${gusDto.guesttel}</td>
										<td>이메일 주소 : ${gusDto.guestemail}</td>
									</tr>
								</table>
								<!-- Text input-->
							</fieldset>
							<br>
							<br>
							<table>
								<tr>
									<td>▣ 증상<br>
									<br>
									<textarea name="checkup_opinion" readonly rows="5" cols="120"
											style="resize: none; width: 100%;">${ReservDto.symptom}</textarea>
									</td>
								</tr>
							</table>
							<div>

								<br>
								<br>

								<div class="form-group">
									<label class="col-md-4 control-label">증상 체크</label>
									<div class="col-md-6  inputGroupContainer">
										<div class="input-group">

											
											<c:if test="${ReservDto.symptomchk == disgusted}">
								          		두통
								            </c:if>
											<c:if test="${ReservDto.symptomchk == head}">
								          		머리
								            </c:if>

											<%-- <div style="margin-left: 10px;">
						
						  <label>
						    <input type="checkbox" class="option-input checkbox"name="symptomchk" value="head"  checked=<c:if test="${ReservDto.symptomchk == head }">checked</c:if> />
							두통
						  </label>
						  <label>
						    <input type="checkbox" class="option-input checkbox"name="symptomchk"  value="fever" checked=<c:if test="${ReservDto.symptomchk == fever }">checked</c:if> />
							    발열
						  </label>
						  <label>
						    <input type="checkbox" class="option-input checkbox"name="symptomchk"  value="cough" />
						    기침
						  </label>
						 <label>
						    <input type="checkbox" class="option-input checkbox"name="symptomchk"  value="disgusted" checked=<c:if test="${ReservDto.symptomchk == disgusted }">checked</c:if>/>
						    
						메스꺼움
						  </label>
						   <label>
						    <input type="checkbox" class="option-input checkbox"name="symptomchk"  value="stomachache"/>
						   복통
						  </label>
						   <label>
						    <input type="checkbox" class="option-input checkbox"name="symptomchk"  value="vomit"/>
						    구토
						  </label>

		 					<label>
						    <input type="checkbox" class="option-input checkbox"name="symptomchk"  value="diarrhea"/>
						  설사
						  </label>
						   <label>
						    <input type="checkbox" class="option-input checkbox"name="symptomchk"  value="musclepain"/>
						    근육통
						  </label>
						  <label>
						    <input type="checkbox" class="option-input checkbox"name="symptomchk"  value="sore throat"/>
						    인후통
						  </label>
		          </div> --%>
										</div>
									</div>
								</div>
							</div>

							<div class="form-group">
								<div style="display: table; margin: 0 auto">
									<button type="submit" class="btn btn-warning">
										검사의뢰등록 <span class="glyphicon glyphicon-send"></span>
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



	<!-- <img src="resources/images/Demonstration/reserveForm.jpg"> -->
	<!-- <--<input type="button" onclick="window.location='main'" value="메인페이지">
	<input type="button" onclick="window.location='reserveList'" value="등록">
	<input type="button" onclick="window.location='reserveList'" value="취소"> -->
	-->
</body>
</html>