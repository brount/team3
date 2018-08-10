
var msg_id = "아이디를 입력하세요";
var msg_pwd = "비밀번호 입력하세요";
var msg_repwd = "비밀번호 입력하세요";
var msg_pwdChk = "비밀번호가 다릅니다";
var msg_name = "이름 입력하세요";
var msg_birth = "주민번호 입력안하냐";
var msg_email = "이메일  입력하세요";
var msg_emailChk = "이메일 형식에 맞지 않습니다";
var msg_ConfirmId = "중복확인 하세요";
var msg_hp = "휴대전화 번호 입력하세요";
var msg_address1 = "우편번호를 입력하세요";
var msg_address2 = "주소 입력하세요";
var msg_agree = "동의하셔야 가입가능합니다";
var msg_hospital = "병원을 입력해주세요";
var msg_licence = "면허증을 등록해주세요";
//*****************************************
var msg_checkup_kind = "의뢰과목을 체크해주세요";
var msg_checkup_name = "진단명을 적어주세요";
var msg_checkup_opinion = "병력 및 소견 적어주세요";
var msg_checkup_contents = "의뢰 내용을 적어주세요";
//*****************************************
var msg_height = "신장을 입력해주세요";
var msg_weight = "체중을 입력해주세요";
var msg_fatness = "비만도를 입력해주세요";
var msg_visionl = "시력(좌)을 입력해주세요";
var msg_visionr = "시력(우)을 입력해주세요";
var msg_hearingl = "청력(좌)을 입력해주세요";
var msg_hearingr = "청력(우)을 입력해주세요";
var msg_bloodpremax = "혈압(최고)을 입력해주세요";
var msg_bloodpremin = "혈압(최저)을 입력해주세요";

var msg_urineph = "요ph를 입력해주세요";

var msg_hemoglobin = "혈색소를 입력해주세요";
var msg_bloodglucose = "혈당을 입력해주세요";
var msg_totalcholesterol = "총콜레스테롤을 입력해주세요";
var msg_ast = "AST(SGOT)를 입력해주세요";
var msg_alt = "ALT(SGPT)를 입력해주세요";
var msg_gammagtp = "감마지티피를 입력해주세요";
var msg_hepatitisscr = "간염검사를 입력해주세요";
var msg_symptom = "증상을 입력해주세요";
var msg_drugname1 = "처방의약품 명칭을 입력해주세요";
var msg_drugdosage1 = "1회 투여량을 입력해주세요";
var msg_drugrepeat1 = "1회 투여횟수를 입력해주세요";
var msg_dosagedate1 = "총투여일수를 입력해주세요";
var msg_dosageusage1 = "용법을 입력해주세요";

//*****************************************
//*****************************************
//*****************************************

//*****************************************
var InsertError = "회원가입에 실패했거든? \n 다시 해봐"
var updateError = "회원정보 수정에 실패했거든? \n 다시 해봐"
var deleteError = "회원탈퇴에 실패했거든? \n 다시 해봐 "
var passwdError = "비밀번호가 일치하지않아 \n 다시 해봐"

//*****************************************
//회원가입
//*****************************************

