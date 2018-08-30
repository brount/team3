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
<%@ include file="../common/line.jsp"%>

<section>
<input type="hidden" value="${checkup}" name="checkup">
<form action="examinationInputPro?checkup=${checkup}" method="post" name="examinationAdd">
<div class="container">
    <div class="row">
        <div class="col-sm-3 col-md-3">
            <%@ include file="../common/menuCheckup.jsp" %>
        </div>	
	  		 <div class="col-sm-9 col-md-9">
	            <div class="well" style="padding: 0px;">
	            <c:if test="${sessionScope.memberState == 2 }">
	               <h3><small style="font-family: 'Do Hyeon', sans-serif; font-size: 25px;" >처방전 목록 > </small>처방전</h3>
	               </c:if>
	            <br>
					<div>
						<div class="panel panel-primary">
						    <div class="panel-heading">
						        <h3>처방전</h3>
						    </div>
						    <table class="responstable" border="1">
						    	<tr>
						    		<th rowspan="3" style="width: 5%;">환자</th>
						    		<td>이름</td>
						    		<td>${gusDto.guestname}</td>
						    		<th rowspan="3">의료<br>기관</th>
						    		<td>명칭</td>
						    		<td>${hosDto.hospitalname}</td>
						    	</tr>
						    	<tr>
						    		<td>주민번호</td>
						    		<td>${jumin}-********</td>
						    		<td>전화번호</td>
						    		<td>${hosDto.hospitalphone}</td>
						    		
						    	</tr>
						    	<tr>
						    		<td>연락처</td>
						    		<td>${gusDto.guesttel}</td>
						    		<td>의사명</td>
						    		<td>${docDto.doctorname}</td>
						    	</tr>
						    </table>
						  	<table class="responstable" border="1">
						  		<tr>
						  			<th>증상</th>
						  		</tr>
						  		<tr>
						  			<td><textarea rows="5" name = "symptom" style="resize: none; width: 100%" readonly>${preDto.symptom}</textarea></td>
						  		</tr>
						  	</table>
						    <table class="responstable" border="1">
						        <thead>
						            <tr>
						    		<th>처 방 의 약 품 <br>명 칭</th>
						    		<th>1회<br>투여량</th>
						    		<th>1회<br>투여횟수</th>
						    		<th>총<br>투여일수</th>
						    		<th style=" width: 20%;">용법</th>
						    	</tr>
						        </thead>
						        <tbody>
						        <c:set value="0" var="a"></c:set>
								<c:forEach var="drugname" items="${drugname1}">
						            <tr>
						                <td>${drugname}</td>
						                <td>${drugdosage1[a]}</td>
						                <td>${drugrepeat1[a]}번</td>
						                <td>${dosagedate1[a]}일</td>
						                <td>${dosageusage1[a]}</td>
						          	</tr>
						         <c:set value="${a+1}" var="a"></c:set>
						           </c:forEach>
						          	
						          	<tr>
						          		<th colspan="4" align="center">주사제 처방내역</th>
						          		<th> 조 제 시 참 고 사 항 </th>
						          	</tr>
						          	<tr>
						                <th>처 방 의 약 품 <br>명 칭</th>
							    		<th>1회<br>투여량</th>
							    		<th>1회<br>투여횟수</th>
							    		<th>총<br>투여일수</th>
						                <td rowspan="10"><textarea rows="3" name="caution" maxlength="255" style="resize: none; width: 100%;">${preDto.caution}</textarea>　</td>
						          	</tr>
						          	<c:set value="0" var="b"></c:set>
						          	<c:forEach var="injectionname" items="${injectionname1}">
						          	<tr>
						          	  	<td>${injectionname}</td>
						          	  	<td>${injectiondosage1[b]}</td>
						                <td>${injectionrepeat1[b]}번</td>
						                <td>${injectiondate1[b]}일</td>
						          	</tr>
						          	<c:set value="${b+1}" var="b"></c:set>
						          	</c:forEach>
						         
						        </tbody>
						    </table>
						    
						</div>
						<div style="display:table; margin:0 auto;">
						  <c:if test="${sessionScope.memberState == 2 }">
							<input type="button" class="btn btn-dark-blue" value="처방목록" style="margin-left:5px;" onclick="window.location='examinationList'">
						</c:if>
						<c:if test="${sessionScope.memberState != 2 }">
							<input type="button" class="btn btn-dark-blue" value="처방목록" style="margin-left:5px;" onclick="window.location='guestexaminationList'">
						</c:if>
						
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
