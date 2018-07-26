<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="/medical/resources/css/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!------ Include the above in your HEAD tag ---------->
 <header>
	<%@ include file="../common/header.jsp" %>
</header>
<section>
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
						        <h3>건강검진 결과</h3>
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
						            <tr>
						                <td class="col-check"></td>
						                <td rowspan="9">계층검사</td>
						                <td rowspan="3">비만</td>
						                <td>신장</td>
						                <td>cm</td>
						                <td></td>
						                <td></td>
						          	</tr>
						          	<tr>
						          		<td>체중</td>
						          		<td>kg</td>
						          		<td></td>
						                <td></td>
						          	</tr>
						          	<tr>
						          		<td>비만도</td>
						          		<td>BMI</td>
						          		<td></td>
						                <td>저체충 18.5 미만<br>정상 : 18.5이상 ~ 23미만<br>과체중 : 23이상~25미만<br>비만 : 25이상~30미만 <br> 고도비만 30이상</td>
						          	</tr>
						          	<tr>
						          		<td rowspan="2">시각 이상</td>
						          		<td>시력(좌)</td>
						          		<td></td>
						          		<td></td>
						          		<td></td>
						          	</tr>
						          	<tr>
						          		<td>시력(우)</td>
						          		<td></td>
						          		<td></td>
						          		<td></td>
						          	</tr>
						          	<tr>
						          		<td rowspan="2">청각 이상</td>
						          		<td>청력(좌)</td>
						          		<td></td>
						          		<td></td>
						          		<td></td>
						          	</tr>
						          	<tr>
						          		<td>청력(우)</td>
						          		<td></td>
						          		<td></td>
						          		<td></td>
						          	</tr>
						          	<tr>
						          		<td rowspan="2">고혈압</td>
						          		<td>혈압(최고)</td>
						          		<td>mmHg</td>
						          		<td></td>
						          		<td>120이하</td>
						          	</tr>
						          	<tr>
						          		<td>혈압(최저)</td>
						          		<td>mmHg</td>
						          		<td></td>
						          		<td>80이상</td>
						          	</tr>
						          	<tr>
						          		<td rowspan="4">요검사</td>
						          		<td rowspan="4">신장검사</td>
						          		<td>요당</td>
						          		<td></td>
						          		<td>음성</td>
						          		<td>약양성±</td>
						          	</tr>
						          	
						          	<tr>
						          		<td>요단백</td>
						          		<td></td>
						          		<td>음성</td>
						          		<td>약양성±</td>
						          	</tr>
						          	
						          	<tr>
						          		<td>요잠혈</td>
						          		<td></td>
						          		<td>음성</td>
						          		<td>약양성±</td>
						          	</tr>
						          	
						          	<tr>
						          		<td>요ph</td>
						          		<td></td>
						          		<td>4.5~8</td>
						          		<td></td>
						          	</tr>
						          	
						          	<tr>
						          		<td rowspan="7">혈액검사</td>
						          		<td>빈혈등</td>
						          		<td>혈색소</td>
						          		<td>g/dL</td>
						          		<td>남:13~16.5<br>여:12~15.5</td>
						          		<td>남:12~12.9 / 16.6~17.5<br>여:10~11.9 / 15.6~16.5</td>
						          	</tr>
						          	
						          	<tr>
						          		<td>당뇨병</td>
						          		<td>혈당</td>
						          		<td>mg/dL</td>
						          		<td>100미만</td>
						          		<td>100~125</td>
						          	</tr>
						          	
						          	<tr>
						          		<td>고혈압<br>
						          		이상지질혈증<br>
						          		동맥경화</td>
						          		<td>총콜레스테롤</td>
						          		<td>mg/dL</td>
						          		<td>200미만</td>
						          		<td>239</td>
						          	</tr>
						          	
						          	<tr>
						          		<td rowspan="4">간장질환</td>
						          		<td>AST(SGOT)</td>
						          		<td>UL</td>
						          		<td>40이하</td>
						          		<td>41~50</td>
						          	</tr>
						          	
						          	<tr>
						          		<td>ALT(SGPT)</td>
						          		<td>UL</td>
						          		<td>35이하</td>
						          		<td>36~45이하</td>
						          	</tr>
						          	
						          	<tr>
						          		<td>감마지티피</td>
						          		<td>UL</td>
						          		<td>남:11~63<br> 여:8~35</td>
						          		<td>남:64~77<br> 여:36~45</td>
						          	</tr>
						          	
						          	<tr>
						          		<td>간염검사</td>
						          		<td></td>
						          		<td></td>
						          		<td></td>
						          	</tr>
						          	
						          	<tr>
						          		<td rowspan="2">영상검사</td>
						          		<td>폐결핵 흉부 질환</td>
						          		<td>흉부방사선검사</td>
						          		<td></td>
						          		<td>정상</td>
						          		<td>비활동성</td>
						          	</tr>
						          	
						          	<tr>
						          		<td>심장질환</td>
						          		<td>심전도 검사</td>
						          		<td></td>
						          		<td>정상</td>
						          		<td>비활동성</td>
						          	</tr>
						        </tbody>
						    </table>
						</div>
					</div>
	            </div>
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
</html>
