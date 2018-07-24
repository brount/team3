<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<title> 사이트 이름 </title>
<body>
   
   <header>
   <%@ include file="../common/header.jsp" %>
   </header>
   
	<section>   
		<div class="container">
		    <div class="row">
		        <div class="col-sm-3 col-md-3">
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
		                                        <a href="myHealth">내 건강정보</a>
		                                    </td>
		                                </tr>
	                                    <tr>
		                                    <td>
		                                        <a href="checkupRegister">검진서등록</a>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                        <a href="checkAnalyze">내 검진결과</a>
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
		        </div>	
			  		 <div class="col-sm-9 col-md-9">
			            <div class="well">
			                <h1> 내 용 드 러 갈 부 분</h1>
			            </div>
			        </div>
			    </div>
			</div> 
  		 </section>

  
   
   
   <footer>
   <%@ include file="../common/footer.jsp" %>
   </footer>


</body>
</html>

	
