<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<title>사이트 이름</title>
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

	<section style="margin-bottom: 100px;">
		<div class="container">
			<div class="row">
				<div class="col-sm-3 col-md-3">
					<%@ include file="../guest/menuGuest.jsp"%>
				</div>
				<div class="col-sm-9 col-md-9">
					<div class="well">
					
							<div class="mail-box">
								<aside class="lg-side">
								
									<div class="inbox-body">
										<div class="mail-option">
											<h3>내 질문 목록</h3>
											<table class="responstable"
												style="margin-top: 50;">

												<tbody>
													<tr class="unread">
														<th class="view-message  dont-show">글번호</th>
														<th class="view-message" colspan="3">제목</th>
														<th>작성자</th>
														<th class="view-message">등록일</th>
													</tr>

													<c:if test="${cnt!=0 }">
														<c:forEach var="dto" items="${dtos }">
															<tr class="">
																<td class="view-message  dont-show">${dto.boardno}</td>

																<td colspan="3" class="view-message"><a
																	href="boardInfoCheck?num=${dto.boardno}&pageNum=${pageNum}&number=${number+1}"
																	style="font-size: 20px; font-family: 'NanumGothic, sans-serif';"
																	>${dto.boardtitle}</a></td>
																<td style="padding: 16px;width: 15%"><span class="label label-success">${dto.boardwriter}</span></td>
																<td class="view-message " style=" width: 20%">${dto.boarddate}</td>
															</tr>

														</c:forEach>
													</c:if>
													<c:if test="${cnt==0 }">
														<tr>
															<td colspan="6" align="center">작성된 질문이 없습니다.</td>
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
                              <a href="myBordList?pageNum=${startPage-pageBlock}"><</a>
                           </c:if>
                           <!-- 페이지 블록 -->
                           <c:forEach var="i" begin="${startPage }" end="${endPage }">
                              <c:if test="${i == currentPage }">
                                 <strong>${i }</strong>
                              </c:if>
                              <c:if test="${i != currentPage }">
                                 <a href="myBordList?pageNum=${i}">${i }</a>
                              </c:if>
                           </c:forEach>
                           <!-- 다음블록 -->
                           <c:if test="${pageCnt > endPage }">
                              <a href="myBordList?pageNum=${startPage+pageBlock}">></a>
                           </c:if>
                        </c:if>
                     </div>
								
								

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