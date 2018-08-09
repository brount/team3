<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<script src="jquery-1.11.0.min.js" type="text/javascript"></script>
	<script>
		//**************************************************************************
		function delLastTr(idN) {
			// idN 매개변수값을 가진 태그를 관리하는 jQuery 객체 생성해 저장
			var tableObj = $("#" + idN);
			// idN 매개변수값을 가진 태그의 개수가 1이 아니면 경고 멈춤
			if (tableObj.length != 1) {
				alert("id='" + idN
						+ "' 을 가진 table 태그가 없어 delLastTr(~)란 이름의 함수 호출불가!");
				return;
			}
			// 카피할 마지막 tr 태그를 관리하는 jQuery 객체 생성해 저장
			var lastTrObj = tableObj.find("tbody:eq(0) tr").first().parent()
					.children().last();
			// 만약 tr 태그가 1개만 있으면 경고하고 중단
			if (lastTrObj.siblings().filter("tr").length == 0) {
				//if(lastTrObj.parent().children("tr").length==1){
				alert("마지막 남은 1개 행은 삭제가 불가능함!");
				return;
			}
			var htmlType1 = "input[type=checkbox],input[type=radio]";
			var htmlType2 = "select,textarea,input[type=text],input[type=password],input[type=hidden],input[type=image]";
			var htmlType3 = htmlType1 + "," + htmlType2;
			//----------------------------------------------------------------
			// 복사할 tr 태그 안의 입력 양식에 입력/선택된 데이터의 개수 얻기
			//-----------------------------------------------------------------
			var dataCnt = 0;
			lastTrObj.find(htmlType3).each(
					function() {
						// each 메소드가 잡은 입력양식에 데이터가 있으면 dataCnt 변수 안의 데이터 1 증가
						// each 메소드가 잡은 입력양식을 관리하는 JQuery 객체를 생성해서 저장
						var thisObj = $(this);
						if (thisObj.prop("type") == "radio"
								|| thisObj.prop("type") == "checkbox") {
							// each 메소드가 잡은 입력양식이 체크되어 있으면 dataCnt 변수안에 1증가
							if (thisObj.filter(":checked").length > 0) {
								dataCnt++;
							}
						}
						// each 메소드가 잡은 입력양식이 checkbox 또는 radio가 아니면
						else {
							// each 메소드가 잡은 입력양식의 입력/선택값이 있으면 dataCnt 변수안에 1증가
							var val = thisObj.val();
							if (val.split(" ").join("") != "") {
								dataCnt++;
							}
						}
					});
			// 삭제할 tr 내부의 입력양식에 입력/선택 데이터가 있으면 confirm 상자 띄우기
			if (dataCnt > 0) {
				// confirm 상자에서 확인 버튼 누르면 함수 멈춤
				if (confirm("행에 데이터가 있음! 삭제할까요?") == false) {
					return;
				}
			}
			//----------------------------------
			// 마지막 tr을 삭제하기
			//----------------------------------
			lastTrObj.remove();
		}
			
		function delLastTr2(idN) {
			// idN 매개변수값을 가진 태그를 관리하는 jQuery 객체 생성해 저장
			var tableObj = $("#" + idN);
			// idN 매개변수값을 가진 태그의 개수가 1이 아니면 경고 멈춤
			if (tableObj.length != 1) {
				alert("id='" + idN
						+ "' 을 가진 table 태그가 없어 delLastTr(~)란 이름의 함수 호출불가!");
				return;
			}
			// 카피할 마지막 tr 태그를 관리하는 jQuery 객체 생성해 저장
			var lastTrObj = tableObj.find("tbody:eq(0) tr").first().parent()
					.children().last();
			// 만약 tr 태그가 1개만 있으면 경고하고 중단
			if (lastTrObj.siblings().filter("tr").length == 2) {
				//if(lastTrObj.parent().children("tr").length==1){
				alert("마지막 남은 1개 행은 삭제가 불가능함!");
				return;
			}
			var htmlType1 = "input[type=checkbox],input[type=radio]";
			var htmlType2 = "select,textarea,input[type=text],input[type=password],input[type=hidden],input[type=image]";
			var htmlType3 = htmlType1 + "," + htmlType2;
			//----------------------------------------------------------------
			// 복사할 tr 태그 안의 입력 양식에 입력/선택된 데이터의 개수 얻기
			//-----------------------------------------------------------------
			var dataCnt = 0;
			lastTrObj.find(htmlType3).each(
					function() {
						// each 메소드가 잡은 입력양식에 데이터가 있으면 dataCnt 변수 안의 데이터 1 증가
						// each 메소드가 잡은 입력양식을 관리하는 JQuery 객체를 생성해서 저장
						var thisObj = $(this);
						if (thisObj.prop("type") == "radio"
								|| thisObj.prop("type") == "checkbox") {
							// each 메소드가 잡은 입력양식이 체크되어 있으면 dataCnt 변수안에 1증가
							if (thisObj.filter(":checked").length > 0) {
								dataCnt++;
							}
						}
						// each 메소드가 잡은 입력양식이 checkbox 또는 radio가 아니면
						else {
							// each 메소드가 잡은 입력양식의 입력/선택값이 있으면 dataCnt 변수안에 1증가
							var val = thisObj.val();
							if (val.split(" ").join("") != "") {
								dataCnt++;
							}
						}
					});
			// 삭제할 tr 내부의 입력양식에 입력/선택 데이터가 있으면 confirm 상자 띄우기
			if (dataCnt > 2) {
				// confirm 상자에서 확인 버튼 누르면 함수 멈춤
				if (confirm("행에 데이터가 있음! 삭제할까요?") == false) {
					return;
				}
			}
			//----------------------------------
			// 마지막 tr을 삭제하기
			//----------------------------------
			lastTrObj.remove();
		}	

		//**************************************************************************
		function addTr(idN) {
			// id=idN매개변수값을 가진 태그를 관리하는 jQuery 객체 생성해 저장
			var tableObj = $("#" + idN);
			// id=idN매개변수값을 가진 태그의 개수가 1이 아니면
			if (tableObj.length != 1) {
				alert("id'=" + idN
						+ "'을 가진 table 태그가 없어 addTr(~)란 이름의 함수 호출 불가!");
				return;
			}
			// 카피할 마지막 tr 태그를 관리하는 jQuery 객체 생성해 저장
			var lastTrObj = tableObj.find("tbody:eq(0)").find("tr:eq(0)")
					.parent().children().last();
			//checkbox와 radio 입력 양식을 가르키는 선택자 문자열 저장
			//------------------------------------
			var htmlType1 = "input[type=checkbox],input[type=radio]";
			// checkbox와 <APPLET CODE="" WIDTH="" HEIGHT="">
			// radio 입력 양식을 제외한 입력 양식 태그를 가르키는 선택자 문자열 저장
			var htmlType2 = "select, textarea,input[type=text],input[type=password],input[type=hidden],input[type=image]";
			// 모든 입력 양식 태그를 가르키는 선택자 문자열 저장
			var htmlType3 = htmlType1 + "," + htmlType2;
			//----------------------------
			// 복사할 tr 태그 안의 입력 양식에 입력/선택 데이터의 개수 얻기
			//----------------------------
			// 입력/선택된 데이터의 갯 수를 정장할 변수 선언
			var dataCnt = 0;
			lastTrObj.find(htmlType3).each(
					function() {
						// each 메소드가 잡은 입력양식에 데이터가 있으면 dataCnt 변수 안의 데이터 1 증가
						// each 메소드가 잡은 입력양식을 관리하는 JQuery 객체를 생성해서 저장
						var thisObj = $(this);
						if (thisObj.prop("type") == "radio"
								|| thisObj.prop("type") == "checkbox") {
							// each 메소드가 잡은 입력양식이 체크되어 있으면 dataCnt 변수안에 1증가
							if (thisObj.filter(":checked").length > 0) {
								dataCnt++;
							}
						}
						// each 메소드가 잡은 입력양식이 checkbox 또는 radio가 아니면
						else {
							// each 메소드가 잡은 입력양식의 입력/선택값이 있으면 dataCnt 변수안에 1증가
							var val = thisObj.val();
							if (val.split(" ").join("") != "") {
								dataCnt++;
							}
						}
					});
			// 만약에 dataCnt 변수가 0이면
			if (dataCnt == 0) {
				alert("마지막 행에 데이터가 비어있어 행 추가 불가능");
				return;
			}
			//-------------------------------------------	
			// 마지막 tr 을 복사해 맨 밑에 추가하고 복사 tr 안의 입력 야익에 입력/선택 데이터 지우기
			//-------------------------------------------	
			lastTrObj.parent().append(lastTrObj.clone());
			// 오른쪽처럼도 가능 lastTrObj.after(lastTrObj.clone());/
			//----------------------------------------
			// 추가된 마지막 tr 을 관리하는 JQuery 객체를 생성
			//----------------------------------------
			lastTrObj = lastTrObj.next();
			// 오른쪽처럼도 가능 lastTrObj = lastTrObj.parent().chilren("tr").last();
			//----------------------------------------
			// 추가된 tr 안의 입력 양식에 데이터 비우기
			//----------------------------------------
			lastTrObj.find(htmlType2).val("");
			lastTrObj.find(htmlType1).prop("checked", false);
			//-----------------------------------------------
			// 추가한 tr 안의 입력 양식의 name 속성값 바꾸기
			//-----------------------------------------------
			var totTrCnt = lastTrObj.parent().children("tr").length;
			var flag = false;
			lastTrObj.find(htmlType3).each(function(i) {
				// each 메소드가 잡은 입력양식을 관리하는 jQuery 객체를 생성해서 저장
				var thisObj = $(this);
				// each 메소드가 잡은 입력양식의 name 속성값 얻기
				var nameV = thisObj.prop("name");
				// 만약 _숫자로 끝나면
				/* if( nameV.lastIndexOf("_"+(totTrCnt-1))>=0 ) {
					// name 속성값을 _totTrCnt변수데이터로 수정
					var arr = nameV.split("_");
					arr[arr.length-1] = "_"+totTrCnt;
					thisObj.attr( "name", arr.join("") );
				} */
				/* else{ flag=true } */
			});
			if (flag == true) {
				//마지막 tr 태그를 지움
				lastTrObj.remove();
				alert("<개발자 수정 사항>한 행의 입력 향식 name 속성값 마지막에는_숫자 가 붙어야합니다.");
			}

		}
	</script>
	<section>
		<input type="hidden" value="${checkup}" name="checkup"> <input
			type="hidden" value="${doctorno}" name="doctorno">






		<center>

			<form
				action="examinationInputPro?checkup=${checkup}&doctorno=${docDto.doctorno}"
				method="post" name="examinationAdd">
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
										<table class="table" border="1">
											<tr>
												<th rowspan="3"><br>환<br>자</th>
												<th>이름</th>
												<td>${gusDto.guestname}</td>
												<th rowspan="3">의<br>료<br>기<br>관
												</th>
												<th>명칭</th>
												<td>
													<%-- ${hosDto.hospitalname} --%>
												</td>
											</tr>
											<tr>
												<th>주민번호</th>
												<td>${gusDto.jumin}</td>
												<th>전화번호</th>
												<td>
													<%-- ${hosDto.hospitalphone} --%>
												</td>

											</tr>
											<tr>
												<th>연락처</th>
												<td>${gusDto.guesttel}</td>
												<th>의사명</th>
												<td>${docDto.doctorname}</td>
											</tr>

										</table>
										<table class="table table-striped table-hover" border="1">
											<tr>
												<th>증상</th>
											</tr>
											<tr>
												<td><textarea cols="90" rows="5" name="symptom"
														maxlength="100" style="resize: none;"></textarea></td>
											</tr>
										</table>
										<table class="table table-striped table-hover" border="1"
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
													<td><input type="text" style="width: 100%"
														name="drugname1"></td>
													<td><input type="text" style="width: 100%"
														name="drugdosage1"></td>
													<td><input type="text" style="width: 100%" min="0"
														max="99" name="drugrepeat1">번</td>
													<td><input type="text" style="width: 100%" min="0"
														max="99" name="dosagedate1">일</td>
													<td><input type="text" style="width: 100%"
														name="dosageusage1"></td>
												</tr>
										</table>
										<input type="button" value="행추가" onclick="addTr( 'xxx' );">
										<input type="button" value="행삭제" onclick="delLastTr( 'xxx' );">
										<table class="table table-striped table-hover" border="1" id="yyy">
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
												<td><textarea rows="3" name="caution" maxlength="255"
														style="resize: none;"></textarea></td>
											</tr>
											<tr>
												<td><input type="text" style="width: 100%"
													name="injectionname1"></td>
												<td><input type="text" style="width: 100%"
													name="injectiondosage1"></td>
												<td><input type="text" style="width: 100%" min="0"
													max="99" name="injectionrepeat1">번</td>
												<td><input type="text" style="width: 100%" min="0"
													max="99" name="injectiondate1">일</td>
											</tr>
											</tbody>
										</table>
										<input type="button" value="행추가" onclick="addTr( 'yyy' );">

										<input type="button" value="행삭제" onclick="delLastTr2( 'yyy' );">

									</div>
									<div style="display: table; margin: 0 auto;">
										<input type="submit" value="처방등록" style="margin-right: 5px;">
										<input type="reset" value="작성취소"> <input type="button"
											value="처방목록" style="margin-left: 5px;"
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
