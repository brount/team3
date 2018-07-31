
var blOpen = false;
var lastClickedBtn = null;
function visibleDiv(elementId,value, useLoad, srcEle){
	if(srcEle) {
		lastClickedBtn = srcEle;
	}
	
	var obj = document.getElementById(elementId);
	if(value && !blOpen){
		blOpen = true;
		obj.style.display = "";
		obj.focus();
	}else{
		blOpen = false;
		obj.style.display = "none";
		//document.location.reload();
	}
	var frm = document.interestForm;
	if(useLoad == "LOAD") {
		frm.loadBase[1].checked = true;
		changeLoadBase(frm.loadBase[1]);
	} else {
        if(frm.loadBase != null) {
            frm.loadBase[0].checked = true;
            changeLoadBase(frm.loadBase[0]);
        }
	}
	jQuery('#load_keyword').val('');
	
	if(lastClickedBtn && value == false) {
		try {
			lastClickedBtn.focus();
		}catch(e) {}
		lastClickedBtn = null;
	}
}

// 관심지역 삭제
function deleteLocal(num){
	
	// 팝업 관심지역 삭제
	var div = document.getElementById("address");
	var list = div.getElementsByTagName("p");
	
	for(var i = 0 ; i < list.length ; i++){
		child = list.item(i);
		if(child.id != "" && child.id == "Local_"+num){
			div.removeChild(child);
			//deleteCookie(num);
			i--;
		}
	}
	
	if(list.length == 0){
		var html = "";
		html += '<p class="base">';
		html += '	<input type="text" class="inp_text2" title="설정된 지역이 없음." value="지역을 추가해주세요." readonly="readonly"/>';
		//html += '	<a href="#" >';
		//html += '		<img src="../../images/weather/forecast/btn_add_setarea.gif" alt="추가" class="btn_base" />';
		//html += '	</a>';
		html += '</p>';
		div.innerHTML = html;
	}
	updateMyLocations("del", num);
	var $no = jQuery('#Local_' + (num+1));
	if($no.length > 0) {
		$no.find('input').first().trigger('focus');
	} else {
		$po = jQuery('#loadBaseN');
		$po.trigger('focus');
	}
}

//지역설정 쿠키 삭제
function deleteCookie(num){
	var temp = "";
	
	var numbers = getCookie("localNumbers").split("/");
	
	for(var i = 0 ; i < numbers.length ; i++){
		if(num != numbers[i]){
			if(temp != "") temp += "/";
			temp += numbers[i];
		}
	}

	setCookie("localNumbers",temp, 365);
}
// 마지막 관심지역 예보 보기를 최우선으로 보기
// 수정 2016.08.17 
function lastSelectedForecastToFirst(num) {
	var frm = document.setinfoForm;
	var obj = frm.town_select;
	//var val = obj.options[num].value;
	var numbers = getCookie("localNumbers").split("/");
	var arrInfo = [];
	var arrIdx = 1;

	for( var j = 0; j< obj.options.length; j++ ) {
		var val = obj.options[j].value;
		for( var i = 0; i< numbers.length; i++) {
			var temp2 = getCookie("localInfo_" + numbers[i]);
			if ( temp2 == undefined || temp2 == '')
				continue;
			if ( num == j && temp2 == val)	
				arrInfo[0] = numbers[i];
			else if (num != j && temp2 == val)
			{
				arrInfo[arrIdx] = numbers[i];
				arrIdx++;
			}
		}
	}

	var temp = "";
	for( var i = 0; i< arrInfo.length; i++) {
		if(arrInfo[i] == undefined || arrInfo[i] == '' ) continue;
		if (i == 0) temp = arrInfo[i];
		else temp += "/" + arrInfo[i];
	}
	var today = new Date();
	today.setDate(today.getDate()+ 365);
	document.cookie = "localNumbers=" + escape( temp ) + "; path=/; expires=" + today.toGMTString() + ";domain=.kma.go.kr;";
}
// 관심지역 예보 보기
function selectedForecast(){
	var frm = document.setinfoForm;
	var obj = frm.town_select;
	var val = obj.options[obj.selectedIndex].value;

    lastSelectedForecastToFirst(obj.selectedIndex);

	if(val != ""){
		document.location.href = "?searchType=SETINFO&setinfoCode="+val;
	}
	return false;
}

