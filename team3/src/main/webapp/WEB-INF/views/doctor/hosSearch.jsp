<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<link href="/medical/resources/css/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="/medical/resources/css/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- Plugin CSS -->
<link href="/medical/resources/css/vendor/magnific-popup/magnific-popup.css" rel="stylesheet"
	type="text/css">

<!-- Custom styles for this template -->
<link href="/medical/resources/css/css/freelancer.min.css" rel="stylesheet">
<link href="/medical/resources/css/css/mycss.css" rel="stylesheet">
<link href="/medical/resources/css/css/footer.css" rel="stylesheet">
<link href="/medical/resources/css/css/mainmenuversion.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/medical/resources/css/css/default.css" />
<link rel="stylesheet" type="text/css" href="/medical/resources/css/css/component.css" />
<%@include file="../common/setting.jsp"%>
<html lang="en">
<title>근무병원 찾기</title>
<script type="text/javascript">
	$(function(){
		/* data 가 json 인경우 */
		$('#search').click(function(){ // 키입력이 끝낫을때 cf) 키입력중 : keydown			
			var select = $("#select").val(); // 입력한 키워드
			var sc = $("#sc").val();
			
			$.ajax({
				url:"/medical/hosSearch_sub?sc="+sc+"&select="+select,				
				type: 'post',								
				
				success : function(data){ 
					$('#result').html(data);  
				},error:function(){ 
					alert('오류');
				}
			});																		
		});
	});
</script>
<body>
	<section>
		<div class="container">
			<div class="inbox-body">
				<div class="mail-option">
					<div>
						<select name="sc" id="sc">
							<option value="1">병원명</option>
							<option value="2">병원주소</option>
						</select> <input type="text" name="select" id="select">
						<button id="search">검색</button>
					</div>
				</div>
				
				<div id="result">
				
				</div>
			</div>
		</div>
	</section>


</body>
</html>