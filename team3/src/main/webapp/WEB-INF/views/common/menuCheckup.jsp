<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<body>

	<div class="panel-group" id="accordion">
		<c:if test="${sessionScope.memberState == 2 }">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a href="patientList">진료 예약조회</a>
					</h4>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a href="checkupList">검사 의뢰조회</a>
					</h4>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a href="checkupResultList">검진 결과조회</a>
					</h4>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a href="examinationList">처방전 조회</a>
					</h4>
				</div>
			</div>
		</c:if>

		<c:if test="${sessionScope.memberState != 2 }">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a href="guestcheckupResultList">검진 결과조회</a>
					</h4>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a href="guestexaminationList">처방전 조회</a>
					</h4>
				</div>
			</div>
		</c:if>

	</div>
</body>
</html>