// 상위
function upLocal(type, initType){
	var frm = document.interestForm;
	
	frm.type.value = type;

	if(type == "WIDE"){
		frm.wideCode.value = "";
		frm.wideName.value = "";
		frm.cityCode.value = "";
		frm.cityName.value = "";
		frm.dongCode.value = "";
		frm.dongName.value = "";
		jQuery('#search_box').hide();
	}
	else if(type == "CITY"){
		frm.cityCode.value = "";
		frm.cityName.value = "";
		frm.dongCode.value = "";
		frm.dongName.value = "";
		jQuery('#search_box').hide();
	}else{
		if(frm.loadBase[0].checked) {
			jQuery('#search_box').hide();
		} else {
			jQuery('#search_box').show();
		}
	}
	if(initType == null) initType = '';
	if(type != "WIDE") initType = '';
	frm.action = "/weather/process/main-dfs-area.jsp?initType=" + initType;

	jQuery('#hiddenFrame').remove();
	jQuery('<iframe name="hiddenFrame" />').appendTo('body').attr({'id':'hiddenFrame', 'width':'0', 'height':'0'});
	frm.target = "hiddenFrame";
	frm.target = "hiddenFrame";
	frm.submit();
	frm.target = "_self";
}

// 하위
function selectLocal(type,code,name){
	var frm = document.interestForm;
	
	frm.type.value = type;
	
	if(type == "CITY"){
		frm.wideCode.value = code;
		frm.wideName.value = name;
		jQuery('#search_box').hide();
	}
	else if(type == "DONG"){
		frm.cityCode.value = code;
		frm.cityName.value = name;
		if(frm.loadBase != null && frm.loadBase[0].checked) {
			jQuery('#search_box').hide();
		} else {
			jQuery('#search_box').show();
		}
	}
	frm.action = "/weather/process/main-dfs-area.jsp";
	frm.target = "hiddenFrame";
	frm.submit();
	frm.target = "_self";
}

// 동 정보를 선택
function setLocal(code,name){
	var frm = document.interestForm;
	var txtLocalName = document.getElementById("selectedLocalName");
	
	frm.type.value	= "SET";
	frm.dongCode.value = code;
	frm.dongName.value = name;

	txtLocalName.value = frm.wideName.value+" "+frm.cityName.value+" "+frm.dongName.value;
}

// 선택 지역 저장하기
function setCookieLocalInfo(){
	
	var frm = document.interestForm;
	
	if(frm.type.value == "SET"){
		
		var numbers = getCookie("localNumbers").split("/");
		if ( numbers.length > 10 ) {
			alert("관심지역 저장 개수를 초과하셨습니다. 저장된 관심지역을 삭제 후 저장하십시요");
			return;
		}

		updateMyLocations("add", frm.dongCode.value);
		alert("저장 되었습니다. 화면을 새로고칩니다.");
		
		document.location.href = "?searchType=SETINFO&setinfoCode="+frm.dongCode.value;
		
		return;
	}
	alert("지역을 선택해 주세요.");
	return;
}

// 찾아본 지역 저장하기
function setSearchInfo(){
	
	var frm = document.interestForm;
	
	var intMaxNumber = 0;
	
	var strLocalNumbers = getCookie("searchNumbers");
	
	var arrLocalNumbers = strLocalNumbers.split("/");

	// 5이상일경우 - 처음 지역을 삭제함.
	if(arrLocalNumbers.length >= 5){
		deleteSearchInfo(arrLocalNumbers[0]);
		strLocalNumbers = getCookie("searchNumbers");
	}
	
	if(strLocalNumbers != ""){
		intMaxNumber = parseInt(arrLocalNumbers[arrLocalNumbers.length - 1],0);
		intMaxNumber++;
	}
	
	setCookie("searchInfo_"+intMaxNumber,frm.dongCode.value,1);
	
	if(strLocalNumbers != ""){
		setCookie("searchNumbers",strLocalNumbers+"/"+intMaxNumber,1);
	}else{
		setCookie("searchNumbers",intMaxNumber, 1);
	}
	
}

