<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<link rel="stylesheet" type="text/css" href="/medical/resources/css/css/default.css" />
<link rel="stylesheet" type="text/css" href="/medical/resources/css/css/table.css" />
</head>

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
							<fieldset>
								<h3>나의 칼로리</h3>

								<table class="responstable" border="1"
									id="xxx">
									<thead>
										<tr>
											<th>섭취 칼로리</th>※ 섭취  칼로리를 클릭하시면 섭취음식목록을 보실수 있습니다
											<th>등록일</th>											
										</tr>
									</thead>
									<tbody>
										<c:forEach var="dto" items="${kcalList }">
											<tr onclick="window.location='kcalInfo?day=${dto.day}'">
												<td>${dto.kcal } &nbsp;<b>kcal</b></td>
												<td>${dto.day }</td>												
											</tr>
										</c:forEach>
										
								</table>
							<button type="button" class="btn btn-dark-blue"  style="display: table;margin: 0 auto;" onclick="window.location='caloryAdd'"> 음식 등록하기 <span class="glyphicon glyphicon-send"></span></button>
							</fieldset>
							<br>
							<table class="responstable">
					 	 		
					 	 <h3>나의 칼로리 정보</h3>
					 	 	   <tr class="unread">
                                    <th class="view-message  dont-show" style="width: 36%;">오늘 하루 나의 섭취 칼로리</th>
                                  <td class="view-message">
                                   	${todaykcal} kcal
                                  </td>     
                              </tr>
					 	 
					 	 	   <tr class="unread">
                                    <th class="view-message  dont-show">나의 기초 대사량</th>
                                  <td class="view-message"> ${basalmetabolism} kcal </td>                                  
                                    
                              </tr>
					 	 	   <tr class="unread">
                                    <th class="view-message  dont-show">나의 권장 칼로리</th>
                                  <td class="view-message"> ${encouragecal} kcal</td>                                  
                                    
                              </tr>
                              <c:if test="${alertcnt==1}">
					 	   <tr class="unread">
                                    <td colspan="4" class="view-message  dont-show">
                                    	    
					 			
					 			 나의   일일 권장칼로리에 비해 음식섭취량이 많으므로 
					 			  	식이조절이 필요합니다.
					 			  
					 			
                                    </td>
                                    
                               
                                    
                              </tr>
                                </c:if>
                              
                              
                             
                              
                              
					 	 </table>
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