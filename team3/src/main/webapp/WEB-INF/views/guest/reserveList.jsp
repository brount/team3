<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>사이트이름</title>
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
			<div class="row">
				<div class="col-sm-3 col-md-3">
					<%@ include file="../guest/menuGuest.jsp"%>
				</div>
				<div class="col-sm-9 col-md-9">
					<div class="well">
						<div class="mail-box">
							<aside class="lg-side">
								<div class="inbox-head">
									<h3>나의 예약 목록</h3>
								</div>
								<div class="inbox-body">
									<div class="mail-option">
										<table class="responstable">
											<tbody>
												<tr class="unread">
													<th>예약번호</th>
													<th class="view-message" colspan="3">병원명</th>
													
													<th>예약종류</th>
													<th>예약날짜</th>
													<th>예약시간</th>
												</tr>
												<c:if test="${cnt!=0 }">
													<c:forEach var="dto" items="${dtos}">
														<tr class="">
															<td>${dto.reservationNo}</td>
															<td colspan="3" class="view-message"><a
																href="hospitalInfo?hospitalno=${dto.hospitalno}"
																style="font-size: 20px; font-family: 'Nanum Gothic', sans-serif;"
																>${dto.hospitalname }</a></td>
															<td style="padding: 16px;"><span class="label label-success"> 
															<c:if test="${dto.reservationKind==1}">
                                  							병원 예약
                                 							</c:if>
                                 							<c:if test="${dto.reservationKind==2}">
                                  							클리닉 예약
                                 							</c:if>
															</span></td>
															<td class="view-message">${dto.reservationTime }</td>
															<td>${dto.clock }${dto.minute }</td>
														</tr>
													</c:forEach>
												</c:if>
												<c:if test="${cnt == 0}">
												<tr>
													<td colspan="8" align="center" style="margin-top: 50;">
														<button type="button" class="btn btn-dark-blue"
															onclick="window.location='achospitalSeach?state=1'">
															병원을 예약해주세요~! <span class="glyphicon glyphicon-send"></span>
														</button>
													</td>
												</tr>
												</c:if>
											</tbody>
										</table>
									</div>
								</div>

							</aside>
							
							
							<div class="pagination clearfix" style="display: table; margin: 0 auto;">
                        <c:if test="${cnt>0}">
                           <!-- 이전블록 -->
                           <c:if test="${startPage > pageBlock }">
                              <a href="reserveList?pageNum=${startPage-pageBlock}"><</a>
                           </c:if>
                           <!-- 페이지 블록 -->
                           <c:forEach var="i" begin="${startPage }" end="${endPage }">
                              <c:if test="${i == currentPage }">
                                 <strong>${i }</strong>
                              </c:if>
                              <c:if test="${i != currentPage }">
                                 <a href="reserveList?pageNum=${i}">${i }</a>
                              </c:if>
                           </c:forEach>
                           <!-- 다음블록 -->
                           <c:if test="${pageCnt > endPage }">
                              <a href="reserveList?pageNum=${startPage+pageBlock}">></a>
                           </c:if>
                        </c:if>
                     </div>
							

						</div>
						<div style="margin-top: 50px;">
							※ 병원에 대기하는 환자가 많거나 현재 시간 기준으로 + 30분은 예약 및 예약수정이 불가능합니다.<br>
							재예약을 원하시는 분은 신중히 취소해 주시기 바랍니다.<br> ※ 『정보통신망 이용촉진 및 정보보호 등에
							관한 법률』 제 30조 2항(개인정보 이용내역의 통지)에 따라 메디클립 예약 서비스를 이용한 회원님의 개인정보
							이용내역입니다.
							
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