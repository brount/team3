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
								<h3>섭취음식목록</h3>

								<table class="responstable" border="1"
									id="xxx">
									<thead>
										<tr style="font-size: 14px;">											
											<th>식품군</th>
											<th>식품이름</th>
											<th>1회 섭취량(g)</th>
											<th>칼로리(kcal)</th>
											<th>나트륨(g)</th>
											 <th>탄수화물(g)</th>
											<th>단백질(g)</th>
											<th>지방(g)</th>
											<th>당류(g)</th>
											<th>콜레스테롤(mg)</th>
											<!-- <th>포화지방산(g)</th>
											<th>트랜스지방산(g)</th>	 -->
											<!-- <th>등록일</th>  -->
										</tr>
									</thead>
									<tbody>
										<c:set value="0" var="a"/>
										<c:forEach var="dto" items="${kcalList }">
											<tr style="font-size: 14px;">
												<td id="foodkind">${food[a].foodkind}</td>
												<td id="foodname">${food[a].foodname}</td>
												<td id="gram">${food[a].gram}</td>
												<td id="kcal">${food[a].kcal}</td>
												<td id="salt">${food[a].salt}</td>
												 <td id="carbohydrate">${food[a].carbohydrate}</td>
												<td id="protein">${food[a].protein}</td>
												<td id="fat">${food[a].fat}</td>
												<td id="sugars">${food[a].sugars}</td>
												<td id="cholesterol">${food[a].cholesterol}</td>
											<%-- 	<td id="sfa">${food[a].sfa}</td>
												<td id="tfa">${food[a].tfa}</td> --%>
												<%-- <td>${dto.day }</td>  --%>
											</tr>
											<c:set value="${a+1 }" var="a"/>
										</c:forEach>
								</table>
							</fieldset>
						
						<input type="button" class="btn btn-dark-blue" value="목록" onclick="window.location='kcalList'" style="display: table;
    margin: 0 auto;" >
						
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