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
<div class="container">
    <div class="row">
        <div class="col-sm-3 col-md-3">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a href="checkupRequest">검사의뢰 등록</a>
                        </h4>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a href="checkupList">검사의뢰 목록</a>
                        </h4>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a  href="checkupAdd">건강검진 등록</a>
                        </h4>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a href="checkupResultList">건강검진 결과 목록</a>
                        </h4>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a  href="examinationAdd">처방등록</a>
                        </h4>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a href="examinationList">처방결과</a>
                        </h4>
                    </div>
                </div>
            </div>
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
						    		<th>번호</th>
						    		<td>00152</td>
						    		<th rowspan="3">의<br>료<br>기<br>관</th>
						    		<th>명칭</th>
						    		<td>코스모정신의학과</td>
						    	</tr>
						    	<tr>
						    		<th rowspan="2">환자</th>
						    		<td>신우철</td>
						    		<th>전화번호</th>
						    		<td>02-977-2645</td>
						    	</tr>
						    	<tr>
						    		<td>123456-1******</td>
						    		<th>e-mail주소</th>
						    		<td>kosmo@naver.com</td>
						    	</tr>
						    </table>
						  
						    <table class="table table-striped table-hover" border="1">
						        <thead>
						            <tr>
						    		<th>처 방 의 약 품 명 칭</th>
						    		<th>1회<br>투여량</th>
						    		<th>1회<br>투여횟수</th>
						    		<th>총<br>투여일수</th>
						    		<th>용법</th>
						    	</tr>
						        </thead>
						        <tbody>
						            <tr>
						                <td><input type="text" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="text" style="width:100%"></td>
						          	</tr>
						          	 <tr>
						                <td><input type="text" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="text" style="width:100%"></td>
						          	</tr>
						          	<tr>
						                <td><input type="text" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="text" style="width:100%"></td>
						          	</tr>
						          	<tr>
						                <td><input type="text" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="text" style="width:100%"></td>
						          	</tr>
						          	<tr>
						                <td><input type="text" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="text" style="width:100%"></td>
						          	</tr>
						          	<tr>
						                <td><input type="text" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="text" style="width:100%"></td>
						          	</tr>
						          	<tr>
						                <td><input type="text" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="text" style="width:100%"></td>
						          	</tr>
						          	<tr>
						                <td><input type="text" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="text" style="width:100%"></td>
						          	</tr>
						          	<tr>
						          		<th colspan="4" align="center">주사제 처방내역</th>
						          		<th> 조 제 시 참 고 사 항 </th>
						          	</tr>
						          	<tr>
						                <td><input type="text" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td rowspan="5"><textarea rows="8"></textarea>　</td>
						          	</tr>
						          	<tr>
						          	  	<td><input type="text" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						          	</tr>
						          	<tr>
						          	  	<td><input type="text" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						          	</tr>
						          	<tr>
						          	  	<td><input type="text" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						          	</tr>
						          	<tr>
						          	  	<td><input type="text" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						                <td><input type="number" style="width:100%"></td>
						          	</tr>
						        </tbody>
						    </table>
						    
						</div>
						<div style="display:table; margin:0 auto;">
							<input type="button" value="등록하기" style="margin-right:5px;">
							<input type="reset" value="작성취소">
							<input type="button" value="메인가기" style="margin-left:5px;" onclick="window.location='main'">
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
