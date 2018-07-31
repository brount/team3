<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../admin_setting.jsp"%>
<html>
<head>
<title>관리자 페이지 - 일반회원관리</title>
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
					<h1 class="page-header">회원관리 - 회원제제관리</h1>
					<!-- 페이지 제목 -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-8">
					<!-- /.panel -->
					<div class="panel panel-default">
						 <div class="panel-heading">
	                        <div class="pull-right">
	                            <div class="btn-group">
	                            	<select class="btn btn-default btn-xs dropdown-toggle" onchange="location.href=this.value">
						 				<option value="memberList">일반회원목록</option>
						 				<option value="membersanctionList">제제회원목록</option>
						 				<option value="membersecessionList">탈퇴회원목록</option>
						 			</select>
	                            </div>
	                        </div>
	                    </div>
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-6">
									<form role="form" action="membersanctionManagePro">
										<input type="hidden" name="pageNum" value="${pageNum}">
										<div class="form-group input-group">
											<label>회원번호</label> 
											<input type="text" class="form-control" id="guestNo" name="guestNo" value="${dto.guestNo}" readonly >
										</div>
										<div class="form-group input-group">
											<label>회원명</label> 
											<input type="text" class="form-control" id="guestname" name="guestname" value="${dto.guestname}" readonly >
										</div>

										<div class="form-group input-group">
											<label>회원ID</label>
											<input type="text" class="form-control" id="guestid" name="guestid" value="${dto.guestid}" readonly >
										</div>
										
										<div class="form-group input-group">
											<label>제제단계</label> 현재제제단계 : ${dto.sanctions}<br>
											
											<select id="sanctions" name="sanctions"> 
												<option value="0">0단계</option>
												<option value="1">1단계</option>
												<option value="2">2단계</option>
												<option value="3">3단계</option>
											</select>
										</div>
										
										<div class="form-group input-group">
											<label>제제사유</label>
											<textarea class="form-control" rows="3" id="reason" name="reason"></textarea>
										</div>
										<button type="submit" class="btn btn-default">등록</button>
										<button type="reset" class="btn btn-default"
											onclick="window.history.back(-1)">취소</button>
									</form>
								</div>
								<!-- /.col-lg-6 (nested) -->
							</div>
							<!-- /.row (nested) -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-4 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->



</body>
</html>