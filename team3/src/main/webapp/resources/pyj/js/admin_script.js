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
	
	if(guestno == null){
		alert("선택하세요");
		return false;
	}else{
		window.location='memberdeletePro?guestno='+guestno+'&pageNum='+pageNum;
	}
}


//의사 회원 선택제명
function doctorExpelCheck(){
	var count = 0;
	var doctorno = "";
	var checkOne = document.getElementsByName("checkOne");
	var pageNum = document.getElementsByName("pageNum")[0].value;

	//선택된거 체크
	for(var i = 0; i < checkOne.length; i++){
		if(checkOne[i].checked == true){
			count++;
			if(doctorno == ""){
				doctorno += checkOne[i].value;
			}else{
				doctorno += "," + checkOne[i].value;
			}
		}
	}
	
	if(doctorno == null){
		alert("선택하세요");
		return false;
	}else{
		window.location='doctorExpelPro?doctorno='+doctorno+'&pageNum='+pageNum;
	}
}


//의사 회원 선택삭제
function doctordeleteCheck(){
	var count = 0;
	var doctorno = "";
	var checkOne = document.getElementsByName("checkOne");
	var pageNum = document.getElementsByName("pageNum")[0].value;
	var pageDivision = document.getElementById("pageDivision").value;

	//선택된거 체크
	for(var i = 0; i < checkOne.length; i++){
		if(checkOne[i].checked == true){
			count++;
			if(doctorno == ""){
				doctorno += checkOne[i].value;
			}else{
				doctorno += "," + checkOne[i].value;
			}
		}
	}
	
	if(doctorno == null){
		alert("선택하세요");
		return false;
	}else{
		window.location='doctordeletePro?doctorno='+doctorno+'&pageNum='+pageNum+'&pageDivision='+pageDivision;
	}
}

//의사 회원 승인
function doctorPermissionCheck(){
	var count = 0;
	var doctorno = "";
	var checkOne = document.getElementsByName("checkOne");
	var pageNum = document.getElementsByName("pageNum")[0].value;

	//선택된거 체크
	for(var i = 0; i < checkOne.length; i++){
		if(checkOne[i].checked == true){
			count++;
			if(doctorno == ""){
				doctorno += checkOne[i].value;
			}else{
				doctorno += "," + checkOne[i].value;
			}
		}
	}
	
	if(doctorno == null){
		alert("선택하세요");
		return false;
	}else{
		window.location='doctorPermissionPro?doctorno='+doctorno+'&pageNum='+pageNum;
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
	
	if(diseaseCode == null){
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
function exerciseDeleteCheck(){
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
	
	if(exerciseName == null){
		alert("선택하세요");
		return false;
	}else{
		window.location='exerciseDeletePro?exerciseName='+exerciseName+'&pageNum='+pageNum;
	}
}

// 예방정보 선택삭제
function preventiondeleteCheck(){
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
	
	if(preventionCode == null){
		alert("선택하세요");
		return false;
	}else{
		window.location='apreventiondeletePro?preventionCode='+preventionCode+'&pageNum='+pageNum;
	}
}

// 예방입력 / 수정 체크
function preventionChk(){
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

//약정보 선택삭제
function drugdeleteCheck(){
	var count = 0;
	var drugCode = "";
	var checkOne = document.getElementsByName("checkOne");
	var pageNum = document.getElementsByName("pageNum")[0].value;
	//선택된거 체크
	for(var i = 0; i < checkOne.length; i++){
		if(checkOne[i].checked == true){
			count++;
			if(drugCode == ""){
				drugCode += checkOne[i].value;
			}else{
				drugCode += "," + checkOne[i].value;
			}
		}
	}
	
	if(drugCode == null){
		alert("선택하세요");
		return false;
	}else{
		window.location='drugdeletePro?drugCode='+drugCode+'&pageNum='+pageNum;
	}
}

//이벤트 선택삭제
function memberdeleteCheck(){
   var count = 0;
   var advertisementNo = "";
   var checkOne = document.getElementsByName("checkOne");
   var pageNum = document.getElementsByName("pageNum")[0].value;
   //선택된거 체크
   for(var i = 0; i < checkOne.length; i++){
      if(checkOne[i].checked == true){
         count++;
         if(advertisementNo == ""){
            advertisementNo += checkOne[i].value;
         }else{
            advertisementNo += "," + checkOne[i].value;
         }
      }
   }
   
   if(advertisementNo == null){
      alert("선택하세요");
      return false;
   }else{
      window.location='eventDel?advertisementNo='+guestno+'&pageNum='+pageNum;
   }
}


