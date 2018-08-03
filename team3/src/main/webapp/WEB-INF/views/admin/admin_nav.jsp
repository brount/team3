<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin_setting.jsp"%>
<html>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="navbar-header">
			<a class="navbar-brand" href="memberList"> 관리자 </a>
		</div>

		<ul class="nav navbar-right navbar-top-links">
			<li onclick="main">Main</a></li>
			<li onclick="main"><i class="fa fa-sign-out fa-fw"></i> Logout </a></li>
		</ul>
		<!-- /.navbar-top-links -->

		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					<li><a href="#">회원관리<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="memberList">일반회원목록</a></li>
							<li><a href="doctorList">의사회원목록</a></li>
						</ul> <!-- /.nav-second-level --></li>

					<li><a href="hospitalList">병원관리</a></li>

					<li><a href="#">정보관리<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="drugList">약정보목록</a></li>
							<li><a href="diseaseList">질병정보목록</a></li>
							<li><a href="exerciseList">운동정보목록</a></li>
							<li><a href="apreventionList">예방정보목록</a></li>
						</ul> <!-- /.nav-second-level --></li>
					<li><a href="adminReportList">신고게시판</a></li>
					<li><a href="eventRequestList">광고관리</a></li>
					<li><a href="pointList">결산</a></li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>