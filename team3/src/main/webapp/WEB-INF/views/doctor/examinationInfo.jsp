<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<body>
 <header>
	<%@ include file="../common/header.jsp" %>
</header> 
<section>
<input type="hidden" value="${checkup}" name="checkup">
<form action="examinationInputPro?checkup=${checkup}" method="post" name="examinationAdd">
<div class="container">
    <div class="row">
        <div class="col-sm-3 col-md-3">
            <%@ include file="../common/menuCheckup.jsp" %>
        </div>	
	  		 <div class="col-sm-9 col-md-9">
	            <div class="well">
					<div>
						<div class="panel panel-primary">
						    <div class="panel-heading">
						        <h3>처방전 입력</h3>
						    </div>
						    <table class="table" border="1">
						    	<tr>
						    		<th rowspan="3"><br>환<br>자</th>
						    		<th>이름</th>
						    		<td>${gusDto.guestname}</td>
						    		<th rowspan="3">의<br>료<br>기<br>관</th>
						    		<th>명칭</th>
						    		<td>${hosDto.hospitalname}</td>
						    	</tr>
						    	<tr>
						    		<th>주민번호</th>
						    		<td>${gusDto.jumin}</td>
						    		<th>전화번호</th>
						    		<td>${hosDto.hospitalphone}</td>
						    		
						    	</tr>
						    	<tr>
						    		<th>연락처</th>
						    		<td>${gusDto.guesttel}</td>
						    		<th>의사명</th>
						    		<td>${docDto.doctorname}</td>
						    	</tr>
						    </table>
						  	<table class="table table-striped table-hover" border="1">
						  		<tr>
						  			<th>증상</th>
						  		</tr>
						  		<tr>
						  			<td><textarea readonly cols="90" rows="5" name = "symptom" style="resize: none;">${preDto.symptom}</textarea></td>
						  		</tr>
						  	</table>
						    <table class="table table-striped table-hover" border="1">
						        <thead>
						            <tr>
						    		<th>처 방 의 약 품 <br>명 칭</th>
						    		<th>1회<br>투여량</th>
						    		<th>1회<br>투여횟수</th>
						    		<th>총<br>투여일수</th>
						    		<th>용법</th>
						    	</tr>
						        </thead>
						        <tbody>
						            <tr>
						                <td>${drugname1}</td>
						                <td>${drugdosage1}</td>
						                <td>${drugrepeat1}번</td>
						                <td>${dosagedate1}일</td>
						                <td>${dosageusage1}</td>
						          	</tr>
						          	 <tr>
						                <td>${drugname2}</td>
						                <td>${drugdosage2}</td>
						                <td>${drugrepeat2}번</td>
						                <td>${dosagedate2}일</td>
						                <td>${dosageusage2}</td>
						          	</tr>
						          	<tr>
						                <td>${drugname3}</td>
						                <td>${drugdosage3}</td>
						                <td>${drugrepeat3}번</td>
						                <td>${dosagedate3}일</td>
						                <td>${dosageusage3}</td>
						          	</tr>
						          	<tr>
						                <td>${drugname4}</td>
						                <td>${drugdosage4}</td>
						                <td>${drugrepeat4}번</td>
						                <td>${dosagedate4}일</td>
						                <td>${dosageusage4}</td>
						          	</tr>
						          	<tr>
						          		<td>${drugname5}</td>
						          		<td>${drugdosage5}</td>
						          		<td>${drugrepeat5}번</td>
						          		<td>${dosagedate5}일</td>
						          		<td>${dosageusage5}</td>
						          	</tr>
						          	
						          	<tr>
						          		<th colspan="4" align="center">주사제 처방내역</th>
						          		<th> 조 제 시 참 고 사 항 </th>
						          	</tr>
						          	<tr>
						                <th>처 방 의 약 품 <br>명 칭</th>
							    		<th>1회<br>투여량</th>
							    		<th>1회<br>투여횟수</th>
							    		<th>총<br>투여일수</th>
						                <td rowspan="5"><textarea rows="8"  name="caution" style="resize: none;">${preDto.caution}</textarea>　</td>
						          	</tr>
						          	<tr>
						          	  	<td>${injectionname1}</td>
						          	  	<td>${injectiondosage1}</td>
						                <td>${injectionrepeat1}번</td>
						                <td>${injectiondate1}일</td>
						          	</tr>
						          	<tr>
						          	  	<td>${injectionname2}</td>
						          	  	<td>${injectiondosage2}</td>
						                <td>${injectionrepeat2}번</td>
						                <td>${injectiondate2}일</td>
						          	</tr>
						          	<tr>
						          	  	<td>${injectionname3}</td>
						          	  	<td>${injectiondosage3}</td>
						                <td>${injectionrepeat3}번</td>
						                <td>${injectiondate3}일</td>
						          	</tr>
						        </tbody>
						    </table>
						    
						</div>
						<div style="display:table; margin:0 auto;">
							<input type="button" value="처방목록" style="margin-left:5px;" onclick="window.location='examinationList'">
						</div>
					</div>
	            </div>
	        </div>
	    </div>
	</div> 
</form>
</section>

 <footer>
	<%@ include file="../common/footer.jsp" %>
</footer>
</body>
</html>
