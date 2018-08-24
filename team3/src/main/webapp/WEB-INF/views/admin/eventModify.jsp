<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin_setting.jsp"%>
<html>
<head>
<title>관리자 페이지 - 광고관리</title>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="./admin_nav.jsp"></jsp:include>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">이벤트 수정 페이지</h1>
					<!-- 페이지 제목 -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="container">
					<div class="col-lg-9">
						<form class="form-horizontal" action="eventModifyPro"
							method="post" id="reg_form" enctype="multipart/form-data">
							<input type="hidden" name="advertisementNo" value="${dto.advertisementNo}">
							<div class="input-group">
								<label>제목</label>
								<input name="title" class="form-control"
									type="text" value="${dto.advertisementTitle }" required>
							</div>

							<div class="input-group">
								<label>이벤트 기간 </label>
								<div class="input-group">
									<input id="date1" name="date1" class="form-control" type="date"
										onchange="date();" value="${dto.advertisementStart }">
									<input id="date2" name="date2" class="form-control" type="date"
										value="${dto.advertisementEnd }" readonly>
								</div>
								<input type="radio" name="point" value="1000" checked="checked">7일
								<input type="radio" name="point" value="2000">15일
								<input type="radio" name="point" value="3500">30일

								<script type="text/javascript">
									function dateC() {
										var formattedDate = new Date();
										var d = formattedDate.getDate();
										var m = formattedDate.getMonth();

										(++m < 10) ? m = "0" + m : m;
										(d < 10) ? d = "0" + d : d;
										var y = formattedDate.getFullYear();
										$("#date1").val(y + "-" + m + "-" + d);
										var d2 = Number(d) + 7;

										if (d2 < 10) {
											d2 = "0" + d2;
										}
										$("#date2").val(y + "-" + m + "-" + d2);
									}

									function date() {
										var date1 = $("#date1").val();

										var y = date1.substr(0, 4);
										var m = date1.substr(5, 2);
										var d = date1.substr(8, 2);

										var date = new Date(y, m, d);

										var formattedDate = new Date();
										var fy = formattedDate.getFullYear();
										var fm = formattedDate.getMonth();
										var fd = formattedDate.getDate();
										(++fm < 10) ? fm = "0" + fm : fm;
										(fd < 10) ? fd = "0" + fd : fd;

										if ((y * 1) < (fy * 1)) {
											alert("이전 연도 선택 불가능");
											$("#date1").val(
													fy + "-" + fm + "-" + fd);
											$("input[checked=checked]").prop(
													'checked', true);
											var d2 = Number(fd) + 7;
											if (d2 < 10) {
												d2 = "0" + d2;
											}
											$("#date2").val(
													fy + "-" + fm + "-" + d2);
											return false;
										} else if ((m * 1) < (fm * 1)) {
											alert("이전 월 선택 불가능");
											$("#date1").val(
													fy + "-" + fm + "-" + fd);
											$("input[checked=checked]").prop(
													'checked', true);
											var d2 = Number(fd) + 7;
											if (d2 < 10) {
												d2 = "0" + d2;
											}
											$("#date2").val(
													fy + "-" + fm + "-" + d2);
											return false;
										} else if ((d * 1) < (fd * 1)) {
											alert("이전 날짜 선택 불가능");
											$("#date1").val(
													fy + "-" + fm + "-" + fd);
											$("input[checked=checked]").prop(
													'checked', true);
											var d2 = Number(fd) + 7;
											if (d2 < 10) {
												d2 = "0" + d2;
											}
											$("#date2").val(
													fy + "-" + fm + "-" + d2);
											return false;
										}

										$("input[checked=checked]").prop(
												'checked', true);
										date.setDate(date.getDate() + 7);
										(d < 10) ? d = "0" + d : d;

										// year
										var yyyy = '' + date.getFullYear();

										// month
										var mm = ('0' + (date.getMonth())); // prepend 0 // +1 is because Jan is 0
										mm = mm.substr(mm.length - 2); // take last 2 chars

										// day
										var dd = ('0' + date.getDate()); // prepend 0
										dd = dd.substr(dd.length - 2); // take last 2 chars

										var date2 = yyyy + "-" + mm + "-" + dd;
										$("#date2").val(date2);
									}
									$("input[name=point]").click(function() {
										var date1 = $("#date1").val();
										console.log(date1);
										var y = date1.substr(0, 4);
										var m = date1.substr(5, 2);
										var d = date1.substr(8, 2);
										var date = new Date(y, m, d);
										switch ($(this).val()) {
										case "1000":
											date.setDate(date.getDate() + 7);
											break;
										case "2000":
											date.setDate(date.getDate() + 15);
											break;
										case "3500":
											date.setDate(date.getDate() + 30);
											break;
										}
										(d < 10) ? d = "0" + d : d;

										// year
										var yyyy = '' + date.getFullYear();

										// month
										var mm = ('0' + (date.getMonth())); // prepend 0 // +1 is because Jan is 0
										mm = mm.substr(mm.length - 2); // take last 2 chars

										// day
										var dd = ('0' + date.getDate()); // prepend 0
										dd = dd.substr(dd.length - 2); // take last 2 chars

										var date2 = yyyy + "-" + mm + "-" + dd;
										$("#date2").val(date2);

									})
								</script>
							</div>

							<div class="input-group">
								<label>이벤트 썸네일 이미지</label>
								<input name="thumbnail"
									class="form-control" type="file" style="padding: 1px;" required>
							</div>

							<div class="input-group">
								<label>이벤트 이미지</label>
								<input name="image" class="form-control"
									type="file" style="padding: 1px;" required>
							</div>

							<div class="input-group">
								<label>이벤트 내용 </label>
								<textarea class="form-control" rows="8" name="content"
									placeholder="이벤트 내용을 적어주세요 " style="resize: none;">${dto.advertisementContents }</textarea>
							</div>
							<!-- Text input-->

							<!-- Button -->
							<div class="input-group">
								<div style="display: table; margin: 0 auto;">
									<button type="submit" style="margin-right: 5px;">수정</button>
									<button type="button" style="margin-left: 5px"
										onclick="window.location='eventRequestList'">메인</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- /#page-wrapper -->
		</div>
		<!-- /#wrapper -->
	</div>
</body>
</html>