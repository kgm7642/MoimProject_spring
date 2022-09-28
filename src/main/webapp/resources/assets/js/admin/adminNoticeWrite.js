	//유효성 검사
	function sendit() {
		let noticeForm = document.noticeForm;
		let noticetitle = noticeForm.noticetitle;
		let contents = noticeForm.contents;
		let dupTag = document.getElementById("result");
		if (noticetitle.value == "") {
			alert("제목을 입력하세요!");
			noticetitle.focus();
			return false;
		}
		if (contents.value == "") {
			alert("내용을 입력하세요!");
			contents.focus();
			return false;
		}
	}