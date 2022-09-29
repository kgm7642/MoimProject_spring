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