function inputCheck() {
	// 아이디
	if (!document.reg_form.id.value) {
		alert(msg_id);
		document.reg_form.id.focus();
		return false;

	} else if (document.reg_form.hiddenId.value == 0) {
		alert(msg_ConfirmId);
		document.reg_form.dupchk.focus();
		return false;

		// 비밀번호
	} else if (!document.reg_form.password.value) {
		alert(msg_pwd);
		document.reg_form.pwd.focus();
		return false;
		// 비밀번호 재확인
	} else if (!document.reg_form.confirmPassword.value) {
		alert(msg_repwd);
		document.reg_form.repwd.focus();
		return false;

		// 비밀번호 일치여부
	} else if (document.reg_form.password.value != document.reg_form.confirmPassword.value) {
		alert(msg_pwdChk);
		document.reg_form.repwd.focus();
		return false;
		// 이름
	} else if (!document.reg_form.name.value) {
		alert(msg_name);
		document.reg_form.name.focus();
		return false;
		// 폰
	} else if (!document.reg_form.phone.value) {
		alert(msg_hp);
		document.reg_form.phone.focus();
		return false;

		// 이메일
	} else if (!document.reg_form.email.value) {
		alert(msg_email);
		document.reg_form.email.focus();
		return false;

		// 근무병원 찾기
	} else if (!document.reg_form.hospital.value) {
		alert(msg_hospital);
		document.reg_form.hospital.focus();
		return false;

		// 의사 면허증
	} else if (!document.reg_form.file.value) {
		alert(msg_licence);
		document.reg_form.file.focus();
		return false;
	}
}
//**********************************************
//검사의뢰
//**********************************************
function checkupRequestCheck() {
	// 체크
	if(!!document.checkupRequest.checkup_kind.value){
		alert(msg_checkup_kind);
		return false;
		
		// 진단명
	} else if (!document.checkupRequest.checkup_name.value) {
		alert(msg_checkup_name);
		document.checkupRequest.checkup_name.focus();
		return false;
		
		// 병력 및 소견
	}else if (!document.checkupRequest.checkup_opinion.value) {
		alert(msg_checkup_opinion);
		document.checkupRequest.checkup_opinion.focus();
		return false;
		
		// 의뢰 내용
	}else if (!document.checkupRequest.checkup_contents.value) {
		alert(msg_checkup_contents);
		document.checkupRequest.checkup_contents.focus();
		return false;
	}
}
//**********************************************
//건강검진
//**********************************************

function checkupAddCheck(kind) {
	if(kind==1){
		// 신장
		if(!document.checkupAdd.height.value){
			alert(msg_height);
			document.checkupAdd.height.focus();
			return false;
			
			// 체중
		} if(!document.checkupAdd.weight.value){
			alert(msg_weight);
			document.checkupAdd.weight.focus();
			return false;
			
			// 비만도
		} if(!document.checkupAdd.fatness.value){
			alert(msg_fatness);
			document.checkupAdd.fatness.focus();
			return false;
			
			// 시력(좌)
		} if(!document.checkupAdd.visionl.value){
			alert(msg_visionl);
			document.checkupAdd.visionl.focus();
			return false;
			
			// 시력(우)
		} if(!document.checkupAdd.visionr.value){
			alert(msg_visionr);
			document.checkupAdd.visionr.focus();
			return false;
			
			// 청력(좌)
		} if(!document.checkupAdd.hearingl.value){
			alert(msg_hearingl);
			document.checkupAdd.hearingl.focus();
			return false;
			
			// 청력(우)
		} if(!document.checkupAdd.hearingr.value){
			alert(msg_hearingr);
			document.checkupAdd.hearingr.focus();
			return false;
			
			// 혈압(최고)
		} if(!document.checkupAdd.bloodpremax.value){
			alert(msg_bloodpremax);
			document.checkupAdd.bloodpremax.focus();
			return false;
			
			// 혈압(최저)
		} if(!document.checkupAdd.bloodpremin.value){
			alert(msg_bloodpremin);
			document.checkupAdd.bloodpremin.focus();
			return false;
			alert("요검사시작");
			// 요ph
		}
	}
	if(kind==2){
			// 요ph
		 if(!document.checkupAdd.urineph.value){
				alert(msg_urineph);
				document.checkupAdd.urineph.focus();
				return false;
			
				
			} 
	}if(kind==3){
		// 혈색소
		if(!document.checkupAdd.hemoglobin.value){
			alert(msg_hemoglobin);
			document.checkupAdd.hemoglobin.focus();
			return false;
		
			// 혈당
		} if(!document.checkupAdd.bloodglucose.value){
			alert(msg_bloodglucose);
			document.checkupAdd.bloodglucose.focus();
			return false;
		
			// 총 콜레스테롤
		} if(!document.checkupAdd.totalcholesterol.value){
			alert(msg_totalcholesterol);
			document.checkupAdd.totalcholesterol.focus();
			return false;
		
			// AST(SGOT)
		} if(!document.checkupAdd.ast.value){
			alert(msg_ast);
			document.checkupAdd.ast.focus();
			return false;
		
			// ALT(SGPT)
		} if(!document.checkupAdd.alt.value){
			alert(msg_alt);
			document.checkupAdd.alt.focus();
			return false;
		
			// 감마지티피
		} if(!document.checkupAdd.gammagtp.value){
			alert(msg_gammagtp);
			document.checkupAdd.gammagtp.focus();
			return false;
		
			// 간염검사
		} if(!document.checkupAdd.hepatitisscr.value){
			alert(msg_hepatitisscr);
			document.checkupAdd.hepatitisscr.focus();
			return false;
		
			
		}
	}
	
}
//**********************************************
//처방전
//**********************************************

