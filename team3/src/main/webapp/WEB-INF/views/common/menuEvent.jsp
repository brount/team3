<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<body>
	<div class="panel-group" id="accordion">
	    <div class="panel panel-default">
	        <div class="panel-heading">
	            <h4 class="panel-title">
	                <a href="eventList">프로모션 목록</a>
	            </h4>
	        </div>
	    </div>
	    <c:if test="${sessionScope.memberState == 2 }">
	    <div class="panel panel-default">
	        <div class="panel-heading">
	            <h4 class="panel-title">
	                <a href="eventRequest">프로모션 신청</a>
	            </h4>
	        </div>
	    </div>
	    </c:if>
	</div>
</body>
</html>