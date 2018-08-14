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

function reChk() {
	if (!document.reform.boardcontent.value) {
		alert("댓글을 입력해주세요.");
		document.reform.boardcontent.focus();
		return false;
	} else if (!document.reform.boardpwd.value) {
		alert("비밀번호를 입력해주세요.");
		document.reform.boardpwd.focus();
		return false;
	}
}
</script>
<style>
	th {
		font-size: 25px !important;
	}
	td {
		font-size: 25px !important;
	}
</style>

	<header>
		<%@ include file="../common/header.jsp"%>
	</header>
	
	<%@ include file="../common/line.jsp"%>
	
	<section>
	<c:if test="${pwdCnt == 0}">
		<script type="text/javascript">
			alert("입력한 정보를 다시 확인하세요~!");
			window.history.back();
		</script>
	</c:if>
	
	<c:if test="${pwdCnt != 0}">	
		<div class="container">
			<div class="mail-box">
				<aside class="lg-side">
					<div class="inbox-head">
						<h3>질문게시판</h3>
					</div>
					<div class="mail-option">

						<table class="table table-inbox table-hover">

							<tbody>
								<tr>
									<th style="width: 150px">글번호</th>
									<td style="width: 150px">${number}</td>

									<th style="width: 150px">작성일</th>
									<td style="width: 150px"><fmt:formatDate type="both"
											pattern="yyyy-MM-dd" value="${dto.boarddate}" /></td>
								</tr>
								<tr>
									<th>작성자</th>
									<td colspan=3>${dto.boardwriter }</td>
								</tr>
								<tr>
									<th>글제목</th>
									<td colspan=3>${dto.boardtitle }</td>
								</tr>
								<tr>
									<th colspan="4" style="text-align: center;">글내용</th>
									
								</tr>
								<tr>
									<td colspan="4">${dto.boardcontent }</td>
								</tr>
							</tbody>
						</table>
						<table style="width: 100%; margin-top: 50px;" align="center">
							<tr>
								<th style="width: 15%; text-align: center;">작성자</th>
								<th style="width: 60%; text-align: center;">댓글내용</th>
								<th style="width: 25%; text-align: center;">작성일</th>
							</tr>
							<c:forEach var="dt" items="${dtos}">
								<tr>
									<td align="center">${dt.boardwriter}</td>
									<td>${dt.boardcontent}</td>
									<td align="center"><fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${dt.boarddate }" />
										<c:if test="${sessionScope.id==dt.boardwriter}">
											<c:if test="${sessionScope.memberState==2}">
												<button class="btn btn-dark-blue" onclick="window.open('refDelete?num=${dt.boardno}&kind=${dto.boardno}&pageNum=${pageNum}&number=${number}','로그인창','width=450px,height=200px,screenX=700px,screenY=400px');">
													삭제
												</button>
											</c:if>
										</c:if> 
									</td>
								</tr>
							</c:forEach>
						</table>
						<c:if test="${sessionScope.memberState == 2}">
							<form action="inputre" method="post" name="reform" onsubmit="return reChk();">
								<input type="hidden" name="kind" value="2">
								<input type="hidden" name="ref" value="${dto.boardno }">
								<input type="hidden" name="num" value="${dto.boardno }">
								<input type="hidden" name="number" value="${number }">
								<input type="hidden" name="pageNum" value="${pageNum }">
								<table style="width: 100%">
									<tr>
										<td rowspan=3>
											<c:if test="${sessionScope.id != null }"> ${sessionScope.id }
												<input type="hidden" name="boardwriter" value="${sessionScope.id }">
											</c:if>
											<c:if test="${sessionScope.id == null }">
												<input type="text" name="boardwriter">
											</c:if>
										</td>
										<td rowspan=3>
											<textarea rows="3" cols="70" name="boardcontent" style="resize: none; "></textarea>
										</td>
										<td><input class="btn btn-dark-blue" type="submit" value="댓글작성"></td>
									</tr>
									<tr>
										<td>댓글 비밀번호</td>
									</tr>
									<tr>
										<td><input type="password" name="boardpwd"></td>
									</tr>
								</table>
							</form>
						</c:if>
						<table style="width: 100%">
							<tr>
								<th style="text-align: center;">
									<c:if test="${sessionScope.id==dto.boardwriter}">
										<input class="btn btn-dark-blue" type="button" value="글수정"
											onclick="window.location='boardModify?num=${dto.boardno}&pageNum=${pageNum}&kind=1'">
										<input class="btn btn-dark-blue" type="button" value="글삭제"
											onclick="window.location='boardDelete?num=${dto.boardno}&pageNum=${pageNum}&kind=1'">
									</c:if> 
										<input class="btn btn-dark-blue" type="button" value="목록보기"
											onclick="window.location='boardList?pageNum=${pageNum}'">
								</th>
							</tr>
						</table>
					</div>
				</aside>
			</div>
		</div>
	</c:if>
	</section>

	<footer>
		<%@ include file="../common/footer.jsp"%>
	</footer>

</body>
</html>