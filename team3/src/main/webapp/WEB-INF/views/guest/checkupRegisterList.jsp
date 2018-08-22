<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>


<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<link href="/medical/resources/djcss/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<!-- <link href="/medical/resources/djcss/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
 -->
<link href="/medical/resources/djcss/css/style.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<c:if test="${deletecnt==1 }">
		<script type="text/javascript">
			alert('검진서가 삭제되었습니다.');
			window.location = "checkupRegisterList";
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

								<%-- <div class="inbox-head">
                         <c:if test="${cnt==0  }">
											<div class="form-group">
												<div style="display: table; margin: 0 auto;">
													<button type="button" class="btn btn-primary" onclick="window.location='checkupRegister'">
														검진서를 등록해주세요~! <span class="glyphicon glyphicon-send"></span>
													</button>
												</div>
											</div>
										</c:if>
					
                      
                      </div> --%>


								<h3>나의 검진서 목록(${cnt})</h3>
								<div class="inbox-body">
									<div class="mail-option">


										<table class="responstable">

											<tbody>
												<tr class="unread">
													<th>검진날짜</th>


													<th>등록번호</th>
													<th></th>

												</tr>
												<c:if test="${cnt !=0 }">
													<c:forEach var="dto" items="${dtos}">

														<tr class="">

															<td style="font-size: 20px; font-family: 'Nanum Gothic', sans-serif;"><a href="checkAnalyze?col=${dto.COL}">${dto.examinationday}</a>
															</td>
															
															<td>${dto.COL}</td>
															<td><button type="button" class="btn btn-primary"
																	onclick="window.location='checkdelete?col=${dto.COL}'">검진서
																	삭제</button></td>
														</tr>

													</c:forEach>
												</c:if>
												<c:if test="${cnt==0  }">
													<tr>
														<td colspan="4" align="center">
															<button type="button" class="btn btn-dark-blue"
																onclick="window.location='checkupRegister'">
																검진서를 등록해주세요~! <span class="glyphicon glyphicon-send"></span>
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
                              <a href="checkupRegisterList?pageNum=${startPage-pageBlock}"><</a>
                           </c:if>
                           <!-- 페이지 블록 -->
                           <c:forEach var="i" begin="${startPage }" end="${endPage }">
                              <c:if test="${i == currentPage }">
                                 <strong>${i }</strong>
                              </c:if>
                              <c:if test="${i != currentPage }">
                                 <a href="checkupRegisterList?pageNum=${i}">${i }</a>
                              </c:if>
                           </c:forEach>
                           <!-- 다음블록 -->
                           <c:if test="${pageCnt > endPage }">
                              <a href="checkupRegisterList?pageNum=${startPage+pageBlock}">></a>
                           </c:if>
                        </c:if>
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