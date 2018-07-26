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
	            <%@ include file="../common/menuCheckup.jsp" %>
	        		</div>	
		  		 		<div class="col-sm-9 col-md-9">
		           			 <div class="well">
		                <div>
					<div class="panel panel-primary">
					    <div class="panel-heading">
					        <h3>검사 의뢰서</h3>
					    </div>
					    <table class="table" border="1" >
							<tr>
								<td>진료 의뢰일 : 2018년 7월 19일 5시 10분</td>
							</tr>
							<tr>
								<td>과명 : 2018년 7월 19일 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;의사명 : 박영진</td>
							</tr>
					    </table>
					    
					    <table class="table" border="1" >
							<tr>
								<td>성명 : 신우철</td>
								<td>주민등록번호 : 123456-1*******</td>
							</tr>
							<tr>
								<td>성별 : 남</td>
								<td>나이 : 20</td>
							</tr>
							<tr>
								<td>연락처 : 01012345695</td>
								<td>이메일 주소 : sin@naver.com</td>
							</tr>
					    </table>
								    
					    <table class="table" border="1" >
							<tr>
								<td>
									▣ 의뢰과목<br><br>
									<input type="checkbox" name="request" value="엑스레이" >엑스레이　
									<input type="checkbox" name="request" value="혈액" checked="checked">혈액　
									<input type="checkbox" name="request" value="소변" checked="checked">소변　 
									<input type="checkbox" name="request" value="MRI">MRI　 
									<input type="checkbox" name="request" value="내시경">내시경　  
									
								</td>
							</tr>
							<tr>
								<td>
									▣ 진단명<br><br><textarea rows="5" style="resize: none; width: 100%;">스트레스성 우울증</textarea>
								</td>
							</tr>
							<tr>
								<td>
									▣ 병력 및 소견<br><br><textarea rows="5" style="resize: none; width: 100%;">지나친 야근으로 인하여 피로가 누적된것으로 보임</textarea>
								</td>
							</tr>
							<tr>
								<td>
									▣ 의뢰 내용<br><br><textarea rows="5" style="resize: none; width: 100%;">혈액 검사와 소변검사를 요청함</textarea>
								</td>
							</tr>
					    </table>
					    
					    <table class="table" border="1" >
								<tr>
									<td align="center">의뢰 병원 : 코스모정신의학과</td>
									<td align="center">전화번호 : 029521241</td>
								</tr>
								<tr>
									<td align="center">주소 : 금천구 가산동 29</td>
									<td align="center">의사 : 박영진</td>
								</tr>
					    </table>
					    <table class="table" border="1" >
								<tr>
									<td align="center"> 코스모정신의학과 병원</td>
								</tr>
					    </table>
					  
					</div>
					<center>
					<input type="button" value="등록하기">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" value="작성취소">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="메인가기" onclick="window.location='main'">
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

</body>
</html>
