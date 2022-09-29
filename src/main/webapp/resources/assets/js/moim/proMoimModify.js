	function checkWord(obj, maxByte) {
		//지금 입력을 한 태그 객체
		let strValue = obj.value;

		// 태그 객체의 입력 값 총 길이
		let strLen = strValue.length;

		// 전체 바이트 수
		let totalByte = 0;

		// 현재 입력된 전체 길이
		let len = 0;

		// 입력 값을 하나씩 잘라낼 때 저장될 공간 
		let oneChar = "";

		// 잘라냈을 때 문자열 담을 변수
		let str = "";

		for (let i = 0; i < strLen; i++) {
			oneChar = strValue.charAt(i);
			if (escape(oneChar).length > 4) {
				totalByte += 2;
			} else {
				totalByte++;
			}

			// 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
			if (totalByte <= maxByte) {
				len = i + 1;
			}
		}

		// 넘어가는 글자를 자르는 조건문
		if (totalByte > maxByte) {
			alert(maxByte + "byte를 초과 입력 할 수 없습니다.");
			str = strValue.substr(0, len);
			obj.value = str;
			checkWord(obj, 4000);
		}
	}

	function sendit() {
		let recruittitle = document.getElementById("recruittitle");
		let recruitcontents = document.getElementById("recruitcontents");
		if (recruittitle.value == "") {
			alert("제목을 입력하세요!");
			recruittitle.focus();
			return false;
		}
		if (recruitcontents.value == "") {
			alert("내용을 입력하세요!");
			recruitcontents.focus();
			return false;
		}
		return true;
	}