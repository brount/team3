<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/setting.jsp"%>
<html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<body>
	<header>
		<%@ include file="../common/header.jsp"%>
	</header>

	<%@ include file="../common/line.jsp"%>

	<section>
		<form action="checkupRequestInputPro?guestno=${guestno}" method="post"
			name="checkupRequest" onsubmit="return checkupRequestCheck()">
			<div class="container">
				<div class="row">
					<div class="col-sm-3 col-md-3">
						<%@ include file="../common/menuCheckup.jsp"%>
					</div>
					<div class="col-sm-9 col-md-9">
						<div class="well">
							<div>

								<div class="panel-heading">
									<h3>
										<small style="font-family: 'Do Hyeon', sans-serif; font-size: 25px;">진료예약 목록 > 환자정보 ></small> 검사의뢰서 등록
									</h3>
								</div>
								<c:set value="0" var="a"></c:set>
								<c:set value="0" var="b"></c:set>
								<table class="responstable" border="1">
									<tr>
										<th>진료 의뢰일</th>
										<td>${ReservDto.reservationTime}</td>
									</tr>
									<tr>
										<th>진료과 ${docList[a].doctorname}</th>
										<td>
											<c:if test="${vo.doctorspecialism==1}">
												내과
											</c:if> 
											<c:if test="${vo.doctorspecialism==2}">
												이비인후과
											</c:if> 
											<c:if test="${vo.doctorspecialism==3}">
												정신의학과
											</c:if> 
											<c:if test="${vo.doctorspecialism==4}">
												외과
											</c:if> 
											<c:if test="${vo.doctorspecialism==5}">
												치과
											</c:if>
										</td>
									</tr>
									<tr>
										<th align="center" style="width: 20%;">의사</th>
										<td>${vo.doctorname}</td>
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

								<table class="responstable">
									<tr>
										<th colspan="2">▣ 의뢰과목</th>
									</tr>
									<tr>
										<td>
											<input type="checkbox" name="checkup_kind" value="1">계층검사
											<input type="checkbox" name="checkup_kind" value="2">소변
											<input type="checkbox" name="checkup_kind" value="3">혈액
											<input type="checkbox" name="checkup_kind" value="4">MRI
										</td>

									</tr>
									<tr>
										<th>▣ 진단명</th>
									</tr>
									<tr>
										<td>
											<textarea name="checkup_name" rows="5"
												style="resize: none; width: 100%;" maxlength="100"></textarea>
										</td>
									</tr>

									<tr>
										<th>▣ 병력 및 소견</th>
									</tr>

									<tr>
										<td>
											<textarea name="checkup_opinion" rows="5"
												style="resize: none; width: 100%;" maxlength="100"></textarea>
										</td>
									</tr>

									<tr>
										<th>▣ 의뢰 내용</th>
									</tr>
									<tr>
										<td>
											<textarea name="checkup_contents" rows="5"
												style="resize: none; width: 100%;" maxlength="100"></textarea>
										</td>
									</tr>
								</table>

								<table class="responstable" border="1">

									<tr>
										<th style="width: 12%;">의뢰 병원</th>
										<td>${dto.hospitalname}</td>
										<th style="width: 12%;">의사</th>
										<td>${vo.doctorname}</td>
									</tr>

									<tr>
										<th style="width: 12%;">주소</th>
										<td>${dto.hospitaladdr}</td>
										<th>전화번호</th>
										<td>${dto.hospitalphone}</td>
									</tr>

								</table>
								<table class="responstable" border="1">
									<tr>
										<th align="center" colspan="2">${dto.hospitalname}</th>
									</tr>
								</table>

							</div>
							<div style="display: table; margin: 0 auto;">
								<input type="submit" class="btn btn-dark-blue" value="등록하기"
									style="margin-right: 5px;"> <input type="reset"
									class="btn btn-dark-blue" value="작성취소"> <input
									type="button" class="btn btn-dark-blue" value="메인가기"
									style="margin-left: 5px;" onclick="window.location='main'">
							</div>
						</div>
					</div>
				</div>
			</div>

		</form>
	</section>
	
	<footer>
		<%@ include file="../common/footer.jsp"%>
	</footer>
	
</body>
</html>