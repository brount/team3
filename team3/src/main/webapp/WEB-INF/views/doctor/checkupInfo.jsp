<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/setting.jsp"%>
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
	<%@ include file="../common/line.jsp"%>

	<section>
		<!-- 환자 -->

		<input type="hidden" value="${checkuplist}" name="checkuplist">
		<input type="hidden" value="${docDto.doctorno}" name="doctorno">

		<div class="container">
			<div class="row">
				<div class="col-sm-3 col-md-3">
				<%@ include file="../common/menuCheckup.jsp"%>
				</div>
				<div class="col-sm-9 col-md-9">
					<div class="well">
		<h3><small style="font-family: 'Do Hyeon', sans-serif; font-size: 25px;" >검사 의뢰목록 ></small> 검사 의뢰서 <small style="font-family: 'Do Hyeon', sans-serif; font-size: 25px;" >> 검진서 등록</small></h3>
					<br>
						<div>
							<div class="panel panel-primary">
								
								<div class="panel-heading">
						
								<h3>검사 의뢰서</h3>
								</div>
								<table class="responstable" border="1">
									<tr>
									<th>진료 의뢰일 </th>
										<td> ${checkDto.checkup_date}</td>
									</tr>
									<tr>
									<th>진료과</th>
										<td><c:if test="${docDto.doctorspecialism==1}">
										내과
									</c:if> <c:if test="${docDto.doctorspecialism==2}">
										이비인후과
									</c:if> <c:if test="${docDto.doctorspecialism==3}">
										정신의학과
									</c:if> <c:if test="${docDto.doctorspecialism==4}">
										외과
									</c:if> <c:if test="${docDto.doctorspecialism==5}">
										치과
									</c:if>


										
										</td>
									</tr>
									<tr>
									
										<th align="center" style="width: 20%;">의사 </th>
										<td>${docDto.doctorname}</td>
									</tr>
									
								</table>

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

								<table class="responstable" >
									<tr>
										<th style="width: 18%;">▣ 의뢰과목	</th>
										 <%-- 	<input type="checkbox" name="checkup_kind" value="1" <c:if test="${checkup_kind.indexOf('1') != -1 }" >checked='checked'</c:if> />계층검사
										<input type="checkbox" name="checkup_kind" value="2" <c:if test="${checkup_kind.indexOf('2') != -1 }" >checked='checked'</c:if> />소변　
										<input type="checkbox" name="checkup_kind" value="3" <c:if test="${checkup_kind.indexOf('3') != -1 }" >checked='checked'</c:if> />혈액　
										<input type="checkbox" name="checkup_kind" value="4" <c:if test="${checkup_kind.indexOf('4') != -1 }" >checked='checked'</c:if> />MRI　 
									 --%>
										 <td> <b> <c:if test="${kind=='1'}">계층검사</c:if> <c:if
														test="${kind=='2'}">요검사</c:if> <c:if test="${kind=='3'}">혈액검사</c:if>
													<c:if test="${kind=='4'}">영상검사</c:if>
											</b>
										</td>
									</tr>
									<tr>
										<th colspan="2">▣ 진단명</th>
									</tr>
									<tr>
										<td colspan="2"> 
										<textarea name="checkup_name" rows="5" readonly="readonly"
												style="resize: none; width: 100%;">${checkDto.checkup_name}</textarea>
										</td>
									</tr>
									<tr>
										<th colspan="2">▣  병력 및 소견</th>
									</tr>
									<tr>
										<td colspan="2"> 
										<textarea name="checkup_name" rows="5" readonly="readonly"
												style="resize: none; width: 100%;">${checkDto.checkup_opinion}</textarea>
										</td>
									</tr>
									<tr>
										<th colspan="2">▣ 의뢰 내용</th>
									</tr>
									<tr>
										<td colspan="2"> 
										<textarea name="checkup_name" rows="5" readonly="readonly"
												style="resize: none; width: 100%;">${checkDto.checkup_contents}</textarea>
										</td>
									</tr>
									
								</table>

								<table class="responstable" border="1">
								
								
								<tr>
										<th style="width: 12%;">의뢰 병원 </th>
										<td> ${hosDto.hospitalname}</td>
										<th style="width: 12%;">의사</th>
										<td>${docDto.doctorname}</td>
									
										
									</tr>

									<tr>
										<th style="width: 12%;">주소</th>
										<td>${hosDto.hospitaladdr}</td>
										<th>전화번호</th>
										<td>${hosDto.hospitalphone}</td>
									</tr>
								
								
						
									
									
								
								</table>
								<table class="responstable" border="1">
									<tr>
										<th align="center" colspan="2">${hosDto.hospitalname}</th>
									</tr>
								</table>

							</div>
							<div style="display: table; margin: 0 auto;">
								<input type="button" class="btn btn-dark-blue" value="검진서 등록"
									style="margin-right: 5px;"
									onclick="window.location='checkupAdd?checkuplist=${checkuplist}&doctorno=${docDto.doctorno}&kind=${kind}'">
								<input type="button" class="btn btn-dark-blue" value="목록가기"
									style="margin-left: 5px;"
									onclick="window.location='checkupList'">
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		
	</section>
	<footer>
		<%@ include file="../common/footer.jsp"%>
	</footer>
</body>
</html>
