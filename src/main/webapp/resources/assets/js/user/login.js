	let idTag = document.loginForm.userid;
	let pwTag = document.loginForm.userpw;
	function sendit() {
		if (idTag.value != null) {
			if (idTag.value == "") {
				alert("아이디를 입력하세요!");
				idTag.focus();
				return false;
			}
			if (pwTag.value == "") {
				alert("비밀번호를 입력하세요!");
				pwTag.focus();
				return false;
			}
		}
		return true;
	}