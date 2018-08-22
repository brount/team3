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
					<%@ include file="../common/menuCheckup.jsp"%>
				</div>
				<div class="col-sm-9 col-md-9">
					<div class="well">
						<div class="mail-box">
							<aside class="lg-side">
								<div class="inbox-head">
									<h3>검사 예약 목록</h3>
									<small>*환자 이름을 클릭하세요</small>
								</div>
								<div class="inbox-body">
									<div class="mail-option">


										<table class="responstable">

											<tbody>
												<tr class="unread">
													<th>예약번호</th>
													<th>환자명</th>
													<th class="view-message">병원명</th>
													<th>예약종류</th>
													<th>예약시간</th>
													<th>진료여부</th>
												</tr>
												<c:if test="${cnt>0 }">
													<c:set value="0" var="a"></c:set>
													<c:set value="0" var="b"></c:set>
													<c:forEach var="dto" items="${dtos}">
														<tr>
															<td>${dto.reservationNo} <c:set var="number"
																	value="${number-1 }"></c:set>
															</td>
															<td><a
																onclick="window.location='patientInfo?pageNum=${pageNum}&number=${number+1}&reservationNo=${dto.reservationNo}'"
																style="font-size: 20px;"
																>${guestList[b].guestname}</a></td>
															<td>${hospitalList[a].hospitalname}</td>
															<c:if test="${dto.reservationKind==1 }">
																<td><span class="label label-success">병원예약</span></td>
															</c:if>
															<c:if test="${dto.reservationKind==2 }">
																<td><span class="label label-success">클리닉예약</span></td>
															</c:if>
															<td><fmt:formatDate type="both"
																	pattern="yyyy-MM-dd" value="${dto.reservationTime}" />
															</td>
															<td>
																<c:if test="${dto.reservationappro==1}">
																	<span class="label label-warning">미진료</span>
																</c:if>
																<c:if test="${dto.reservationappro==2}">
																	<span class="label label-primary">진료 완료</span>
																</c:if>
															</td>
														</tr>
														<c:set var="b" value="${b+1 }"></c:set>
														<c:set var="a" value="${a+1 }"></c:set>
													</c:forEach>
												</c:if>
												<!-- 게시글이 없으면 -->
												<c:if test="${cnt==0 }">
													<tr>
														<td colspan="6" align="center">게시글이 없습니다. 글을 작성해
															주세요.!!</td>
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
                              <a href="patientList?pageNum=${startPage-pageBlock}"><</a>
                           </c:if>
                           <!-- 페이지 블록 -->
                           <c:forEach var="i" begin="${startPage }" end="${endPage }">
                              <c:if test="${i == currentPage }">
                                 <strong>${i }</strong>
                              </c:if>
                              <c:if test="${i != currentPage }">
                                 <a href="patientList?pageNum=${i}">${i }</a>
                              </c:if>
                           </c:forEach>
                           <!-- 다음블록 -->
                           <c:if test="${pageCnt > endPage }">
                              <a href="patientList?pageNum=${startPage+pageBlock}">></a>
                           </c:if>
                        </c:if>
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