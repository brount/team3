<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="/medical/resources/css/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!------ Include the above in your HEAD tag ---------->
<header>
	<%@ include file="../common/header.jsp"%>
</header>

<%@ include file="../common/line.jsp"%>

<input type="hidden" value="${doctorno}" name="doctorno">
<section>
	<div class="container">
		<div class="row">
			<div class="col-sm-3 col-md-3">
				<%@ include file="../common/menuCheckup.jsp"%>
			</div>
			<div class="col-sm-9 col-md-9">
				<div class="well">
					<h3>
						<small style="font-family: 'Do Hyeon', sans-serif; font-size: 25px;">검진결과 목록 ></small> 검진결과 <small style="font-family: 'Do Hyeon', sans-serif; font-size: 25px;">> 처방전 등록</small>
					</h3>

					<div>
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3>검진결과</h3>
							</div>
							<table class="responstable" border="1">

								<tr>
									<th>환자명</th>
									<td>${gusDto.guestname}</td>
									<th>주민등록번호</th>
									<td>${jumin}-*******</td>
								</tr>
								
								<tr>
									<th>연락처</th>
									<td>${gusDto.guesttel}</td>
									<th>이메일 주소</th>
									<td>${gusDto.guestemail}</td>
								</tr>
								
							</table>

							<table class="responstable">
								<tr>
									<th style="padding: 0px; height: 34px;" colspan="2">▣ 검진결과 주의항목 및 관련 질병</th>
								</tr>
								<c:forEach var="item" items="${dtos2}">
									<tr>
										<th style="width: 20%;">${item.name }</th>
										<td colspan=6 style="text-align: left; font-size: 20px;">
											<b style="color: #47a3da;">관련질병 </b> <b> ${item.content }</b>
										</td>
									</tr>
								</c:forEach>
							</table>

							<table class="table table-striped table-hover" border="1">
								<thead>
									<tr>
										<th class="col-check"></th>
										<th style="text-align: center;">구분</th>
										<th colspan="2" style="text-align: center;">목표질환</th>
										<th style="text-align: center;">결과</th>
										<th colspan="2" style="text-align: center;">참고치</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="col-check"></td>
										<td rowspan="9" style="text-align: center;">계층<br>검사
										</td>
										<td rowspan="3">비만</td>
										<td>신장</td>
										<td>${CheckDto.height}cm</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>체중</td>
										<td>${CheckDto.weight}kg</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>비만도</td>
										<td><span
											<c:if test="${CheckDto.fatness < 18}">style="color:blue;"</c:if>
											<c:if test="${CheckDto.fatness >= 18 &&CheckDto.fatness<23}">style="color:green;"</c:if>
											<c:if test="${CheckDto.fatness >= 23 &&CheckDto.fatness<25}">style="color:orange;"</c:if>
											<c:if test="${CheckDto.fatness >= 25 &&CheckDto.fatness<30} ">style="color:red;"</c:if>
											<c:if test="${CheckDto.fatness >= 30}">style="color:purple;"</c:if>>
												${CheckDto.fatness}BMI </span></td>
										<td></td>
										<td>
											<span style="color: blue;"> 저체중 18 미만 </span> <br>
											<span style="color: green;"> 정상 : 18이상 ~ 23미만</span> <br>
											<span style="color: orange;"> 과체중 : 23이상~25미만</span> <br>
											<span style="color: red;"> 비만 : 25이상~30미만 </span> <br> <span
											style="color: purple;"> 고도비만 30이상</span>
										</td>
									</tr>
									<tr>
										<td rowspan="2">시각 이상</td>
										<td>시력(좌)</td>
										<td>${CheckDto.visionl}</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>시력(우)</td>
										<td>${CheckDto.visionr}</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td rowspan="2">청각 이상</td>
										<td>청력(좌)</td>
										<td>${CheckDto.hearingl}</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>청력(우)</td>
										<td>${CheckDto.hearingr}</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td rowspan="2">고혈압</td>
										<td>혈압(최고)</td>
										<td>
											<span
											<c:if test="${CheckDto.bloodpremax > 140}">style="color:red;"</c:if>
											<c:if test="${CheckDto.bloodpremax >= 60}">style="color:green;"</c:if>
											<c:if test="${CheckDto.bloodpremax < 60}">style="color:red;"</c:if>>
												${CheckDto.bloodpremax}mmHg </span>
										</td>
										<td></td>
										<td style="color: green;">120이하</td>
									</tr>
									<tr>
										<td>혈압(최저)</td>
										<td>
											<span
											<c:if test="${CheckDto.bloodpremin < 60}">style="color:red;"</c:if>
											<c:if test="${CheckDto.bloodpremax >= 60}">style="color:green;"</c:if>
											<c:if test="${CheckDto.bloodpremin > 140}">style="color:red;"</c:if>>
												${CheckDto.bloodpremin}mmHg </span>
										</td>
										<td></td>
										<td style="color: green;">80이상</td>
									</tr>
									<tr>
										<td rowspan="4" style="text-align: center;">요검사</td>
										<td rowspan="4">신장검사</td>
										<td>요당</td>
										<td>
											<span
											<c:if test="${CheckDto.urineglucose == '음성'}">style="color:green;"</c:if>
											<c:if test="${CheckDto.urineglucose == '양성'}">style="color:red;"</c:if>>
												${CheckDto.urineglucose} </span>
										</td>
										<td style="color: green;">음성</td>
										<td style="color: red;">양성±</td>
									</tr>

									<tr>
										<td>요단백</td>
										<td>
											<span
											<c:if test="${CheckDto.urineprotein == '음성'}">style="color:green;"</c:if>
											<c:if test="${CheckDto.urineprotein == '양성'}">style="color:red;"</c:if>>
												${CheckDto.urineprotein} </span>
										</td>
										<td style="color: green;">음성</td>
										<td style="color: red;">양성±</td>
									</tr>

									<tr>
										<td>요잠혈</td>
										<td>
											<span
											<c:if test="${CheckDto.occulthematuria == '음성'}">style="color:green;"</c:if>
											<c:if test="${CheckDto.occulthematuria == '양성'}">style="color:red;"</c:if>>
												${CheckDto.occulthematuria} </span>
										</td>
										<td style="color: green;">음성</td>
										<td style="color: red;">양성±</td>
									</tr>

									<tr>
										<td>요ph</td>
										<td>
											<span
											<c:if test="${CheckDto.urineph < 4}">style="color:red;"</c:if>
											<c:if test="${CheckDto.urineph >= 4}">style="color:green;"</c:if>
											<c:if test="${CheckDto.urineph > 8}">style="color:red;"</c:if>>
												${CheckDto.urineph}mmHg </span>
										</td>
										<td style="color: green;">4~8</td>
										<td></td>
									</tr>

									<tr>
										<td rowspan="7" style="text-align: center;">혈액<br>검사
										</td>
										<td>빈혈등</td>
										<td>혈색소</td>
										<td>
											<span
											<c:if test="${CheckDto.hemoglobin < 12}">style="color:red;"</c:if>
											<c:if test="${CheckDto.hemoglobin >= 12}">style="color:green;"</c:if>
											<c:if test="${CheckDto.hemoglobin > 17}">style="color:red;"</c:if>>
												${CheckDto.hemoglobin}g/dL </span>
										</td>
										<td style="color: green;">남:13~16<br>여:12~15
										</td>
										<td style="color: green;">남:12~13 / 16~17<br>여:10~12
											/ 15~16
										</td>
									</tr>


									<tr>
										<td>당뇨병</td>
										<td>혈당</td>
										<td>
											<span
											<c:if test="${CheckDto.bloodglucose < 100}">style="color:red;"</c:if>
											<c:if test="${CheckDto.bloodglucose >= 100}">style="color:green;"</c:if>
											<c:if test="${CheckDto.bloodglucose > 125}">style="color:red;"</c:if>>
												${CheckDto.bloodglucose}mg/dL </span>
										</td>
										<td style="color: red;">100미만</td>
										<td style="color: green;">100~125</td>
									</tr>

									<tr>
										<td>고혈압<br> 이상지질혈증<br> 동맥경화
										</td>
										<td>총콜레스테롤</td>
										<td>
											<span
											<c:if test="${CheckDto.totalcholesterol < 100}">style="color:red;"</c:if>
											<c:if test="${CheckDto.totalcholesterol >= 100}">style="color:green;"</c:if>
											<c:if test="${CheckDto.totalcholesterol > 239}">style="color:red;"</c:if>>
												${CheckDto.totalcholesterol}mg/dL </span>
										</td>
										<td style="color: red;">130미만</td>
										<td style="color: green;">130~239</td>
									</tr>

									<tr>
										<td rowspan="4">간장질환</td>
										<td>AST(SGOT)</td>
										<td>${CheckDto.ast}UL</td>
										<td style="color: red;">40이하</td>
										<td style="color: green;">41~50</td>
									</tr>

									<tr>
										<td>ALT(SGPT)</td>
										<td>${CheckDto.alt}UL</td>
										<td style="color: red;">35이하</td>
										<td style="color: green;">36~45이하</td>
									</tr>

									<tr>
										<td>감마지티피</td>
										<td>${CheckDto.gammagtp}UL</td>
										<td style="color: red;">남:11~63<br> 여:8~35
										</td>
										<td style="color: green;">남:64~77<br> 여:36~45
										</td>
									</tr>

									<tr>
										<td>간염검사</td>
										<td>${CheckDto.hepatitisscr}</td>
										<td></td>
										<td></td>
									</tr>

									<tr>
										<td rowspan="2" style="text-align: center;">영상<br>검사
										</td>
										<td>폐결핵 흉부 질환</td>
										<td>흉부방사선검사</td>
										<td>${CheckDto.breastradiography}</td>
										<td style="color: green;">정상</td>
										<td style="color: red;">비활동성</td>
									</tr>

									<tr>
										<td>심장질환</td>
										<td>심전도 검사</td>
										<td>${CheckDto.ecg}</td>
										<td style="color: green;">정상</td>
										<td style="color: red;">비활동성</td>
									</tr>
									<!--  <tr>
                              <td colspan=6 align=center> 주의사항</td>                                                  
                           </tr> -->
									<%--   <c:forEach var="item" items="${dtos2}">
                           <tr>                  
                           	<td colspan=6 style="color:red;">
                           	 <b style="color:#47a3da;">${item.name } |</b>    ${item.content }
                            </td>
                           </tr>
                           </c:forEach> --%>
								</tbody>
							</table>

						</div>
					</div>
				</div>
				<center>

					<c:if test="${sessionScope.memberState == 2 }">
						<input type="button" class="btn btn-dark-blue" value="처방전 등록" style="margin-right: 5px;"
							onclick="window.location='examinationAdd?checkup=${checkup}&doctorno=${doctorno}'">
						<input type="reset" class="btn btn-dark-blue" value="취소">
						<input type="button" class="btn btn-dark-blue" value="검진결과목록" style="margin-left: 5px;"
							onclick="window.location='checkupResultList'">
					</c:if>
					
					<c:if test="${sessionScope.memberState != 2 }">
						<input type="button" class="btn btn-dark-blue" value="검진결과목록" style="margin-left: 5px;"
							onclick="window.location='guestcheckupResultList'">
					</c:if>
					
			</div>
		</div>
	</div>

	<script>
		/* class="success" */
		$(function() {
			$('.col-check').hide();
			$('#btn-admin').on('click', function() {
				if ($("#toolbar-admin").is(":visible")) {
					$("#toolbar-admin").hide();
					$(".col-check").hide();
				} else {
					$("#toolbar-admin").show();
					$(".col-check").show();
				}
			});

			$('#btn-online').on(
					'click',
					function() {
						$('table tr').filter(':has(:checkbox:checked)').find(
								'td').parent().removeClass()
								.addClass('success');
						$('table tr').filter(':has(:checkbox:checked)').find(
								'td.status').text('Online');
					});
			$('#btn-offline').on(
					'click',
					function() {
						$('table tr').filter(':has(:checkbox:checked)').find(
								'td').parent().removeClass()
								.addClass('warning');
						$('table tr').filter(':has(:checkbox:checked)').find(
								'td.status').text('Offline');
					});
			$('#btn-out-of-order')
					.on(
							'click',
							function() {
								$('table tr').filter(':has(:checkbox:checked)')
										.find('td').parent().removeClass()
										.addClass('danger');
								$('table tr').filter(':has(:checkbox:checked)')
										.find('td.status').text('Out Of Order');
							});

		});
	</script>
</section>

<footer>
	<%@ include file="../common/footer.jsp"%>
</footer>

</html>