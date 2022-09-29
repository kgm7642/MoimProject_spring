	//유효성 검사
	function sendit() {
		let boardForm = document.boardForm;
		let boardtitle = boardForm.boardtitle;
		let contents = boardForm.contents;
		let dupTag = document.getElementById("result");
		if (boardtitle.value == "") {
			alert("제목을 입력하세요!");
			boardtitle.focus();
			return false;
		}
		if (contents.value == "") {
			alert("내용을 입력하세요!");
			contents.focus();
			return false;
		}
	}