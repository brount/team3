<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<link href="/medical/resources/common/css/drugSeach.css"
	rel="stylesheet"><link href="/medical/resources/djcss/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- <link href="/medical/resources/djcss/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
 --><link href="/medical/resources/djcss/css/style.css" rel="stylesheet" type="text/css" />
	
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<html lang="en">
<title>의약품식별표시 식품의약품안전처 &amp; 약학정보원 :: 국내 유일 종합 의약품정보제공 공익기관</title>

<meta name="description" content="">
<meta name="keywords" content="낱알식별,낱알식별등록,약사회,대한약사회">
<link rel="stylesheet" type="text/css"
	href="/medical/resources/drug/common.css">
<!-- jquey datepicker 때문에 추가 -->
<link rel="stylesheet" href="/medical/resources/drug/jquery-ui.css">
<body>
	<header>
		<%@ include file="../common/header.jsp"%>
	</header>
<%@ include file="../common/line.jsp"%>

	<section>
		<script src="/medical/resources/common/js/drugSeach.js"></script>
		<div class="container">
			<div class="row">
				<div class="col-sm-3 col-md-3">
					<%@ include file="../common/menuHygiene.jsp"%>
				</div>
				<div class="col-sm-9 col-md-9">
					<div class="well">
						<script type="text/javascript" async=""
							src="/medical/resources/drug/ga.js"></script>
						<script type="text/javascript">

var omitformtags=["input", "textarea", "select"]

omitformtags=omitformtags.join("|")

function disableselect(e){
if (omitformtags.indexOf(e.target.tagName.toLowerCase())==-1)
return false
}

function reEnable(){
return true
}

</script>


						<script language="JavaScript"> 

//마우스 왼쪽/오른쪽 클릭 금지 
function noRightClick(evnt) {
	//네비게디터
	if (navigator.appName.toUpperCase().match(/NETSCAPE/) != null) {
		//오른쪽 버튼 클릭금지
		if (evnt.which == 3){;
			return false;
		}
		else {
			//왼쪽버튼 영역지정 금지
			if (document.onselectstart)
				return false;
		}		
	}
	//Microsoft Internet Explorer
	else {
		//오른쪽 버튼 클릭금지
		if (event.button==2){
			return false;
		}
		else {
			//왼쪽버튼 영역지정 금지
			if (document.onselectstart)
				return false;
		}
	}
}

function rtn_false() {
	return false;
}

	//document.onmousedown = noRightClick;
	//document.onselectstart = noRightClick;
	if (typeof document.onselectstart!="undefined")
		document.onselectstart= rtn_false
	else{
		document.onmousedown=disableselect
		document.onmouseup=reEnable
	}
	document.oncontextmenu = rtn_false;


</script>
						<!-- # include virtual = "/include/asp/permission_normal.asp" -->




						<script type="text/javascript"
							src="/medical/resources/drug/swfobject.js"></script>
						<script type="text/javascript"
							src="/medical/resources/drug/common.js"></script>
						<script type="text/javascript"
							src="/medical/resources/drug/jquery-1.6.2.min.js"></script>
						<script>window.jQuery || document.write('<script src="/include/js/jquery-1.4.2.min.js">\x3C/script>')</script>
						<!-- jquey datepicker 때문에 추가 -->
						<script src="/medical/resources/drug/jquery-ui.js"></script>

						<!-- Highslide JS -->
						<script type="text/javascript"
							src="/medical/resources/drug/highslide-full.js"></script>
						<script type="text/javascript"> 
hs.graphicsDir = '/include/js/highslide/graphics/';
hs.wrapperClassName = 'wide-border';
hs.showCredits = false;
hs.dimmingOpacity = 0.5;
hs.easing = 'easeInCirc';
hs.blockRightClick = true;
hs.headingEval = 'this.thumb.title';
</script>
<script language="JavaScript">

function auto_fill()
{
	document.frm.drugCompany.value = document.frm.drugCompany2.value;
}

function auto_fill2()
{
	document.frm.drugForm[10].checked = true;
}

function auto_fill3()
{
	document.frm.shape[10].checked = true;
}

function auto_check(c_type)
{
  	if (document.frm.is_check_all.checked)
  	{
  		document.frm.shape[0].checked = true;
  		document.frm.shape[1].checked = true;
  		document.frm.shape[2].checked = true;
  		document.frm.shape[3].checked = true;
  		document.frm.shape[4].checked = true;
  		document.frm.shape[5].checked = true;
  		document.frm.shape[6].checked = true;
		document.frm.shape[7].checked = true;
		document.frm.shape[10].checked = true;
  	} else {
  		document.frm.shape[0].checked = false;
  		document.frm.shape[1].checked = false;
  		document.frm.shape[2].checked = false;
  		document.frm.shape[3].checked = false;	
  		document.frm.shape[4].checked = false;
  		document.frm.shape[5].checked = false;
  		document.frm.shape[6].checked = false;
		document.frm.shape[7].checked = false;	
		document.frm.shape[10].checked = false;	
  	}
}

//-->
</script>


						<script language="VBScript">
function frm_OnSubmit() 
	
	's_print = Trim(document.frm.s_print.value)
	
	'if s_print <> "" and len(s_print) < 2 then 
	'	alert("검색하실 표시어를 2자 이상으로 입력해 주십시오.")
	'	document.frm.s_print.focus
	'	frm_onSubmit = false
	'	exit function
	'end if
	
	frm_onSubmit = True
