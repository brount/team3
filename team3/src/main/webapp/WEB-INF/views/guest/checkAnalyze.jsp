<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load('current', {'packages':['bar','corechart']});
    
    function schedulerSuccessAndFailChart() {
        var data = google.visualization.arrayToDataTable([
        	["수치","정상수치", "나의 수치"],
        	["최고혈압", 120, ${vo.bloodpremax}],
        	["최저혈압", 60, ${vo.bloodpremin}],
        	["공복혈당", 100, ${vo.bloodglucose}],
        	["총콜레스테롤", 240, ${vo.totalcholesterol}],
        	["BMI", 23, ${vo.fatness}]
      	 	]);
       var barChartOption = {
    		   title:{textStyle:{fontSize:22}},
               bars: 'vertical',
               height :500,
               width :'100%',
               legend: { position: "top" },
               isStacked: false,
               tooltip:{textStyle : {fontSize:22}, showColorCode : true	},
               animation: { //차트가 뿌려질때 실행될 애니메이션 효과
                 startup: true,
                 duration: 1000,
                 easing: 'linear' },
               annotations: {
                   textStyle: {
                     fontSize: 15,
                     bold: true,
                     italic: true,
                     color: '#871b47',
                     auraColor: '#d799ae',
                     opacity: 0.8
                   }
              }
        };
       var chart = new google.visualization.BarChart(document.getElementById('bar_chart_div'));
       chart.draw(data, barChartOption);
       window.addEventListener('resize', function() { chart.draw(data, barChartOption); }, false);
    }
    google.charts.setOnLoadCallback(schedulerSuccessAndFailChart);

    </script>

