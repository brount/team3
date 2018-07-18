<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="/medical/resources/common/css/memberLogin.css" rel="stylesheet">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="/medical/resources/common/js/memberLogin.js"></script>
<title> 사이트 이름 </title>
<body>
	
	<header>
	<%@ include file="../common/header.jsp" %>
	</header>
	
	<section style="padding:2rem 0;">
		<div class="container">
		
		<div class="row" style="margin-top:20px">
		    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<form role="form">
					<fieldset>
						<h3> 로그인 </h3>
						<hr class="colorgraph">
						<div class="form-group">
		                    <input type="text" name="id" id="id" class="form-control input-lg" placeholder="아이디를 입력하세요">
						</div>
						<div class="form-group">
		                    <input type="password" name="password" id="password" class="form-control input-lg" placeholder="비밀번호를 입력하세요">
						</div>
						<span class="button-checkbox">
							<!-- 체크 박스 처리 확인 해야됨 - 현재는 전체 체크 박스 처리만 가능 버튼을 바꾸든 해야할듯 -->
							<button type="button" class="btn" data-color="info">아이디 저장</button>
							<button type="button" class="btn" data-color="info">일반 회원</button>
							<button type="button" class="btn" data-color="info">의사 회원</button>
		                    <input type="checkbox" name="remember_me" id="remember_me" checked="checked" class="hidden">
							<a href="" class="btn btn-link pull-right">Forgot Password?</a>
						</span>
						<hr class="colorgraph">
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
		                        <input type="submit" class="btn btn-lg btn-success btn-block" value="로그인">
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6">
								<a href="memberClassify" class="btn btn-lg btn-primary btn-block">회원가입</a>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
		
		</div>
	</section>
	
	
	<footer>
	<%@ include file="../common/footer.jsp" %>
	</footer>


</body>
</html>