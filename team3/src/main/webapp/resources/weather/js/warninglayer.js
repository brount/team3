//jQuery = jQuery.noConflict();
var objXY = { x: 0, y: 0 };
var cmXY = { x: 0, y: 0 };
var target = {};
var draggablePop = false;
jQuery(document).ready(function(){ jQuery.ajax({
type: 'POST'
, async: true
, url: '/weather/eqklayerpopup3.jsp'
, cache:false
, dataType: "json"
, beforeSend: function() {}
, success: function(data) {

targetId = "" ;
var resData = data;
if(resData.length > 0 ) {
var x = 1;
var btnClose = "<a href=\"#\" onclick=\"return false;\"><img id=\"layer_popup_move\" src=\"/images/main/img_totalm_move.gif\" height=\"19\" border=\"0\" alt=\"이동\" /></a><a href=\"#\" onclick=\"javascript:fncClose('eqkT');return false;\"><img src=\"/images/main/img_totalm_close.gif\" height=\"21\" onclick=\"javascript:fncClose('eqkT');return false;\" border=\"0\" alt=\"닫기\"/></a>"; 
var t1 = "규모", t2="발생시각", t3="발생위치", t4="참고사항", t5="위도/경도", t6="깊이", t7="해당지역", t8="파고 및 도달시각", t9="당부사항";
var tgDlsH = "<dl class=\"top bgn\">", tgDls = "<dl class=\"cont\">", tgDle = "</dl>", tgDts = "<dt>", tgDte="</dt>", tgDds = "<dd>", tgDde = "</dd>", tdDivs = "<div id=\"eqkT\" class=\"layer_popup\">", tdDive = "</div>", tdP = "<p class=\"border_line\"></p>",spc = "&nbsp;";
var eqkL = "";
eqkL += tdDivs;
for(var i=0; i< resData.length; i++ ) {
var eqkDJson = resData[i];
if(i == 1 && resData.length == 2)
eqkL += tdP;
eqkL += tgDlsH;
if (eqkDJson.kind == "INF" || eqkDJson.kind == "RPT" )
{
t1 = "규모" , t3="발생위치";
eqkL += tgDts + eqkDJson.y + tgDte + tgDds + btnClose  + tgDde ;
eqkL += tgDle;
eqkL += tgDls;
eqkL += tgDts + t1 + tgDte + tgDds + spc + eqkDJson.mag   + tgDde ;
eqkL += tgDle;
eqkL += tgDls;
eqkL += tgDts + t2 + tgDte + tgDds + spc + eqkDJson.w   + tgDde ;
eqkL += tgDle;
eqkL += tgDls;
eqkL += tgDts + t3 + tgDte + tgDds + spc + eqkDJson.area   + tgDde ;
eqkL += tgDle;
eqkL += tgDls;
eqkL += tgDts + t4 + tgDte + tgDds + spc + eqkDJson.noti   + tgDde ;
eqkL += tgDle;
eqkL += tgDls;
eqkL += tgDts + t5 + tgDte + tgDds + spc + eqkDJson.lat + "/" + spc + eqkDJson.lon + tgDde ;
eqkL += tgDle;
eqkL += tgDls;
eqkL += tgDts + t6 + tgDte;
eqkL += tgDds + spc;
if( eqkDJson.depth != null && eqkDJson.depth != '' ) eqkL += eqkDJson.depth + " km";
eqkL += tgDde ;
eqkL += tgDle;
} 
else if (eqkDJson.kind == "TSN" )
{
t1 = "규모" , t3="발생위치";
eqkL += tgDts + eqkDJson.y + tgDte + tgDds + btnClose  + tgDde ;
eqkL += tgDle;
eqkL += tgDls;
eqkL += tgDts + t1 + tgDte + tgDds + spc + eqkDJson.mag   + tgDde ;
eqkL += tgDle;
eqkL += tgDls;
eqkL += tgDts + t2 + tgDte + tgDds + spc + eqkDJson.w   + tgDde ;
eqkL += tgDle;
eqkL += tgDls;
eqkL += tgDts + t3 + tgDte + tgDds + spc + eqkDJson.area   + tgDde ;
eqkL += tgDle;
eqkL += tgDls;
eqkL += tgDts + t4 + tgDte + tgDds + spc + eqkDJson.noti   + tgDde ;
eqkL += tgDle;
eqkL += tgDls;
eqkL += tgDts + t5 + tgDte + tgDds + spc + eqkDJson.lat + "/" + spc + eqkDJson.lon + tgDde ;
eqkL += tgDle;
eqkL += tgDls;
eqkL += tgDts + t6 + tgDte;
eqkL += tgDds + spc;
if( eqkDJson.depth != null && eqkDJson.depth != '' ) eqkL += eqkDJson.depth + " km";
eqkL += tgDde ;
eqkL += tgDle;
eqkL += tgDls;
eqkL += tgDts + t7 + tgDte + tgDds + spc + eqkDJson.tsnarea   + tgDde ;
eqkL += tgDle;
eqkL += tgDls;
eqkL += tgDts + t8 + tgDte + tgDds + spc + eqkDJson.wave   + tgDde ;
eqkL += tgDle;
eqkL += tgDls;
eqkL += tgDts + t9 + tgDte + tgDds + spc + eqkDJson.request   + tgDde ;
eqkL += tgDle;
} else if( eqkDJson.kind == "EEW" ) {
t1 = "추정규모", t3 = "추정위치";
if(resData.length == 1)
eqkL += tgDts + eqkDJson.y + tgDte + tgDds + btnClose  + tgDde ;
else if(resData.length == 2)
eqkL += tgDts + eqkDJson.y + tgDte + tgDds + tgDde ;
eqkL += tgDle;
eqkL += tgDls;
eqkL += tgDts + t1 + tgDte + tgDds + spc + eqkDJson.mag   + tgDde ;
eqkL += tgDle;
eqkL += tgDls;
eqkL += tgDts + t2 + tgDte + tgDds + spc + eqkDJson.w   + tgDde ;
eqkL += tgDle;
eqkL += tgDls;
eqkL += tgDts + t3 + tgDte + tgDds + spc + eqkDJson.area   + tgDde ;
eqkL += tgDle;
eqkL += tgDls;
eqkL += tgDts + t4 + tgDte + tgDds + spc + eqkDJson.noti   + tgDde ;
eqkL += tgDle;
eqkL += tgDls;
eqkL += tgDts + t5 + tgDte + tgDds + spc + eqkDJson.lat + "/" + spc + eqkDJson.lon + tgDde ;
eqkL += tgDle;
} 
}
eqkL += tdDive;
jQuery(document.body).append(eqkL);
target = document.getElementById( "eqkT");
if( target != null ) {
itarget = document.getElementById("layer_popup_move");
itarget.onmousedown = layerPopMouseDown;
document.onmousemove = layerPopMouseMove;
}
}
}
, error: function(data, status, err) {}
, complete: function() { }
});

});

