<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="/medical/resources/common/css/memberLogin.css" rel="stylesheet">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="/medical/resources/common/js/memberLogin.js"></script>
<title>사이트 이름</title>
<body>
	<section style="padding: 2rem 0;">
		<div class="container">

			<div class="row" style="margin-top: 20px">
				<div
					class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
					<form role="form" action="adminLoginPro">
						<fieldset>
							<h3>로그인</h3>
							<hr class="colorgraph">
							<div class="form-group">
								<input type="text" name="id" id="id" class="form-control input-lg" placeholder="아이디를 입력하세요">
							</div>
							<div class="form-group">
								<input type="password" name="pwd" id="password" class="form-control input-lg" placeholder="비밀번호를 입력하세요">
							</div>

							<hr class="colorgraph">
							<div class="row">
								<div class="col-xs-6 col-sm-6 col-md-6">
									<input type="submit" class="btn btn-lg btn-success btn-block" value="로그인">
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>

		</div>
	</section>

</body>
</html>