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

	}
	
}
</script>

<title> 사이트 이름 </title>

<body>
	
	<header>
	<%@ include file="../common/header.jsp" %>
	</header>
	<%@ include file="../common/line.jsp"%>
	
	<section>
		<div class="container">
		<div class="well" >
		<div class="row" style="margin-top:20px">
		    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<form role="form" action="exitOkPro" onsubmit="return pwdCheck()" name="exit">
					<fieldset>
					
						<h3>비밀번호 확인</h3>
		<table   class="responstable">
			<tr>
				<th style="text-align: center;">비밀번호</th>	
				
			</tr>
			<tr>	
				<td>
				<input name="password" type="password" id="password" required>
				</td>		
			</tr>
			
					
		</table>
				<center>
				 <input type="submit" class="btn btn-dark-blue" value="확인">
				 <input type="button" class="btn btn-dark-blue" value="취소" onclick="window.history.back();">
				</center>
	
					
					
					
						<!-- <h3> 비밀번호확인 </h3>
						<hr class="colorgraph">
						<div class="form-group">
		                    <input type="password" name="password" id="password" class="form-control input-lg" placeholder="비밀번호를 입력하세요">
						</div>
						
						
						<hr class="colorgraph">
						<div class="col-xs-6 col-sm-6 col-md-6">
		                        <input type="submit"   class="btn btn-dark-blue"  value="확인" style="text-align: center;">
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6">
								<input type="button"  class="btn btn-dark-blue" value="취소" onclick="window.history.back()" style="text-align: center;">
							</div>
						
							 -->
						
					</fieldset>
				</form>
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