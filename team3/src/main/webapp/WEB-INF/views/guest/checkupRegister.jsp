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
<%@ include file="../common/line.jsp"%>

<script type="text/javascript">
function check() {
	if(!document.register.reservationtime1.value){
		alert('검진 날짜(년)를 입력해주세요.');
		document.register.reservationtime1.focus();
		return false;
	}
	else if(!document.register.reservationtime2.value){
		alert('검진 날짜(월)를 입력해주세요.');
		document.register.reservationtime2.focus();
		return false;
	}else if(!document.register.reservationtime3.value){
		alert('검진 날짜(일)를 입력해주세요.');
		document.register.reservationtime3.focus();
		return false;
	}else if(!document.register.height.value){
		alert('신장을 입력해주세요.');
		document.register.height.focus();
		return false;
	}else if(!document.register.weight.value){
		alert('체중을 입력해주세요.');
		document.register.weight.focus();
		return false;
	}else if(!document.register.fatness.value){
		alert('BMI지수를 입력해주세요.');
		document.register.fatness.focus();
		return false;
	}else if(!document.register.visionl.value){
		alert('시력(좌)를 입력해주세요.');
		document.register.visionl.focus();
		return false;
	}else if(!document.register.visionr.value){
		alert('시력(우)를 입력해주세요.');
		document.register.visionr.focus();
		return false;
	}else if(!document.register.hearingl.value){
		alert('청력(좌)를 입력해주세요.');
		document.register.hearingl.focus();
		return false;
	}else if(!document.register.hearingr.value){
		alert('청력(우)를 입력해주세요.');
		document.register.hearingr.focus();
		return false;
	}else if(!document.register.bloodpremax.value){
		alert('혈압(최고)를 입력해주세요.');
		document.register.bloodpremax.focus();
		return false;
	}else if(!document.register.bloodpremin.value){
		alert('혈압(최저)를 입력해주세요.');
		document.register.bloodpremin.focus();
		return false;
	}else if(!document.register.urineglucose.value){
		alert('요당을 입력해주세요.');
		document.register.urineglucose.focus();
		return false;
	}else if(!document.register.urineprotein.value){
		alert('요단백을 입력해주세요.');
		document.register.urineprotein.focus();
		return false;
	}else if(!document.register.occulthematuria.value){
		alert('요잠혈을 입력해주세요.');
		document.register.occulthematuria.focus();
		return false;
	}else if(!document.register.urineph.value){
		alert('요ph을 입력해주세요.');
		document.register.urineph.focus();
		return false;
	}else if(!document.register.hemoglobin.value){
		alert('혈색소를 입력해주세요.');
		document.register.hemoglobin.focus();
		return false;
	}else if(!document.register.bloodglucose.value){
		alert('혈당를 입력해주세요.');
		document.register.bloodglucose.focus();
		return false;
	}else if(!document.register.totalcholesterol.value){
		alert('총 콜레스트롤을 입력해주세요.');
		document.register.totalcholesterol.focus();
		return false;
	}else if(!document.register.ast.value){
		alert('AST(SGOT)을 입력해주세요.');
		document.register.ast.focus();
		return false;
	}else if(!document.register.alt.value){
		alert('ALT(SGPT)을 입력해주세요.');
		document.register.alt.focus();
		return false;
	}else if(!document.register.gammagtp.value){
		alert('감마지티피를 입력해주세요.');
		document.register.gammagtp.focus();
		return false;
	}else if(!document.register.hepatitisscr.value){
		alert('간염검사를 입력해주세요.');
		document.register.hepatitisscr.focus();
		return false;
	}else if(!document.register.breastradiography.value){
		alert('영상검사를 입력해주세요.');
		document.register.breastradiography.focus();
		return false;
	}else if(!document.register.ecg.value){
		alert('심전도 검사를 입력해주세요.');
		document.register.ecg.focus();
		return false;
	}
}

</script>