end function
</script>

						<!-- 전체 -->
						<div id="wrapper">



							<form method="get" action="drugSeachList" name="frm">

								<h3>
									약품검색
								</h3>
								<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-inbox table-hover">
									<tbody>
										<tr>
											<td height="60"><span class="f_ds">※ 기본상태로 검색하시면
													모든제품이 검색됩니다. </span>&nbsp;</td>
										</tr>
									</tbody>
								</table>

								<table width="100%" cellspacing="0" cellpadding="0" border="0" class="table"
									bordercolor="#cecece"
									style="border: solid 1px #cecece; border-collapse: collapse; border-bottom: solid 0px #cecece" class="table table-inbox table-hover">
									<tbody>
										<tr>
											<td
												style="border: solid 1px #cecece; border-bottom: solid 0px #cecece;"
												width="94px" height="74" bgcolor="#f3f3f3" align="center">식별표시</td>
											<td
												style="border: solid 1px #cecece; border-bottom: solid 0px #cecece;"
												width="57px" height="54px" align="center">문자</td>
											<td colspan=3 style="padding: 0 0 0 7px; border: solid 0px #cecece; border-bottom: solid 0px #cecece;"width="200px">
												<input type="text" size="20"name="sign" style="ime-mode: inactive"><br>
												 <input	type="radio" name="sign_flag" value="0" checked="checked"style="margin-top: 8px">포함&nbsp;&nbsp; 
												 <input	type="radio" name="sign_flag" value="1">일치&nbsp;&nbsp;
												<input type="radio" name="sign_flag" value="2">시작
												</td>
											
										</tr>


										<tr>
											<td width="94" height="95" bgcolor="#f3f3f3" align="center"
												style="border: solid 1px #cecece">제 형</td>
											<td colspan="8"
												style="padding: 5px 0 5px 14px; border: solid 1px #cecece">
												<li style="width: 85px; float: left; letter-spacing: -1px;">
													<input type="checkbox" name="is_check_all"
													onclick="auto_check()" class="ver">정제류 :
											</li>
												<li style="width: 75px; float: left; letter-spacing: -1px;">
													<input type="checkbox" name="shape" value="당의정"
													class="ver">당의정&nbsp;
											</li>
												<li style="width: 110px; float: left; letter-spacing: -1px;">
													<input type="checkbox" name="shape" value="필름코팅정"
													class="ver">필름코팅정&nbsp;
											</li>
												<li style="width: 60px; float: left; letter-spacing: -1px;">
													<input type="checkbox" name="shape" value="나정"
													class="ver">나정&nbsp;
											</li>
												<li style="width: 85px; float: left; letter-spacing: -1px;">
													<input type="checkbox" name="shape" value="다층정"
													class="ver">다층정&nbsp;
											</li>
												<li style="width: 85px; float: left; letter-spacing: -1px;">
													<input type="checkbox" name="shape" value="설하정"
													class="ver">설하정&nbsp;
											</li>
												<li style="width: 85px; float: left;">
													<input type="checkbox" name="shape" value="저작정"
													class="ver">저작정&nbsp;
											</li>
												<li style="width: 110px; float: left; letter-spacing: -1px;">
													<input type="checkbox" name="shape" value="붕해(현탁)정"
													class="ver">붕해(현탁)정
											</li>

												<li style="width:130px; float: left; letter-spacing: -1px;">
													<input type="checkbox" name="shape" value="트로키정"
													class="ver">트로키정&nbsp;
											</li>
												<li style="width: 85px; float: none; clear: both"></li>
												<li style="width: 80px; float: left; letter-spacing: -1px;">
													<input type="checkbox" name="shape" value="경질캡슐"
													class="ver">경질캡슐&nbsp;
											</li>
												<li style="width: 150px; float: left"><input
													type="checkbox" name="shape" value="연질캡슐" class="ver">연질캡슐&nbsp;
											</li>


												<li
												style="width: 173px; float: right; letter-spacing: -1px;">
													<input type="checkbox" name="shape" value="기타"
													class="ver" style="margin-right: 0px;" onclick="zcheck()">기
													타&nbsp; <select name="shape_etc"
													onchange="javascript:auto_fill3()" class="ver f12"
													style="width: 100px">
														<option value="">전체</option>
														<option value="구강붕해필름">구강붕해필름</option>
														<option value="구강정">구강정</option>
														<option value="껌">껌</option>
														<option value="로젠지">로젠지</option>
														<option value="발포정">발포정</option>
														<option value="서방정">서방정</option>
														<option value="이중정">이중정</option>
														<option value="장용정">장용정</option>
														<option value="지속정">지속정</option>
														<option value="질정">질정</option>
														<option value="츄잉껌정">츄잉껌정</option>
														<option value="트로키정">트로키정</option>
														<option value="특수구강정">특수구강정</option>
														<option value="확산정">확산정</option>
												</select>&nbsp;
											</li> <script type="text/javascript">
