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
		
			<div class="col-sm-3 col-md-3">
				<%@ include file="../common/menuHygiene.jsp"%>
			</div>
			
			
			
			 <div class="col-sm-9 col-md-9">
			 	<div class="well">
					<!-- 조회된 질병이 없으면 -->
					<div class="inbox-body">
					
							<c:if test="${selectcnt==0 }">
								<table class="responstable"  >
									<tr>
										<td colspan="6" align="center">조회된 질병이 없습니다. 증상을 다시
											체크해주세요.</td>
									</tr>
									
								
								</table>
									<center>
									<input type="button" class="btn btn-dark-blue" value="확인" 
									onclick="window.history.back()">
									</center>
							</c:if>
						
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
									<table class="responstable">
										<tbody>
											<tr>
												<th colspan="2">${dto.diseaseName }</th>
												
												
											</tr>
											<tr>
												
												<th style="width: 13%;">▶ 정의 </th>
												<td> ${dto.diseaseDefine } ${dto.diseaseSymptom}
												</td>
												
												
											</tr>

											<tr>
												<th>▶ 증상 </th>
												<td> ${dto.diseaseDiagnosis }</td>
											</tr>
											<tr>
												<th>▶ 합병증 </th>
												<td> ${dto.complications }</td>
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
										
										</tbody>
									</table>
									<input type="button" class="btn btn-dark-blue"
													value="병원예약하러가기" style="display: table; margin: 0 auto;"
													onclick="window.location='achospitalSeach?state=1'">
									
									
								</div>
							</div>
						</c:forEach>
					</c:if>
					</div>
					</div>
			</div>
			
		
		
	

	</section>

	<footer> <%@ include file="../common/footer.jsp"%>
	</footer>











</body>
</html>