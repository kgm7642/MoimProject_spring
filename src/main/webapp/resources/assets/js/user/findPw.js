	function sendit() {
		if (userid != null) {
			let idTag = document.findpwForm.userid;
			if (idTag.value == "") {
				alert("아이디를 입력하세요!");
				idTag.focus();
				return false;
			}
			let emailTag = document.findpwForm.useremail;
			if (emailTag.value == "") {
				alert("이메일을 입력해주세요.");
				emailTag.focus();
				return false;
			}
			var email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
			if (!email.test(emailTag.value)) {
				alert("이메일 형식이 잘못되었습니다.");
				emailTag.focus();
				return false;
			}
		}
		return true;
	}