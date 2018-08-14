function allCheckFunc( obj ) {
		$("[name=checkOne]").prop("checked", $(obj).prop("checked") );
		$("[name=checkTwo]").prop("checked", $(obj).prop("checked") );
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
	
	// 의사회원 승인처리 체크박스
	$("[name=checkOne]").click(function(){
	    if($("[name=checkOne]").is(":checked")){
	    	$(this).next().prop("checked",true);
	    }
	    else{
	    	$(this).next().prop("checked",false);
	    }
	});
	$("[name=checkOne]").click(function(){
	    if($("[name=checkTwo]").is(":checked")){
	    	$(this).next().prop("checked",true);
	    }
	    else{
	    	$(this).next().prop("checked",false);
	    }
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
			if(guestno == " "){
				guestno += checkOne[i].value;
			}else{
				guestno += "," + checkOne[i].value;
			}
		}
	}
	
	if(guestno == ""){
		alert("선택하세요");
		return false;
	}else{
		window.location='memberdeletePro?guestno='+guestno+'&pageNum='+pageNum;
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
	
	if(doctorno == ""){
		alert("선택하세요");
		return false;
	}else{
		window.location='doctordeletePro?doctorno='+doctorno+'&pageNum='+pageNum+'&pageDivision='+pageDivision;
	}
}

//의사 회원 승인
function doctorPermissionCheck(){
	var count1 = 0;
	var count2 = 0;
	var doctorno = "";
	var hospitalno = "";
	var checkOne = document.getElementsByName("checkOne");
	var checkTwo = document.getElementsByName("checkTwo");
	var pageNum = document.getElementsByName("pageNum")[0].value;

	//선택된거 체크
	for(var i = 0; i < checkOne.length; i++){
		if(checkOne[i].checked == true){
			count1++;
			if(doctorno == ""){
				doctorno += checkOne[i].value;
			}else{
				doctorno += "," + checkOne[i].value;
			}
		}
	}
	//선택된거 체크
	for(var i = 0; i < checkTwo.length; i++){
		if(checkTwo[i].checked == true){
			count2++;
			if(hospitalno == ""){
				hospitalno += checkTwo[i].value;
			}else{
				hospitalno += "," + checkTwo[i].value;
			}
		}
	}
	
	if(doctorno == ""){
		alert("선택하세요");
		return false;
	}else{
		window.location='doctorPermissionPro?doctorno='+doctorno+'&hospitalno='+hospitalno+'&pageNum='+pageNum;
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
	
	if(diseaseCode == ""){
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
	}
	
	else if(!document.diseaseForm.diseaseDefine.value){
		alert("질병정의를 입력하세요.");
		document.diseaseForm.diseaseDefine.focus();
		return false;
	}
	
	else if(!document.diseaseForm.diseaseCause.value){
		alert("원인을 입력하세요.");
		document.diseaseForm.diseaseCause.focus();
		return false;
	}
	
	else if(!document.diseaseForm.diseaseSymptom.value){
		alert("증상을 입력하세요.");
		document.diseaseForm.diseaseSymptom.focus();
		return false;
	}
	
	else if(!document.diseaseForm.diseaseDiagnosis.value){
		alert("자가진단을 입력하세요.");
		document.diseaseForm.diseaseDiagnosis.focus();
		return false;
	}
	
	else if(!document.diseaseForm.diseaseCure.value){
		alert("치료법을 입력하세요.");
		document.diseaseForm.diseaseCure.focus();
		return false;
	}
	
	else if(!document.diseaseForm.complications.value){
		alert("경과/합병증을 입력하세요.");
		document.diseaseForm.complications.focus();
		return false;
	}
	
	else if(!document.diseaseForm.prevention.value){
		alert("예방법을 입력하세요.");
		document.diseaseForm.prevention.focus();
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
	
	if(exerciseName == ""){
		alert("선택하세요");
		return false;
	}else{
		window.location='exerciseDeletePro?exerciseName='+exerciseName+'&pageNum='+pageNum;
	}
}


//운동입력 / 수정 체크
function exerciseChk(){
	if(!document.exerciseForm.exerciseName.value){
		alert("운동명을 입력하세요.");
		document.exerciseForm.exerciseName.focus();
		return false;
	}
	
	else if(!document.exerciseForm.exerciseDefine.value){
		alert("운동정의를 입력하세요.");
		document.exerciseForm.exerciseDefine.focus();
		return false;
	}
	
	else if(!document.exerciseForm.exerciseMethod.value){
		alert("운동방법을 입력하세요.");
		document.exerciseForm.exerciseMethod.focus();
		return false;
	}
	
	else if(!document.exerciseForm.exercisePart.value){
		alert("운동부위을 입력하세요.");
		document.exerciseForm.exercisePart.focus();
		return false;
	}
	
	else if(!document.exerciseForm.exerciseCaution.value){
		alert("주의할점을 입력하세요.");
		document.exerciseForm.exerciseCaution.focus();
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
	
	if(drugCode == ""){
		alert("선택하세요");
		return false;
	}else{
		window.location='drugdeletePro?drugCode='+drugCode+'&pageNum='+pageNum;
	}
}

//이벤트 선택삭제
function eventDelCheck(){
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
   
   if(advertisementNo == ""){
      alert("선택하세요");
      return false;
   }else{
      window.location='eventDel?advertisementNo='+advertisementNo+'&pageNum='+pageNum;
   }
}


// 신고 게시판 삭제
function adminReportDeleteChek(){
	var count = 0;
	var boardno = "";
	var checkOne = document.getElementsByName("checkOne");
	var pageNum = document.getElementsByName("pageNum")[0].value;
	//선택된거 체크
	for(var i = 0; i < checkOne.length; i++){
		if(checkOne[i].checked == true){
			count++;
			if(boardno == ""){
				boardno += checkOne[i].value;
			}else{
				boardno += "," + checkOne[i].value;
			}
		}
	}
	if (boardno == "") {
		alert("선택하세요");
		return false;
	} else {
		window.location='adminReportDeleteProChek?boardno='+boardno+'&pageNum='+pageNum;
	}
}


//검색 체크
function searchChk(){
	
	var search = document.searchForm.search.value;
	
	if(search == ""){
		alert("검색어를 입력하세요.");
		document.searchForm.search.focus();
		return false;
	}
}

//제제 사유 체크
function sanctionChk(){
	
	var doctorappro = document.doctormanageForm.doctorappro.value;
	var sanctions = document.doctormanageForm.sanctions.value;
	
	if(doctorappro != null){
		if(sanctions == null){
			alert("제제 사유를 작성해주세요.");
			return false;
		}	
	}
}

// 병원 정보 수정 체크
function hosModifyChk(){
	var hospitalname = document.hosModifyForm.hospitalname.value;
	var hospitaladdr = document.hosModifyForm.hospitaladdr.value;
	var hospitalphone = document.hosModifyForm.hospitalphone.value;
	var hospitalinstruction = document.hosModifyForm.hospitalinstruction.value;
	
	if(hospitalname == ""){
		alert("수정할 내용을 입력하세요.");
		document.hosModifyForm.hospitalname.focus();
		return false;
	}else if(hospitaladdr == ""){
		alert("수정할 내용을 입력하세요.");
		document.hosModifyForm.hospitaladdr.focus();
		return false;
	}else if(hospitalphone == ""){
		alert("수정할 내용을 입력하세요.");
		document.hosModifyForm.hospitalphone.focus();
		return false;
	}else if(hospitalinstruction == ""){
		alert("수정할 내용을 입력하세요.");
		document.hosModifyForm.hospitalinstruction.focus();
		return false;
	}
}


//약 수정 체크
function drugModifyChk(){
	
	var drugStorageMethod = document.drugModifyForm.drugStorageMethod.value;
	var drugEfficacy = document.drugModifyForm.drugEfficacy.value;
	var drugUsedCapacity = document.drugModifyForm.drugUsedCapacity.value;
	var drugPrecautions = document.drugModifyForm.drugPrecautions.value;
	
	if(drugStorageMethod == ""){
		alert("저장방법을 작성해주세요.");
		document.drugModifyForm.drugStorageMethod.focus();
		return false;
	}else if(drugEfficacy == ""){
		alert("효능 효과를 작성해주세요.");
		document.drugModifyForm.drugEfficacy.focus();
		return false;
	}else if(drugUsedCapacity == ""){
		alert("용법용량을 작성해주세요.");
		document.drugModifyForm.drugUsedCapacity.focus();
		return false;
	}else if(drugPrecautions == ""){
		alert("주의사항을 작성해주세요.");
		document.drugModifyForm.drugPrecautions.focus();
		return false;
	}	
}

// 이벤트 입력 체크
function eventAddChk(){
	
}

// 신고게시판 글작성 체크
function reportChk(){
	var boardtitle = document.adminReportForm.boardtitle.value;
	var boardcontent = document.adminReportForm.boardcontent.value;
	
	if(boardtitle == ""){
		alert("글 제목을 입력하세요.");
		document.adminReportForm.boardtitle.focus();
		return false;
	}
	else if(boardcontent == ""){
		alert("글 내용을 입력하세요.");
		document.adminReportForm.boardcontent.focus();
		return false;
	}
}