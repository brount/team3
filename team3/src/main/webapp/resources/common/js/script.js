

var msg_id = "아이디를 입력하세요";
var msg_pwd = "비밀번호 입력하세요";
var msg_repwd = "비밀번호 입력하세요";
var msg_pwdChk = "비밀번호가 다릅니다";
var msg_name = "이름 입력하세요";
var msg_birth = "주민번호 입력안하냐";
var msg_email = "이메일  입력하세요";
var msg_emailChk = "이메일 형식에 맞지 않습니다";
var msg_ConfirmId = "중복확인 하세요";
var msg_hp = "핸드폰 번호 입력하세요";
var msg_address1 = "우편번호를 입력하세요";
var msg_address2 = "주소 입력하세요";
var msg_agree = "동의하셔야 가입가능합니다";

var InsertError = "회원가입에 실패했거든? \n 다시 해봐"
var updateError = "회원정보 수정에 실패했거든? \n 다시 해봐"
var deleteError = "회원탈퇴에 실패했거든? \n 다시 해봐 "
var passwdError = "비밀번호가 일치하지않아 \n 다시 해봐"
	

// 에러메세지
function errorAlert(errorMsg){
	alert(errorMsg);
	window.history.back();
}
// 메인페이지
function mainFocus(){
	document.mainForm.id.focus();
}


function mainCheck(){
	if(!document.mainForm.id.value){
		alert(msg_id);
		document.mainForm.id.focus();	
		return false;
	}else if(!document.mainForm.pwd.value){
		alert(msg_pwd);
		document.mainForm.pwd.focus();	
		return false;
	}
}


function inputFocus(){
	document.reg_form.id.focus();
}

function inputCheck(){
	// 아이디
	if(!document.reg_form.id.value){
		alert(msg_id);
		document.reg_form.id.focus();
		return false;
		
	}else if(document.reg_form.hiddenId.value==0){
			alert(msg_ConfirmId);
			document.reg_form.dupchk.focus();
			return false;
	
	// 비밀번호
	}else if(!document.reg_form.pwd.value){
		alert(msg_pwd);
		document.reg_form.pwd.focus();
		return false;
	// 비밀번호 재확인
	}else if(!document.reg_form.repwd.value){
		alert(msg_repwd);
		document.reg_form.repwd.focus();
		return false;
	
	// 비밀번호 일치여부
	}else if(document.reg_form.pwd.value!=document.reg_form.repwd.value){
		alert(msg_pwdChk);
		document.reg_form.repwd.focus();
		return false;
	// 이름
	}else if(!document.reg_form.name.value){
		alert(msg_name);
		document.reg_form.name.focus();
		return false;
	//폰1
	}else if(!document.reg_form.phone1.value){
		alert(msg_hp);
		document.reg_form.phone1.focus();
		return false;
		//폰2
	}else if(!document.reg_form.phone2.value){
		alert(msg_hp);
		document.reg_form.phone2.focus();
		return false;
		//폰3
	}else if(!document.reg_form.phone3.value){
		alert(msg_hp);
		document.reg_form.phone3.focus();
		return false;
		// address1
	}else if(!document.reg_form.address1.value){
		alert(msg_address1);
		document.reg_form.address1.focus();
		return false;
		// address2
	}else if(!document.reg_form.address2.value){
		alert(msg_address2);
		document.reg_form.address2.focus();
		return false;
		// address3
	}else if(!document.reg_form.address3.value){
		alert(msg_address);
		document.reg_form.address3.focus();
		return false;
		// 이메일
	}else if(!document.reg_form.email1.value){
		alert(msg_email);
		document.reg_form.email1.focus();
		return false;
	
		// 이메일2 값 null
	}else if(!document.reg_form.email2.value && document.reg_form.email3.value =="0"){
		alert(msg_email);
		document.reg_form.email2.focus();
		return false;
		
	//약관 동의
	}else if(document.reg_form.yes.value == "0"){
		alert(msg_agree);
		document.reg_form.yes.focus();
		return false;
	}
	
}
//약관

function Ok(){
	document.reg_form.yes.value = 1;
}

function selectEmailChk(){
	if(document.reg_form.email3.value ==0){
		document.reg_form.email2.value ="";
		document.reg_form.email2.focus();
		
		//이메일 직접입력이 아닌경우 select box값 (email3)을 email2의 값으로 설정
	}else{
		document.reg_form.email2.value = document.reg_form.email3.value;
	}
}
//중복확인 버튼 클릭시 서브창open
function doctorconfirmId(){
	//id값 미입력시
	if(!document.reg_form.id.value){
		alert(msg_id);
		document.reg_form.id.focus();
		return false;
	}
	
	var url="doctorconfirmId?id="+document.reg_form.id.value;
	window.open(url, "confirm", "menubar=no, width=300, height=200");
}

//중복 확인 버튼 클릭시 id로 포커스
function confirmIdFocus(){
	document.confirmform.id.focus();
}

function confirmIdCheck(){
	if(!document.confirmform.id.value){
		alert(msg_id);
		document.confirmform.id.focus();
		return false;
	}
}

// opener : window객체의 open()메소드로 열린 새창(=중복확인)에서, 열어준 부모창(=회원가입)에 접근할때 사용


// self.close(); 메세지 없이 현재 창을 닫을 때 사용
// hiddenId : 중복확인버튼 클릭 여부 체크
function setId(id){	
	opener.document.reg_form.id.value=id;
	opener.document.reg_form.hiddenId.value="1";
	self.close();
}

function loginCheck(){
	if(!document.loginForm.id.value){
		alert(msg_id);
		document.loginForm.id.focus();
		return false;
		
	// 비밀번호
	}else if(!document.loginForm.pwd.value){
		alert(msg_pwd);
		document.loginForm.pwd.focus();
		return false;
	// 비밀번호 재확인
	}
}

function setHos(a,b){	
	opener.document.reg_form.hospitalno.value=a;
	opener.document.reg_form.hospital.value=b;
	self.close();
}

/*

function nextJumin1(){
	if(document.reg_form.jumin1.value.length>=6){
	document.reg_form.jumin2.focus();
	}
}

function nextJumin2(){
	if(document.reg_form.jumin2.value.length>=7){
		document.reg_form.hp1.focus();
	}
}

function nextHp1(){
	if(document.reg_form.hp1.value.length>=3){
		document.reg_form.hp2.focus();
	}
}

function nextHp2(){
	if(document.reg_form.hp2.value.length>=4){
		document.reg_form.hp3.focus();
	}
}

function nextHp3(){
	if(document.reg_form.hp3.value.length>=4){
		document.reg_form.email1.focus();
	}
}

function passwdFocus(){
	document.passwdform.pwd.focus();
}

function passwdCheck(){
	if(!document.passwdform.pwd.value){
		alert(msg_pwd);
		document.passwdform.pwd.focus();
		return false;
	}
}

function modifyFocus(){
	document.modifiyform.pwd.focus();
}

function modifyCheck(){
	//비밀번호 입력값이 없을 때
	
	//비밀번호 확인 값이 없을때
	
	//비밀번호 불일치 시
	
	//이메일 입력값이 없으 ㄹ때
	//1,2
}



*/