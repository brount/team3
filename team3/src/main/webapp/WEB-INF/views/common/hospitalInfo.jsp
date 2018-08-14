<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					<%@ include file="../common/menuMedical.jsp"%>
				</div>
				<div class="col-sm-9 col-md-9">
					<div class="well">
						<div class='form container'>

							<div>
								<h3 style="display: block;">병원정보</h3>
								<hr>
							</div>

							<div style="display: table; margin: 20px auto;">
								<img src="/medical/resources/images/licence/${vo.hospitalimage}" width="500px" height="380px"
									onerror="this.src='/medical/resources/images/dachaimg.jpg'">
							</div>
							<div class="panel panel-primary">
								<table class="table">
									<tr>
										<th style="background: lightcyan">병원이름</th>
										<td>${vo.hospitalname}</td>
									</tr>
									<tr>
										<th style="background: lightcyan">병원주소</th>
										<td>${vo.hospitaladdr}<br>
										</td>
									</tr>
									<tr>
										<th style="background: lightcyan">전화번호</th>
										<td>${vo.hospitalphone}</td>
									</tr>
									<tr>
										<th style="background: lightcyan">병원 소개</th>
										<td>${vo.hospitalinstruction}</td>
									</tr>
									<tr>
										<th style="background: lightcyan">진료시간</th>
										<td>월 : ${vo.mon}<br> 화 : ${vo.tues}<br> 수 : ${vo.wed}
										<br>목 : ${vo.thurs}<br> 금 : ${vo.fri}<br> 토 : ${vo.sat}
										<br> 일 : ${vo.sun}<br> 공휴일 : ${vo.holi}<br>
										</td>
									</tr>
									<tr>
										<td style="background: lightcyan" align=center colspan=2>
											<button type="button"class="btn btn-dark-blue"value="" style="padding: 8px;"
												onclick="window.location='reserveForm?hospitalno=${vo.hospitalno}'">예약</button>
											<button type="button" class="btn btn-dark-blue" value="" style="padding:8px;"
												onclick="window.location='bookMarkIn?hospitalno=${vo.hospitalno}'">
											즐겨찾는 병원 등록
											</button>
										</td>
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