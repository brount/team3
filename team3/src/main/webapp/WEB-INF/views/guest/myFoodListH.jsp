<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

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
<script type="text/javascript">
function modi(foodno) {

	var url = "foodmodi?foodno="+ foodno; 

	window.open(url, "foodmodi", "menubar=no,width=1100,height=300");
}

</script>
</head>
<body>
	<header>
		<%@ include file="../common/header.jsp"%>
	</header>
<%@ include file="../common/line.jsp"%>
	<section style="margin-bottom: 100px;">
		<form name="foodlist" action="myFoodModi" onsubmit="return modi();">
			<div class="container">
				<div class="row">
					<div class="col-sm-3 col-md-3">
						<%@ include file="../common/menuCare.jsp"%>
					</div>
					<div class="col-sm-9 col-md-9">
			<div class="well">
						<div class="mail-box">

							<aside class="lg-side">
								<div class="inbox-head">
									<h3>나만의 음식 목록</h3>

								</div>
								<div class="inbox-body">
									<div class="mail-option">
										<table class="responstable">

											<tbody>
												<tr class="unread">
													<!--       <td>  <input type="checkbox" class="toption-input checkbox" /></td> -->
													<th class="view-message" colspan="3">음식</th>
													<th>칼로리</th>
													<th>gram</th>
													<th style="width: 20%"></th>
												</tr>
												<c:if test="${cnt!=0 }">
													<c:forEach var="dto" items="${dtos}">
														<input type="hidden" value="${dto.foodno }" name="foodno">

														<tr class="">
															<!--   <td>  <input type="checkbox" class="toption-input checkbox" /></td> -->

															<td colspan="3" class="view-message">${dto.food }</td>

															<td><span class="label label-success">
																	${dto.foodcal } Kcal </span></td>
															<td><span class="label label-success">
																	${dto.foodgram}g </span></td>
															<td><input type="button" class="btn btn-dark-blue"
																value="수정" onclick="modi(${dto.foodno })"> <input type="button" class="btn btn-dark-blue" value="삭제"
																onclick="window.location='myFoodDelete?foodno=${dto.foodno }'">
															</td>
														</tr>

													</c:forEach>
												</c:if>
												<c:if test="${cnt==0 }">
													<tr>

														<td colspan="8" align="center" style="margin-top: 50;">
															<button type="button" class="btn btn-dark-blue"
																onclick="window.location='myFoodAdd'">
																나만의 음식 등록하기 <span class="glyphicon glyphicon-send"></span>
															</button>
														</td>

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
                              <a href="myFoodListH?pageNum=${startPage-pageBlock}"><</a>
                           </c:if>
                           <!-- 페이지 블록 -->
                           <c:forEach var="i" begin="${startPage }" end="${endPage }">
                              <c:if test="${i == currentPage }">
                                 <strong>${i }</strong>
                              </c:if>
                              <c:if test="${i != currentPage }">
                                 <a href="myFoodListH?pageNum=${i}">${i }</a>
                              </c:if>
                           </c:forEach>
                           <!-- 다음블록 -->
                           <c:if test="${pageCnt > endPage }">
                              <a href="myFoodListH?pageNum=${startPage+pageBlock}">></a>
                           </c:if>
                        </c:if>
                     </div>
							


						</div>

					</div>
					</div>
				</div>
			</div>

		</form>
	</section>


	<footer>
		<%@ include file="../common/footer.jsp"%>
	</footer>


</body>
</html>