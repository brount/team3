<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
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
						<div class='form container'>
							<div>
								<div class="row" style="margin-bottom: 20px;">
									<div class="center-block clearfix">
										<img src="/medical/resources/common/images/testDrug.jpg">
									</div>
								</div>
								<table class="responstable">
									<tr>
										<th style="width: 22%;">약품명</th>
										<td>${vo.drugName}</td>
									</tr>
									<tr>
										<th>저장방법</th>
										<td>${vo.drugStorageMethod}</td>
									</tr>
									<tr>
										<th>효능효과</th>
										<td>${vo.drugEfficacy}</td>
									</tr>
									<tr>
										<th>용법용량</th>
										<td>${vo.drugUsedCapacity}</td>
									</tr>
									<tr>
										<th>사용상 주의사항</th>
										<td>${vo.drugPrecautions}</td>
									</tr>
								</table>
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