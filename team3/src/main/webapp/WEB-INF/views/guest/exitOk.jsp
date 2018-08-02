<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="/medical/resources/common/css/memberLogin.css" rel="stylesheet">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="/medical/resources/common/js/memberLogin.js"></script>
<script type="text/javascript">
function pwdCheck(){
	if(!document.exit.password.value){
		alert('비밀번호를 입력하세요');
		document.exit.password.focus();
		return false;
	}else if(!document.exit.confirmPassword.value){
		alert('비밀번호를 확인하세요');
		document.exit.confirmPassword.focus();
		return false;
	} else if (document.exit.password.value != document.exit.confirmPassword.value) {
		alert('비밀번호가 일치하지않습니다.');
		document.exit.confirmPassword.focus();
		return false;
	}
	
}
</script>

<title> 사이트 이름 </title>

<body>
	
	<header>
	<%@ include file="../common/header.jsp" %>
	</header>
	
	<section>
		<div class="container">
		
		<div class="row" style="margin-top:20px">
		    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<form role="form" action="exitOkPro" onsubmit="return pwdCheck()" name="exit">
					<fieldset>
						<h3> 비밀번호확인 </h3>
						<hr class="colorgraph">
						<div class="form-group">
		                    <input type="password" name="password" id="password" class="form-control input-lg" placeholder="비밀번호를 입력하세요">
						</div>
						<div class="form-group">
		                    <input type="password" name="confirmPassword" id="confirmPassword" class="form-control input-lg" placeholder=" 비밀번호를 확인하세요">
						</div>
						
						
						<hr class="colorgraph">
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
		                        <input type="submit" class="btn btn-lg btn-success btn-block" value="확인">
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6">
								<a href="myGuest" class="btn btn-lg btn-primary btn-block">취소</a>
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