function fncClose(target){
var obj = document.getElementById(target);
jQuery(obj).css("display","none");
}
function layerPopMoveClick(e) {
itarget = document.getElementById("layer_popup_move");
itarget.click();
}
function layerPopMouseDown(e) {
var posX = 0;
var posY = 0;
if (typeof(e) == 'undefined') {
e = event;
}
if(typeof(e.clientX) == 'undefined') {
posX = e.originalEvent.clientX;
posY = e.originalEvent.clientY;
} else {
posX = e.clientX;
posY = e.clientY;
}
var docElem = document.documentElement;
var docBody = document.body;
if (docElem) {
posX += docElem.scrollLeft;
posY += docElem.scrollTop;
} else if (docBody) {
posX += docBody.scrollLeft;
posY += docBody.scrollTop;
}
var xy = {x : posX, y : posY};
var oTmp = jQuery(target);
var left = oTmp.css("left");
var top = oTmp.css("top");
left = left.substr(0, left.length-2);
top = top.substr(0, top.length-2);
objXY.x = parseFloat(left);
objXY.y = parseFloat(top);
cmXY.x = xy.x - objXY.x;
cmXY.y = xy.y - objXY.y;
if (draggablePop) {
draggablePop = false;
} else {
draggablePop = true;
}
}
function layerPopMouseMove(e) {
var posX = 0;
var posY = 0;
if (typeof(e) == 'undefined') {
e = event;
}
if(typeof(e.clientX) == 'undefined') {
posX = e.originalEvent.clientX;
posY = e.originalEvent.clientY;
} else {
posX = e.clientX;
posY = e.clientY;
}
if(draggablePop) {
var docElem = document.documentElement;
var docBody = document.body;
if (docElem) {
posX += docElem.scrollLeft;
posY += docElem.scrollTop;
} else if (docBody) {
posX += docBody.scrollLeft;
posY += docBody.scrollTop;
}
var xy = {x : posX, y : posY};
var left = xy.x - cmXY.x ;
var top = xy.y - cmXY.y ;
var oTmp = jQuery(target);
oTmp.css("left",left+"px");
oTmp.css("top",top+"px");
}
}
function getWarningNotice(dongCd, url) {
	if(!dongCd) return;
var urlDongCd = '/weather/waringdongjson.jsp';
if ( dongCd != '4613036000' && dongCd != '5011032000')
{
dongCd = dongCd.substring(0,5);
}
urlDongCd += '?dongCd='+dongCd;
jQuery.ajax({
type: 'GET'
, async: true
, url: urlDongCd
, cache:false

, dataType: "JSON"
, beforeSend: function(req) {}
, success: function(data) {
if (url == 'index.jsp')
{
displayWarningNoticeIndex(data);
}
else if (url == 'main.jsp')
{
displayWarningNoticeMain(data);
}
else if (url == 'timeseries.jsp')
{
displayWarningNoticeTimeseries(data);
}

}
, error: function(data, status, err) {
console.log(data+","+status+","+err);
}
, complete: function() { 

}
});
}

