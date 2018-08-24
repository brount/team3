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
	
	<%@ include file="../common/line.jsp"%>

	<section>
		<div class="container">
			<div class="well">
			<div class="mail-box">
				<aside class="lg-side">
					<div class="inbox-head">
						<h3>고객센터</h3>
					</div>
					<div class="mail-option">

						<table class="responstable">

							<tbody>
								<tr>
									<th >글번호</th>
									<td >${number}</td>
									
									<th>작성자</th>
									<td colspan=3>${dto.boardwriter}</td>
									<th>작성일</th>
									<td><fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${dto.boarddate}" /></td>
								</tr>
								<tr>
									<th>글제목</th>
									<td colspan="7">${dto.boardtitle}</td>
								</tr>
								<tr>
									<th colspan="8" style="text-align: center;">글내용</th>
								</tr>
								<tr>
									<td colspan="8">${dto.boardcontent}</td>
								</tr>
							</tbody>
						</table>
						<table style="width: 100%">
							<tr>
								<th style="text-align: center;">
								<c:if test="${dto.kind==4}">
								<c:if test="${sessionScope.id==dto.boardwriter}">
								<input  class="btn btn-dark-blue" type="button" value="글수정"
									onclick="window.location='reportBoardModify?num=${dto.boardno}&pageNum=${pageNum}&kind=4'">
								<input  class="btn btn-dark-blue" type="button" value="글삭제"
									onclick="window.location='reportBoardDelete?num=${dto.boardno}&pageNum=${pageNum}&kind=4'">
								</c:if>
								</c:if>
								<input class="btn btn-dark-blue" type="button" value="목록보기"
									onclick="window.location='reportBoardList?pageNum=${pageNum}'">
								</th>
							</tr>
						</table>
					</div>
				</aside>
			</div>
			</div>
		</div>
	</section>

	<footer>
		<%@ include file="../common/footer.jsp"%>
	</footer>

</body>
</html>