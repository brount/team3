<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/setting.jsp" %>
<html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="/medical/resources/css/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!------ Include the above in your HEAD tag ---------->
<input type="hidden" name ="id" value="${id}">

<header>
	<%@ include file="../common/header.jsp" %>
</header>

<section>
<div class="container">
    <div class="row">
        <div class="col-sm-3 col-md-3">
            <%@ include file="../doctor/menuDoctor.jsp" %>
            </div>
            <div class="col-sm-9 col-md-9">
            <div class="well">
                <div>
				<div class="panel panel-primary">
				    <div class="panel-heading">
				        <h3>마이 병원</h3>
				    </div>
				 </div>
					<center>
						<img src="/medical/resources/images/licence/${vo.hospitalimage}" width="500px" height="380px">
						<br><br>
					<div class="panel panel-primary">
					    
					    <table class="table" >
					        <tr>
					        	<th style="background: lightcyan">병원이름</th>
					        	<td>${vo.hospitalname}</td>
					        </tr>
					        <tr>
					        	<th style="background: lightcyan">병원주소</th>
					        	<td>
					        		${vo.hospitaladdress1}<br>
					        		${vo.hospitaladdress2}<br>
					        		${vo.hospitaladdress3}<br>
					        	</td>
					        </tr>
					        <tr>
					        	<th style="background: lightcyan">전화번호</th>
					        	<td>${vo.hospitalphone}</td>
					        </tr>
					    	<tr>
					        	<th style="background: lightcyan">병원 소개</th>
					        	<td>${vo.hospitalinstruction}</td>
					        </tr>
					    	<tr>
					        	<th style="background: lightcyan">진료시간</th>
					        	<td>${vo.hospitaltime}</td>
					        </tr>
					   		<tr>
					        	<th style="background: lightcyan">휴무일</th>
					        	<td>${vo.hospitalholiday}</td>
					        </tr>
					     </table>
					</div>
					<input type="button" value="병원 등록하기" onclick="window.location='myHospitalResistraion'">
				</div>
        	</div>
        </div>
      </div>
    </div>







</section>
 <footer>
	<%@ include file="../common/footer.jsp" %>
</footer>
</html>