<section>
	<div class="container">
	    <div class="row">
	        <div class="col-sm-3 col-md-3">
		            <%@ include file="../guest/menuGuest.jsp" %>
		        </div>	
	        
	        
		  		 <div class="col-sm-9 col-md-9">
		  		 <form action="checkupRegisterPro" method="post" name="register" onsubmit="return check();"> 
		            <div class="well">
		                <div>
	    					<div class="panel panel-primary">
								<div class="panel-heading">
									<h3>건강검진 결과 등록</h3>
								</div>
							</div>
						<table class="table table-striped table-hover" border="1">
							<thead>
							<tr>
							<th colspan="3">검진 날짜</th>
							<td colspan="3">
							<input name="reservationtime1" placeholder="년도" class="form-control"  type="text" style="display: -webkit-inline-box; width: 90px;">
							-
							<input name="reservationtime2" placeholder="월" class="form-control"  type="text" style="display: -webkit-inline-box; width: 90px;">
							-
							<input name="reservationtime3" placeholder="일" class="form-control"  type="text" style="display: -webkit-inline-box; width: 90px;;">
							</td>
							
							
							</tr>
							
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
					                      <td rowspan="9">계층<br>검사</td>
					                      <td rowspan="3">비만</td>
					                      <td>신장</td>
					                      <td><input name="height" placeholder="신장" class="form-control"  type="text" style="width:100px;"></td>
					                      <td></td>
					                      <td></td>
					                   </tr>
					                   <tr>
					                      <td>체중</td>
					                      <td><input name="weight" placeholder="체중" class="form-control"  type="text" style="width:90px;"></td>
					                      <td></td>
					                      <td></td>
					                   </tr>
					                   <tr>
					                      <td>비만도</td>
					                      <td><input name="fatness" placeholder="지수" class="form-control"  type="text" style="width:90px;"></td>
					                      <td></td>
					                      <td> 
										 	<div style="border:1px solid;border-color:blue; background:blue; padding:7px; display:-webkit-inline-box;"></div>
			                              	<span style="color:blue;"> 저체중:18 미만   </span> <br>
											<div style="border:1px solid;border-color:green; background:green; padding:7px; display:-webkit-inline-box;"></div>
											<span style="color:green;"> 정상:18~22 </span> <br>
											<div style="border:1px solid;border-color:orange; background:orange; padding:7px; display:-webkit-inline-box;"></div>
											<span style="color:orange;"> 과체중:23~24 </span> <br>
											<div style="border:1px solid;border-color:red; background:red; padding:7px; display:-webkit-inline-box;"></div>
											<span style="color:red;"> 비만:25~29 </span> <br>
											<div style="border:1px solid;border-color:purple; background:purple; padding:7px; display:-webkit-inline-box;"></div>
											<span style="color:purple;"> 고도비만:30 이상 </span>
					                      </td>
					                   </tr>
					                   <tr>
					                      <td rowspan="2">시각 이상</td>
					                      <td>시력(좌)</td>
					                      <td><input name="visionl" placeholder="1.0" class="form-control"  type="text" style="width:80px;"></td>
					                      <td></td>
					                      <td></td>
					                   </tr>
					                   <tr>
					                      <td>시력(우)</td>
					                      <td><input name="visionr" placeholder="1.0" class="form-control"  type="text" style="width:80px;"></td>
					                      <td></td>
					                      <td></td>
					                   </tr>
					                   <tr>
					                      <td rowspan="2">청각 이상</td>
					                      <td>청력(좌)</td>
					                      <td><input name="hearingl" placeholder="" class="form-control"  type="text" style="width:80px;"></td>
					                      <td></td>
					                      <td></td>
					                   </tr>
					                   <tr>
					                      <td>청력(우)</td>
					                      <td><input name="hearingr" placeholder="" class="form-control"  type="text" style="width:80px;"></td>
					                      <td></td>
					                      <td></td>
					                   </tr>
					                   <tr>
					                      <td rowspan="2">고혈압</td>
					                      <td>혈압(최고)</td>
					                      <td><input name="bloodpremax" placeholder="mmHg" class="form-control"  type="text" style="width:80px;"></td>
					                      <td></td>
					                      <td style="color: green;">120이하</td>
					                   </tr>
					                   <tr>
					                      <td>혈압(최저)</td>
					                      <td><input name="bloodpremin" placeholder="mmHg" class="form-control"  type="text" style="width:80px;"></td>
					                      <td></td>
					                      <td style="color: green;">80이상</td>
					                   </tr>
					                   <tr>
					                      <td rowspan="4">요검사</td>
					                      <td rowspan="4">신장검사</td>
					                      <td>요당</td>
					                      <td><input name="urineglucose" placeholder="" class="form-control"  type="text" style="width:80px;"></td>
					                      <td style="color: green;">음성</td>
					                      <td style="color: red;">약양성±</td>
					                   </tr>
					                   
					                   <tr>
					                      <td>요단백</td>
					                      <td><input name="urineprotein" placeholder="" class="form-control"  type="text" style="width:80px;"></td>
					                      <td style="color: green;">음성</td>
					                      <td style="color: red;">약양성±</td>
					                   </tr>
					                   
					                   <tr>
					                      <td>요잠혈</td>
					                      <td><input name="occulthematuria" placeholder="" class="form-control"  type="text" style="width:80px;"></td>
					                      <td style="color: green;">음성</td>
					                      <td style="color: red;">약양성±</td>
					                   </tr>
					                   
					                   <tr>
					                      <td>요ph</td>
					                      <td><input name="urineph" placeholder="" class="form-control"  type="text" style="width:80px;"></td>
					                      <td style="color: green;">4.5~8</td>
					                      <td></td>
					                   </tr>
					                   
					                   <tr>
					                      <td rowspan="7">혈액<br>검사</td>
					                      <td>빈혈등</td>
					                      <td>혈색소</td>
					                      <td><input name="hemoglobin" placeholder="g/dL" class="form-control"  type="text" style="width:80px;"></td>
					                      <td style="color: green;">남:13~16.5<br>여:12~15.5</td>
					                      <td style="color: green;">남:12~12.9 / 16.6~17.5<br>여:10~11.9 / 15.6~16.5</td>
					                   </tr>
					                   
					                   <tr>
					                      <td>당뇨병</td>
					                      <td>혈당</td>
					                      <td><input name="bloodglucose" placeholder="mg/dL" class="form-control"  type="text" style="width:80px;"></td>
					                      <td style="color: red;">100미만</td>
					                      <td style="color: green;">100~125</td>
					                   </tr>
					                   
					                   <tr>
					                      <td>고혈압<br>
					                      이상지질혈증<br>
					                      동맥경화</td>
					                      <td>총콜레스테롤</td>
					                      <td><input name="totalcholesterol" placeholder="mg/dL" class="form-control"  type="text" style="width:80px;"></td>
					                      <td style="color: red;">130미만</td>
					                      <td style="color: green;">130~239</td>
					                   </tr>
					                   
					                   <tr>
					                      <td rowspan="4">간장질환</td>
					                      <td>AST(SGOT)</td>
					                      <td><input name="ast" placeholder="UL" class="form-control"  type="text" style="width:80px;"></td>
					                      <td style="color: red;">40이하</td>
					                      <td style="color: green;">41~50</td>
					                   </tr>
					                   
					                   <tr>
					                      <td>ALT(SGPT)</td>
					                      <td><input name="alt" placeholder="UL" class="form-control"  type="text" style="width:80px;"></td>
					                      <td style="color: red;">35이하</td>
					                      <td style="color: green;">36~45이하</td>
					                   </tr>
					                   
					                   <tr>
					                      <td>감마지티피</td>
					                      <td><input name="gammagtp" placeholder="UL" class="form-control"  type="text" style="width:80px;"></td>
					                      <td style="color: green;">남:11~63<br> 여:8~35</td>
					                      <td style="color: green;">남:64~77<br> 여:36~45</td>
					                   </tr>
					                   
					                   <tr>
					                      <td>간염검사</td>
					                      <td><input name="hepatitisscr" placeholder="입력" class="form-control"  type="text" style="width:80px;"></td>
					                      <td></td>
					                      <td></td>
					                   </tr>
					                   
					                   <tr>
					                      <td rowspan="2">영상<br>검사</td>
					                      <td>폐결핵 흉부 질환</td>
					                      <td>흉부방사선검사</td>
					                      <td><input name="breastradiography" placeholder="입력" class="form-control"  type="text" style="width:80px;"></td>
					                      <td></td>
					                      <td style="color: red;">비활동성</td>
					                   </tr>
					                   
					                   <tr>
					                      <td>심장질환</td>
					                      <td>심전도 검사</td>
					                      <td><input name="ecg" placeholder="입력" class="form-control"  type="text" style="width:80px;"></td>
					                      <td></td>
					                      <td style="color: red;">비활동성</td>
					                   </tr>
					              </tbody>
					          </table>
					          <div class="form-group">
					        	<div style="display:table; margin:0 auto;">
					          <button type="submit" class="btn btn-dark-blue"  >검진서 등록 <span class="glyphicon glyphicon-send"></span></button>
					        </div>
					      </div>
					      </div>
					   </div>
					   </form>
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
	            </div>
	        </div>
	
</section>

 <footer>
   <%@ include file="../common/footer.jsp" %>
</footer>

</body>
</html>