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
		                <h1>내용</h1>
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