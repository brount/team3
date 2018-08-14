<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/setting.jsp" %>
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
<!-- 환자 -->

<input type="hidden" value="${checkuplist}" name="checkuplist">
<input type="hidden" value="${docDto.doctorno}" name="doctorno">



<div class="container">
    <div class="row">
        <%@ include file="../common/menuCheckup.jsp"%>
	  		 <div class="col-sm-9 col-md-9">
	            <div class="well">
					<div>
						<div class="panel panel-primary">
						    <div class="panel-heading">
						        <h3>검사 의뢰서</h3>
						    </div>
						    <table class="table" border="1" >
								<tr>
									<td>진료 의뢰일 : ${checkDto.checkup_date}</td>
								</tr>
								<tr>
									<td>과명 : 
									<c:if test="${docDto.doctorspecialism==1}">
										내과
									</c:if>
									<c:if test="${docDto.doctorspecialism==2}">
										이비인후과
									</c:if>
									<c:if test="${docDto.doctorspecialism==3}">
										정신의학과
									</c:if>
									<c:if test="${docDto.doctorspecialism==4}">
										외과
									</c:if>
									<c:if test="${docDto.doctorspecialism==5}">
										치과
									</c:if>
									
									
									 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;의사명 : ${docDto.doctorname}</td>
								</tr>
						    </table>
						    
						    <table class="table" border="1" >
								<tr>
									<td>성명 : ${gusDto.guestname}</td>
									<td>주민등록번호 : ${gusDto.jumin}</td>
								</tr>
								
								<tr>
									<td>연락처 : ${gusDto.guesttel}</td>
									<td>이메일 주소 : ${gusDto.guestemail}</td>
								</tr>
						    </table>
									    
						    <table class="table" border="1" >
								<tr>
									<td>
										▣ 의뢰과목<br><br>
									<%-- 	<input type="checkbox" name="checkup_kind" value="1" <c:if test="${checkup_kind.indexOf('1') != -1 }" >checked='checked'</c:if> />계층검사
										<input type="checkbox" name="checkup_kind" value="2" <c:if test="${checkup_kind.indexOf('2') != -1 }" >checked='checked'</c:if> />소변　
										<input type="checkbox" name="checkup_kind" value="3" <c:if test="${checkup_kind.indexOf('3') != -1 }" >checked='checked'</c:if> />혈액　
										<input type="checkbox" name="checkup_kind" value="4" <c:if test="${checkup_kind.indexOf('4') != -1 }" >checked='checked'</c:if> />MRI　 
									 --%>
									 <b>
									 <c:if test="${kind=='1'}">계층검사</c:if>
									 <c:if test="${kind=='2'}">요검사</c:if>
									 <c:if test="${kind=='3'}">혈액검사</c:if>
									 <c:if test="${kind=='4'}">영상검사</c:if>
									 </b>
									 </td>
								</tr>
								<tr>
									<td>
										▣ 진단명<br><br><textarea name="checkup_name" rows="5" readonly="readonly" style="resize: none; width: 100%;">${checkDto.checkup_name}</textarea>
									</td>
								</tr> 
								<tr>
									<td>
										▣ 병력 및 소견<br><br><textarea name ="checkup_opinion" rows="5" readonly="readonly" style="resize: none; width: 100%;">${checkDto.checkup_opinion}</textarea>
									</td>
								</tr>
								<tr>
									<td>
										▣ 의뢰 내용<br><br><textarea name ="checkup_contents" rows="5" readonly="readonly" style="resize: none; width: 100%;">${checkDto.checkup_contents}</textarea>
									</td>
								</tr>
						    </table>
						    
						    <table class="table" border="1" >
								<tr>
									<td align="center">의뢰 병원 : ${hosDto.hospitalname}</td>
									<td align="center">전화번호 : ${hosDto.hospitalphone}</td>
								</tr>
								<tr>
									<td align="center">주소 : ${hosDto.hospitaladdr}<br>
									</td>
									<td align="center">의사 :${docDto.doctorname}</td>
								</tr>
						    </table>
						    <table class="table" border="1" >
								<tr>
									<td align="center"> ${hosDto.hospitalname}</td>
								</tr>
						    </table>
						    
						</div>
						<div style="display:table; margin:0 auto;">
							<input type="button" class="btn btn-dark-blue" value="건강검진 등록" style="margin-right:5px;"  onclick="window.location='checkupAdd?checkuplist=${checkuplist}&doctorno=${docDto.doctorno}&kind=${kind}'">
							<input type="button" class="btn btn-dark-blue" value="목록가기" style="margin-left:5px;" onclick="window.location='checkupList'">
						</div>
					</div>
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
