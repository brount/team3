<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin_setting.jsp"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
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
											<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
											<script type="text/javascript">
												google.charts.load('current', {'packages':['corechart']});
												google.charts.setOnLoadCallback(drawChart);
												
												function drawChart() {
												
													var data = google.visualization.arrayToDataTable([
														['총결산', '포인트'],
														['획득포인트',${cum}],
														['사용포인트',${tal}]
													]);
													
													var options = {
														title: '총결산',
														is3D: true,
													};
													
													var chart = new google.visualization.PieChart(document.getElementById('piechart'));
													
													chart.draw(data, options);
												}
											</script>
											<div id="piechart" style="width: 1000px; height: 500px;"></div>
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
													<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}">
													<c:set value="0" var="a"></c:set>
													<c:forEach var="dto" items="${dtos}">
														<tr>
															<td>${dto.pointNo }</td>
															<td>${dtos2[a].doctorno}</td>
															<td>${dtos2[a].doctorid}</td>
															<td>
																<fmt:formatDate type="both" pattern="yy-MM-dd"
																	value="${dto.cum_date}" />
															</td>

															<td>
																<c:if test="${dto.point != 0}">
																	<c:if test="${dto.status == 1}">
																		+ ${dto.point}
																	</c:if>

																	<c:if test="${dto.status == 2}">
																		- ${dto.point}
																	</c:if>
																</c:if>
																<c:if test="${dto.point == 0}">
																	${dto.point}
																</c:if>
															</td>
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