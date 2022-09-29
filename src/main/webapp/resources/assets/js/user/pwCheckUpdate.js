	function sendPW(){
		let joinForm = document.joinForm;
		let pwTag = joinForm.userpw;
		if(pwTag.value == ""){
			alert("비밀번호를 입력해주세요.");
			pwTag.focus();
			return false;
		}
		if(pwTag.value != "${session.userpw}"){
			alert("비밀번호를 확인해주세요.")
			pwTag.focus();
			return false;
		}
		return true;
	}