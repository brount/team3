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
					<%@ include file="../common/menuCare.jsp" %>
				</div>
				<div class="col-sm-9 col-md-9">
					<div class="well">
						<div class='form container'>
							<div>
								<div class="row" style="margin-bottom: 20px;">
									<div class="center-block clearfix"></div>
								</div>
								<table class='table'>
									<tr>
										<th style="width:15%">이미지</th>
										<td><img src="/medical/resources/images/exercise/${dto.exerciseImage}"></td>
									</tr>
									<tr>
										<th style="width:15%">운동 부위</th>
										<td>${dto.exercisePart}</td>
									</tr>
									<tr>
										<th style="width:15%">운동명</th>
										<td>${dto.exerciseName}</td>
									</tr>
									<tr>
										<th style="width:15%">정의</th>
										<td>${dto.exerciseDefine}</td>
									</tr>
									<tr>
										<th style="width:15%">운동법</th>
										<td>${dto.exerciseMethod}</td>
									</tr>
									<tr>
										<th style="width:15%">주의사항</th>
										<td>${dto.exerciseCaution}</td>
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


