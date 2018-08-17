<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<title>사이트 이름</title>
<body>
<script type="text/javascript">
function reportBoardAdd() {
	if(${sessionScope.id==null} ){
		alert('로그인이 필요한 서비스입니다.');
		window.location='memberLogin';
	}else{
		window.location='reportBoardAdd?kind=4';
	}
}

function noEvent() { // 새로 고침 방지
	if (event.keyCode == 116) {
		event.keyCode = 2;
		return false;
	} else if (event.ctrlKey && (event.keyCode == 78 || event.keyCode == 82)) {
		return false;
	}
}
document.onkeydown = noEvent;

document.oncontextmenu = function() {return false;}
</script>

<style>
	td {
		font-size: 25px;
		text-align: center;
	}
	a {
		font-size: 25px;
		text-decoration: none !important;
	}
	b {
		font-size: 25px;
	}
</style>

	<header>
		<%@ include file="../common/header.jsp"%>
	</header>
	
	<%@ include file="../common/line.jsp"%>

	<section>
		<div class="container">
			<div class="well">
			<div class="mail-box">
				<aside class="lg-side">
					<div class="inbox-head">
						<h3>고객센터</h3>
						<form action="#" class="pull-right position">
							<div class="input-append">
								<input class="btn btn-dark-blue" class="btn" value="글쓰기" onclick="reportBoardAdd()"
									style="width: 80px; float: right; margin-bottom: 10px;">
							</div>
						</form>
					</div>
					<div class="inbox-body">
						<div class="mail-option">
							<table class="table table-inbox table-hover">
								<tbody>
									<tr class="unread">
										<td class="view-message" style="width: 10%">글번호</td>
										<td class="view-message" style="width: 10%">분류</td>
										<td class="view-message">제목</td>
										<td style="width: 15%"><span>작성자 </span></td>
										<td class="view-message" style="width: 20%">등록일</td>
									</tr>
									<c:if test="${cnt>0 }">
										<c:forEach var="dto" items="${dtos}">
											<tr>
												<td>
													${number} <c:set var="number" value="${number-1}"></c:set>
												</td>
												<td 
													<c:if test="${dto.kind == 3}">style="color:crimson;"</c:if>
												>
													<c:if test="${dto.kind == 3}">
														공지
													</c:if>
													<c:if test="${dto.kind == 4}">
														신고
													</c:if>
												</td>
												<td>
													<a href="reportBoardInfo?num=${dto.boardno}&pageNum=${pageNum}&number=${number+1}"
														style="font-size: 25px; font-family: 'Nanum Gothic', sans-serif;">${dto.boardtitle}</a>
												</td>
												<td>${dto.boardwriter}</td>
												<td>
													<fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${dto.boarddate}"/>
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
									<a href="reportBoardList" style="font-size: 15px;">[◀◀]</a>
									<a href="reportBoardList?pageNum=${startPage-pageBlock}" style="font-size: 15px;">[◀]</a>
								</c:if>
								<!-- 페이지 블록 -->
								<c:forEach var="i" begin="${startPage }" end="${endPage }">
									<c:if test="${i == currentPage }">
										<span> <b style="font-size: 20px;">[${i }]</b></span>
									</c:if>
									<c:if test="${i != currentPage }">
										<a href="reportBoardList?pageNum=${i}" style="font-size: 15px;">[${i }]</a>
									</c:if>
								</c:forEach>
								<!-- 다음블록[▶] / 끝[▶▶] -->
								<c:if test="${pageCnt > endPage }">
									<a href="reportBoardList?pageNum=${startPage+pageBlock}" style="font-size: 15px;">[▶]</a>
									<a href="reportBoardList?pageNum=${pageCnt}" style="font-size: 15px;">[▶▶]</a>
								</c:if>
							</c:if>
						</th>
					</tr>
				</table>
			</div>
		</div>
		</div>
	</section>

	<footer>
		<%@ include file="../common/footer.jsp"%>
	</footer>

</body>
</html>