<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="/medical/resources/common/css/memberLogin.css" rel="stylesheet">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="/medical/resources/common/js/memberLogin.js"></script>
<title> 사이트 이름 </title>
<script type="text/javascript">
function loginSet(){
	var ms=document.getElementsByName('memberState');
	ms[0].checked=true;
}
</script>
<body onload="loginSet();">
	
	<header>
	<%@ include file="../common/header.jsp" %>
	</header>
	<%@ include file="../common/line.jsp"%>
	
	<section>
		<div class="container">
		
		<div class="row" style="margin-top:20px">
		    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<form role="form" action="memberLoginPro">
					<fieldset style="font-size: 30px;">
						<h1> 로그인 </h1>
						<hr class="colorgraph">
						<div class="form-group">
		                    <input type="text" name="id" id="id" class="form-control input-lg" placeholder="아이디를 입력하세요"style="font-size: 25;">
						</div>
						<div class="form-group">
		                    <input type="password" name="pwd" id="password" class="form-control input-lg" placeholder="비밀번호를 입력하세요"style="font-size: 25;">
						</div>
		                    <input type="checkbox" name="memberState" value="1" class="option checkbox" style="margin: 7px;" onchange="statChk1();">일반회원
							<input type="checkbox" name="memberState" value="2" class="option checkbox" style="margin: 7px;" onchange="statChk2();">의사회원
							<script type="text/javascript">
							
							function statChk1(){
								var ms=document.getElementsByName('memberState');								
								if(ms[0].checked){
									ms[1].checked=false;
									console.log(1);
								}
							}
							function statChk2(){
								var ms=document.getElementsByName('memberState');								
								if(ms[1].checked){
									ms[0].checked=false;
									console.log(2);
								}
							}
							</script>
					<!-- 	<span class="button-checkbox">						
							<a href="" class="btn btn-link pull-right">Forgot Password?</a>
						</span> -->
						<hr class="colorgraph">
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
		                        <input type="submit" class="btn btn-lg btn-success btn-block" value="로그인" style="font-size: 40; padding: 18px;">
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6">
								<a href="memberClassify" class="btn btn-lg btn-primary btn-block" style="font-size: 40; padding: 18px;">회원가입</a>
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