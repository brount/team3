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

						<div></div>
				
						<script type="text/javascript">
						
							var data_json = ${a};
							
							function restr(indata) {
								indata = indata.replace(/\&lt;/g, "<");
								return indata;
							}
							function restr2(indata) {
								indata = indata.replace(/\&amp;/g, "&");
								return indata;
							}

							var save_json = null; //jsondata
							var save_data_point = 0; //현재 선택한 날짜 포인트 저장
							var save_day_point = 0;
							var save_day_array = new Array(); //날짜 정보 저장
							var ment_array = new Array(); //ment 전체 정의
							ment_array[0] = "&lt;p class='h_info'>식중독 발생가능성은 낮으나 &lt;br>식중독예방에 지속적인 관심 요망&lt;/p>&lt;p class='h_info'>화장실 사용 후, 귀가 후, &lt;br>조리 전에 손 씻기를 생활화&lt;/p>";
							ment_array[1] = "&lt;p class='h_info'>식중독 발생가능성이 중간단계로 &lt;br>식중독예방에 주의 요망&lt;/p>&lt;p class='h_info'>조리음식은 중심부까지 75℃&lt;br>(어패류 85℃)로 1분 이상 완전히 &lt;br>익힘&lt;/p>";
							ment_array[2] = "&lt;p class='h_info'>식중독 발생가능성이 높으므로 &lt;br>식중독예방에 경계 요망&lt;/p>&lt;p class='h_info'>조리도구는 세척, 소독하여&lt;br>세균오염 방지&lt;/p>&lt;p class='h_info'>음식물 조리, 보관에 각별히 주의&lt;/p>";
							ment_array[3] = "&lt;p class='h_info'>식중독 발생가능성이 매우&lt;br>높으므로 식중독 예방에 각별한&lt;br>경계 요망&lt;/p>&lt;p class='h_info'>설사, 구토 등 식중독 의심&lt;br>증상 시 의료기관 방문&lt;/p>&lt;p class='h_info'>식중독 의심 환자는 식품 조리&lt;br>중단&lt;/p>";

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
												to : 54,
												color : "#e5e5e5"
											}, {
												from : 55,
												to : 70,
												color : "#FED98E"
											}, {
												from : 71,
												to : 85,
												color : "#FD8D3C"
											}, {
												from : 86,
												to : 100,
												color : "#F03B20"
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
															&& val < 55) {
														lv = "관심";
													} else if (55 <= val
															&& val < 71) {
														lv = "주의";
													} else if (71 <= val
															&& val < 86) {
														lv = "경고";
													} else if (86 <= val) {
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
								var icon = "d04"; //등급 class 
								var mark_select = 0;
								if (0 <= val && val < 55) {
									lv = "관심";
									icon = "d01";
									mark_select = 0;
								} else if (55 <= val && val < 71) {
									lv = "주의";
									icon = "d02";
									mark_select = 1;
								} else if (71 <= val && val < 86) {
									lv = "경고";
									icon = "d03";
									mark_select = 2;
								} else if (86 <= val) {
									lv = "<font style='color:#F03B20; font-weight:bold'>위험</font>";
									icon = "d04";
									mark_select = 3;
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
								for (var idx = 0; idx < 4; idx++) {
									memarray[idx] = $("#legmark" + idx)
											.removeClass('on');//class 요소중 'on' 이라는 요소 삭제
								}
								memarray[mark_select].addClass("on");
								$("#sment")
										.html(restr(ment_array[mark_select])); //ment 변경
							}
						</script>
						<div>
							<h3>식중독 지수</h3>
						</div>

						<div class="viewTime">
							<font id="anno_time"></font> <span id="provide" class="period" style="float:right;"> 제공기간 :
								연중</span>
						</div>
						<table class="a_timeGraph2" style="margin-top: 0;">
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

						<div class="e_contBox" id="tab_tree1"
							style="border: 1px solid #cecece;">
							<div class="map_cont" style="height: 460px; border: none;">
								<div class="map_box" id="mapcon" style="height: 439px;"></div>

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
														<span class="day_info_g" id="tittext">경고</span><br/> <span id="tit_time_text" class="timetext"></span>
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
															</tr>
															<tr class="leg_col">
																<th class="col_a">관심</th>
																<th class="col_b">주의</th>
																<th class="col_c">경고</th>
																<th class="col_d">위험</th>
															</tr>
														</table>
													</div>
												</td>
											</tr>
											<tr>
												<td colspan="2" class="h_subtit">대응요령</td>
											</tr>
											<tr>
												<td colspan="2" id="sment"></td>
											</tr>
										</tbody>
									</table>
								</div>
								<!--map_info -->
							</div>
							<!-- .map_cont -->
						</div>
						<!--.e_contBox 끝 -->

						<!-- 대응요령 -->
						<div class="e_contBox2"">
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
											<th><img src='resources/weather/images/color04.png'
												alt='4등급아이콘'>&nbsp;위험</th>
											<th style="text-align:center;">86 이상</th>
											<td>▶ 식중독 발생가능성이 매우 높으므로 식중독 예방에 각별한 경계가 요망됨 <br/>▶ 설사,
												구토 등 식중독 의심 증상이 있으면 의료기관을 방문하여 의사 지시에 따름 <br/>▶ 식중독 의심 환자는
												식품 조리 참여에 즉시 중단하여야 함
											</td>
										</tr>
										<tr>
											<th><img src='resources/weather/images/color03.png'
												alt='3등급아이콘'>&nbsp;경고</th>
											<th style="text-align:center;">71 이상<br />86 미만
											</th>
											<td>▶ 식중독 발생가능성이 높으므로 식중독 예방에 경계가 요망됨 <br/>▶ 조리도구는 세척,
												소독 등을 거쳐 세균오염을 방지하고 유통기한, 보관방법 등을 확인하여 음식물 조리. 보관에 각별히 주의하여야
												함
											</td>
										</tr>
										<tr>
											<th><img src='resources/weather/images/color02.png'
												alt='2등급아이콘'>&nbsp;주의</th>
											<th style="text-align:center;">55 이상<br>71 미만
											</th>
											<td>▶ 식중독 발생가능성이 중간 단계이므로 식중독예방에 주의가 요망됨<br/>▶ 조리음식은
												중심부까지 75℃(어패류 85℃)로 1분 이상 완전히 익히고 외부로 운반할 때에는 가급적 아이스박스 등을
												이용하여 10℃이하에서 보관 및 운반
											</td>
										</tr>
										<tr>
											<th><img src='resources/weather/images/color01.png'
												alt='1등급아이콘'>&nbsp;관심</th>
											<th style="text-align:center;">55 미만</th>
											<td>▶ 식중독 발생가능성은 낮으나 식중독 예방에 지속적인 관심이 요망됨<br/>▶ 화장실 사용
												후, 귀가 후, 조리 전에 손 씻기를 생활화
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!--.e_2 -->

						</div>
						<!--.e_contBox2 -->
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