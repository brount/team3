<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- <link href="/medical/resources/css/css/bootstrap.min.css" rel="stylesheet" type="text/css" /> -->
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
		        <h3>처방전</h3>
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
		                <td>692000120 프레드포르테점안약(외용)</td>
		                <td>0.8333</td>
		                <td>6</td>
		                <td>1</td>
		                <td>2시간마다</td>
		          	</tr>
		          	 <tr>
		                <td>643901070 오큐시클로점안액(외용)</td>
		                <td>1.25</td>
		                <td>4</td>
		                <td>1</td>
		                <td>식후 1번씩 취침전 1번</td>
		          	</tr>
		          	<tr>
		                <td>646201050 솔로젠정(내복)</td>
		                <td>2</td>
		                <td>3</td>
		                <td>2</td>
		                <td>식후 30분</td>
		          	</tr>
		          	<tr>
		                <td>646200690 록소젠정(내복)</td>
		                <td>1</td>
		                <td>3</td>
		                <td>2</td>
		                <td>식후 30분</td>
		          	</tr>
		          	<tr>
		                <td>646202070 파모시드정20mg(내복)</td>
		                <td>3</td>
		                <td>2</td>
		                <td>2</td>
		                <td>식후 30분</td>
		          	</tr>
		          	<tr>
		                <td>　</td>
		                <td>　</td>
		                <td>　</td>
		                <td>　</td>
		                <td>　</td>
		          	</tr>
		          	<tr>
		                <td>　</td>
		                <td>　</td>
		                <td>　</td>
		                <td>　</td>
		                <td>　</td>
		          	</tr>
		          	<tr>
		                <td>　</td>
		                <td>　</td>
		                <td>　</td>
		                <td>　</td>
		                <td>　</td>
		          	</tr>
		          	<tr>
		          		<th colspan="4" align="center">주사제 처방내역</th>
		          		<th> 조 제 시 참 고 사 항 </th>
		          	</tr>
		          	<tr>
		                <td>　</td>
		                <td>　</td>
		                <td>　</td>
		                <td>　</td>
		                <td rowspan="5">　</td>
		          	</tr>
		          	<tr>
		          	  	<td>　</td>
		               	<td>　</td>
		                <td>　</td>
		                <td>　</td>
		          	</tr>
		          	<tr>
		          	  	<td>　</td>
		               	<td>　</td>
		                <td>　</td>
		                <td>　</td>
		          	</tr>
		          	<tr>
		          	  	<td>　</td>
		               	<td>　</td>
		                <td>　</td>
		                <td>　</td>
		          	</tr>
		          	<tr>
		          	  	<td>　</td>
		               	<td>　</td>
		                <td>　</td>
		                <td>　</td>
		          	</tr>
		        </tbody>
		    </table>
		</div>
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

<%-- <!-- 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<div class="container">
	<div class="row">
		
		<div class="panel panel-primary">
		    <div class="panel-heading">
		        <h3>건강검진 결과</h3>
		    </div>
		    <div id="toolbar-admin" class="panel-body">
		        <div class="btn-toolbar" role="toolbar" aria-label="admin">
                  
                </div>
		    </div>
		    <table class="table table-striped table-hover" border="1">
		        <thead>
		            <tr>
		                <th class="col-check"></th>
		                <th>구분</th>
		                <th colspan="2">목표질환</th>
		                <th>결과</th>
		                <th colspan="2">참고치</th>
		            </tr>
		        </thead>
		        <tbody>
		            <tr class="success">
		                <td class="col-check"><input type="checkbox" class="form-check-input"></td>
		                <td rowspan="9">계층검사</td>
		                <td rowspan="3">비만</td>
		                <td>신장</td>
		                <td></td>
		                <td></td>
		                <td></td>
		                
		                
		                
		            </tr>
		            <tr class="success">
		                <td class="col-check"><input type="checkbox" class="form-check-input"></td>
		                <td rowspan="3">요검사</td>
		                <td></td>
		                <td>192.168.1.98</td>
		                <td>EE:FF:33:44:AB:CD</td>
		                <td class="status">Online</td>
		                <td>test</td>
		            </tr>
		            <tr class="success">
		                <td class="col-check"><input type="checkbox" class="form-check-input"></td>
		                <td rowspan="7">혈액검사</td>
		                <td>TSR321</td>
		                <td>192.168.1.97</td>
		                <td>EF:12:FE:34:AA:CC</td>
		                <td class="status">Offline</td>
		                <td>test</td>
		            </tr>
		            <tr class="success">
		                <td class="col-check"><input type="checkbox" class="form-check-input"></td>
		                <td rowspan="2">영상검사</td>
		                <td>QPO987</td>
		                <td>192.168.1.96</td>
		                <td>FA:91:EB:82:DC:73</td>
		                <td class="status">Out Of Order</td>
		                <td>test</td>
		            </tr>
		            
		        </tbody>
		    </table>
		</div>
	</div>
</div>
<script>
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
</html>

 --> --%>