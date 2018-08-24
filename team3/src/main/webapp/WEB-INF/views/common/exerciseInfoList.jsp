<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<title>사이트 이름</title>
<body>

	<header>
		<%@ include file="../common/header.jsp"%>
	</header>
	
	<%@ include file="../common/line.jsp"%>

	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3 col-md-3">
					<%@ include file="../common/menuCare.jsp"%>
				</div>
				<div class="col-sm-9 col-md-9">
					<div class="well">
						<div class="container">
							<h3>운동정보</h3>
							<div class="row text-center text-lg-left">
								<c:forEach var="dto" items="${dtos}">
									<table class="responstable"
										style="margin-top: 10px; margin-bottom: 0px; display: -webkit-box; max-height: 100px; overflow: hidden; vertical-align: top; text-overflow: ellipsis; word-break: keep-all; -webkit-box-orient: vertical; -webkit-line-clamp: 3; max-height: 95px;"
										onclick="window.location.href='exerciseInfo?exerciseName=${dto.exerciseName}'">
										<tr>
											<th style="width: 10%;">${dto.exerciseName}</th>
											<td style="color: #000000;">
												[정의] ${dto.exerciseDefine} <br>
												[주운동부위] ${dto.exercisePart}
											</td>
										</tr>
									</table>
								</c:forEach>
							</div>
						</div>
						
						<br>
						<br>

						<div class="pagination clearfix" style="display: table; margin: 0 auto;">
							<c:if test="${cnt>0}">
								<!-- 이전블록 -->
								<c:if test="${startPage > pageBlock }">
									<a href="exerciseInfoList?pageNum=${startPage-pageBlock}"><</a>
								</c:if>
								<!-- 페이지 블록 -->
								<c:forEach var="i" begin="${startPage }" end="${endPage }">
									<c:if test="${i == currentPage }">
										<strong>${i }</strong>
									</c:if>
									<c:if test="${i != currentPage }">
										<a href="exerciseInfoList?pageNum=${i}">${i }</a>
									</c:if>
								</c:forEach>
								<!-- 다음블록 -->
								<c:if test="${pageCnt > endPage }">
									<a href="exerciseInfoList?pageNum=${startPage+pageBlock}">></a>
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