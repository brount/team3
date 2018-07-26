function allCheckFunc( obj ) {
		$("[name=checkOne]").prop("checked", $(obj).prop("checked") );
}

/* 체크박스 체크시 전체선택 체크 여부 */
function oneCheckFunc( obj )
{
	var allObj = $("[name=checkAll]");
	var objName = $(obj).attr("name");

	if( $(obj).prop("checked") )
	{
		checkBoxLength = $("[name="+ objName +"]").length;
		checkedLength = $("[name="+ objName +"]:checked").length;

		if( checkBoxLength == checkedLength ) {
			allObj.prop("checked", true);
		} else {
			allObj.prop("checked", false);
		}
	}
	else
	{
		allObj.prop("checked", false);
	}
}

$(function(){
	$("[name=checkAll]").click(function(){
		allCheckFunc( this );
	});
	$("[name=checkOne]").each(function(){
		$(this).click(function(){
			oneCheckFunc( $(this) );
		});
	});
});



//일반탈퇴회원 선택삭제
function memberdeleteCheck(){
	var count = 0;
	var guestno = "";
	var checkOne = document.getElementsByName("checkOne");
	var pageNum = document.getElementsByName("pageNum")[0].value;
	//선택된거 체크
	for(var i = 0; i < checkOne.length; i++){
		if(checkOne[i].checked == true){
			count++;
			if(guestno == ""){
				guestno += checkOne[i].value;
			}else{
				guestno += "," + checkOne[i].value;
			}
		}
	}
	
	if(count == null){
		alert("선택하세요");
		return false;
	}else{
		window.location='memberdeletePro?guestno='+guestno+'&pageNum='+pageNum;
	}
}