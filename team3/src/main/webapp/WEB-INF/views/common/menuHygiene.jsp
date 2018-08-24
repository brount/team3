<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<body>
	<div class="panel-group" id="accordion">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">날씨(보건기상지수)</a>
				</h4>
			</div>
			<div id="collapseOne" class="panel-collapse collapse in collapse">
				<div class="panel-body">
					<table class="table">
						<tr>
							<td><a href="ultravioletRay">자외선지수</a></td>
						</tr>
						<tr>
							<td><a href="foodPoisoning">식중독지수</a></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a href="cdiseaseList">질병정보</a>
				</h4>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a href="simpleTreat">간단진료</a>
				</h4>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a href="drugSeach">약검색</a>
				</h4>
			</div>
		</div>
	</div>
</body>
</html>