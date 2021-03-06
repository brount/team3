<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html class="no-js" lang="en">

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
	<c:if test="${overlap==1 }">
		<script type="text/javascript">
	alert('이미 즐겨찾기된 병원입니다.');
</script>
	</c:if>

	<c:if test="${cnt==0 }">
		<script type="text/javascript">
	alert('즐겨찾기된 병원이 없습니다.먼저 병원을 즐겨찾기해주세요!');
	window.location="achospitalSeach?state=1";
</script>
	</c:if>

	<header>
		<%@ include file="../common/header.jsp"%>
	</header>
	<%@ include file="../common/line.jsp"%>

	<section>

		<div class="container">
			<div class="row">
				<div class="col-sm-3 col-md-3">
					<%@ include file="../guest/menuGuest.jsp"%>
				</div>
				<div class="col-sm-9 col-md-9">

					<div class="well">
						<div class="mail-box">
							<aside class="lg-side">
								<div class="inbox-head">
									<h3>즐겨찾는 병원</h3>

								</div>
								<div class="inbox-body">
									<div class="mail-option">


										<table class="responstable">

											<tbody>
												<tr class="unread">
													<!--   <td>  <input type="checkbox" class="toption-input checkbox" /></td> -->
													<th class="view-message" colspan="3" style="width: 17%;">병원명</th>
													<th  style="width: 10%;">전화번호</th>
													<th class="view-message  ">주소</th>
												</tr>
												<c:forEach var="dto" items="${dtos}">
													<tr class="">
														<!--    <td>  <input type="checkbox" class="toption-input checkbox" /></td> -->
														<td colspan="3" class="view-message"
															onclick="hospitalInfo?hospitalno=${dto.hospitalno }">${dto.hospitalname }</td>
														<td style="padding: 16px;"><span class="label label-success">${dto.hospitalphone }</span></td>
														<td class="view-message ">
														<a href="hospitalInfo?hospitalno=${dto.hospitalno }" 
														style="font-size: 20px; font-family: 'NanumGothic, sans-serif';">
														${dto.hospitaladdr }</a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>

										<!--   	<input type="button" onclick="window.location='reserveForm'" value="예약신청"> -->
									</div>
								</div>
						</div>

						</aside>
				<div class="pagination clearfix" style="display: table; margin: 0 auto;">
                       <c:if test="${cnt>0}">
                          <!-- 이전블록 -->
                          <c:if test="${startPage > pageBlock }">
                             <a href="bookMark?pageNum=${startPage-pageBlock}"><</a>
                          </c:if>
                          <!-- 페이지 블록 -->
                          <c:forEach var="i" begin="${startPage }" end="${endPage }">
                             <c:if test="${i == currentPage }">
                                <strong>${i }</strong>
                             </c:if>
                             <c:if test="${i != currentPage }">
                                <a href="bookMark?pageNum=${i}">${i }</a>
                             </c:if>
                          </c:forEach>
                          <!-- 다음블록 -->
                          <c:if test="${pageCnt > endPage }">
                             <a href="bookMark?pageNum=${startPage+pageBlock}">></a>
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