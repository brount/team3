<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<title>사이트 이름</title>
<body>
<script type="text/javascript">
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
							</div>
						</form>
					</div>
					<div class="mail-option">

						<table class="table table-inbox table-hover">

							<tbody>
								<tr>
									<th style="width: 150px">글번호</th>
									<td style="width: 150px">${number}</td>
									
									<th style="width: 150px">작성일</th>
									<td style="width: 150px"><fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.boarddate}" /></td>
								</tr>
								<tr>
									<th>작성자</th>
									<td colspan=3>${dto.boardwriter}</td>
								</tr>
								<tr>
									<th>글제목</th>
									<td colspan=3>${dto.boardtitle}</td>
								</tr>
								<tr>
									<th>글내용</th>
									<td colspan=3>${dto.boardcontent}</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tr>
								<th colspan=4>
								<c:if test="${dto.kind==4}">
								<c:if test="${sessionScope.id==dto.boardwriter}">
								<input class="inputButton" type="button" value="글수정"
									onclick="window.location='reportBoardModify?num=${dto.boardno}&pageNum=${pageNum}&kind=4'">
								<input class="inputButton" type="button" value="글삭제"
									onclick="window.location='reportBoardDelete?num=${dto.boardno}&pageNum=${pageNum}&kind=4'">
								</c:if>
								</c:if>
								<input class="inputButton" type="button" value="목록보기"
									onclick="window.location='reportBoardList?pageNum=${pageNum}'">
								</th>
							</tr>
						</table>
					</div>
				</aside>
			</div>
		</div>
	</section>

	<footer>
		<%@ include file="../common/footer.jsp"%>
	</footer>


</body>
</html>