function sendit() {
	let joinForm = document.joinForm;
	let idTag = joinForm.userid;
	let resultIdTag = document.getElementById("ResultId");
	if (idTag.value == "") {
		alert("아이디를 입력하세요.");
		idTag.focus();
		return false;
	}
	if (idTag.value.length < 5 || idTag.value.length > 12) {
		alert("아이디는 5자 이상 12자 이하로 입력해주세요.");
		idTag.focus();
		return false;
	}
	if (resultIdTag.innerHTML == "") {
		alert("아이디 중복검사를 진행해주세요.");
		idTag.focus();
		return false;
	}
	if (resultIdTag.innerHTML != "사용할 수 있는 아이디입니다.") {
		alert("중복된 아이디가 있습니다.");
		idTag.focus();
		return false;
	}
	let nicknameTag = joinForm.usernickname;
	let resultNicknaemTag = document.getElementById("ResultNickname");
	if (nicknameTag.value == "") {
		alert("닉네임을 입력해주세요.");
		nicknameTag.focus();
		return false;
	}
	if (nicknameTag.value.length < 2 || nicknameTag.value.length > 10) {
		alert("닉네임은 2자 이상 6자 이하로 입력해주세요.");
		nicknameTag.focus();
		return false;
	}
	if (resultNicknaemTag.innerHTML == "") {
		alert("닉네임 중복검사를 진행해주세요.");
		nicknameTag.focus();
		return false;
	}
	if (resultNicknaemTag.innerHTML != "사용할 수 있는 닉네임입니다.") {
		alert("중복된 닉네임이 있습니다.");
		nicknameTag.focus();
		return false;
	}
	let pwTag = joinForm.userpw;
	let pw_reTag = joinForm.userpw_re;
	if (pwTag.value == "") {
		alert("비밀번호를 입력해주세요.");
		pwTag.focus();
		return false;
	}
	let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,}$/
	if (!reg.test(pwTag.value)) {
		alert("비밀번호는 8자 이상, 숫자, 대문자, 소문자, 특수문자를 모두 포함해야 합니다.");
		pwTag.focus();
		return false;
	} else if (/(\w)\1\1\1/.test(pwTag.value)) {
		alert("같은 문자를 4번 이상 사용하실 수 없습니다.")
		pwTag.focus();
		return false;
	} else if (pwTag.value.search(/\s/) != -1) {
		alert("비밀번호는 공백을 포함할 수 없습니다.");
		pwTag.focus()
		return false;
	}
	if (pw_reTag.value == "") {
		alert("비밀번호 확인을 해주세요.");
		pw_reTag.focus();
		return false;
	}
	if (pwTag.value != pw_reTag.value) {
		alert("비밀번호 확인을 다시 해주세요.");
		pwTag.focus();
		return false;
	}  
	let emailTag = joinForm.useremail;
	let resultUserEmailTag = document.getElementById("ResultEmail");
	if (emailTag.value == "") {
		alert("이메일을 입력해주세요.");
		emailTag.focus();
		return false;
	}	
	var email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	if(!email.test(emailTag.value)) {
		alert("이메일 형식이 잘못되었습니다.");
		emailTag.focus();
		return false;        
	}
	if (resultUserEmailTag.innerHTML == "") {
		alert("이메일 중복검사를 진행해주세요.");
		emailTag.focus();
		return false;
	}
	if (resultUserEmailTag.innerHTML != "사용할 수 있는 이메일입니다.") {
		alert("중복된 이메일이 있습니다.");
		emailTag.focus();
		return false;
	}
	return true;
}

function checkId() {
	let userid = document.joinForm.userid.value;
	let idTag = joinForm.userid;
	if (userid.length < 5 || userid.length > 12) {
		alert("아이디는 5자 이상 12자 이하로 입력해주세요.");
		idTag.focus();
		return false;
	}
	if (idTag.value.indexOf('admin') != -1) {
		alert("아이디에 'admin'을 포함할 수 없습니다.");
		idTag.focus();
		return false;
	}
	let resultIdTag = document.getElementById("ResultId");
	let json = {"userid":userid}
	$.ajax(
			{
				type:"POST",
				url:"/user/checkId",
				data:JSON.stringify(json),
				contentType: "application/json",
				success:function(result,status,xhr){
					console.log(result);
					if(result == "fail"){						
						resultIdTag.innerHTML = "이미 존재하는 아이디입니다.";
						idTag.focus();
					}else{
						resultIdTag.innerHTML = "사용할 수 있는 아이디입니다.";
					}
				},
				error:function(xhr,status,e){
						}
			}		
		)
}

function checkNickName() {
	let usernickname = document.joinForm.usernickname.value;
	let nicknameTag = joinForm.usernickname;
	if (usernickname.length < 2 || usernickname.length > 10) {
		alert("닉네임은 2자 이상 6자 이하로 입력해주세요.");
		nicknameTag.focus();
		return false;
	}
	let resultNicknameTag = document.getElementById("ResultNickname");
	let json = {"usernickname":usernickname}
	$.ajax(
			{
				type:"POST",
				url:"/user/checkNick",
				data:JSON.stringify(json),
				contentType: "application/json",
				success:function(result,status,xhr){
					console.log(result);
					if(result == "fail"){						
						resultNicknameTag.innerHTML = "이미 존재하는 닉네임입니다.";
						nicknameTag.focus();
					}else{
						resultNicknameTag.innerHTML = "사용할 수 있는 닉네임입니다.";
					}
				},
				error:function(xhr,status,e){
						}
			}		
		)
}

function checkEmail() {
	let useremail = document.joinForm.useremail.value;
	let useremailTag = joinForm.useremail;
	let resultUserEmailTag = document.getElementById("ResultEmail");
	let json = {"useremail":useremail}
	var email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	if (useremailTag.value == "") {
		alert("이메일을 입력해주세요.");
		useremailTag.focus();
		return false;
	}
	if (!email.test(useremailTag.value)) {
		alert("이메일 형식이 잘못되었습니다.");
		useremailTag.focus();
		return false;
	}
	$.ajax(
			{
				type:"POST",
				url:"/user/checkEmail",
				data:JSON.stringify(json),
				contentType: "application/json",
				success:function(result,status,xhr){
					console.log(result);
					if(result == "fail"){						
						resultUserEmailTag.innerHTML = "이미 존재하는 이메일입니다.";
						useremailTag.focus();
					}else{
						resultUserEmailTag.innerHTML = "사용할 수 있는 이메일입니다.";
					}
				},
				error:function(xhr,status,e){
						}
			}		
		)
}
