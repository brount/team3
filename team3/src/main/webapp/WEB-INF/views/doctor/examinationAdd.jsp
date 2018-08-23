<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/setting.jsp"%>
<html>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<body>
	<header>
		<%@ include file="../common/header.jsp"%>
	</header>
	<%@ include file="../common/line.jsp"%>
	
	<script src="jquery-1.11.0.min.js" type="text/javascript"></script>
	<script>
		function delLastTr(idN) {
			var tableObj = $("#" + idN);
			if (tableObj.length != 1) {
				alert("id='" + idN
						+ "' 을 가진 table 태그가 없어 delLastTr(~)란 이름의 함수 호출불가!");
				return;
			}
			var lastTrObj = tableObj.find("tbody:eq(0) tr").first().parent()
					.children().last();
			if (lastTrObj.siblings().filter("tr").length == 0) {
				alert("마지막 남은 1개 행은 삭제가 불가능함!");
				return;
			}
			var htmlType1 = "input[type=checkbox],input[type=radio]";
			var htmlType2 = "select,textarea,input[type=text],input[type=password],input[type=hidden],input[type=image]";
			var htmlType3 = htmlType1 + "," + htmlType2;
			var dataCnt = 0;
			lastTrObj.find(htmlType3).each(
					function() {
						var thisObj = $(this);
						if (thisObj.prop("type") == "radio"
								|| thisObj.prop("type") == "checkbox") {
							if (thisObj.filter(":checked").length > 0) {
								dataCnt++;
							}
						}
						else {
							var val = thisObj.val();
							if (val.split(" ").join("") != "") {
								dataCnt++;
							}
						}
					});
			if (dataCnt > 0) {
				if (confirm("행에 데이터가 있음! 삭제할까요?") == false) {
					return;
				}
			}
			lastTrObj.remove();
		}
			
		function delLastTr2(idN) {
			var tableObj = $("#" + idN);
			if (tableObj.length != 1) {
				alert("id='" + idN
						+ "' 을 가진 table 태그가 없어 delLastTr(~)란 이름의 함수 호출불가!");
				return;
			}
			var lastTrObj = tableObj.find("tbody:eq(0) tr").first().parent()
					.children().last();
			if (lastTrObj.siblings().filter("tr").length == 2) {
				alert("마지막 남은 1개 행은 삭제가 불가능함!");
				return;
			}
			var htmlType1 = "input[type=checkbox],input[type=radio]";
			var htmlType2 = "select,textarea,input[type=text],input[type=password],input[type=hidden],input[type=image]";
			var htmlType3 = htmlType1 + "," + htmlType2;
			var dataCnt = 0;
			lastTrObj.find(htmlType3).each(
					function() {
						var thisObj = $(this);
						if (thisObj.prop("type") == "radio"
								|| thisObj.prop("type") == "checkbox") {
							if (thisObj.filter(":checked").length > 0) {
								dataCnt++;
							}
						}
						else {
							var val = thisObj.val();
							if (val.split(" ").join("") != "") {
								dataCnt++;
							}
						}
					});
			if (dataCnt > 2) {
				if (confirm("행에 데이터가 있음! 삭제할까요?") == false) {
					return;
				}
			}
			lastTrObj.remove();
		}	
		function addTr(idN) {
			var tableObj = $("#" + idN);
			if (tableObj.length != 1) {
				alert("id'=" + idN
						+ "'을 가진 table 태그가 없어 addTr(~)란 이름의 함수 호출 불가!");
				return;
			}
			var lastTrObj = tableObj.find("tbody:eq(0)").find("tr:eq(0)")
					.parent().children().last();
			var htmlType1 = "input[type=checkbox],input[type=radio]";
			var htmlType2 = "select, textarea,input[type=text],input[type=password],input[type=hidden],input[type=image]";
			var htmlType3 = htmlType1 + "," + htmlType2;
			var dataCnt = 0;
			lastTrObj.find(htmlType3).each(
					function() {
						var thisObj = $(this);
						if (thisObj.prop("type") == "radio"
								|| thisObj.prop("type") == "checkbox") {
							if (thisObj.filter(":checked").length > 0) {
								dataCnt++;
							}
						}
						else {
							var val = thisObj.val();
							if (val.split(" ").join("") != "") {
								dataCnt++;
							}
						}
					});
			if (dataCnt < 5) {
				alert("마지막 행에 데이터가 비어있어 행 추가 불가능");
				return;
			}
			lastTrObj.parent().append(lastTrObj.clone());
			lastTrObj = lastTrObj.next();
			lastTrObj.find(htmlType2).val("");
			lastTrObj.find(htmlType1).prop("checked", false);
			var totTrCnt = lastTrObj.parent().children("tr").length;
			var flag = false;
			lastTrObj.find(htmlType3).each(function(i) {
				var thisObj = $(this);
				var nameV = thisObj.prop("name");
			});
			if (flag == true) {
				lastTrObj.remove();
				alert("<개발자 수정 사항>한 행의 입력 향식 name 속성값 마지막에는_숫자 가 붙어야합니다.");
			}

		}
		function addTr2(idN) {
			var tableObj = $("#" + idN);
			if (tableObj.length != 1) {
				alert("id'=" + idN
						+ "'을 가진 table 태그가 없어 addTr(~)란 이름의 함수 호출 불가!");
				return;
			}
			var lastTrObj = tableObj.find("tbody:eq(0)").find("tr:eq(0)")
					.parent().children().last();
			var htmlType1 = "input[type=checkbox],input[type=radio]";
			var htmlType2 = "select, textarea,input[type=text],input[type=password],input[type=hidden],input[type=image]";
			var htmlType3 = htmlType1 + "," + htmlType2;
			var dataCnt = 0;
			lastTrObj.find(htmlType3).each(
					function() {
						var thisObj = $(this);
						if (thisObj.prop("type") == "radio"
								|| thisObj.prop("type") == "checkbox") {
							if (thisObj.filter(":checked").length > 0) {
								dataCnt++;
							}
						}
						else {
							var val = thisObj.val();
							if (val.split(" ").join("") != "") {
								dataCnt++;
							}
						}
					});
			if (dataCnt < 4) {
				alert("마지막 행에 데이터가 비어있어 행 추가 불가능");
				return;
			}
			lastTrObj.parent().append(lastTrObj.clone());
			lastTrObj = lastTrObj.next();
			lastTrObj.find(htmlType2).val("");
			lastTrObj.find(htmlType1).prop("checked", false);
			var totTrCnt = lastTrObj.parent().children("tr").length;
			var flag = false;
			lastTrObj.find(htmlType3).each(function(i) {
				var thisObj = $(this);
				var nameV = thisObj.prop("name");
			});
			if (flag == true) {
				lastTrObj.remove();
				alert("<개발자 수정 사항>한 행의 입력 향식 name 속성값 마지막에는_숫자 가 붙어야합니다.");
			}

		}
	</script>
	<section>
		<input type="hidden" value="${checkup}" name="checkup"> <input
			type="hidden" value="${doctorno}" name="doctorno">
	

			<form
				action="examinationInputPro?checkup=${checkup}&doctorno=${docDto.doctorno}"
				method="post" name="examinationAdd" onsubmit="return examinationAddCheck()">
				<div class="container">
					<div class="row">
						<div class="col-sm-3 col-md-3">
							<%@ include file="../common/menuCheckup.jsp"%>
						</div>
						<div class="col-sm-9 col-md-9">
							<div class="well">
								<div>
									<div class="panel panel-primary">
								
										<div class="panel-heading">
									
											<h3>처방전 입력</h3>
										</div>
										<table class="responstable" border="1">
											<tr>
												<th rowspan="3" style="width: 5%;">환자</th>
												<td>환자명</td>
												<td>${gusDto.guestname}</td>
											</tr>
											<tr>
												<td>주민번호</td>
												<td>${jumin}-*******</td>
											</tr>
											<tr>
												<td>연락처</td>
												<td>${gusDto.guesttel}</td>
											</tr>

										</table>
										<table class="responstable" border="1">
											<tr>
												<th>증상</th>
											</tr>
											<tr>
												<td><textarea rows="5" name="symptom"
														maxlength="100" style="resize: none; width: 100%"></textarea></td>
											</tr>
										</table>
										<table class="responstable" border="1"
											id="xxx">
											<thead>
												<tr>
													<th>처 방 의 약 품 <br>명 칭
													</th>
													<th>1회<br>투여량
													</th>
													<th>1회<br>투여횟수
													</th>
													<th>총<br>투여일수
													</th>
													<th>용법</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><input type="text" style="width: 85px"
														name="drugname1"></td>
													<td><input type="text" style="width: 85px"
														name="drugdosage1"></td>
													<td><input type="text" style="width: 85px" min="0"
														max="99" name="drugrepeat1">번</td>
													<td><input type="text" style="width: 85px" min="0"
														max="99" name="dosagedate1">일</td>
													<td><input type="text" style="width: 85px"
														name="dosageusage1"></td>
												</tr>
												<!-- var lastTrObj = tableObj.find("tbody:eq(0)").find("tr:eq(0)")
														.parent().children().last(); -->
										</table>
										<center>
										<input type="button" class="btn btn-dark-blue" value="행추가" onclick="addTr( 'xxx' );">
										<input type="button" class="btn btn-dark-blue" value="행삭제" onclick="delLastTr( 'xxx' );">
										</center>
											<br><br>
											
										<table class="responstable" border="1" id="yyy">
											<tr>
												<th colspan="4" align="center">주사제 처방내역</th>
												<th>조 제 시 참 고 사 항</th>
											</tr>
											<tr>
												<th>처 방 의 약 품 <br>명 칭
												</th>
												<th>1회<br>투여량
												</th>
												<th>1회<br>투여횟수
												</th>
												<th>총<br>투여일수
												</th>
												<td rowspan="10">
													<textarea rows="3" name="caution" maxlength="255"
														style="resize: none; height: 150px;"></textarea>
												</td>
											</tr>
											<tr>
												<td><input type="text" style="width: 85px"
													name="injectionname1"></td>
												<td><input type="text" style="width: 85px"
													name="injectiondosage1"></td>
												<td><input type="text" style="width: 85px" min="0"
													max="99" name="injectionrepeat1">번</td>
												<td><input type="text" style="width: 85px" min="0"
													max="99" name="injectiondate1">일</td>
											</tr>
											</tbody>
										</table>
										<center>
										<input type="button" class="btn btn-dark-blue" value="행추가" onclick="addTr2( 'yyy' );">

										<input type="button" class="btn btn-dark-blue" value="행삭제" onclick="delLastTr2( 'yyy' );">
										</center>
									</div>
									
										<br><br>
									<div style="display: table; margin: 0 auto;">
										<input type="submit" value="처방등록" style="margin-right: 5px;" class="btn btn-dark-blue">
										<input type="reset" value="작성취소" class="btn btn-dark-blue">
										<input type="button" value="처방목록" style="margin-left: 5px;" class="btn btn-dark-blue"
											onclick="window.location='examinationList'">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
	</section>

	<footer>
		<%@ include file="../common/footer.jsp"%>
	</footer>
</body>
</html>
