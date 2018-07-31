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
									<th>예방접종종류</th>
									<td>${dto.preventionKind}</td>
								</tr>
								<tr>
									<th>국가번호</th>
									<td>${dto.countryCode}</td>
								</tr>
								<tr>
									<th>질병등록번호</th>
									<td>${dto.diseaseRcode}</td>
								</tr>
								<tr>
									<th>내용</th>
									<td>${dto.preventionContent}</td>
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