	let searchForm = $("#searchForm");
	let pageForm = $("#pageForm");

	//페이지 이동
	$(".changePage").on("click", function(e) {
		e.preventDefault();

		pageForm.find("input[name='pagenum']").val($(this).attr("href"));
		pageForm.submit();
	})

	//검색
	$("#searchForm a").on("click", function(e) {
		e.preventDefault();

		if (!searchForm.find("option:selected").val()) {
			alert("검색 기준을 선택하세요.");
			return false;
		}
		if (!searchForm.find("input[name='keyword']").val()) {
			alert("키워드를 입력하세요.");
			return false;
		}
		searchForm.find("input[name='pagenum']").val("1");
		searchForm.submit();
	})

	let checkKingId = document.getElementById("checkKingId");

	//게시글 작성하기 전 모임장인지 확인
	function writemoim() {
		let userid = "${session.userid}";
		let json = {
			"userid" : userid
		}
		$
				.ajax({
					type : "POST",
					url : "/moim/checkKing",
					data : JSON.stringify(json),
					contentType : "application/json",
					success : function(result, status, xhr) {
						console.log(result);
						if (result == "success") {
							alert("모임장이 아니면 글을 작성 할 수 없습니다.");
						} else {
							location.href = "/moim/proMoimWrite${pageMaker.cri.listLink}&userid=${session.userid}";
						}
					},
					error : function(xhr, status, e) {
					}
				})
	}