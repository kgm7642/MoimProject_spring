	//유효성 검사
	function sendit(){
		let joincontents = document.getElementById("joincontents");
		let dupTag = document.getElementById("result");
		if(joincontents.value == ""){
			alert("내용을 입력하세요!");
			joincontents.focus();
			return false;
		}
		return true;
	}