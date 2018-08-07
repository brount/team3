<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<title>사이트 이름</title>
<body>

	<header>
		<%@ include file="../common/header.jsp"%>
	</header>

	<section>
		<div class="container">
			<div class="mail-box">
				<aside class="lg-side">
					<div class="inbox-head">
						<h3>고객센터</h3>
						<form action="#" class="pull-right position">
							<div class="input-append">
								<input type="text" class="sr-input" placeholder="검색">
								<button class="btn sr-btn" type="button">
									<i class="fa fa-search"></i>
								</button>
								<input type="button" class="btn" value="글쓰기" onclick="window.location='reportBoardAdd?kind=4'">
							</div>
							<div></div>
						</form>
					</div>
					<div class="inbox-body">
						<div class="mail-option">

							<table class="table table-inbox table-hover">

								<tbody>
									<tr class="unread">
										<td class="view-message">글번호</td>
										<td class="view-message">분류</td>
										<td class="view-message">제목</td>
										<td><span>작성자 </span></td>
										<td class="view-message">등록일</td>
									</tr>
									<c:if test="${cnt>0 }">
										<c:forEach var="dto" items="${dtos}">
											<tr>
												<td>
													${number } <c:set var="number" value="${number-1}"></c:set>
												</td>
												<td>
													<c:if test="${dto.kind == 3}">
														공지
													</c:if>
													<c:if test="${dto.kind == 4}">
														신고
													</c:if>
												</td>
												<td>
													<a href="reportBoardInfo?num=${dto.boardno}&pageNum=${pageNum}&number=${number+1}">${dto.boardtitle}</a>
												</td>
												<td>${dto.boardwriter}</td>
												<td>
													<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.boarddate}"/>
												</td>
											</tr>
										</c:forEach>
									</c:if>
									<!-- 게시글이 없으면 -->
									<c:if test="${cnt==0}">
										<tr>
											<td colspan="6" align="center">게시글이 없습니다. 글을 작성해 주세요.!!
											</td>
										</tr>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
				</aside>
				<table align="center">
					<tr>
						<th align="center"><c:if test="${cnt>0}">
								<!-- 처음[◀◀] / 이전블록 [◀] -->
								<c:if test="${startPage > pageBlock }">
									<a href="reportBoardList">[◀◀]</a>
									<a href="reportBoardList?pageNum=${startPage-pageBlock}">[◀]</a>
								</c:if>
								<!-- 페이지 블록 -->
								<c:forEach var="i" begin="${startPage }" end="${endPage }">
									<c:if test="${i == currentPage }">
										<span> <b>[${i }]</b></span>
									</c:if>
									<c:if test="${i != currentPage }">
										<a href="reportBoardList?pageNum=${i}">[${i }]</a>
									</c:if>
								</c:forEach>
								<!-- 다음블록[▶] / 끝[▶▶] -->
								<c:if test="${pageCnt > endPage }">
									<a href="reportBoardList?pageNum=${startPage+pageBlock}">[▶]</a>
									<a href="reportBoardList?pageNum=${pageCnt}">[▶▶]</a>
								</c:if>
							</c:if>
						</th>
					</tr>
				</table>
			</div>
		</div>
	</section>

	<footer>
		<%@ include file="../common/footer.jsp"%>
	</footer>

</body>
</html>