<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin_setting.jsp"%>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<html>
<head>
<title>관리자 페이지 - 결산</title>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="./admin_nav.jsp"></jsp:include>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">결산 - 포인트목록</h1>
					<!-- 페이지 제목 -->
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
										<div class="input-group">
										
											<fmt:formatDate value="${Date.valueOf(vo1.cum_date)}" pattern="yyyy-MM-dd" var='vo_date'/>
											
											<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
											<script type="text/javascript">
												google.charts.load('current', {'packages':['bar']});
												google.charts.setOnLoadCallback(drawChart);
												
												
												function drawChart() {
													
													var data = google.visualization.arrayToDataTable([
														['날짜', '사용포인트', '누적포인트'],
														<c:set var='a' value="0"/>
														<c:forEach var="vo1" items="${vo1}">
															if(${fn:length(vo1)}==0){
																[${a},if(${vo1.point}==null){${vo1.point}}else{${0}},if(${vo2[a].point}==null){${vo2[a].point}}else{${0}}]
															}else{
																","+[${a},if(${vo1.point}==null){${vo1.point}}else{${0}},if(${vo2[a].point}==null){${vo2[a].point}}else{${0}}]}
															<c:set var="a" value="${a+1 }"/>
														</c:forEach>
													]);
													
													var options = {
														chart: {
														title: '기간별 결산',
														subtitle: '${start}-${end}'
														}
													};
													
													var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
													
													chart.draw(data, google.charts.Bar.convertOptions(options));
												}
											</script>
											<form action="pointChart" name="pointChartForm">
											<div id="columnchart_material" style="width: 800px; height: 500px;"></div>
												<div class="input-group">
													<input id="date1" name="date1" class="form-control"	type="date" onchange="date();" required> 
													<input id="date2" name="date2" class="form-control" type="date" onchange="date();">
												</div>
												<script type="text/javascript">
												document.getElementById('date2').valueAsDate = new Date();

												function dateC(){		
													var formattedDate = new Date();
													var d = formattedDate.getDate();
													var m = formattedDate.getMonth();
													
													(++m < 10)? m = "0" + m : m;
													(d < 10)? d = "0" + d : d;
													var y = formattedDate.getFullYear(); 
													$("#date2").val(y + "-" + m + "-" + d);
													var d2 = Number(d)-7;
													if( d2<10){
														d2 = "0"+d2;
													}
													$("#date1").val(y + "-" + m + "-" + d2);
												       	}
												
												function date(){
													var date1 = $("#date1").val();
													var date2 = $("#date2").val();

													var y1 = date1.substr(0,4);
													var m1 = date1.substr(5,2);
													var d1 = date1.substr(8,2);
													
													var y2 = date2.substr(0,4);
													var m2 = date2.substr(5,2);
													var d2 = date2.substr(8,2);
													
													var date = new Date(y1,m1,d1,y2,m2,d2);
													
													var formattedDate = new Date();
													var fy = formattedDate.getFullYear();
													var fm = formattedDate.getMonth();
													var fd = formattedDate.getDate();
													(++fm < 10)? fm = "0" + fm : fm;
													(fd < 10)? fd = "0" + fd : fd;

													if ((y1*1) > (fy*1)) {
														alert("잘못된 날짜입니다.");
														$("#date1").val(fy + "-" + fm + "-" + fd);
														return false;
													} else if ((m1*1) > (fm*1)) {
														alert("잘못된 날짜입니다.");
														$("#date1").val(fy + "-" + fm + "-" + fd);
														return false;
													} else if ((d1*1) > (fd*1)) {
														alert("잘못된 날짜입니다.");
														$("#date1").val(fy + "-" + fm + "-" + fd);
														return false;
													} else if((y2*1) != null && (y2*1) < (y1*1)){
														alert("잘못된 날짜입니다.");
														$("#date2").val(y1 + "-" + m1 + "-" + d1);
														return false;
													} else if((m2*1) != null && (m2*1) < (m1*1)){
														alert("잘못된 날짜입니다.");
														$("#date2").val(y1 + "-" + m1 + "-" + d1);
														return false;
													} else if((d2*1) != null && (d2*1) < (d1*1)){
														alert("잘못된 날짜입니다.");
														$("#date2").val(y1 + "-" + m1 + "-" + d1);
														return false;
													} else if ((y2*1) > (fy*1)) {
														alert("잘못된 날짜입니다.");
														$("#date2").val(fy + "-" + fm + "-" + fd);
														return false;
													} else if ((m2*1) > (fm*1)) {
														alert("잘못된 날짜입니다.");
														$("#date2").val(fy + "-" + fm + "-" + fd);
														return false;
													} else if ((d2*1) > (fd*1)) {
														alert("잘못된 날짜입니다.");
														$("#date2").val(fy + "-" + fm + "-" + fd);
														return false;
													}
												}
												</script>
												<input type="submit" style="display: table; margin:0 auto;" class="btn btn-dark-blue" value="조회">
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
										<table class="responstable">
											<thead>
												<tr>
													<th>등록번호</th>
													<th>회원번호</th>
													<th>회원ID</th>
													<th>일자</th>
													<th>사용/획득</th>
												</tr>
											</thead>
											<tbody>

												<c:if test="${cnt > 0}">
													<input type="hidden" id="pageNum" name="pageNum"
														value="${pageNum}">
													<c:set value="0" var="a"></c:set>
													<c:forEach var="dto" items="${dtos}">
														<tr>
															<td>${dto.pointNo }</td>
															<td>${dtos2[a].doctorno}</td>
															<td>${dtos2[a].doctorid}</td>
															<td><fmt:formatDate type="both" pattern="yy-MM-dd"
																	value="${dto.cum_date}" /></td>

															<td><c:if test="${dto.status == 1}">
															+	${dto.point}
															</c:if> <c:if test="${dto.status == 2}">
															-	${dto.point}
															</c:if></td>
														</tr>
														<c:set var="a" value="${a+1 }" />
													</c:forEach>
												</c:if>
											</tbody>
										</table>

										<div class="pagination clearfix" style="display: table; margin: 0 auto;">
							                      <c:if test="${cnt>0}">
							                         <!-- 이전블록 -->
							                         <c:if test="${startPage > pageBlock }">
							                           <a href="pointList"><<</a>
							                            <a href="pointList?pageNum=${startPage - pageBlock}"><</a>
							                         </c:if>
							                         <!-- 페이지 블록 -->
							                         <c:forEach var="i" begin="${startPage }" end="${endPage }">
							                            <c:if test="${i == currentPage }">
							                               <strong>${i }</strong>
							                            </c:if>
							                            <c:if test="${i != currentPage }">
							                               <a href="pointList?pageNum=${i}">${i }</a>
							                            </c:if>
							                         </c:forEach>
							                         <!-- 다음블록 -->
							                         <c:if test="${pageCnt > endPage }">
							                            <a href="pointList?pageNum=${startPage + pageBlock}">></a>
							                            <a href="pointList?pageNum=${pageCount}">>></a>
							                            
							                         </c:if>
							                      </c:if>
							                   </div>



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