<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<link href="/medical/resources/common/css/sidebar.css" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<html lang="en">
<title> 사이트 이름 </title>
<body>
	<header>
	<%@ include file="../common/header.jsp" %>
	</header>
	
	<section>
		<div class="container">
		    <div class="row">
		        <div class="col-sm-3 col-md-3">
		            <%@ include file="../common/menuHygiene.jsp" %>
		        </div>
		        <div class="col-sm-9 col-md-9">
		            <div class="well">
		                <div class='form container'>
						<div>
							<div class="row" style="margin-bottom:20px;">
							<div class="center-block clearfix">
							</div>
							</div>
							<table class='table'>
								<tr>
									<th>병명</th>
									<td>${dto.diseaseName}</td>
								</tr>
								<tr>
									<th>정의</th>
									<td>${dto.diseaseDefine}</td>
								</tr>
								<tr>
									<th>원인</th>
									<td>${dto.diseaseCause}</td>
								</tr>
								<tr>
									<th>증상</th>
									<td>${dto.diseaseSymptom}</td>
								</tr>
								<tr>
									<th>진단</th>
									<td>${dto.diseaseDiagnosis}</td>
								</tr>
								<tr>
									<th>치료</th>
									<td>${dto.diseaseCure}</td>
								</tr>
								<tr>
									<th>경과/합병증</th>
									<td>${dto.complications}</td>
								</tr>
								<tr>
									<th>예방방법</th>
									<td>${dto.prevention}</td>
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
	<%@ include file="../common/footer.jsp" %>
	</footer>
</body>
</html>