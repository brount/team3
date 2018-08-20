<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/medical/resources/djcss/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<!-- <link href="/medical/resources/djcss/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
 -->
<link href="/medical/resources/djcss/css/style.css" rel="stylesheet"
	type="text/css" />
</head>
<body>

	<header> 
		<%@ include file="../common/header.jsp"%>
	</header>
	
	<%@ include file="../common/line.jsp"%>

	<section>
	<div class="container">
		<div style="display: flex;">
		
			<div class="col-sm-3 col-md-3">
				<%@ include file="../common/menuHygiene.jsp"%>
			</div>

			<div class="mail-box">
				<form action="reserveForm">
					<!-- 조회된 질병이 없으면 -->
					<div class="inbox-body">
						<div class="mail-option">
							<c:if test="${selectcnt==0 }">
								<table class="table_d "  >
									<tr>
										<td colspan="6" align="center">조회된 질병이 없습니다. 증상을 다시
											체크해주세요.</td>
									</tr>
									<tr>
									<td colspan="6" align="center"><input type="button" class="btn btn-dark-blue" value="확인" 
									onclick="window.history.back()"></td>
									</tr>
								</table>
								
							</c:if>
						</div>
					</div>
					<!-- 조회된 질병이 있으면 -->
					<c:if test="${selectcnt!=0 }">
						<c:forEach var="dto" items="${dtos}">
							<div class="inbox-head">
								<div class="panel-heading">
									<h5>
										의심되는 질병은 <b style="font-size: 25px; font-family: 'Jua', sans-serif;"> ${dto.diseaseName } </b>입니다 .
									</h5>
								</div>
							</div>
							<div class="inbox-body">
								<div class="mail-option">
									<table class="table_d table-inbox table-hover">
										<tbody>
											<tr>
												<th>${dto.diseaseName }</th>
											</tr>
											<tr>
												<td>▶ 정의 : ${dto.diseaseDefine } ${dto.diseaseSymptom}
												</td>
											</tr>

											<tr>
												<td>▶ 증상 : ${dto.diseaseDiagnosis }</td>
											</tr>
											<tr>
												<td>▶ 합병증 : ${dto.complications }</td>
											</tr>
											<%-- 
										<tr>
											<td>
												 ▶ 진료과 : ${dto.diseasehospitalkind } 
											</td>										
										</tr>
										
										<tr>
													<td>
		                          			<h5>해당 질병의 진료과가 있는병원</h5>
		                          			<c:forEach var="hto" items="${htos}">
		                          			<input type="hidden" name="hospitalno" value=${hto.hospitalno } >
		                          			<tr>
													<th> ${hto.hospitalname }</th>										
												</tr>
		                          			<tr>
		                          				<td>
		                          				 ${hto.hospitaladdress1 } ${hto.hospitaladdress2 } ${hto.hospitaladdress3 }
		                          				</td>
		                          			</tr>
		                          			<tr>
		                          				<td>
		                          				 ${hto.hospitalphone } 
		                          				</td>
		                          			</tr>
		                          			<tr>
		                          				<td>
		                          				 ${hto.hospitalphone } 
		                          				</td>
		                          			</tr>
		                          			
											</c:forEach>	
											</td>
									</tr>
									 --%>
											<tr>
												<td>
													<%-- 	onclick="reserveForm?hospitalno=${hto.hospitalno }'" --%>
													<input type="button" class="btn btn-dark-blue"
													value="병원예약하러가기" style="display: table; margin: 0 auto;"
													onclick="window.location='achospitalSeach?state=1'">
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</form>

				<table style="width: 1000px" align="center">
					<tr>
						<th align="center"><c:if test="${cnt>0 }">
								<!-- 처음[◀◀] / 이전블록 [◀] -->
								<c:if test="${startPage > pageBlock }">
									<a href="bookList.hs">[◀◀]</a>
									<a href="bookList.hs?pageNum=${startPage-pageBlock}">[◀]</a>
								</c:if>
								<!-- 페이지 블록 -->
								<c:forEach var="i" begin="${startPage }" end="${endPage }">
									<c:if test="${i == currentPage }">
										<span> <b>[${i }]</b></span>
									</c:if>
									<c:if test="${i != currentPage }">
										<a href="bookList.hs?pageNum=${i}">[${i }]</a>
									</c:if>
								</c:forEach>
								<!-- 다음블록[▶] / 끝[▶▶] -->
								<c:if test="${pageCnt > endPage }">
									<a href="bookList.hs?pageNum=${startPage+pageBlock}">[▶]</a>
									<a href="bookList.hs?pageNum=${pageCnt}">[▶▶]</a>
								</c:if>
							</c:if></th>
					</tr>
				</table>
			</div>
		</div>
	</div>

	</section>

	<footer> <%@ include file="../common/footer.jsp"%>
	</footer>











</body>
</html>