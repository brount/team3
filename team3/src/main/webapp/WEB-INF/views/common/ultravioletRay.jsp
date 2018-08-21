<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<link href="/medical/resources/common/css/sidebar.css" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="StyleSheet" href="resources/weather/css/e_style3.10.css" type="text/css" />
<title>메디 클립</title>
</head>
<body>
	<header>
		<%@ include file="../common/header.jsp"%>
	</header>
<%@ include file="../common/line.jsp"%>

	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3 col-md-3">
					<%@ include file="../common/menuHygiene.jsp"%>
				</div>
				<div class="col-sm-9 col-md-9">
					<div class="well">
						<script type="text/javascript">
							jQuery(document)
								.ready(function() {
									jQuery('#layor_area')
										.find('a')
										.each(function() {
											var $img1 = jQuery(this)
												.find('img.btn_base')
												.first();
											var $img2 = jQuery(this)
												.find('img.set')
												.first();
											var $img3 = jQuery(this)
												.find('img.view')
												.first();
									jQuery(this)
										.on('focus', function(e) {
											$img1
												.css({
													'border' : '1px dashed #000',
													'margin' : '-1px',
													'margin-left' : '6px'
												});
											$img2
												.css({
													'border' : '1px dashed #000',
													'margin' : '-1px',
													'margin-left' : '3px'
												});
											$img3
												.css({
													'border' : '1px dashed #000',
													'margin' : '-1px',
													'margin-left' : '4px'
												});
										});
									jQuery(this)
										.on('blur', function(e) {
											$img1
												.css({
													'border' : '0',
													'margin' : '0px',
													'margin-left' : '7px'
												});
											$img2
												.css({
													'border' : '0',
													'margin' : '0px',
													'margin-left' : '4px'
												});
											$img3
												.css({
													'border' : '0',
													'margin' : '0px',
													'margin-left' : '5px'
												});
										});
								});
							});
						</script>

						<script type="text/javascript" src="resources/weather/js/highcharts.js"></script>
						<script type="text/javascript" src="resources/weather/js/highcharts-more.js"></script>
						<script type="text/javascript" src="resources/weather/js/map.js"></script>
						<script type="text/javascript" src="resources/weather/js/sigungu_new.js"></script>
						<script type="text/javascript" src="resources/weather/js/sidoline.js"></script>

						<script type="text/javascript">
							var data_json = '[{"code":"1100000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"2600000","value":"0","value0":"9","value1":"9","value2":"10","filetime":"2018073106"},{"code":"2700000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"2800000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"2871000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"2872033","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"2900000","value":"0","value0":"9","value1":"9","value2":"10","filetime":"2018073106"},{"code":"3000000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"3100000","value":"0","value0":"9","value1":"10","value2":"10","filetime":"2018073106"},{"code":"3600000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4111000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4113000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4115000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4117000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4119000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4121000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4122000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4125000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4127000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4128000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4129000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4131000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4136000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4137000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4139000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4141000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4143000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4145000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4146000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4148000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4150000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4155000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4157000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4159000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4161000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4163000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4165000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4167000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4180000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4182000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4183000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4211000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4213000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4215000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4217000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4219000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4221000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4223000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4272000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4273000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4275000","value":"0","value0":"8","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4276000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4277000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4278000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4279000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4280000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4281000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4282000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4283000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4311000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4313000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4315000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4372000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4373000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4374000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4374500","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4375000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4376000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4377000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4380000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4413000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4415000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4418000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4420000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4421000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4423000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4425000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4427000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4471000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4476000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4477000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4479000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4480000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4481000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4482500","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4511000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4513000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4514000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4518000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4519000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4521000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4571000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4572000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4573000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4574000","value":"0","value0":"9","value1":"9","value2":"10","filetime":"2018073106"},{"code":"4575000","value":"0","value0":"9","value1":"9","value2":"10","filetime":"2018073106"},{"code":"4577000","value":"0","value0":"9","value1":"9","value2":"10","filetime":"2018073106"},{"code":"4579000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4580000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4611000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4613000","value":"0","value0":"8","value1":"9","value2":"10","filetime":"2018073106"},{"code":"4615000","value":"0","value0":"9","value1":"9","value2":"10","filetime":"2018073106"},{"code":"4617000","value":"0","value0":"9","value1":"9","value2":"10","filetime":"2018073106"},{"code":"4623000","value":"0","value0":"9","value1":"9","value2":"10","filetime":"2018073106"},{"code":"4671000","value":"0","value0":"9","value1":"9","value2":"10","filetime":"2018073106"},{"code":"4672000","value":"0","value0":"9","value1":"9","value2":"10","filetime":"2018073106"},{"code":"4673000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4677000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4678000","value":"0","value0":"8","value1":"9","value2":"10","filetime":"2018073106"},{"code":"4679000","value":"0","value0":"9","value1":"9","value2":"10","filetime":"2018073106"},{"code":"4680000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4681000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4682000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4683000","value":"0","value0":"8","value1":"9","value2":"10","filetime":"2018073106"},{"code":"4684000","value":"0","value0":"9","value1":"9","value2":"10","filetime":"2018073106"},{"code":"4686000","value":"0","value0":"9","value1":"9","value2":"10","filetime":"2018073106"},{"code":"4687000","value":"0","value0":"9","value1":"9","value2":"10","filetime":"2018073106"},{"code":"4688000","value":"0","value0":"9","value1":"9","value2":"10","filetime":"2018073106"},{"code":"4689000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4690000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4691000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4691036","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4711000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4713000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4715000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4717000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4719000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4721000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4723000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4725000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4728000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4729000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4772000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4773000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4775000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4776000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4777000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4782000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4783000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4784000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4785000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4790000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4792000","value":"0","value0":"9","value1":"10","value2":"9","filetime":"2018073106"},{"code":"4793000","value":"0","value0":"8","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4794000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4812000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4817000","value":"0","value0":"9","value1":"9","value2":"10","filetime":"2018073106"},{"code":"4822000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4824000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4825000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4827000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4831000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4833000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4872000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4873000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4874000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4882000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4884000","value":"0","value0":"9","value1":"9","value2":"10","filetime":"2018073106"},{"code":"4885000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4886000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4887000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4888000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"4889000","value":"0","value0":"9","value1":"9","value2":"9","filetime":"2018073106"},{"code":"5011000","value":"0","value0":"8","value1":"8","value2":"8","filetime":"2018073106"},{"code":"5013000","value":"0","value0":"8","value1":"8","value2":"8","filetime":"2018073106"}]';
							var service_term = 'T';
							var save_json = null; //jsondata
							var save_data_point = 0; //현재 선택한 날짜 포인트 저장
							var save_day_point = 0;
							var save_day_array = new Array(); //날짜 정보 저장
							var ment_array = new Array(); //ment 전체 정의

							function restr(indata) {
								indata = indata.replace(/\&lt;/g, "<");
								return indata;
							}
							function restr2(indata) {
								indata = indata.replace(/\&amp;/g, "&");
								return indata;
							}

							ment_array[0] = "&lt;p class='h_info'>햇볕에 민감한 피부를 가진 분은&lt;br>자외선 차단제를 발라야 함&lt;/p>";
							ment_array[1] = "&lt;p class='h_info'>2 ~ 3시간 햇볕에 노출 시 &lt;br>피부 화상을 입을 수 있음&lt;/p>&lt;p class='h_info'>모자, 선글라스 착용하고 자외선 &lt;br>차단제 바르기&lt;/p> ";
							ment_array[2] = "&lt;p class='h_info'>햇볕에 노출 시 1～2시간&lt;br>내에도 피부 화상을 입을 수&lt;br>있음&lt;/p>&lt;p class='h_info'>낮에는 그늘에 머무르기&lt;/p>&lt;p class='h_info'>외출 시 긴 소매, 모자, 선글라스 &lt;br>착용하고, 자외선 차단제 바르기&lt;/p> ";
							ment_array[3] = "&lt;p class='h_info'>햇볕에 노출 시 수십 분 이내에도 &lt;br>피부 화상을 입을 수 있음&lt;/p>&lt;p class='h_info'>낮 10시～3시까지 외출을 피하고&lt;br>실내나 그늘에 머무르기&lt;/p>&lt;p class='h_info'>외출 시 긴 소매, 모자, 선글라스 &lt;br>착용하고, 자외선 차단제 바르기&lt;/p> ";
							ment_array[4] = "&lt;p class='h_info'>햇볕에 노출 시 수십 분 이내에도 &lt;br>피부 화상을 입을 수 있음&lt;/p>&lt;p class='h_info'>가능한 실내에 머무르기&lt;/p>&lt;p class='h_info'>외출 시 긴 소매, 모자, 선글라스 &lt;br>착용하고, 자외선 차단제 바르기&lt;/p> ";

							var save_area_point_code = "1100000";
							var save_area_point_ko = "서울특별시";

							$(document).ready(function() {
								save_json = eval(data_json);
								all_time_title(); //시간 관련 입력
								create_map();
							});

							//시간표출 관련 모든 내용
							function all_time_title() {
								//발표시간
								var annotime = save_json[0].filetime;

								var yyyy = annotime.substring(0, 4); //년
								var mm = annotime.substring(4, 6); //월
								var dd = annotime.substring(6, 8); //일
								var hh = annotime.substring(8, 10); //시
								// The parameters are year, month, day, hours, minutes, seconds.
								var filetime = new Date(yyyy, mm - 1, dd, hh,
										00, 00);
								var week = new Array('일', '월', '화', '수', '목',
										'금', '토');
								//발표시간 입력
								$("#anno_time").html(
										yyyy + "년 " + mm + "월 " + dd + "일 ("
												+ week[filetime.getDay()]
												+ ") | " + hh + ":00");

								var nowtime = new Date(); //오늘날짜
								var twotime = new Date(nowtime.valueOf()
										+ (24 * 60 * 60 * 1000)); //내일
								var threetime = new Date(nowtime.valueOf()
										+ ((24 * 60 * 60 * 1000) * 2)); //모레

								//자료에 따른 선택 날짜 생성 시간에 따른 날짜 td 생성
								var selectday = "";
								$("#dayselect").html("");
								if (hh == 18) { //18시일 경우 td 두개
									selectday += '&lt;th width="130px" height="30px">날짜&lt;/th>';
									if (0 < nowtime.getHours()
											&& nowtime.getHours() < 18) {
										save_day_array[0] = (nowtime.getMonth() + 1)
												+ '월 '
												+ nowtime.getDate()
												+ '일';
										save_day_array[1] = (twotime.getMonth() + 1)
												+ '월 '
												+ twotime.getDate()
												+ '일';
										selectday += '&lt;td class="on" id="daytd">&lt;a onclick="day_title_click(0,1)">오늘('
												+ (nowtime.getMonth() + 1)
												+ '월 '
												+ nowtime.getDate()
												+ '일)&lt;/a>&lt;/td>';
										selectday += '&lt;td id="daytd">&lt;a onclick="day_title_click(1,2)" >내일('
												+ (twotime.getMonth() + 1)
												+ '월 '
												+ twotime.getDate()
												+ '일)&lt;/a>&lt;/td>';
									} else {
										save_day_array[0] = (twotime.getMonth() + 1)
												+ '월 '
												+ twotime.getDate()
												+ '일';
										save_day_array[1] = (threetime
												.getMonth() + 1)
												+ '월 '
												+ threetime.getDate()
												+ '일';

										selectday += '&lt;td class="on" id="daytd">&lt;a onclick="day_title_click(0,1)">내일('
												+ (twotime.getMonth() + 1)
												+ '월 '
												+ twotime.getDate()
												+ '일)&lt;/a>&lt;/td>';
										selectday += '&lt;td id="daytd">&lt;a onclick="day_title_click(1,2)" >모레('
												+ (threetime.getMonth() + 1)
												+ '월 '
												+ threetime.getDate()
												+ '일)&lt;/a>&lt;/td>';
									}

									save_data_point = 1; //처음 로딩시 map에 로딩해야하는 데이터 위치
								} else { //06시 일 경우 td 3개 생성
									selectday += '&lt;th width="130px" height="30px">날짜&lt;/th>';
									selectday += '&lt;td class="on" id="daytd">&lt;a onclick="day_title_click(0,0)">오늘('
											+ (nowtime.getMonth() + 1)
											+ '월 '
											+ nowtime.getDate()
											+ '일)&lt;/a>&lt;/td>';
									selectday += '&lt;td id="daytd">&lt;a onclick="day_title_click(1,1)">내일('
											+ (twotime.getMonth() + 1)
											+ '월 '
											+ twotime.getDate()
											+ '일)&lt;/a>&lt;/td>';
									selectday += '&lt;td id="daytd">&lt;a onclick="day_title_click(2,2)">모레('
											+ (threetime.getMonth() + 1)
											+ '월 '
											+ threetime.getDate()
											+ '일)&lt;/a>&lt;/td>';
									save_day_array[0] = (nowtime.getMonth() + 1)
											+ '월 ' + nowtime.getDate() + '일';
									save_day_array[1] = (twotime.getMonth() + 1)
											+ '월 ' + twotime.getDate() + '일';
									save_day_array[2] = (threetime.getMonth() + 1)
											+ '월 ' + threetime.getDate() + '일';
									save_data_point = 0; //처음 로딩시 map에 로딩해야하는 데이터 위치
								}
								$("#dayline").css("display", "");
								$("#dayselect").html(restr(selectday));
							}

							function day_title_click(indata, indata2) {
								var memarray = new Array();
								var i = 0;
								$('td[id="daytd"]').each(function() { //html 요소중 id값이 TYPE 데이터 모두 가져오기
									memarray[i] = $(this).removeClass('on'); //class 요소중 'on' 이라는 요소 삭제
									i++;
								});
								memarray[indata].addClass('on');
								save_day_point = indata;
								save_data_point = indata2; //맵에 표현할 값 저장
								create_map(); //맵 다시 그리기
							}

							var lines = Highcharts
									.geojson(Highcharts.maps['korea/mapline'],
											'mapline');

							//클래스 변환 값, 데이터 출력 값
							function create_map() {

								for (var i = 0; i < save_json.length; i++) {
									save_json[i]["value"] = save_json[i]["value"
											+ save_data_point];
									if (save_area_point_code == save_json[i].code) {
										map_point_click(save_area_point_ko,
												save_json[i]["value"
														+ save_data_point]);
									}
								}

								var data = save_json;

								$('#mapcon').highcharts('Map', {
										chart : {
											borderWidth : 1,
											events : {
												click : function() { //ie7에서 클릭할 때 반응하기 위한 이벤트 위치
													if (this.hoverPoint != null) {
														var obj = this.hoverPoint;
														save_area_point_code = obj.code; //현재 선택되어 있는 지점 코드 저장
														save_area_point_ko = obj.properties.SGG_NM; //현재 선택되어진 지점명 저장

														map_point_click(
																obj.properties.SGG_NM,
																obj.value);
													}
												}
											}
										},
										title : {
											text : ''
										},
										legend : {
											enabled : false
										},
										mapNavigation : {
											enabled : true
										},
										/* 없애고 데이터 자체에 color 로 넣어도됨 */
										colorAxis : {
											dataClasses : [ {
												from : 0,
												to : 2,
												color : "#e5e5e5"
											}, {
												from : 3,
												to : 5,
												color : "#FED98E"
											}, {
												from : 6,
												to : 7,
												color : "#FD8D3C"
											}, {
												from : 8,
												to : 10,
												color : "#F03B20"
											}, {
												from : 11,
												to : 100,
												color : "#54278F"
											} ]
										},
										series : [
												{
													data : data,
													mapData : Highcharts.maps['korea/drought_base'],
													joinBy : [
															'SGG_CD',
															'code' ],
													dataLabels : {
														enabled : false,
														color : '#FFFFFF'
													},
													name : ' ',
													tooltip : {
														pointFormatter : function() {
															var val = this.value;
															var lv = "";
															if (0 <= val
																	&& val <= 2) {
																lv = "낮음";
															} else if (2 < val
																	&& val <= 5) {
																lv = "보통";
															} else if (5 < val
																	&& val <= 7) {
																lv = "높음";
															} else if (7 < val
																	&& val <= 10) {
																lv = "매우높음";
															} else if (10 < val) {
																lv = "위험";
															}
															var redata = this.properties.SGG_NM
																	+ ' : '
																	+ lv
																	+ "("
																	+ val
																	+ ")";
															return redata;
														}
													},
													point : {
														events : {
															click : function() {
																/* 액션필요 */
																save_area_point_code = this.code; //현재 선택되어있는 지점 코드 저장
																save_area_point_ko = this.properties.SGG_NM; //현재 선택되어진 지점명 저장
																map_point_click(
																		this.properties.SGG_NM,
																		this.value);
															}
														}
													}
												},
												{
													data : lines,
													enableMouseTracking : false,
													name : 'line',
													type : 'mapline',
													color : '#808080',
													lineWidth : 1,
													zIndex : 10
												} ]
										});
								}

								function map_point_click(indata, indata2) {
									//등급 관련 
									var val = indata2; //지역 value값
									var lv = ""; //등급명
									var icon = "d004"; //등급 class 
									var mark_select = 0;
									if (0 <= val && val <= 2) {
										lv = "낮음";
										icon = "d001";
										mark_select = 0;
									} else if (2 < val && val <= 5) {
										lv = "보통";
										icon = "d002";
										mark_select = 1;
									} else if (5 < val && val <= 7) {
										lv = "높음";
										icon = "d003";
										mark_select = 2;
									} else if (7 < val && val <= 10) {
										lv = "<font style='color:#F03B20; font-weight:bold'>매우높음</font>";
										icon = "d004";
										mark_select = 3;
									} else if (10 < val) {
										lv = "<font style='color:#54278F; font-weight:bold'>위험</font>";
										icon = "d005";
										mark_select = 4;
									}
	
									//등급 입력
									$("#htit").html(indata); //지역명
									$("#tittext").html(lv); //등급한글명
									$("#tit_time_text").html(
											save_day_array[save_day_point]); //선택날짜
									$("#gageText").html(lv); //아이콘 등급 한글명
									$("#gageIcon").attr('class', icon); //아이콘 설정
	
									//마크 위치 지정
									var memarray = new Array();
									var i = 0;
	
									for (var idx = 0; idx < 5; idx++) {
										memarray[idx] = $("#legmark" + idx)
												.removeClass('on');//class 요소중 'on' 이라는 요소 삭제
									}
									memarray[mark_select].addClass("on");
									$("#sment")
											.html(restr(ment_array[mark_select])); //ment 변경
								}
						</script>
						
						<div>
							<h3>자외선 지수</h3>
						</div>

						<div class="viewTime">
							<font id="anno_time"></font> <span id="provide" class="period" style="float:right;">제공기간: 3월 ~ 11월</span>
						</div>

						<div style="height: 35px;">
							<table class="a_timeGraph2" style="margin-top: 0; width: 100%;">
								<thead>
									<tr id="dayselect">
										<td></td>
									</tr>
								</thead>
								<tbody style='display: none;' id='dayline'>
									<tr>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="e_contBox" id="tab_tree1"
							style="border: 1px solid #cecece;">
							
							<div class="map_cont" style="height: 470px; border: none;">
								<div class="map_box" id="mapcon"
									style="width: 370px; height: 439px;"></div>

								<div class="map_info" style="margin-bottom: 20px;">
									<table class="h_table">
										<thead>
											<tr>
												<th colspan="2"><h2 class="h_tit" id="htit">서울특별시</h2></th>
											</tr>
										</thead>
										<tbody>
											<tr class="day_info" style="height: 74px;">
												<th><div class="day_in">
														<span class="day_info_g" id="tittext">경고</span><br />
														<span id="tit_time_text" class="timetext"></span>
													</div></th>
												<th><div id="gageIcon" class="d03"></div></th>
											</tr>
											<tr>
												<td colspan="2">
													<div class="leg_box2">
														<table class="leg_table2">
															<tr class="leg_mark">
																<th id='legmark0'></th>
																<th id='legmark1'></th>
																<th id='legmark2' class="on"></th>
																<th id='legmark3'></th>
																<th id='legmark4'></th>
															</tr>
															<tr class="leg_col">
																<th class="col_a">낮음</th>
																<th class="col_b">보통</th>
																<th class="col_c">높음</th>
																<th class="col_d">매우<br>높음</th>
																<th class="col_e">위험</th>
															</tr>
														</table>
													</div>
												</td>
											</tr>
											<tr>
												<!--20170220 kby 내용 수정 -->
												<td colspan="2" class="h_subtit">대응요령</td>
											</tr>
											<tr>
												<td colspan="2" id="sment"></td>
											</tr>
										</tbody>
									</table>
								</div>
								<!--map_info -->

								<!--서비스 제공기간이 아닐 때 -->
								<div class="mapIn off" id="mapoff" style="display: none;">
									<div class="por" style="height: 460px">
										<div class="indexmNone">
											<p>
												<strong>서비스 제공기간이 아닙니다</strong>제공기간 : 3월~11월
											</p>
										</div>
									</div>
								</div>
								<!-- 서비스 제공기간이 아닐 때 -->

							</div>
							<!-- .map_cont -->

						</div>
						<!--.e_contBox 끝 -->
						<!-- 대응요령 -->
						<div class="e_contBox2">
							<div class="e_1">
								<img src="resources/weather/images/cau_icon.png" alt="아이콘"
									style="width: 25px; margin-right: 10px; padding-left: 5px;" />단계별
								대응요령
							</div>
							<div class="e_2" style="width: 100%; margin-left: 10px;"
								id="cntbox2">
								<table class="e_table2" style="width: 100%">
									<colgroup>
										<col width="15%" />
										<col width="15%" />
										<col width="70%" />
									</colgroup>
									<thead style="text-align:center;">
										<tr>
											<th>단계</th>
											<th>지수범위</th>
											<th>대응요령</th>
										</tr>
									</thead>
									<tbody id="long_ment">
										<tr>
											<th><img src='resources/weather/images/color05.png' alt='5등급아이콘'>&nbsp;위험</th>
											<th style="text-align:center;">11 이상</th>
											<td>▶ 햇볕에 노출 시 수십 분 이내에도 피부 화상을 입을 수 있어 가장 위험함<br />▶
												가능한 실내에 머물러야 함<br /> ▶ 외출 시 긴 소매 옷, 모자, 선글라스 이용<br />▶ 자외선
												차단제를 정기적으로 발라야 함
											</td>
										</tr>
										<tr>
											<th><img src='resources/weather/images/color04.png' alt='4등급아이콘'>&nbsp;매우높음</th>
											<th style="text-align:center;">8 이상<br />10 이하
											</th>
											<td>▶ 햇볕에 노출 시 수십 분 이내에도 피부 화상을 입을 수 있어 매우 위험함 <br />▶
												오전 10시부터 오후 3시까지 외출을 피하고 실내나 그늘에 머물러야 함 <br />▶ 외출 시 긴 소매 옷,
												모자, 선글라스 이용<br />▶ 자외선 차단제를 정기적으로 발라야 함
											</td>
										</tr>
										<tr>
											<th><img src='resources/weather/images/color03.png' alt='3등급아이콘'>&nbsp;높음</th>
											<th style="text-align:center;">6 이상<br>7 이하
											</th>
											<td>▶ 햇볕에 노출 시 1～2시간 내에도 피부 화상을 입을 수 있어 위험함<br />▶ 한낮에는
												그늘에 머물러야 함<br />▶ 외출 시 긴 소매 옷, 모자, 선글라스 이용<br />▶ 자외선 차단제를
												정기적으로 발라야 함
											</td>
										</tr>
										<tr>
											<th><img src='resources/weather/images/color02.png' alt='2등급아이콘'>&nbsp;보통</th>
											<th style="text-align:center;">3 이상<br>5 이하
											</th>
											<td>▶ 2～3시간 내에도 햇볕에 노출 시에 피부 화상을 입을 수 있음 <br />▶ 모자,
												선글라스 이용 <br />▶ 자외선 차단제를 발라야 함
											</td>
										</tr>
										<tr>
											<th><img src='resources/weather/images/color01.png' alt='1등급아이콘'>&nbsp;낮음</th>
											<th style="text-align:center;">2 이하</th>
											<td>▶ 햇볕 노출에 대한 보호조치가 필요하지 않음 <br />▶ 그러나 햇볕에 민감한 피부를 가진
												분은 자외선 차단제를 발라야 함
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
	
</body>
</html>