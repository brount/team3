<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="/medical/resources/css/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
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
				
						<div class="mail-box">
							<aside class="lg-side">
								<div class="inbox-head">
			<h3>검사의뢰 목록<small style="font-family: 'Do Hyeon', sans-serif; font-size: 25px;" > > 검사 의뢰서 > 검진서 등록</small></h3>
									
								
									<small>*환자 이름을 클릭하세요</small>
								</div>
								<div class="inbox-body">
									<div class="mail-option">

										<table class="responstable">

											<tbody>
												<tr class="unread">
													<th class="view-message">검사번호</th>
													<th class="view-message">검사종류</th>
													<th class="view-message">환자명</th>
													<th><span>담당의사 </span></th>
													<th class="view-message">접수일</th>
												</tr>
												<c:if test="${cnt>0 }">
													<c:set value="0" var="a"></c:set>
													<c:set value="0" var="b"></c:set>
													<c:forEach var="dto" items="${dtos}">
														<c:forEach var="vo" items="${dto.checkup_kind}">
															<tr>

																<td>${dto.checkuplist} <c:set var="number"
																		value="${number-1 }"></c:set>
																</td>
																<td><c:if test="${vo==1}"><span class="label label-success">계층검사</span></c:if> 
																	<c:if test="${vo==2}"><span class="label label-warning">요  검  사</span></c:if>
																	<c:if test="${vo==3}"><span class="label label-danger">혈액검사</span></c:if>
																	<c:if test="${vo==4}"><span class="label label-primary">영상검사</span></c:if></td>
																<td><a
																	onclick="window.location='checkupInfo?pageNum=${pageNum}&number=${number+1}&checkuplist=${dto.checkuplist}&kind=${vo}'"
																	style="font-size: 20px;"
																	>${guestList[b].guestname}
																		님 </a></td>

																<td>${docList[a].doctorname}</td>
																<td><fmt:formatDate type="both"
																		pattern="yyyy-MM-dd" value="${dto.checkup_date}" />
																</td>
															</tr>
														</c:forEach>
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
                              <a href="checkupList?pageNum=${startPage-pageBlock}"><</a>
                           </c:if>
                           <!-- 페이지 블록 -->
                           <c:forEach var="i" begin="${startPage }" end="${endPage }">
                              <c:if test="${i == currentPage }">
                                 <strong>${i }</strong>
                              </c:if>
                              <c:if test="${i != currentPage }">
                                 <a href="checkupList?pageNum=${i}">${i }</a>
                              </c:if>
                           </c:forEach>
                           <!-- 다음블록 -->
                           <c:if test="${pageCnt > endPage }">
                              <a href="checkupList?pageNum=${startPage+pageBlock}">></a>
                           </c:if>
                        </c:if>
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