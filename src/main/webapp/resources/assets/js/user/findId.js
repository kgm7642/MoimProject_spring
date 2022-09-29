	function sendit() {
		let emailTag = document.findIdForm.useremail;
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
		return true;
	}