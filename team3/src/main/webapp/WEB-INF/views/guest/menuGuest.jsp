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
	                            <a href="myHealth">나의 건강 정보</a>
	                        </td>
	                    </tr>
	                  
	                       <tr>
	                        <td>
	                            <a href="checkupRegister">검진서등록</a>
	                        </td>
	                    </tr>
	                    <!-- <tr>
	                        <td>
	                            <a href="checkAnalyze">내 검진결과</a>
	                        </td>
	                    </tr> -->
	                      <tr>
	                  	   <td>
	                            <a href="checkupRegisterList">내 검진서 목록</a>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                           <a href="myBordList">내 질문목록</a>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <a href="reserveList">예약목록</a>
	                        </td>
	                    </tr>
	                       <tr>
	                        <td>
	                            <a href="personalCareM">개인건강관리</a>
	                        </td>
	                    </tr>
	                       <tr>
	                       <td>
	                            <a href="mkcalList">나의 칼로리</a>
	                        </td>
	                    </tr>
	                </table>
	            </div>
	        </div>
	    </div>
	    <div class="panel panel-default">
	        <div class="panel-heading">
	            <h4 class="panel-title">
	                <a href="bookMark">즐겨찾는병원</a>
	            </h4>
	        </div>
	    </div>
	    <div class="panel panel-default">
	        <div class="panel-heading">
	            <h4 class="panel-title">
	                <a  href="guestModify">회원정보수정</a>
	            </h4>
	        </div>
	    </div>
	    <div class="panel panel-default">
	        <div class="panel-heading">
	            <h4 class="panel-title">
	                <a href="guestExit">회원탈퇴</a>
	            </h4>
	        </div>
	    </div>
	</div>
</body>
</html>