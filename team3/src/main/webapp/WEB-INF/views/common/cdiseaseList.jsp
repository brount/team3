<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<link href="/medical/resources/common/css/sidebar.css" rel="stylesheet">
<link href="/medical/resources/djcss/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<html lang="en">
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
					<%@ include file="../common/menuHygiene.jsp"%>
				</div>
				<div class="col-sm-9 col-md-9">
					<div class="well">
						<h3>질병정보</h3>
						<div class="container">
							<div class="row text-center text-lg-left">
								<c:forEach var="dto" items="${dtos}">
									<table class='responstable'
										style="margin-top: 10px; margin-bottom: 0px; display: -webkit-box; max-height: 100px;
										overflow: hidden; vertical-align: top; text-overflow: ellipsis; word-break: keep-all;
										-webkit-box-orient: vertical; -webkit-line-clamp: 3; max-height: 95px;"
										onclick="window.location.href='diseaseInfo?diseaseCode=${dto.diseaseCode}'">
										<tr>
											<th style="width: 10%;">${dto.diseaseName}</th>
											<td style="color: #000000;"><%-- [정의] ${dto.diseaseDefine} <br> --%>
												[증상] ${dto.diseaseCause}
											</td>
										</tr>
									</table>
								</c:forEach>
							</div>
						</div>
							<br><br>
			<div class="pagination clearfix" style="display: table; margin: 0 auto;">
                        <c:if test="${cnt>0}">
                           <!-- 이전블록 -->
                           <c:if test="${startPage > pageBlock }">
                              <a href="cdiseaseList?pageNum=${startPage-pageBlock}"><</a>
                           </c:if>
                           <!-- 페이지 블록 -->
                           <c:forEach var="i" begin="${startPage }" end="${endPage }">
                              <c:if test="${i == currentPage }">
                                 <strong>${i }</strong>
                              </c:if>
                              <c:if test="${i != currentPage }">
                                 <a href="cdiseaseList?pageNum=${i}">${i }</a>
                              </c:if>
                           </c:forEach>
                           <!-- 다음블록 -->
                           <c:if test="${pageCnt > endPage }">
                              <a href="cdiseaseList?pageNum=${startPage+pageBlock}">></a>
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