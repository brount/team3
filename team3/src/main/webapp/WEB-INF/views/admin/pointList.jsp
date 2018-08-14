<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../admin_setting.jsp" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

function dateC(){		
	var formattedDate = new Date();
	var d = formattedDate.getDate();
	var m = formattedDate.getMonth();
	
	(++m < 10)? m = "0" + m : m;
	(d < 10)? d = "0" + d : d;
	var y = formattedDate.getFullYear(); 
	$("#date1").val(y + "-" + m + "-" + d);
	var d2 = Number(d)-7;
	if( d2<10){
		d2 = "0"+d2;
	}
	$("#date2").val(y + "-" + m + "-" + d2);
       	}
function date(){
	var date1 = $("#date1").val();
	
	var y = date1.substr(0,4);
	var m = date1.substr(5,2);
	var d = date1.substr(8,2);
	
	var date = new Date(y,m,d);
	
	var formattedDate = new Date();
	var fy = formattedDate.getFullYear();
	var fm = formattedDate.getMonth();
	var fd = formattedDate.getDate();
	(++fm < 10)? fm = "0" + fm : fm;
	(fd < 10)? fd = "0" + fd : fd;
	
	if ((y*1) > (fy*1)) {
		alert("현재연도 이후 연도 선택 불가능");
		$("#date1").val(fy + "-" + fm + "-" + fd);
		$("input[checked=checked]").prop('checked', true);
		var d2 = Number(fd)-7;
		if (d2<10){
			d2 = "0"+d2;
		}
		$("#date2").val(fy + "-" + fm + "-" + d2);
		return false;
	} else if ((m*1) > (fm*1)) {
		alert("현재월 이후 월 선택 불가능");
		$("#date1").val(fy + "-" + fm + "-" + fd);
		$("input[checked=checked]").prop('checked', true);
		var d2 = Number(fd)-7;
		if (d2<10){
			d2 = "0"+d2;
		}
		$("#date2").val(fy + "-" + fm + "-" + d2);
		return false;
	} else if ((d*1) > (fd*1)) {
		alert("현재날짜 이후 날짜 선택 불가능");
		$("#date1").val(fy + "-" + fm + "-" + fd);
		$("input[checked=checked]").prop('checked', true);
		var d2 = Number(fd)-7;
		if (d2<10){
			d2 = "0"+d2;
		}
		$("#date2").val(fy + "-" + fm + "-" + d2);
		return false;
	}
	
	$("input[checked=checked]").prop('checked', true);
	date.setDate(date.getDate()-7);  
	(d < 10)? d = "0" + d : d;
	
	 // year
    var yyyy = '' + date.getFullYear();

    // month
    var mm = ('0' + (date.getMonth()));  // prepend 0 // +1 is because Jan is 0
    mm = mm.substr(mm.length - 2);                  // take last 2 chars

    // day
    var dd = ('0' + date.getDate());         // prepend 0
    dd = dd.substr(dd.length - 2);                  // take last 2 chars
    
	var date2 = yyyy+"-"+mm+"-"+dd;
	$("#date2").val(date2);
}
$("input[name=point]").click(function(){
	var date1 = $("#date1").val();
	console.log(date1);
	var y = date1.substr(0,4);
	var m = date1.substr(5,2);
	var d = date1.substr(8,2);
	var date = new Date(y,m,d);
	switch($(this).val()){
		case 1000 :
			date.setDate(date.getDate()-7);  
			break;
		case 2000 :
			date.setDate(date.getDate()-15);  
			break;
		case 3500 :
			date.setDate(date.getDate()-30);
			break;
	}
	(d < 10)? d = "0" + d : d;
	
	 // year
    var yyyy = '' + date.getFullYear();

    // month
    var mm = ('0' + (date.getMonth()));  // prepend 0 // +1 is because Jan is 0
    mm = mm.substr(mm.length - 2);                  // take last 2 chars

    // day
    var dd = ('0' + date.getDate());         // prepend 0
    dd = dd.substr(dd.length - 2);                  // take last 2 chars
    
	var date2 = yyyy+"-"+mm+"-"+dd;
	$("#date2").val(date2);										
	
})
</script>
<html>
<head>
<title> 관리자 페이지 - 결산</title>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="./admin_nav.jsp"></jsp:include>
	
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">	
					<h1 class="page-header">결산 - 포인트목록</h1>		<!-- 페이지 제목 -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-8">
					<!-- /.panel -->
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="row">
								<div class="container">
									<div class="col-lg-9">
										<div id="bar_chart_div" style="width: 95%; height: 500px; margin: 0 auto;"></div>
										<div class="input-group">
										
											<script type="text/javascript">

											google.charts.load('current', {'packages':['bar','corechart']});

											function schedulerSuccessAndFailChart() {
												
											    var data = google.visualization.arrayToDataTable([
											    	["날짜","누적 포인트", "사용 포인트"],
											    	<c:set value="0" var="a"/>
													<c:forEach var="dto" items="${dtos1}" >
														[${dto.cum_date},${dto.point },${dtos2[a].point}],
														<c:set value="${a+1 }" var="a"/>
													</c:forEach> 												     
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
											<form action="pointChart" name="pointChartForm">
											<div class="input-group">
												<input id="date2" name="date2" class="form-control" type="date" readonly>
												<input id="date1"  name="date1" class="form-control" type="date" onchange="date();" required>
											</div>		
												<input type="radio" name="point" value="1000" checked="checked">7일
												<input type="radio" name="point" value="2000" >15일
												<input type="radio" name="point" value="3500">30일		          
											
							          			<input type="submit" value="조회">
							          		</form>
							      		</div>
						      		</div>
					      		</div>
							</div>
							<!-- /.row -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-4 -->
			</div>
			<!-- /.row -->
			
			<div class="row">
				<div class="col-lg-8">
				<!-- /.panel -->
					<div class="panel panel-default">
						<div class="panel-body">
	                        <div class="row">
	                            <div class="col-lg-4">
	                                <div class="table-responsive">
	                                    <table class="table table-bordered table-hover table-striped">
	                                        <thead>
	                                        <tr>
	                                            <th>회원번호</th>			
	                                            <th>회원ID</th>
	                                            <th>일자</th>
	                                            <th>사용/획득</th>
	                                            <th>가용포인트</th>
	                                            <th>누적포인트</th>
	                                        </tr>
	                                        </thead>
	                                        <tbody>
	                                        
	                                        <c:if test="${cnt > 0}">
	                                        	<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}">
	                                        	<c:set value="0" var="a"></c:set>
												<c:forEach var="dto" items="${dtos}" >
													<tr>
													    <td>${dtos2[a].doctorno}</td>
														<td>${dtos2[a].doctorid}</td>
														<td><fmt:formatDate type="both" pattern="yy-MM-dd" value="${dto.cum_date}"/></td>
														
														<td>
															<c:if test="${dto.status == 1}">
															+	${dto.point}
															</c:if>
															<c:if test="${dto.status == 2}">
															-	${dto.point}
															</c:if>
														</td>
														
														
														<td>
															<c:if test="${dto.status==1}">
																<c:set var="ava_point" value="${ava_point + dto.point}"/>
															</c:if>
															<c:if test="${dto.status==2}">
																<c:set var="ava_point" value="${ava_point - dto.point}"/>
															</c:if>
															${ava_point}
														</td>
														
														
														<td>
															<c:if test="${dto.status == 1 }">
																<c:set var="cum_point" value="${cum_point + dto.point}"/>
															</c:if>
															${cum_point}
														</td>
														
		                                        	</tr>
		                                        	<c:set var="a" value="${a+1 }"/>
		                                       	</c:forEach>
		                                       </c:if>
	                                        </tbody>
	                                    </table>
	                                    
	                                    
	                                    <!-- 페이지 컨트롤 -->
										<table align="center">
											<tr>
												<th align="center">
													<c:if test="${cnt > 0}">
														<!-- 맨끝[◀◀] / 이전[◀] -->
														<c:if test="${startPage > pageBlock}">
															<a href="pointList">[맨앞]</a>
															<a href="pointList?pageNum=${startPage - pageBlock}">[이전]</a>
														</c:if>
									
														<c:forEach var="i" begin="${startPage}" end="${endPage}">
															<c:if test="${i == currentPage}">
																<span><b>[${i}]</b></span>
															</c:if>
															<c:if test="${i != currentPage}">
																<a href="pointList?pageNum=${i}">[${i}]</a>
															</c:if>
														</c:forEach>
														
														<!-- 맨끝[▶▶] / 다음▶] -->
														<c:if test="${pageCount > endPage}">
															<a href="pointList?pageNum=${startPage + pageBlock}">[다음]</a>
															<a href="pointList?pageNum=${pageCount}">[맨뒤]</a>
														</c:if>
													</c:if>
												</th>
											</tr>
										</table>
	                                </div>
	                                <!-- /.table-responsive -->
	                            </div>
	                        </div>
	                        <!-- /.row -->
	                    </div>
	                    <!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-4 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->
	
	</div>
	<!-- /#wrapper -->
</body>
</html>