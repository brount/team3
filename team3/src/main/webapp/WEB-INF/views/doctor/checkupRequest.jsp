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


<section>
<form action="checkupRequestInputPro?guestno=${guestno}" method="post" name="checkupRequest">
<div class="container">
    <div class="row">
        <div class="col-sm-3 col-md-3">
					<%@ include file="../common/menuCheckup.jsp"%>
				</div>
	  		 <div class="col-sm-9 col-md-9">
	            <div class="well">
					<div>
						<div class="panel panel-primary">
						    <div class="panel-heading">
						        <h3>검사 의뢰서</h3>
						    </div>
						     <c:set value="0" var="a"></c:set>
                               <c:set value="0" var="b"></c:set>
						    <table class="table" border="1" >
								<tr>
									<td>진료 의뢰일 : 2018년 7월 19일 5시 10분</td>
								</tr>
								<tr>
									<td>과명 : ${docList[a].doctorname}
									<c:if test="${vo.doctorspecialism==1}">
										내과
									</c:if>
									<c:if test="${vo.doctorspecialism==2}">
										이비인후과
									</c:if>
									<c:if test="${vo.doctorspecialism==3}">
										정신의학과
									</c:if>
									<c:if test="${vo.doctorspecialism==4}">
										외과
									</c:if>
									<c:if test="${vo.doctorspecialism==5}">
										치과
									</c:if>
									
									
									 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;의사명 : ${vo.doctorname}</td>
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
										<input type="checkbox" name="checkup_kind" value="1">계층검사
										<input type="checkbox" name="checkup_kind" value="2">소변　
										<input type="checkbox" name="checkup_kind" value="3">혈액　
										<input type="checkbox" name="checkup_kind" value="4">MRI　 
									</td>
								</tr>
								<tr>
									<td>
										▣ 진단명<br><br><textarea name="checkup_name" rows="5" style="resize: none; width: 100%;" maxlength="100"></textarea>
									</td>
								</tr> 
								<tr>
									<td>
										▣ 병력 및 소견<br><br><textarea name ="checkup_opinion" rows="5"  style="resize: none; width: 100%;" maxlength="100"></textarea>
									</td>
								</tr>
								<tr>
									<td>
										▣ 의뢰 내용<br><br><textarea name ="checkup_contents" rows="5" style="resize: none; width: 100%;" maxlength="100"></textarea>
									</td>
								</tr>
						    </table>
						    
						    <table class="table" border="1" >
								<tr>
									<td align="center">의뢰 병원 : ${dto.hospitalname}</td>
									<td align="center">전화번호 : ${dto.hospitalphone}</td>
								</tr>
								<tr>
									<td align="center">주소 : ${dto.hospitaladdr}<br>
															 	
									</td>
									<td align="center">의사 :${vo.doctorname}</td>
								</tr>
						    </table>
						    <table class="table" border="1" >
								<tr>
									<td align="center"> ${dto.hospitalname}</td>
								</tr>
						    </table>
						    
						</div>
						<div style="display:table; margin:0 auto;">
							<input type="submit" value="등록하기" style="margin-right:5px;">
							<input type="reset" value="작성취소">
							<input type="button" value="메인가기" style="margin-left:5px;" onclick="window.location='main'">
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