function displayWarningNoticeIndex(data) {
targetObj = jQuery("div.s_addr p");
targetObj2 = jQuery("div.s_addr p a");
if ( targetObj == undefined || data == undefined || data.length < 1) {
return false;
}

var tmp = "";
var jsonD = data;

tmp += "<a href=\"/weather/warning/status.jsp\"><span class=\"point_wrn\" style=\"margin-left:10px;\">[";
for(i = 0; i< jsonD.length; i++) {
try	{
var wrn = jsonD[i].w;
if ( wrn == undefined || jQuery.trim(wrn) == "" )
{
throw "";
}
if( i > 0 ) tmp += ",";
tmp += wrn;
} catch (e) {
continue;
}
}
tmp += "]</span></a>"; 
if(targetObj2  != undefined) {
targetObj2.remove();
}
if ( targetObj != undefined) {
targetObj.append(tmp);
}
}
function displayWarningNoticeMain(data) {
targetObj = jQuery("#warning_notice");
if ( targetObj.length  == 0) return false;
if(!data || data.length < 1) {
targetObj.html("");
return false;
}
var jsonD = data;

var tmp = "<a href=\"/weather/warning/status.jsp\" class=\"warningreg2dong\">관심지역에 <strong>[";
for(var i = 0; i < jsonD.length; i++) {
try	{
if( i > 0 ) tmp += ",";
tmp += jsonD[i].w;
} catch (e) {
continue;
}
}
tmp += "]</strong>가 발표되었습니다.</a>"; 
targetObj.html(tmp);
}
function displayWarningNoticeTimeseries(data) {
var targetObj = jQuery("#addressName");
if ( targetObj.length  == 0) return false;
if(!data || data.length < 1) {
return false;
}

var jsonD = data;
var tmp = targetObj.html().toLowerCase().replace("<br/>","").replace("<br>","");
tmp += "<a href=\"/weather/warning/status.jsp\" class=\"warningreg2dong\"><strong>[";
for(i = 0; i< jsonD.length; i++) {
try	{
if( i > 0 ) tmp += ",";
tmp += jsonD[i].w;
} catch (e) {
continue;
}
}
tmp += "]</a>"; 

targetObj.html(tmp);

}
