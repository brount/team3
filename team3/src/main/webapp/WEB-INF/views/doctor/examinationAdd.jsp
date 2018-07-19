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
		
		<div class="panel panel-primary">
		    <div class="panel-heading">
		        <h3>처방전 입력</h3>
		    </div>
		    <div id="toolbar-admin" class="panel-body">
		       
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
		                <td><input type="text"></td>
		                <td><input type="number"></td>
		                <td><input type="number"></td>
		                <td><input type="number"></td>
		                <td><input type="text"></td>
		          	</tr>
		          	 <tr>
		                <td><input type="text"></td>
		                <td><input type="number"></td>
		                <td><input type="number"></td>
		                <td><input type="number"></td>
		                <td><input type="text"></td>
		          	</tr>
		          	<tr>
		                <td><input type="text"></td>
		                <td><input type="number"></td>
		                <td><input type="number"></td>
		                <td><input type="number"></td>
		                <td><input type="text"></td>
		          	</tr>
		          	<tr>
		                <td><input type="text"></td>
		                <td><input type="number"></td>
		                <td><input type="number"></td>
		                <td><input type="number"></td>
		                <td><input type="text"></td>
		          	</tr>
		          	<tr>
		                <td><input type="text"></td>
		                <td><input type="number"></td>
		                <td><input type="number"></td>
		                <td><input type="number"></td>
		                <td><input type="text"></td>
		          	</tr>
		          	<tr>
		                <td><input type="text"></td>
		                <td><input type="number"></td>
		                <td><input type="number"></td>
		                <td><input type="number"></td>
		                <td><input type="text"></td>
		          	</tr>
		          	<tr>
		                <td><input type="text"></td>
		                <td><input type="number"></td>
		                <td><input type="number"></td>
		                <td><input type="number"></td>
		                <td><input type="text"></td>
		          	</tr>
		          	<tr>
		                <td><input type="text"></td>
		                <td><input type="number"></td>
		                <td><input type="number"></td>
		                <td><input type="number"></td>
		                <td><input type="text"></td>
		          	</tr>
		          	<tr>
		          		<th colspan="4" align="center">주사제 처방내역</th>
		          		<th> 조 제 시 참 고 사 항 </th>
		          	</tr>
		          	<tr>
		                <td><input type="text"></td>
		                <td><input type="number"></td>
		                <td><input type="number"></td>
		                <td><input type="number"></td>
		                <td rowspan="5"><textarea rows="10" cols="23"></textarea>　</td>
		          	</tr>
		          	<tr>
		          	  	<td><input type="text"></td>
		                <td><input type="number"></td>
		                <td><input type="number"></td>
		                <td><input type="number"></td>
		          	</tr>
		          	<tr>
		          	  	<td><input type="text"></td>
		                <td><input type="number"></td>
		                <td><input type="number"></td>
		                <td><input type="number"></td>
		          	</tr>
		          	<tr>
		          	  	<td><input type="text"></td>
		                <td><input type="number"></td>
		                <td><input type="number"></td>
		                <td><input type="number"></td>
		          	</tr>
		          	<tr>
		          	  	<td><input type="text"></td>
		                <td><input type="number"></td>
		                <td><input type="number"></td>
		                <td><input type="number"></td>
		          	</tr>
		        </tbody>
		    </table>
		    
		</div>
		<center>
		<input type="button" value="등록하기">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" value="작성취소">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value="메인가기" onclick="window.location='main'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
</div>
<script>
/* class="success" */
$(function() {
    $('.col-check').hide();
    $('#btn-admin').on('click', function(){
        if($("#toolbar-admin").is(":visible"))
        {
		    $("#toolbar-admin").hide();
		    $(".col-check").hide();
        }
        else
        {
            $("#toolbar-admin").show();
            $(".col-check").show();
        }
	});
    
    $('#btn-online').on('click', function(){
         $('table tr').filter(':has(:checkbox:checked)').find('td').parent().removeClass().addClass('success');
         $('table tr').filter(':has(:checkbox:checked)').find('td.status').text('Online');
    });
    $('#btn-offline').on('click', function(){
         $('table tr').filter(':has(:checkbox:checked)').find('td').parent().removeClass().addClass('warning');
         $('table tr').filter(':has(:checkbox:checked)').find('td.status').text('Offline');
    });
    $('#btn-out-of-order').on('click', function(){
         $('table tr').filter(':has(:checkbox:checked)').find('td').parent().removeClass().addClass('danger');
         $('table tr').filter(':has(:checkbox:checked)').find('td.status').text('Out Of Order');
    });
    
});
</script>
</section>
 <footer>
	<%@ include file="../common/footer.jsp" %>
</footer>
</body>
</html>
