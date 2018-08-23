<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/setting.jsp"%>
<html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="/medical/resources/css/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!------ Include the above in your HEAD tag ---------->

<header>
	<%@ include file="../common/header.jsp"%>
</header>
<%@ include file="../common/line.jsp"%>

<section>
	<form
		action="checkupAddInputPro?checkuplist=${checkuplist}&doctorno=${docDto.doctorno}"
		method="post" name="checkupAdd"
		onsubmit="return checkupAddCheck(${kind})">
		<input type="hidden" value="${checkuplist}" name="checkuplist">
		<input type="hidden" value="${doctorno}" name="doctorno">

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
									<h3>건강검진 입력</h3>
								</div>
							<table class="responstable" border="1">
								
									<tr>
										<th>환자명</th>
										<td>${gusDto.guestname}</td>
										<th style="width: 15%;">주민등록번호</th>
										<td>${jumin}-*******</td>
									</tr>

									<tr>
										<th>연락처</th>
										<td>${gusDto.guesttel}</td>
										<th>이메일</th>
										<td>${gusDto.guestemail}</td>
									</tr>
								</table>
								<table class="table table-striped table-hover" border="1">
									<thead>
										<tr>
											<th class="col-check"></th>
											<th style="text-align: center; width: 10%">구분</th>
											<th colspan="2" style="text-align: center;">목표질환</th>
											<th style="text-align: center;">결과</th>
											<th colspan="2" style="text-align: center;">참고치</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${kind=='1'}">
											<tr>
												<td class="col-check"></td>
												<td rowspan="9" style="text-align: center;">계층<br>검사
												</td>
												<td rowspan="3">비만</td>
												<td>신장</td>
												<td><input type="text" name="height">cm</td>
												<td style="width: 10%"></td>
												<td></td>
											</tr>
											<tr>
												<td>체중</td>
												<td><input type="text" name="weight">kg</td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td>비만도</td>
												<td><input type="text" name="fatness">BMI</td>
												<td></td>
												<td>
												<span style="color:blue;">
									                              저체중 18 미만   </span>      <br>
									                              <span style="color:green;">
									                              정상 : 18이상 ~ 23미만</span><br>
									                              <span style="color:orange;">
									                              과체중 : 23이상~25미만</span><br>
									                              <span style="color:red;">
									                              비만 : 25이상~30미만 </span><br>
									                              <span style="color:purple;"> 
									                              고도비만 30이상</span>
												</td>
											</tr>
											<tr>
												<td rowspan="2">시각<br>이상
												</td>
												<td>시력(좌)</td>
												<td><input type="text" name="visionl"></td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td>시력(우)</td>
												<td><input type="text" name="visionr"></td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td rowspan="2">청각<br>이상
												</td>
												<td>청력(좌)</td>
												<td><input type="text" name="hearingl"></td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td>청력(우)</td>
												<td><input type="text" name="hearingr"></td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td rowspan="2">고혈압</td>
												<td>혈압<br>(최고)
												</td>
												<td><input type="text" name="bloodpremax">mmHg</td>
												<td></td>
												<td style="color:green;">120이하</td>
											</tr>
											<tr>
												<td>혈압<br>(최저)
												</td>
												<td><input type="text" name="bloodpremin">mmHg</td>
												<td></td>
												<td style="color:green;">80이상</td>
											</tr>
										</c:if>
										<c:if test="${kind=='2'}">
											<tr>
												<td rowspan="4" style="text-align: center;">요검사</td>
												<td rowspan="4">신장검사</td>
												<td>요당</td>
												<td><select name="urineglucose">
														<option>음성</option>
														<option>양성±</option>
												</select></td>
												<td style="color:green;">음성</td>
												<td style="color:red;">양성±</td>
											</tr>

											<tr>
												<td>요단백</td>
												<td><select name="urineprotein">
														<option>음성</option>
														<option>양성±</option>
												</select></td>
												<td style="color:green;">음성</td>
												<td style="color:red;">양성±</td>
											</tr>

											<tr>
												<td>요잠혈</td>
												<td><select name="occulthematuria">
														<option>음성</option>
														<option>양성±</option>
												</select></td>
												<td style="color:green;">음성</td>
												<td style="color:red;">양성±</td>
											</tr>

											<tr>
												<td>요ph</td>
												<td><input type="text" name="urineph"></td>
												<td style="color:green;">4.5~8</td>
												<td></td>
											</tr>
										</c:if>
										<c:if test="${kind=='3'}">
											<tr>
												<td rowspan="7" style="text-align: center;">혈액<br>검사
												</td>
												<td>빈혈등</td>
												<td>혈색소</td>
												<td><input type="text" name="hemoglobin">g/dL</td>
												<td style="color:green;">남:13~16.5<br>여:12~15.5
												</td>
												<td style="color:green;">남:12~12.9 / 16.6~17.5<br>여:10~11.9 / 15.6~16.5
												</td>
											</tr>

											<tr>
												<td>당뇨병</td>
												<td>혈당</td>
												<td><input type="text" name="bloodglucose">mg/dL</td>
												<td style="color:red;">100미만</td>
												<td style="color:green;">100~125</td>
											</tr>

											<tr>
												<td>고혈압<br>
												<br> 이상지질<br>혈증<br>
												<br> 동맥경화
												</td>
												<br>
												<td>총<br>콜레스테롤
												</td>
												<td><input type="text" name="totalcholesterol">mg/dL</td>
												<td style="color:red;">130미만</td>
												<td style="color:green;">130~239</td>
											</tr>

											<tr>
												<td rowspan="4">간장질환</td>
												<td>AST(SGOT)</td>
												<td><input type="text" name="ast">UL</td>
												<td style="color:red;">40이하</td>
												<td style="color:green;">41~50</td>
											</tr>

											<tr>
												<td>ALT(SGPT)</td>
												<td><input type="text" name="alt">UL</td>
												<td style="color:red;">35이하</td>
												<td style="color:green;">36~45이하</td>
											</tr>

											<tr>
												<td>감마지티피</td>
												<td><input type="text" name="gammagtp">UL</td>
												<td style="color:green;">남:11~63<br> 여:8~35
												</td>
												<td style="color:green;">남:64~77<br> 여:36~45
												</td>
											</tr>

											<tr>
												<td>간염검사</td>
												<td><input type="text" name="hepatitisscr"></td>
												<td></td>
												<td></td>
											</tr>
										</c:if>
										<c:if test="${kind=='4'}">
											<tr>
												<td rowspan="2" style="text-align: center;">영상<br>검사</td>
												<td>폐결핵 흉부 질환</td>
												<td>흉부방사선검사</td>
												<td><select name="breastradiography">
														<option>정상</option>
														<option>비활동성</option>
												</select></td>
												<td style="color:green;">정상</td>
												<td style="color:red;">비활동성</td>
											</tr>

											<tr>
												<td>심장질환</td>
												<td>심전도 검사</td>
												<td><select name="ecg">
														<option>정상</option>
														<option>비활동성</option>
												</select></td>
												<td style="color:green;">정상</td>
												<td style="color:red;">비활동성</td>
											</tr>
										</c:if>
									</tbody>
								</table>
							</div>
							<div style="display: table; margin: 0 auto;">
								<input class="btn btn-dark-blue" type="submit" value="등록하기" style="margin-right: 5px;">
								<input class="btn btn-dark-blue" type="reset" value="작성취소">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<script>
/* class="success" */
$(function() {
    $('.col-check').hide();
    $('#btn-admin').on('click', function(){
        if($("#toolbar-admin").is(":visible"))
        {
		    $("#toolbar-admin").hide();
		    $(".col-check").hide();
        }
        else
        {
            $("#toolbar-admin").show();
            $(".col-check").show();
        }
	});
    
    $('#btn-online').on('click', function(){
         $('table tr').filter(':has(:checkbox:checked)').find('td').parent().removeClass().addClass('success');
         $('table tr').filter(':has(:checkbox:checked)').find('td.status').text('Online');
    });
    $('#btn-offline').on('click', function(){
         $('table tr').filter(':has(:checkbox:checked)').find('td').parent().removeClass().addClass('warning');
         $('table tr').filter(':has(:checkbox:checked)').find('td.status').text('Offline');
    });
    $('#btn-out-of-order').on('click', function(){
         $('table tr').filter(':has(:checkbox:checked)').find('td').parent().removeClass().addClass('danger');
         $('table tr').filter(':has(:checkbox:checked)').find('td.status').text('Out Of Order');
    });
    
});
</script>
	</form>
</section>

<footer>
	<%@ include file="../common/footer.jsp"%>
</footer>
</html>