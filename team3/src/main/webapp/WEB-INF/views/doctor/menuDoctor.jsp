<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<body>
	<div class="panel-group" id="accordion">
	    <div class="panel panel-default">
	        <div class="panel-heading">
	            <h4 class="panel-title">
	                <a data-toggle="collapse" data-parent="#accordion" href="#">마이페이지</a>
	            </h4>
	        </div>
	        <div id="collapseOne" class="panel-collapse collapse in collapse show">
	            <div class="panel-body">
	                <table class="table">
	                    <tr>
	                        <td>
	                            <a href="myHospital">병원정보</a>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                           <a href="#">내 답변목록</a>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <a href="#">예약목록</a>
	                        </td>
	                    </tr>
	                </table>
	            </div>
	        </div>
	    </div>
	    <div class="panel panel-default">
	        <div class="panel-heading">
	            <h4 class="panel-title">
	                <a data-toggle="collapse" data-parent="#accordion" href="pointManage">내 포인트</a>
	            </h4>
	        </div>
	     <div id="collapseTwo" class="panel-collapse collapse in collapse show">
	            <div class="panel-body">
	                <table class="table">
	                    <tr>
	                        <td>
	                            <a href="pointManage">포인트 내역</a>
	                        </td>
	                    </tr>
	                    
	                </table>
	            </div>
	        </div>
	    </div>
	    <div class="panel panel-default">
	        <div class="panel-heading">
	            <h4 class="panel-title">
	                <a href="doctorModify">회원정보수정</a>
	            </h4>
	        </div>
	    </div>
	    <div class="panel panel-default">
	        <div class="panel-heading">
	            <h4 class="panel-title">
	                <a href="doctorExitOk">회원탈퇴</a>
	            </h4>
	        </div>
	    </div>
	</div>
</body>
</html>