function examinationAddCheck() {
	// 증상
	if(!document.examinationAdd.symptom.value){
		alert(msg_symptom);
		document.examinationAdd.symptom.focus();
		return false;
		
		// 처방의약품명칭
	}/*else if(!document.examinationAdd.drugname1.value){
		alert(msg_drugname1);
		document.examinationAdd.drugname1.focus();
		return false;
	
		// 1회 투여량
	}else if(!document.examinationAdd.drugdosage1.value){
		alert(msg_drugdosage1);
		document.examinationAdd.drugdosage1.focus();
		return false;
	
		// 1회 투여횟수
	}else if(!document.examinationAdd.drugrepeat1.value){
		alert(msg_drugrepeat1);
		document.examinationAdd.drugrepeat1.focus();
		return false;
	
		// 총 투여일수
	}else if(!document.examinationAdd.dosagedate1.value){
		alert(msg_dosagedate1);
		document.examinationAdd.dosagedate1.focus();
		return false;
	
		// 용법
	}else if(!document.examinationAdd.dosageusage1.value){
		alert(msg_dosageusage1);
		document.examinationAdd.dosageusage1.focus();
		return false;
	
	}*/
	var drugname =  document.getElementsByName("drugname1");
	var drugdosage =  document.getElementsByName("drugdosage1");
	var drugrepeat =  document.getElementsByName("drugrepeat1");
	var dosagedate =  document.getElementsByName("dosagedate1");
	var dosageusage =  document.getElementsByName("dosageusage1");
	for(var i=0; i<drugname.length ;i++){
		if(!drugname[i].value){
			alert(msg_drugname1);
			return false;
		}else if(!drugdosage[i].value){
			alert(msg_drugdosage1);
			return false;
		}else if(!drugrepeat[i].value){
			alert(msg_drugrepeat1);
			return false;
		}else if(!dosagedate[i].value){
			alert(msg_dosagedate1);
			return false;
		}else if(!dosageusage[i].value){
			alert(msg_dosageusage1);
			return false;
		}
	}
}



function selectEmailChk() {
	if (document.reg_form.email3.value == 0) {
		document.reg_form.email2.value = "";
		document.reg_form.email2.focus();

		// 이메일 직접입력이 아닌경우 select box값 (email3)을 email2의 값으로 설정
	} else {
		document.reg_form.email2.value = document.reg_form.email3.value;
	}
}
// 중복확인 버튼 클릭시 서브창open
function doctorconfirmId() {
	// id값 미입력시
	if (!document.reg_form.id.value) {
		alert(msg_id);
		document.reg_form.id.focus();
		return false;
	}
	var url = "doctorconfirmId?id=" + document.reg_form.id.value;
	window.open(url, "confirm", "menubar=no, width=300, height=200");
}

// 중복 확인 버튼 클릭시 id로 포커스
function confirmIdFocus() {
	document.confirmform.id.focus();
}

function confirmIdCheck() {
	if (!document.confirmform.id.value) {
		alert(msg_id);
		document.confirmform.id.focus();
		return false;
	}
}




// opener : window객체의 open()메소드로 열린 새창(=중복확인)에서, 열어준 부모창(=회원가입)에 접근할때 사용

// self.close(); 메세지 없이 현재 창을 닫을 때 사용
// hiddenId : 중복확인버튼 클릭 여부 체크
function setId(id) {
	opener.document.reg_form.id.value = id;
	opener.document.reg_form.hiddenId.value = "1";
	self.close();
}

function loginCheck() {
	if (!document.loginForm.id.value) {
		alert(msg_id);
		document.loginForm.id.focus();
		return false;

		// 비밀번호
	} else if (!document.loginForm.pwd.value) {
		alert(msg_pwd);
		document.loginForm.pwd.focus();
		return false;
		// 비밀번호 재확인
	}
}

function setHos(a, b) {
	opener.document.reg_form.hospitalno.value = a;
	opener.document.reg_form.hospital.value = b;
	self.close();
}