// 찾아본 지역 삭제
function deleteSearchInfo(num){
	var ul = document.getElementById("searchList");
	var list = ul.getElementsByTagName("li");
	
	for(var i = 0 ; i < list.length ; i++){
		child = list.item(i);
		if(child.id != "" && child.id == "search_"+num){
			ul.removeChild(child);
			
			var temp = "";
			var numbers = getCookie("searchNumbers").split("/");
			
			for(var i = 0 ; i < numbers.length ; i++){
				if(num != numbers[i]){
					if(temp != "") temp += "/";
					temp += numbers[i];
				}
			}

			setCookie("searchNumbers",temp,1);
			
			i--;
		}
	}
	
	if(list.length == 0){
		ul.innerHTML = "<p class='no_info'>찾아본 동네가<br />없습니다.</p>";
	}
	
}

//찾아본 지역 예보보기
function getSearchAjax(code){
	document.location.href = "?searchType=RESEARCH&researchCode="+code;
}

/**
 * 선택지역 예보 보기
 * @return
 */
function refresh_dfs(){
	var frm = document.interestForm;
	if(frm.type.value == "SET"){
		
		//찾아본 동네 추가
		setSearchInfo();

		document.location.href = "?searchType=INTEREST&wideCode=" + frm.wideCode.value + "&cityCode=" + frm.cityCode.value + "&dongCode=" + frm.dongCode.value;
		
		return false;
	}
	alert("지역을 선택해 주세요.");
	return false;
}

function updateMyLocations(action, loc) {
	var param = "?";
	if(action == "add") {
		param += "addLocation=" + loc;
	} else if(action == "del") {
		param += "delLocation=" + loc;
	}
	//alert("/mypage/updateMyLocations.jsp" + param);

	if(typeof(Ajax)  != "undefined") {
		var myAjax = new Ajax.Request("/mypage/updateMyLocations.jsp" + param,
			{
				method: 'post',
				parameters: '', 
				onSuccess: function() { },
				onFailure: function() { }
			}
		);
	} else {
		try {
			jQuery.ajax({
				url: "/mypage/updateMyLocations.jsp" + param
				, cache:false
				, success:function(data) {
				}
				, error:function(req, textStatus, error) {
				}
			});
		} catch(e) { }
	}
}
function changeLoadBase(o) {
	if(o.value=="Y") {
		// 도로(도로코드기반)
		jQuery('#search_box').hide();
		upLocal("WIDE",'init');
	} else {
		// 지번(행정동코드기반)
		jQuery('#search_box').hide();
		upLocal("WIDE",'init');
	}
}

function search_load() {
	var frm = document.interestForm;
	if(frm.type.value == "DONG" || frm.type.value == "SET") {
		selectLocal("DONG",frm.cityCode.value,frm.cityName.value);
	} else {
		alert("시도/구군을 선택하신 후 도로명을 검색해 주세요.");
	}
}
function search_load_keydown(e) {
	if(!e) e = window.event;
	if(e.keyCode == 13) {
		search_load();
		return false;
	}
}
function indexSearch(start, end) {
	var frm = document.interestForm;
	if(frm.type.value == "DONG" || frm.type.value == "SET") {
		frm.type.value = "DONG";
		frm.indexStart.value = start;
		frm.indexEnd.value = end;
		frm.action = "/weather/process/main-dfs-area.jsp";
		frm.target = "hiddenFrame";
		frm.submit();
		frm.target = "_self";
	}
}