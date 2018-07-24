var msg_id = "아이디를 입력하세요~!";
var msg_pwd = "비밀번호를 입력하세요~!";
var msg_repwd = "비밀번호를 확인하세요~!";
var msg_pwdChk = "비밀번호가 불일치에요~!";
var msg_name = "이름을 입력하세요~!";
var msg_brith = "주민번호를 입력하세요~!";
var msg_email = "이메일을 입력하세요~!";
var msg_emailChk = "이메일형식에 일치하지않아요~!";
var msg_address = "주소를 입력하세요~!";
var msg_confirmId = "중복확인 하세요~!";
var msg_hp = "연락처 입력하세요~!";
// 회원가입 페이지
function inputFocus() { // 아이디로 포커스
	document.inputform.id.focus();
}

function inputCheck() {
	if (!document.inputform.id.value) {
		alert(msg_id);
		document.inputform.id.focus();
		return false;
	} else if (!document.inputform.password.value) {
		alert(msg_pwd);
		document.inputform.password.focus();
		return false;
	} else if (!document.inputform.confirmPassword.value) {
		alert(msg_repwd);
		document.inputform.confirmPassword.focus();
		return false;
	} else if (document.inputform.password.value != document.inputform.confirmPassword.value) {
		alert(msg_pwdChk);
		document.inputform.confirmPassword.focus();
		return false;
	} else if (!document.inputform.first_name.value) {
		alert(msg_name);
		document.inputform.first_name.focus();
		return false;
	} else if (!document.inputform.jumin1.value) {
		alert(msg_brith);
		document.inputform.jumin1.focus();
		return false;
	} else if (!document.inputform.jumin2.value) {
		alert(msg_brith);
		document.inputform.jumin2.focus();
		return false;
	} else if (!document.inputform.phone1.value) {
		alert(msg_hp);
		document.inputform.phone1.focus();
		return false;
	} else if (!document.inputform.phone2.value) {
		alert(msg_hp);
		document.inputform.phone2.focus();
		return false;
	} else if (!document.inputform.phone3.value) {
		alert(msg_hp);
		document.inputform.phone3.focus();
		return false;
	} else if (!document.inputform.email1.value) {
		alert(msg_email);
		document.inputform.email1.focus();
		return false;
		// email2값이 null일 때 && email3의 값이 직접입력일때
	} else if (!document.inputform.email2.value
			&& document.inputform.email3.value == 0) {
		alert(msg_email);
		document.inputform.email2.focus();
		return false;
	} else if (!document.inputform.addcode.value) {
		alert(msg_address);
		document.inputform.addcode.focus();
		return false;

		// 중복확인 버튼을 클릭하지 않은경우
		// 체크전제조건 : inputform.jsp의 form안 맨위에 <input type="hidden"
		// name="hiddenId" value="0">
		// hiddenId : 아이디 중복확인여부 체크(0이면 중복확인 클릭x, 1이면 클릭함

	} else if (document.inputform.hiddenEmail.value == 0) {
		alert("이메일 인증이 필요합니다~!");

		return false;

	} else if (document.inputform.hiddenId.value == 0) {
		alert(msg_confirmId);
		document.inputform.dupChk.focus();
		return false;

	}

}

function SelectEmailChk() {
	if (document.inputform.email3.value == 0) { // 직접입력
		document.inputform.email2.value = "";
		document.inputform.email2.focus();

		// 이메일 직접입력이 아닌 경우 select box의 값(email3)을 email2의 값으로 설정
	} else {
		document.inputform.email2.value = document.inputform.email3.value;
	}
}

function nextJumin1() {
	if (document.inputform.jumin1.value.length >= 6) {
		document.inputform.jumin2.focus();
	}
}

function nextJumin2() {
	if (document.inputform.jumin2.value.length >= 7) {
		document.inputform.hp1.focus();
	}
}

function nextHp1() {
	if (document.inputform.phone1.value.length >= 3) {
		document.inputform.phone2.focus();
	}
}

function nextHp2() {
	if (document.inputform.phone2.value.length >= 4) {
		document.inputform.phone3.focus();
	}
}

function nextHp3() {
	if (document.inputform.phone3.value.length >= 4) {
		document.inputform.email1.focus();
	}
}

// 이메일인증 버튼 클릭시
function emailchk() {
	// 이메일 입력값이 없을 때

	if (!document.inputform.email1.value) {
		alert(msg_email);
		document.inputform.email1.focus();
		return false;

	} else if (!document.inputform.email2.value) {
		alert(msg_email);
		document.inputform.email2.focus();
		return false;
	}

	var url = "findId?email=" + document.inputform.email1.value + "@"
			+ document.inputform.email2.value;

	window.open(url, "menubar=no,width=300,height=200");

}

function key() {
	if (!document.findform.key.value) {
		alert("인증번호를 입력하세요.");
		document.findform.key.focus();
		return false;
	}
	var key = document.findform.key.value;
	var url = "emailok?key=" + key;

	window.open(url, "emailok", "menubar=no,width=300,height=200");

}
function keycnt() {

	opener.document.inputform.hiddenEmail.value = "1";
	self.close();

}

// 중복확인 버튼 클릭시
function confirmId() {
	// 중복확인 할 아이디가 입력되지않았을때
	if (!document.inputform.id.value) {
		alert(msg_id);
		document.inputform.id.focus();
		return false;
	}
	/*
	 * window.open("파일명","윈도우명", "창속성") url = "주소?속성=" +속성값 ==> get방식
	 * 
	 */
	var url = "confirmId?id=" + document.inputform.id.value; // 보통 JSP에서 .do를
																// 쓰는데 조건을 타고
																// 주기위해 자바스크립트에서
																// 썼다.

	window.open(url, "confirm", "menubar=no,width=300,height=200");
}
// 중복확인 클릭 시 id로 포커스
function comfirmIdFocus() {
	document.confirmForm.id.focus();
}
// 중복확인 창에서 id입력여부
function confirmCheck() {
	if (!document.inputform.id.value) {
		alert(msg_id);
		document.inputform.id.focus();
		return false;
	}
}
// opener: window 객체의 open()메소드로 열린 새창(=중복확인창)에서
// 열어준 부모창(=회원가입창)접근 할 때

// self.close() : 메시지없이 현재창을 닫을 때 사용
function setId(id) {
	opener.document.inputform.id.value = id;
	// opener로 부모창(=회원가입창->중복확인 창을 열리게 한 객체)에 접근
	// hiddenId : 중복확인 버튼클릭여부체크(0 : 클릭안함, 1 : 클릭함)
	opener.document.inputform.hiddenId.value = "1";// hiddenId 1 을 주지않으면
													// 중복확인경고창이 뜨게된다.
	self.close();// self(=중복확인팝업창)

}
