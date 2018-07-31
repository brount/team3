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



// 일반탈퇴회원 선택삭제
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

// 질병정보 선택삭제
function diseasedeleteCheck(){
	var count = 0;
	var diseaseCode = "";
	var checkOne = document.getElementsByName("checkOne");
	var pageNum = document.getElementsByName("pageNum")[0].value;
	//선택된거 체크
	for(var i = 0; i < checkOne.length; i++){
		if(checkOne[i].checked == true){
			count++;
			if(diseaseCode == ""){
				diseaseCode += checkOne[i].value;
			}else{
				diseaseCode += "," + checkOne[i].value;
			}
		}
	}
	
	if(count == null){
		alert("선택하세요");
		return false;
	}else{
		window.location='diseasedeletePro?diseaseCode='+diseaseCode+'&pageNum='+pageNum;
	}
}

// 질병입력 / 수정 체크
function diseaseChk(){
	if(!document.diseaseForm.diseaseName.value){
		alert("질병명을 입력하세요.");
		document.diseaseForm.diseaseName.focus();
		return false;
	}else if(!document.diseaseForm.diseaseDefine.value){
		alert("질병정의를 입력하세요.");
		document.diseaseForm.diseaseDefine.focus();
		return false;
	}else if(!document.diseaseForm.diseaseSymptom.value){
		alert("증상을 입력하세요.");
		document.diseaseForm.diseaseSymptom.focus();
		return false;
	}
}

//운동정보 선택삭제
function exercisedeleteCheck(){
	var count = 0;
	var exerciseName = "";
	var checkOne = document.getElementsByName("checkOne");
	var pageNum = document.getElementsByName("pageNum")[0].value;
	//선택된거 체크
	for(var i = 0; i < checkOne.length; i++){
		if(checkOne[i].checked == true){
			count++;
			if(exerciseName == ""){
				exerciseName += checkOne[i].value;
			}else{
				exerciseName += "," + checkOne[i].value;
			}
		}
	}
	
	if(count == null){
		alert("선택하세요");
		return false;
	}else{
		window.location='exercisedeletePro?exerciseName='+exerciseName+'&pageNum='+pageNum;
	}
}

// 운동입력 / 수정 체크
function exerciseChk(){
	if(!document.exerciseForm.exerciseName.value){
		alert("운동명을 입력하세요.");
		document.exerciseForm.exerciseName.focus();
		return false;
	}else if(!document.exerciseForm.exerciseMethod.value){
		alert("운동방법을 입력하세요.");
		document.exerciseForm.exerciseMethod.focus();
		return false;
	}
}

// 예방정보 선택삭제
function exercisedeleteCheck(){
	var count = 0;
	var preventionCode = "";
	var checkOne = document.getElementsByName("checkOne");
	var pageNum = document.getElementsByName("pageNum")[0].value;
	//선택된거 체크
	for(var i = 0; i < checkOne.length; i++){
		if(checkOne[i].checked == true){
			count++;
			if(preventionCode == ""){
				preventionCode += checkOne[i].value;
			}else{
				preventionCode += "," + checkOne[i].value;
			}
		}
	}
	
	if(count == null){
		alert("선택하세요");
		return false;
	}else{
		window.location='apreventiondeletePro?preventionCode='+preventionCode+'&pageNum='+pageNum;
	}
}

// 예방입력 / 수정 체크
function exerciseChk(){
	if(!document.diseaseForm.diseaseName.value){
		alert("질병명을 입력하세요.");
		document.diseaseForm.diseaseName.focus();
		return false;
	}else if(!document.diseaseForm.diseaseDefine.value){
		alert("질병정의를 입력하세요.");
		document.diseaseForm.diseaseDefine.focus();
		return false;
	}else if(!document.diseaseForm.diseaseSymptom.value){
		alert("증상을 입력하세요.");
		document.diseaseForm.diseaseSymptom.focus();
		return false;
	}
}