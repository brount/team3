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
                                        <a href="#">나의정보</a>
                                    </td>
                                </tr>
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
                            <a data-toggle="collapse" data-parent="#accordion" href="#">포인트</a>
                        </h4>
                    </div>
                 <div id="collapseTwo" class="panel-collapse collapse in collapse show">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <a href="#">포인트 내역</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="#">포인트 충전</a>
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
                            <a href="memberExit">회원탈퇴</a>
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

	