<link href="/medical/resources/css/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
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
						<div>

							<form action="checkupRegister" name="cr">
								<div class="panel panel-primary" style="margin-left: 10px">
									<div class="panel-heading">
										<c:if test="${selectcnt ==0 }">
											<div class="form-group">
												<div style="display: table; margin: 0 auto;">
													<button type="submit" class="btn btn-dark-blue" >
														검진서를 등록해주세요~! <span class="glyphicon glyphicon-send"></span>
													</button>
												</div>
											</div>
										</c:if>
										<c:if test="${selectcnt !=0 }">
											<h3>${vo.guestname }님의 건강검진 결과</h3>
										</c:if>
									</div>

									<div id="toolbar-admin" class="panel-body"></div>
									<div id="bar_chart_div" style="width: 95%; height: 500px; margin: 0 auto;"></div>
									<table class="table table-striped table-hover" border="1"
										style="width: 95%; margin: 5px auto;">
										<thead>
											<tr>
												<th class="col-check"></th>
												<th>구분</th>
												<th colspan="2">목표질환</th>
												<th>결과</th>
												<th colspan="2">참고치</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="col-check"></td>
												<td rowspan="9">계층<br>검사</td>
												<td rowspan="3">비만</td>
												<td>신장</td>
												<td>${vo.height}cm</td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td>체중</td>
												<td>${vo.height}kg</td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td>비만도</td>
												<td>
													<span 
					                                    <c:if test="${vo.fatness < 18}">style="color:blue;"</c:if>
					                                    <c:if test="${vo.fatness >= 18 && vo.fatness < 23}">style="color:green;"</c:if>
					                                    <c:if test="${vo.fatness >= 23 && vo.fatness < 25}">style="color:orange;"</c:if>
					                                    <c:if test="${vo.fatness >= 25 && vo.fatness < 30} ">style="color:red;"</c:if>
					                                    <c:if test="${vo.fatness >= 30}">style="color:purple;"</c:if>
					                                 >
					                                    ${vo.fatness}BMI
					                                 </span>
												</td>
												<td></td>
												<td>
													<div style="border:1px solid;border-color:blue; background:blue; padding:7px; display:-webkit-inline-box;"></div>
					                              	<span style="color:blue;"> 저체중:18 미만   </span> <br>
													<div style="border:1px solid;border-color:green; background:green; padding:7px; display:-webkit-inline-box;"></div>
													<span style="color:green;"> 정상:18~22 </span> <br>
													<div style="border:1px solid;border-color:orange; background:orange; padding:7px; display:-webkit-inline-box;"></div>
													<span style="color:orange;"> 과체중:23~24 </span> <br>
													<div style="border:1px solid;border-color:red; background:red; padding:7px; display:-webkit-inline-box;"></div>
													<span style="color:red;"> 비만:25~29 </span> <br>
													<div style="border:1px solid;border-color:purple; background:purple; padding:7px; display:-webkit-inline-box;"></div>
													<span style="color:purple;"> 고도비만:30 이상 </span>
												</td>
											</tr>
											<tr>
												<td rowspan="2">시각 이상</td>
												<td>시력(좌)</td>
												<td>${vo.visionl}</td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td>시력(우)</td>
												<td>${vo.visionr}</td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td rowspan="2">청각 이상</td>
												<td>청력(좌)</td>
												<td>${vo.hearingl}</td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td>청력(우)</td>
												<td>${vo.hearingr}</td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td rowspan="2">고혈압</td>
												<td>혈압(최고)</td>
												<td name="bloodpremax">
													<span 
					                                   <c:if test="${vo.bloodpremax > 140}">style="color:red;"</c:if>
					                                   <c:if test="${vo.bloodpremax >= 60}">style="color:green;"</c:if>
					                                   <c:if test="${vo.bloodpremax < 60}">style="color:red;"</c:if>
					                                   > 
					                                   ${vo.bloodpremax}mmHg 
					                                </span>
												</td>
												<td></td>
												<td style="color: green;">120이하</td>
											</tr>
											<tr>
												<td>혈압(최저)</td>
												<td>
													<span 
					                                   <c:if test="${vo.bloodpremin < 60}">style="color:red;"</c:if> 
					                                   <c:if test="${vo.bloodpremax >= 60}">style="color:green;"</c:if>
					                                   <c:if test="${vo.bloodpremin > 140}">style="color:red;"</c:if>
					                                   > 
					                                      ${vo.bloodpremin}mmHg
					                                </span>
												</td>
												<td></td>
												<td style="color: green;">80이상</td>
											</tr>
											<tr>
												<td rowspan="4">요검사</td>
												<td rowspan="4">신장검사</td>
												<td>요당</td>
												<td>
													<span
					                                   <c:if test="${vo.urineglucose == '음성'}">style="color:green;"</c:if>
					                                   <c:if test="${vo.urineglucose == '양성'}">style="color:red;"</c:if>
					                                   >
					                                   ${vo.urineglucose}                                 
					                                </span> 
												</td>
												<td style="color: green;">음성</td>
												<td style="color: red;">약양성±</td>
											</tr>

											<tr>
												<td>요단백</td>
												<td>
													<span
					                                   <c:if test="${vo.urineprotein == '음성'}">style="color:green;"</c:if>
					                                   <c:if test="${vo.urineprotein == '양성'}">style="color:red;"</c:if>
					                                   >
					                                   ${vo.urineprotein}                                 
					                                </span>
												</td>
												<td style="color: green;">음성</td>
												<td style="color: red;">약양성±</td>
											</tr>

											<tr>
												<td>요잠혈</td>
												<td>
													<span
					                                   <c:if test="${vo.occulthematuria == '음성'}">style="color:green;"</c:if>
					                                   <c:if test="${vo.occulthematuria == '양성'}">style="color:red;"</c:if>
					                                   >
					                                   ${vo.occulthematuria}                                 
					                                </span>
												</td>
												<td style="color: green;">음성</td>
												<td style="color: red;">약양성±</td>
											</tr>

											<tr>
												<td>요ph</td>
												<td>
													<span 
					                                   <c:if test="${vo.urineph < 4}">style="color:red;"</c:if> 
					                                   <c:if test="${vo.urineph >= 4}">style="color:green;"</c:if>
					                                   <c:if test="${vo.urineph > 8}">style="color:red;"</c:if>
					                                   > 
					                                      ${vo.urineph}mmHg
					                                </span>
												</td>
												<td style="color: green">4~8</td>
												<td></td>
											</tr>

											<tr>
												<td rowspan="7">혈액<br>검사</td>
												<td>빈혈등</td>
												<td>혈색소</td>
												<td>
													<span 
					                                    <c:if test="${vo.hemoglobin < 12}">style="color:red;"</c:if> 
					                                    <c:if test="${vo.hemoglobin >= 12}">style="color:green;"</c:if>
					                                    <c:if test="${vo.hemoglobin > 17}">style="color:red;"</c:if>
					                                    >
					                              		${vo.hemoglobin}g/dL
					                              	</span>
												</td>
												<td style="color: green;">남:13~16<br>여:12~15
												</td>
												<td style="color: green;">남:12~13 / 16~17<br>여:10~12 / 15~16
												</td>
											</tr>

											<tr>
												<td>당뇨병</td>
												<td>혈당</td>
												<td>
													<span 
					                                    <c:if test="${vo.bloodglucose < 100}">style="color:red;"</c:if> 
					                                    <c:if test="${vo.bloodglucose >= 100}">style="color:green;"</c:if>
					                                    <c:if test="${vo.bloodglucose > 125}">style="color:red;"</c:if>
					                                    >
					                              		${vo.bloodglucose}mg/dL
					                              	</span>
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
					                                    <c:if test="${vo.totalcholesterol < 100}">style="color:red;"</c:if> 
					                                    <c:if test="${vo.totalcholesterol >= 100}">style="color:green;"</c:if>
					                                    <c:if test="${vo.totalcholesterol > 239}">style="color:red;"</c:if>
					                                    >
					                              		${vo.totalcholesterol}mg/dL
					                              	</span>
												</td>
												<td style="color: red;">200미만</td>
												<td style="color: green;">130~239</td>
											</tr>

											<tr>
												<td rowspan="4">간장질환</td>
												<td>AST(SGOT)</td>
												<td>${vo.ast}UL</td>
												<td style="color: red;">40이하</td>
												<td style="color: green;">41~50</td>
											</tr>

											<tr>
												<td>ALT(SGPT)</td>
												<td>${vo.alt}UL</td>
												<td style="color: red;">35이하</td>
												<td style="color: green;">36~45이하</td>
											</tr>

											<tr>
												<td>감마지티피</td>
												<td>${vo.gammagtp}UL</td>
												<td style="color: red;">남:11~63<br> 여:8~35
												</td>
												<td style="color: green;">남:64~77<br> 여:36~45
												</td>
											</tr>

											<tr>
												<td>간염검사</td>
												<td>${vo.hepatitisscr}</td>
												<td></td>
												<td></td>
											</tr>

											<tr>
												<td rowspan="2">영상<br>검사</td>
												<td>폐결핵 흉부 질환</td>
												<td>흉부방사선검사</td>
												<td>${vo.breastradiography}</td>
												<td style="color: green;">정상</td>
												<td style="color: red;">비활동성</td>
											</tr>

											<tr>
												<td>심장질환</td>
												<td>심전도 검사</td>
												<td>${vo.ecg}</td>
												<td style="color: green;">정상</td>
												<td style="color: red;">비활동성</td>
											</tr>
										</tbody>
									</table>

								</div>
							</form>
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
				</div>
			</div>
		</div>

	</section>
	<footer>
		<%@ include file="../common/footer.jsp"%>
	</footer>
</body>
</html>