<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<script type="text/javascript">
function personalCare() {
	if(${sessionScope.id==null}) {
		alert('로그인이 필요한 서비스입니다.');
		window.location='memberLogin';
	}else{
		window.location='personalCare';
	}
}
function myFoodList() {
	if(${sessionScope.id==null}) {
		alert('로그인이 필요한 서비스입니다.');
		window.location='memberLogin';
	}else{
		window.location='myFoodListH';
	}
}
</script>
<body>
	<div class="panel-group" id="accordion">
	    <div class="panel panel-default">
	        <div class="panel-heading">
	            <h4 class="panel-title">
	                <a href="exerciseInfoList">운동정보</a>
	            </h4>
	        </div>                   
	    </div>
	    <div class="panel panel-default">
	        <div class="panel-heading">
	            <h4 class="panel-title">
	                <a onclick="personalCare()">개인건강관리</a>
	            </h4>
	        </div>
	    </div>
	    <c:if test="${sessionScope.memberState == 1 }">
	    <div class="panel panel-default">
	        <div class="panel-heading">
	            <h4 class="panel-title">
	                <a onclick="myFoodList()">나만의 음식목록</a>
	            </h4>
	        </div>
	    </div>
	    </c:if>
	</div>
</body>
</html>