function zcheck()
{
if (document.frm.shape.checked)
{
}
else
{

  		document.frm.shape_etc[0].selected = true;
}

}
//-->
</script> <script type="text/javascript">
function zcheck2()
{
if (document.frm.drugForm.checked)
{
}
else
{

  		document.frm.drugForm_etc[0].selected = true;
}

}
//-->
</script>

											</td>
										</tr>
										<tr>
											<td width="94" height="60" bgcolor="#f3f3f3" align="center"
												style="border: solid 1px #cecece">모 양</td>
											<td
												style="padding: 5px 0 5px 14px; border: solid 1px #cecece"
												colspan="8">
												<li style="width: 85px; float: left; letter-spacing: -1px;">
													<input type="checkbox" name="drugForm" value="원형"
													class="ver">원형 &nbsp;
											</li>
												<li style="width: 85px; float: left; letter-spacing: -1px;">
													<input type="checkbox" name="drugForm" value="타원형"
													class="ver type1" onclick="search_group(this,1)">타원형
													&nbsp;
											</li>
												<li style="width: 85px; float: left; letter-spacing: -1px;">
													<input type="checkbox" name="drugForm" value="반원형"
													class="ver">반원형 &nbsp;
											</li>
												<li style="width: 85px; float: left; letter-spacing: -1px;">
													<input type="checkbox" name="drugForm" value="삼각형"
													class="ver">삼각형 &nbsp;
											</li>

												<li style="width: 85px; float: left; letter-spacing: -1px;">
													<input type="checkbox" name="drugForm" value="사각형"
													class="ver">사각형 &nbsp;
											</li>

												<li style="width: 100px; float: left; letter-spacing: -1px;">
													<input type="checkbox" name="drugForm" value="마름모형"
													class="ver">마름모형&nbsp;
											</li>
												<li style="width: 85px; float: left; letter-spacing: -1px;">
													<input type="checkbox" name="drugForm" value="장방형"
													class="ver type1" onclick="search_group(this,1)">장방형
													&nbsp;
											</li>
												<div style="padding-top: 5px; clear: both; float: none">
													<li style="width: 85px; float: left; letter-spacing: -1px;">
														<input type="checkbox" name="drugForm" value="오각형"
														class="ver">오각형 &nbsp;
													</li>
													<li style="width: 85px; float: left; letter-spacing: -1px;">
														<input type="checkbox" name="drugForm" value="육각형"
														class="ver">육각형 &nbsp;
													</li>
													<li style="width: 85px; float: left; letter-spacing: -1px;">
														<input type="checkbox" name="drugForm" value="팔각형"
														class="ver">팔각형 &nbsp;
													</li>
													<li
														style="width: 173px; float: right; letter-spacing: -1px;">
														<input type="checkbox" name="drugForm" value="기타"
														class="ver" onclick="zcheck2()">기 타&nbsp; <select
														name="drugForm_etc" onchange="javascript:auto_fill2()"
														class="ver f12" style="width: 100px">
															<option value="">전체</option>
															<option value="8자형">8자형</option>
															<option value="강낭콩형">강낭콩형</option>
															<option value="과일모양">과일모양</option>
															<option value="구형">구형</option>
															<option value="나비넥타이형">나비넥타이형</option>
															<option value="나비모양">나비모양</option>
															<option value="다이아몬드형">다이아몬드형</option>
															<option value="도넛형">도넛형</option>
															<option value="동물모양">동물모양</option>
															<option value="땅콩형">땅콩형</option>
															<option value="레몬형">레몬형</option>
															<option value="물방울형">물방울형</option>
															<option value="방패형">방패형</option>
															<option value="사과형">사과형</option>
															<option value="심장형">심장형</option>
															<option value="십각형">십각형</option>
															<option value="애벌레형">애벌레형</option>
															<option value="얼굴모양">얼굴모양</option>
															<option value="오목한 삼각형">오목한 삼각형</option>
															<option value="클로버형">클로버형</option>
															<option value="탄환형">탄환형</option>
													</select>
													</li>
													<!--</span>-->
												</div>
											</td>
										</tr>


										<!-- 색깔 표시 시작 ---------------------------------------------------------->


										<tr>
											<td width="94" height="90px" bgcolor="#f3f3f3" align="center"
												rowspan="1" style="border: solid 1px #cecece">색
													깔</td>

											<td style="padding: 0 0 0 14px;" colspan="8">
												<table border="0" cellspacing="8" cellpadding="1" class="table table-inbox ">
													<!--색깔 -->
													<tbody>
														<tr>
															<td width="40" height="16" align="left"
																style="border: solid 1px #c8c8c8">&nbsp;</td>
															<td width="40" bgcolor="#FFFF00" align="left"
																style="border: solid 1px #c8c8c8">&nbsp;</td>
															<td width="40" bgcolor="#FFA500" align="left"
																style="border: solid 1px #c8c8c8">&nbsp;</td>
															<td width="40" bgcolor="#FF66FF" align="left"
																style="border: solid 1px #c8c8c8">&nbsp;</td>
															<td width="40" bgcolor="#FF0000" align="left"
																style="border: solid 1px #c8c8c8">&nbsp;</td>
															<td width="40" bgcolor="#8B0000" align="left"
																style="border: solid 1px #c8c8c8">&nbsp;</td>
															<td width="40" bgcolor="#ADFF2F" align="left"
																style="border: solid 1px #c8c8c8">&nbsp;</td>
															<td width="40" bgcolor="#009900"
																style="border: solid 1px #c8c8c8">&nbsp;</td>
														</tr>
														<tr>
															<td align="center"><input type="checkbox"
																name="color" value="하양" class="ver f12">하양</td>
															<td align="center"><input type="checkbox"
																name="color" value="노랑,미황" class="ver f12 type2"
																onclick="search_group(this,2)">노랑</td>
															<td align="center"><input type="checkbox"
																name="color" value="주황" class="ver f12 type2"
																onclick="search_group(this,2)">주황</td>
															<td align="center"><input type="checkbox"
																name="color" value="분홍" class="ver f12 type2"
																onclick="search_group(this,2)">분홍</td>
															<td align="center"><input type="checkbox"
																name="color" value="빨강" class="ver f12 type2"
																onclick="search_group(this,2)">빨강</td>
															<td align="center"><input type="checkbox"
																name="color" value="갈색" class="ver f12 type2"
																onclick="search_group(this,2)">갈색</td>
															<td align="center"><input type="checkbox"
																name="color" value="연두" class="ver f12 type3"
																onclick="search_group(this,3)">연두</td>
															<td align="center"><input type="checkbox"
																name="color" value="초록" class="ver f12 type3"
																onclick="search_group(this,3)">초록</td>
														</tr>
														<tr>
															<td width="40" bgcolor="#009900"
																style="border: solid 1px #c8c8c8">&nbsp;</td>
															<td width="40" height="16" align="left" bgcolor="#3333FF"
																style="border: solid 1px #c8c8c8">&nbsp;</td>
															<td width="40" bgcolor="#330066" align="left"
																style="border: solid 1px #c8c8c8">&nbsp;</td>
															<td width="40" bgcolor="#8B008B" align="left"
																style="border: solid 1px #c8c8c8">&nbsp;</td>
															<td width="40" bgcolor="#8A2BE2" align="left"
																style="border: solid 1px #c8c8c8">&nbsp;</td>
															<td width="40" bgcolor="#D3D3D3" align="left"
																style="border: solid 1px #c8c8c8">&nbsp;</td>
															<td width="40" bgcolor="#000000" align="left"
																style="border: solid 1px #c8c8c8">&nbsp;</td>
															<td width="40" align="left"
																style="border: solid 1px #c8c8c8">&nbsp;</td>
														</tr>
														<tr>
															<td align="center"><input type="checkbox"
																name="color" value="청록" class="ver f12 type3"
																onclick="search_group(this,3)">청록</td>
															<td align="center"><input type="checkbox"
																name="color" value="파랑,하늘" class="ver f12 type4"
																onclick="search_group(this,4)">파랑</td>
															<td align="center"><input type="checkbox"
																name="color" value="남색" class="ver f12 type4"
																onclick="search_group(this,4)">남색</td>
															<td align="center"><input type="checkbox"
																name="color" value="자주" class="ver f12 type5"
																onclick="search_group(this,5)">자주</td>
															<td align="center"><input type="checkbox"
																name="color" value="보라" class="ver f12 type5"
																onclick="search_group(this,5)">보라</td>
															<td align="center"><input type="checkbox"
																name="color" value="회색" class="ver f12">회색</td>
															<td align="center"><input type="checkbox"
																name="color" value="검정" class="ver f12">검정</td>
															<td align="center"><input type="checkbox"
																name="color" value="투명" class="ver f12">투명</td>
														</tr>
													</tbody>
												</table>
											</td>

										</tr>


										<tr>
											<td width="94" height="74" bgcolor="#f3f3f3" align="center"
												rowspan="2" style="border: solid 1px #cecece">분할선</td>
											<td
												style="border: solid 1px #cecece; text-align: center; height: 37px">앞</td>
											<td style="padding: 0 0 0 14px; border: solid 1px #cecece"
												colspan="6"><input type="checkbox" name="splitlineF"
												value="없음" class="ver">없음 &nbsp; <input
												type="checkbox" name="splitlineF" value="-" class="ver">
												'-' (또는 'I' ) 형 &nbsp; <input type="checkbox"
												name="splitlineF" value="+" class="ver"> '+' 형
												&nbsp; <input type="checkbox" name="splitlineF" value="기타"
												class="ver">기타</td>
										</tr>
										<tr>
											<td
												style="border: solid 1px #cecece; text-align: center; height: 37px">뒤</td>
											<td style="padding: 0 0 0 14px; border: solid 1px #cecece"
												colspan="6"><input type="checkbox" name="splitlineB"
												value="없음" class="ver">없음 &nbsp; <input
												type="checkbox" name="splitlineB" value="-" class="ver">
												'-' (또는 'I' ) 형 &nbsp; <input type="checkbox"
												name="splitlineB" value="+" class="ver"> '+' 형
												&nbsp; <input type="checkbox" name="splitlineB" value="기타"
												class="ver">기타</td>
										</tr>


										<tr>
											<td width="95" height="45" bgcolor="#f3f3f3" align="center"
												style="border: solid 1px #cecece; border-top: solid 0px #cecece;">제품명</td>
											<td
												style="padding: 0 0 0 14px; border: solid 1px #cecece; border-top: solid 0px #cecece; border-bottom: solid 1px #cecece"
												colspan="2"><input type="text" size="30"
												name="drugName"
												style="ime-mode: active; margin-right: 10px"></td>

											<td width="94" height="45" bgcolor="#f3f3f3" align="center"
												style="border: solid 1px #cecece; border-top: solid 0px #cecece">제조사</td>
											<td
												style="padding: 0 0 0 14px; border: solid 1px #cecece; border-top: solid 0px #cecece"
												colspan="4"><input type="text" name="drugCompany"
												style="ime-mode: active; width: 80px" class="ver f12">
												<select name="drugCompany2"
												onchange="javascript:auto_fill()" class="ver f12"
												style="width: 120px">
													<option value="">직접입력</option>
													<option value="갈더마코리아">갈더마코리아</option>

													<option value="건일제약(주)">건일제약(주)</option>

													<option value="경남제약(주)">경남제약(주)</option>

													<option value="경동제약(주)">경동제약(주)</option>

													<option value="경방신약(주)">경방신약(주)</option>

													<option value="(주)경보제약">(주)경보제약</option>

													<option value="경인제약">경인제약</option>

													<option value="경진제약사">경진제약사</option>

													<option value="경풍약품">경풍약품</option>

													<option value="경희제약(주)">경희제약(주)</option>

													<option value="고려은단(주)">고려은단(주)</option>

													<option value="고려제약(주)">고려제약(주)</option>

													<option value="광동제약(주)">광동제약(주)</option>

													<option value="구주제약(주)">구주제약(주)</option>

													<option value="국제약품(주)">국제약품(주)</option>

													<option value="(주)그린제약">(주)그린제약</option>

													<option value="(주)글락소스미스클라인">(주)글락소스미스클라인</option>

													<option value="(주)글락소스미스클라인컨슈머헬스케어코리아">(주)글락소스미스클라인컨슈머헬스케어코리아</option>

													<option value="기화제약(주)">기화제약(주)</option>

													<option value="길리어드사이언스코리아">길리어드사이언스코리아</option>

													<option value="남선약품">남선약품</option>

													<option value="(주)넥스팜코리아">(주)넥스팜코리아</option>

													<option value="노보노디스크제약(주)">노보노디스크제약(주)</option>

													<option value="(주)녹십자">(주)녹십자</option>

													<option value="(주)뉴젠팜">(주)뉴젠팜</option>

													<option value="(주)다림바이오텍">(주)다림바이오텍</option>

													<option value="다림양행(주)">다림양행(주)</option>

													<option value="(주)다산제약">(주)다산제약</option>

													<option value="대림제약(주)">대림제약(주)</option>

													<option value="대우제약(주)">대우제약(주)</option>

													<option value="(주)대웅">(주)대웅</option>

													<option value="대웅바이오(주)">대웅바이오(주)</option>

													<option value="(주)대웅제약">(주)대웅제약</option>

													<option value="대원제약(주)">대원제약(주)</option>

													<option value="대일화학공업">대일화학공업</option>

													<option value="대창무역상사">대창무역상사</option>

													<option value="대한뉴팜(주)">대한뉴팜(주)</option>

													<option value="대한약품공업(주)">대한약품공업(주)</option>

													<option value="대화제약(주)">대화제약(주)</option>

													<option value="대희물산(주)">대희물산(주)</option>

													<option value="(주)도체오">(주)도체오</option>

													<option value="독립바이오팜(주)">독립바이오팜(주)</option>

													<option value="(주)돌나라한농제약">(주)돌나라한농제약</option>

													<option value="동광제약(주)">동광제약(주)</option>

													<option value="(주)동구바이오제약">(주)동구바이오제약</option>

													<option value="동국제약(주)">동국제약(주)</option>

													<option value="동방에프티엘(주)">동방에프티엘(주)</option>

													<option value="(주)동방제약">(주)동방제약</option>

													<option value="동성제약(주)">동성제약(주)</option>

													<option value="동신제약(주)">동신제약(주)</option>

													<option value="동아에스티(주)">동아에스티(주)</option>

													<option value="동아제약(주)">동아제약(주)</option>

													<option value="동의제약">동의제약</option>

													<option value="동인당제약(주)">동인당제약(주)</option>

													<option value="(주)동현신약">(주)동현신약</option>

													<option value="(주)동호상사">(주)동호상사</option>

													<option value="동화약품(주)">동화약품(주)</option>

													<option value="디에스앤지(주)">디에스앤지(주)</option>

													<option value="(주)디에이치피코리아">(주)디에이치피코리아</option>

													<option value="라보라토리신파(유)">라보라토리신파(유)</option>

													<option value="(주)라이트팜텍">(주)라이트팜텍</option>

													<option value="(주)라파엠제약">(주)라파엠제약</option>

													<option value="(주)레고켐제약">(주)레고켐제약</option>

													<option value="롯데제약(주)">롯데제약(주)</option>

													<option value="(주)마더스제약">(주)마더스제약</option>

													<option value="머크(주)">머크(주)</option>

													<option value="(주)메디카코리아">(주)메디카코리아</option>

													<option value="메디코스팜">메디코스팜</option>

													<option value="메딕스제약(주)">메딕스제약(주)</option>

													<option value="명문제약(주)">명문제약(주)</option>

													<option value="명인제약(주)">명인제약(주)</option>

													<option value="(주)명지약품">(주)명지약품</option>

													<option value="미래제약(주)">미래제약(주)</option>

													<option value="미쓰비시다나베파마코리아(주)">미쓰비시다나베파마코리아(주)</option>

													<option value="바슈롬싸우스아시아인크">바슈롬싸우스아시아인크</option>

													<option value="(주)바이넥스">(주)바이넥스</option>

													<option value="바이엘코리아(주)">바이엘코리아(주)</option>

													<option value="보람제약(주)">보람제약(주)</option>

													<option value="(주)보령바이오파마">(주)보령바이오파마</option>

													<option value="보령제약(주)">보령제약(주)</option>

													<option value="부광메디카(주)">부광메디카(주)</option>

													<option value="부광약품(주)">부광약품(주)</option>

													<option value="(주)비씨월드제약">(주)비씨월드제약</option>

													<option value="비엘엔에이치(주)">비엘엔에이치(주)</option>

													<option value="(주)비웰팜">(주)비웰팜</option>

													<option value="(주)사노피-아벤티스코리아">(주)사노피-아벤티스코리아</option>

													<option value="(주)사이넥스">(주)사이넥스</option>

													<option value="삼공제약(주)">삼공제약(주)</option>

													<option value="삼남제약(주)">삼남제약(주)</option>

													<option value="삼성제약(주)">삼성제약(주)</option>

													<option value="삼신무역상사">삼신무역상사</option>

													<option value="삼아제약(주)">삼아제약(주)</option>

													<option value="(주)삼양바이오팜">(주)삼양바이오팜</option>

													<option value="(주)삼양제넥스대전공장">(주)삼양제넥스대전공장</option>

													<option value="(주)삼오제약">(주)삼오제약</option>

													<option value="삼익제약(주)">삼익제약(주)</option>

													<option value="삼일제약(주)">삼일제약(주)</option>

													<option value="삼진제약(주)">삼진제약(주)</option>

													<option value="삼천당제약(주)">삼천당제약(주)</option>

													<option value="(주)삼천리제약">(주)삼천리제약</option>

													<option value="(주)새한제약">(주)새한제약</option>

													<option value="샤이어파마코리아(유)">샤이어파마코리아(유)</option>

													<option value="(주)서울제약">(주)서울제약</option>

													<option value="(주)서흥">(주)서흥</option>

													<option value="성원애드콕제약(주)">성원애드콕제약(주)</option>

													<option value="세엘진(유)">세엘진(유)</option>

													<option value="세종제약(주)">세종제약(주)</option>

													<option value="(주)셀비온">(주)셀비온</option>

													<option value="(주)셀트리온">(주)셀트리온</option>

													<option value="(주)셀트리온제약">(주)셀트리온제약</option>

													<option value="쉐링푸라우코리아(주)">쉐링푸라우코리아(주)</option>

													<option value="슈미트헬스코리아(유)">슈미트헬스코리아(유)</option>

													<option value="시믹씨엠오코리아(주)">시믹씨엠오코리아(주)</option>

													<option value="(주)신광신약">(주)신광신약</option>

													<option value="신신제약(주)">신신제약(주)</option>

													<option value="신일제약(주)">신일제약(주)</option>

													<option value="신풍제약(주)">신풍제약(주)</option>

													<option value="신화제약(주)">신화제약(주)</option>

													<option value="(주)쎌바이오텍">(주)쎌바이오텍</option>

													<option value="(주)씨엘팜">(주)씨엘팜</option>

													<option value="(주)씨엠지제약">(주)씨엠지제약</option>

													<option value="씨제이헬스케어(주)">씨제이헬스케어(주)</option>

													<option value="(주)씨트리">(주)씨트리</option>

													<option value="(주)씨티씨바이오">(주)씨티씨바이오</option>

													<option value="(주)아림팜">(주)아림팜</option>

													<option value="(주)아벤티스파마">(주)아벤티스파마</option>

													<option value="(주)아이월드제약">(주)아이월드제약</option>

													<option value="아이큐어(주)">아이큐어(주)</option>

													<option value="아주약품(주)">아주약품(주)</option>

													<option value="악텔리온파마수티컬즈코리아(주)">악텔리온파마수티컬즈코리아(주)</option>

													<option value="안국뉴팜(주)">안국뉴팜(주)</option>

													<option value="안국약품(주)">안국약품(주)</option>

													<option value="(주)안트로젠">(주)안트로젠</option>

													<option value="알리코제약(주)">알리코제약(주)</option>

													<option value="알보젠코리아(주)">알보젠코리아(주)</option>

													<option value="알파제약(주)">알파제약(주)</option>

													<option value="(주)알피바이오">(주)알피바이오</option>

													<option value="에리슨제약(주)">에리슨제약(주)</option>

													<option value="에스.피.팜텍">에스.피.팜텍</option>

													<option value="(주)에스앤피제약">(주)에스앤피제약</option>

													<option value="에스에스팜(주)">에스에스팜(주)</option>

													<option value="에스에프아이코리아(주)">에스에프아이코리아(주)</option>

													<option value="에스케이케미칼(주)">에스케이케미칼(주)</option>

													<option value="(주)에스트라">(주)에스트라</option>

													<option value="에스피씨(주)">에스피씨(주)</option>

													<option value="(주)에이스파마">(주)에이스파마</option>

													<option value="에이징생명과학(주)">에이징생명과학(주)</option>

													<option value="에이치제이바이오팜(주)">에이치제이바이오팜(주)</option>

													<option value="(주)에이치피앤씨">(주)에이치피앤씨</option>

													<option value="에이프로젠제약(주)">에이프로젠제약(주)</option>

													<option value="(주)엔엠제약">(주)엔엠제약</option>

													<option value="엔터팜">엔터팜</option>

													<option value="(주)엘브리지">(주)엘브리지</option>

													<option value="(주)엘지화학">(주)엘지화학</option>

													<option value="(주)엠지">(주)엠지</option>

													<option value="영일제약(주)">영일제약(주)</option>

													<option value="영진약품(주)">영진약품(주)</option>

													<option value="영풍제약(주)">영풍제약(주)</option>

													<option value="오리엔탈제약(주)">오리엔탈제약(주)</option>

													<option value="(주)오스코리아제약">(주)오스코리아제약</option>

													<option value="(주)오스콜메디켐">(주)오스콜메디켐</option>

													<option value="오스템파마(주)">오스템파마(주)</option>

													<option value="오스틴제약(주)">오스틴제약(주)</option>

													<option value="(주)오현파마코푸레이션">(주)오현파마코푸레이션</option>

													<option value="(유)옥시레킷벤키저">(유)옥시레킷벤키저</option>

													<option value="와이디메디텍(주)">와이디메디텍(주)</option>

													<option value="우리들제약(주)">우리들제약(주)</option>

													<option value="우리제약(주)">우리제약(주)</option>

													<option value="우신메딕스">우신메딕스</option>

													<option value="(주)우일팜">(주)우일팜</option>

													<option value="원광제약(주)">원광제약(주)</option>

													<option value="위더스제약(주)">위더스제약(주)</option>

													<option value="(주)유나이티드인터팜">(주)유나이티드인터팜</option>

													<option value="유니메드제약(주)">유니메드제약(주)</option>

													<option value="(주)유영제약">(주)유영제약</option>

													<option value="(주)유유제약">(주)유유제약</option>

													<option value="(주)유한메디카">(주)유한메디카</option>

													<option value="(주)유한양행">(주)유한양행</option>

													<option value="이노벡스파마코리아(주)">이노벡스파마코리아(주)</option>

													<option value="(주)이노트로닉">(주)이노트로닉</option>

													<option value="이니스트바이오제약(주)">이니스트바이오제약(주)</option>

													<option value="(주)이든파마">(주)이든파마</option>

													<option value="이연제약(주)">이연제약(주)</option>

													<option value="익수제약(주)">익수제약(주)</option>

													<option value="(주)인바이오넷">(주)인바이오넷</option>

													<option value="(주)인트로바이오파마">(주)인트로바이오파마</option>

													<option value="일동제약(주)">일동제약(주)</option>

													<option value="일성신약(주)">일성신약(주)</option>

													<option value="일심제약">일심제약</option>

													<option value="일양바이오팜(주)">일양바이오팜(주)</option>

													<option value="일양약품(주)">일양약품(주)</option>

													<option value="(주)일화">(주)일화</option>

													<option value="입센코리아(주)">입센코리아(주)</option>

													<option value="(주)재우스팜">(주)재우스팜</option>

													<option value="정우신약(주)">정우신약(주)</option>

													<option value="제이더블유생명과학(주)">제이더블유생명과학(주)</option>

													<option value="제이더블유신약(주)">제이더블유신약(주)</option>

													<option value="제이더블유중외제약(주)">제이더블유중외제약(주)</option>

													<option value="제이앤드엠파마">제이앤드엠파마</option>

													<option value="제이에스제약(주)">제이에스제약(주)</option>

													<option value="제이텍바이오젠">제이텍바이오젠</option>

													<option value="제이팜코리아(주)">제이팜코리아(주)</option>

													<option value="제일기린약품(주)">제일기린약품(주)</option>

													<option value="제일약품(주)">제일약품(주)</option>

													<option value="(주)제일제약">(주)제일제약</option>

													<option value="제일헬스사이언스(주)">제일헬스사이언스(주)</option>

													<option value="(주)젠자임코리아">(주)젠자임코리아</option>

													<option value="조선무약(자)">조선무약(자)</option>

													<option value="조아제약(주)">조아제약(주)</option>

													<option value="(주)종근당">(주)종근당</option>

													<option value="(주)중헌메디텍">(주)중헌메디텍</option>

													<option value="(주)중헌제약">(주)중헌제약</option>

													<option value="지아이메딕스(주)">지아이메딕스(주)</option>

													<option value="지엘루비콘(주)">지엘루비콘(주)</option>

													<option value="지엘팜텍(주)">지엘팜텍(주)</option>

													<option value="지피제약(주)">지피제약(주)</option>

													<option value="진양제약(주)">진양제약(주)</option>

													<option value="(주)차바이오앤디오스텍">(주)차바이오앤디오스텍</option>

													<option value="천혜당제약(주)">천혜당제약(주)</option>

													<option value="초당약품공업(주)">초당약품공업(주)</option>

													<option value="케이엠에스제약(주)">케이엠에스제약(주)</option>

													<option value="코스맥스바이오(주)">코스맥스바이오(주)</option>

													<option value="(주)코아팜바이오">(주)코아팜바이오</option>

													<option value="코오롱제약(주)">코오롱제약(주)</option>

													<option value="콜마파마(주)">콜마파마(주)</option>

													<option value="크라운제약(주)">크라운제약(주)</option>

													<option value="크리스탈생명과학(주)">크리스탈생명과학(주)</option>

													<option value="크리스탈지노믹스(주)">크리스탈지노믹스(주)</option>

													<option value="킴스제약주식회사">킴스제약주식회사</option>

													<option value="태극제약(주)">태극제약(주)</option>

													<option value="(주)태준제약">(주)태준제약</option>

													<option value="(주)테라젠이텍스">(주)테라젠이텍스</option>

													<option value="(주)텔콘알에프제약">(주)텔콘알에프제약</option>

													<option value="투윈파마(주)">투윈파마(주)</option>

													<option value="(주)티디에스팜">(주)티디에스팜</option>

													<option value="티제이팜">티제이팜</option>

													<option value="(주)파마리서치프로덕트">(주)파마리서치프로덕트</option>

													<option value="파마사이언스코리아(주)">파마사이언스코리아(주)</option>

													<option value="(주)파마킹">(주)파마킹</option>

													<option value="(주)파마택코리아">(주)파마택코리아</option>

													<option value="파미래(주)">파미래(주)</option>

													<option value="(주)퍼슨">(주)퍼슨</option>

													<option value="(주)펜믹스">(주)펜믹스</option>

													<option value="풍림무약(주)">풍림무약(주)</option>

													<option value="프레지니우스카비코리아(주)">프레지니우스카비코리아(주)</option>

													<option value="하나제약(주)">하나제약(주)</option>

													<option value="(주)하원제약">(주)하원제약</option>

													<option value="(주)한국글로벌제약">(주)한국글로벌제약</option>

													<option value="한국넬슨제약(주)">한국넬슨제약(주)</option>

													<option value="한국노바티스(주)">한국노바티스(주)</option>

													<option value="한국다이이찌산쿄(주)">한국다이이찌산쿄(주)</option>

													<option value="한국다케다제약주식회사">한국다케다제약주식회사</option>

													<option value="(주)한국로슈">(주)한국로슈</option>

													<option value="한국롱프랑로라제약(주)">한국롱프랑로라제약(주)</option>

													<option value="한국룬드벡(주)">한국룬드벡(주)</option>

													<option value="한국릴리(유)">한국릴리(유)</option>

													<option value="한국마이팜제약(주)">한국마이팜제약(주)</option>

													<option value="한국맥널티(주)">한국맥널티(주)</option>

													<option value="한국먼디파마유한회사">한국먼디파마유한회사</option>

													<option value="한국메나리니(주)">한국메나리니(주)</option>

													<option value="한국바이오켐제약(주)">한국바이오켐제약(주)</option>

													<option value="한국베링거인겔하임(주)">한국베링거인겔하임(주)</option>

													<option value="(주)한국비엠아이">(주)한국비엠아이</option>

													<option value="(유)한국비엠에스제약">(유)한국비엠에스제약</option>

													<option value="한국산도스(주)">한국산도스(주)</option>

													<option value="한국세르비에(주)">한국세르비에(주)</option>

													<option value="한국쉐링(주)">한국쉐링(주)</option>

													<option value="한국슈와츠파마(주)">한국슈와츠파마(주)</option>

													<option value="(주)한국스티펠">(주)한국스티펠</option>

													<option value="(주)한국신약">(주)한국신약</option>

													<option value="한국신텍스제약(주)">한국신텍스제약(주)</option>

													<option value="한국쓰리엠(주)">한국쓰리엠(주)</option>

													<option value="(주)한국아벡스제약">(주)한국아벡스제약</option>

													<option value="(주)한국아브노바">(주)한국아브노바</option>

													<option value="한국아스텔라스제약(주)">한국아스텔라스제약(주)</option>

													<option value="한국아스트라제네카(주)">한국아스트라제네카(주)</option>

													<option value="한국애보트(주)">한국애보트(주)</option>

													<option value="한국애브비(주)">한국애브비(주)</option>

													<option value="한국약품(주)">한국약품(주)</option>

													<option value="(주)한국얀센">(주)한국얀센</option>

													<option value="한국에자이(주)">한국에자이(주)</option>

													<option value="한국엠알비(주)">한국엠알비(주)</option>

													<option value="한국엠에스디(유)">한국엠에스디(유)</option>

													<option value="한국오가논(주)">한국오가논(주)</option>

													<option value="한국오츠카제약(주)">한국오츠카제약(주)</option>

													<option value="한국와이어스(주)">한국와이어스(주)</option>

													<option value="한국웰팜(주)">한국웰팜(주)</option>

													<option value="한국유나이티드제약(주)">한국유나이티드제약(주)</option>

													<option value="한국유니온제약(주)">한국유니온제약(주)</option>

													<option value="(주)한국유니팜">(주)한국유니팜</option>

													<option value="한국유씨비제약(주)">한국유씨비제약(주)</option>

													<option value="한국인스팜(주)">한국인스팜(주)</option>

													<option value="한국캅셀공업(주)">한국캅셀공업(주)</option>

													<option value="한국코러스(주)">한국코러스(주)</option>

													<option value="한국코아제약(주)">한국코아제약(주)</option>

													<option value="한국코와주식회사">한국코와주식회사</option>

													<option value="한국콜마(주)">한국콜마(주)</option>

													<option value="한국쿄와하코기린(주)">한국쿄와하코기린(주)</option>

													<option value="한국테라박스(주)">한국테라박스(주)</option>

													<option value="(주)한국파마">(주)한국파마</option>

													<option value="(주)한국파비스제약">(주)한국파비스제약</option>

													<option value="(주)한국팜비오">(주)한국팜비오</option>

													<option value="한국페링제약(주)">한국페링제약(주)</option>

													<option value="한국프라임제약(주)">한국프라임제약(주)</option>

													<option value="(주)한국피엠지제약">(주)한국피엠지제약</option>

													<option value="한국화이자제약(주)">한국화이자제약(주)</option>

													<option value="한국후지사와약품(주)">한국후지사와약품(주)</option>

													<option value="한국휴텍스제약(주)">한국휴텍스제약(주)</option>

													<option value="(재)한국희귀의약품센터">(재)한국희귀의약품센터</option>

													<option value="(주)한독">(주)한독</option>

													<option value="(주)한독테바">(주)한독테바</option>

													<option value="(주)한독휴먼헬스">(주)한독휴먼헬스</option>

													<option value="한림제약(주)">한림제약(주)</option>

													<option value="한미메디케어(주)">한미메디케어(주)</option>

													<option value="한미약품(주)">한미약품(주)</option>

													<option value="한솔신약(주)">한솔신약(주)</option>

													<option value="한올바이오파마(주)">한올바이오파마(주)</option>

													<option value="한일약품공업(주)">한일약품공업(주)</option>

													<option value="한중제약(주)">한중제약(주)</option>

													<option value="(유)한풍제약">(유)한풍제약</option>

													<option value="한화제약(주)">한화제약(주)</option>

													<option value="(주)함소아제약">(주)함소아제약</option>

													<option value="(주)헤파가드">(주)헤파가드</option>

													<option value="현대약품(주)">현대약품(주)</option>

													<option value="협진무약(주)">협진무약(주)</option>

													<option value="화리약품(주)">화리약품(주)</option>

													<option value="(주)화이트생명과학">(주)화이트생명과학</option>

													<option value="화일약품(주)">화일약품(주)</option>

													<option value="환인제약(주)">환인제약(주)</option>

													<option value="(주)후파르마">(주)후파르마</option>

													<option value="(주)휴메딕스">(주)휴메딕스</option>

													<option value="(주)휴비스트제약">(주)휴비스트제약</option>

													<option value="(주)휴온스">(주)휴온스</option>

													<option value="(주)휴온스메디케어">(주)휴온스메디케어</option>

											</select></td>
										</tr>







									</tbody>
								</table>

								<table width="100%" border="0" cellspacing="0" cellpadding="0"
									style="margin-top: 3px;" class="table table-inbox table-hover">
									<tbody>
										<tr>
											<!--검색 버튼 -->
											<td align="right"><a class="over_btn" onclick="frm.submit();"><img
													src="/medical/resources/drug/btn_search01.gif" alt="검색"><img
													src="/medical/resources/drug/btn_search02.gif" alt="검색"
													class="over"></a></td>
										</tr>






									</tbody>
								</table>
							</form>

							<br>
							<br>




						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer>
		<%@ include file="../common/footer.jsp"%>
	</footer>
</body>
</html>