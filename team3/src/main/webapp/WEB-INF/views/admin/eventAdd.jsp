<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- jQuery -->
<script src="./resources/pyj/js/jquery.min.js" /></script>

<!-- Bootstrap Core JavaScript -->
<script src="./resources/pyj/js/bootstrap.min.js" /></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="./resources/pyj/js/metisMenu.min.js" /></script>

<!-- Custom Theme JavaScript -->
<script src="./resources/pyj/js/startmin.js" /></script>


<title>관리자 페이지 - 광고관리</title>

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/pyj/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/pyj/css/metisMenu.min.css"
	rel="stylesheet">

<!-- Timeline CSS -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/pyj/css/timeline.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/pyj/css/startmin.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/pyj/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>
	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="navbar-header">
			<a class="navbar-brand" href="memberList"> 관리자 </a>
		</div>

		<ul class="nav navbar-right navbar-top-links">
			<li><a href="main">Main</a></li>
			<li><a href="main"><i class="fa fa-sign-out fa-fw"></i>
					Logout </a></li>
		</ul>
		<!-- /.navbar-top-links -->

		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					<li><a href="#">회원관리<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="memberList">일반회원목록</a></li>
							<li><a href="doctorList">의사회원목록</a></li>
							<li><a href="sanctionList">제제회원목록</a></li>
						</ul> <!-- /.nav-second-level --></li>

					<li><a href="hospitalList">병원관리</a></li>

					<li><a href="#">정보관리<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="drugList">약정보목록</a></li>
							<li><a href="diseaseList">질병정보목록</a></li>
							<li><a href="exerciseList">운동정보목록</a></li>
							<li><a href="foodList">음식정보목록</a></li>
							<li><a href="apreventionList">예방정보목록</a></li>
							<li><a href="requestList">요구사항목록</a></li>
						</ul> <!-- /.nav-second-level --></li>

					<li><a href="eventRequestList">광고관리</a></li>
					<li><a href="#">결산<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="pointList">포인트결제내역목록</a></li>
							<li><a href="cashList">현금결제내역목록</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		</nav>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">광고게시</h1>
					<!-- 페이지 제목 -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<section style="padding:2rem 0;">

				<div class="container">
					<div class="col-lg-9">
						<br> <br>


						<form class="form-horizontal" action=" " method="post" id="reg_form">
							<div class="form-group">
                                <label>제목</label>
                                <input class="form-control">
                            </div>

							<div class="form-group">
								<label>이벤트 기간 </label>
									<div class="form-group">
										<input name="date1" class="form-control" type="date"> 
										<input name="date2" class="form-control" type="date">
									</div>
							</div>

							<div class="form-group">
                            	<label>이벤트 이미지</label>
                                <input type="file">
                            </div>

							<div class="form-group">
                                <label>이벤트 내용</label>
                                <textarea class="form-control" rows="3"></textarea>
                            </div>

							<div class="form-group">
                                 <label>이벤트종류</label>
                                 <div class="checkbox">
                                     <label>
                                         <input type="checkbox" value="">광고
                                     </label>
                                 </div>
                                 <div class="checkbox">
                                     <label>
                                         <input type="checkbox" value="">배너
                                     </label>
                                 </div>
                             </div>

							<!-- Text input-->



							<!-- Button -->
							<div class="form-group">
								<label class="col-md-4 control-label"></label>
								<div class="col-md-4">
									<button type="submit" class="btn btn-default">등록</button>
									<button type="reset" class="btn btn-default" onclick="window.location='eventRequestList'">취소</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="row" align="left"></div>
				</section>
				<!-- /.row -->
			</div>
			<!-- /#page-wrapper -->

		</div>
		<!-- /#wrapper -->
</body>
</html>