<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>모임 홍보 게시판</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
</head>
<style>
.proMoimList {
	cursor: pointer;
}

td {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

table {
	table-layout: fixed;
}
</style>
<body class="is-preload">
	<c:if test="${session.userid == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("/user/login");
		</script>
	</c:if>
	<c:if test="${param.join == true}">
		<script>
			alert("가입 신청을 완료했습니다!");
		</script>
	</c:if>
	<c:if test="${param.removeCheck == true}">
		<script>
			alert("게시글 삭제 완료!");
		</script>
	</c:if>
	<c:if test="${param.removeCheck == false}">
		<script>
			alert("게시글 삭제 실패. 다시 시도해 주세요.");
		</script>
	</c:if>
	<!-- Page Wrapper -->
	<div id="page-wrapper">

		<!-- Header -->
		<%@ include file="/WEB-INF/views/inc/header.jsp"%>

		<!-- Menu -->
		<%@ include file="/WEB-INF/views/inc/menu.jsp"%>

		<!-- Banner -->
		<section id="banner" data-video="/resources/assets/css/images/banner">
			<div class="inner">
				<header>
					<h1>홍보 게시판</h1>
				</header>
				<ul class="actions special">
				</ul>
			</div>
			<a href="#wrapper" class="more">Learn More</a>
			<video src="/resources/assets/css/images/banner.mp4" muted autoplay
				loop playsinline></video>
		</section>


		<!-- Wrapper -->
		<div id="wrapper">
			<!-- Main -->
			<section id="main" class="main">
				<div class="inner">
					<div style="text-align: center;">
						<div style="width: 100%; display: inline-block;">
							<div style="font-size: 20px; float: left;">
								<strong>글 개수 : ${pageMaker.total}</strong>
							</div>
							<input type="button" onclick="writemoim();"
								class="button primary" style="float: right;" value="글쓰기">
							<input type="hidden" id="checkKingId">
						</div>
					</div>

					<!-- 게시글 리스트 띄우는 테이블 -->
					<table class="list" style="margin: 0px;">
						<tr align="center" valign="middle" bgcolor="black">
							<th width="10%"
								style="text-align: center; padding: 12px; background-color: #E0EDF2">번호</th>
							<th width="40%"
								style="text-align: center; padding: 12px; background-color: #E0EDF2">제목</th>
							<th width="20%"
								style="text-align: center; padding: 12px; background-color: #E0EDF2">작성자</th>
							<th width="20%"
								style="text-align: center; padding: 12px; background-color: #E0EDF2">날짜</th>
							<th width="10%"
								style="text-align: center; padding: 12px; background-color: #E0EDF2">조회수</th>
						</tr>
						<c:choose>
							<c:when test="${proMoimList.size()>0 and proMoimList != null }">
								<c:forEach var="proMoimList" items="${proMoimList}">
									<tr class="proMoimList"
										id="proMoimList${proMoimList.recruitnum}"
										onClick="location.href='/moim/proMoimView${pageMaker.cri.listLink}&recruitnum=${proMoimList.recruitnum}&moimnum=${proMoimList.moimnum}'"
										onmouseover="this.style.background='#eeeeeb'"
										onmouseout="this.style.background='white'">
										<td style="text-align: center;">${proMoimList.recruitnum}</td>
										<td style="text-align: center;">${proMoimList.recruittitle}</td>
										<td style="text-align: center;">${proMoimList.userid}</td>
										<td style="text-align: center;">${proMoimList.regdate}</td>
										<td style="text-align: center;">${proMoimList.readcnt}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="5" style="text-align: center; font-size: 20px">
										<p>등록된 게시글이 없습니다.</p>
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>
					<br>

					<!-- 페이징 처리하는 테이블 -->
					<div style="text-align: center;">
						<c:if test="${pageMaker.prev}">
							<a class="changePage" href="${pageMaker.startPage-1}">&lt;</a>
						</c:if>
						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="i">
							<c:choose>
								<c:when test="${pageMaker.cri.pagenum == i}">
									<code>${i}</code>
								</c:when>
								<c:otherwise>
									<a class="changePage" href="${i}"><code>${i}</code></a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<a class="changePage" href="${pageMaker.endPage+1}">&gt;</a>
						</c:if>
					</div>
					<form action="/moim/proMoimList" method="get" id="pageForm">
						<input type="hidden" name="pagenum"
							value="${pageMaker.cri.pagenum}"> <input type="hidden"
							name="amount" value="${pageMaker.cri.amount}"> <input
							type="hidden" name="type" value="${pageMaker.cri.type}">
						<input type="hidden" name="keyword"
							value="${pageMaker.cri.keyword}">
					</form>

					<!-- 검색 버튼 -->
					<form action="/moim/proMoimList" method="get" id="searchForm">
						<div style="text-align: center;">
							<select name="type" style="width: 20%; display: inline-block;">
								<option value="">검색</option>
								<option value="T" ${pageMaker.cri.type == "T"?"selected":""}>제목</option>
								<option value="C" ${pageMaker.cri.type == "C"?"selected":""}>내용</option>
								<option value="W" ${pageMaker.cri.type == "W"?"selected":""}>작성자</option>
								<option value="TC" ${pageMaker.cri.type == "TC"?"selected":""}>제목
									또는 내용</option>
								<option value="TW" ${pageMaker.cri.type == "TW"?"selected":""}>제목
									또는 작성자</option>
								<option value="CW" ${pageMaker.cri.type == "CW"?"selected":""}>내용
									또는 작성자</option>
								<option value="TCW" ${pageMaker.cri.type == "TCW"?"selected":""}>제목
									또는 내용 또는 작성자</option>
							</select> <input type="text" id="keyword" name="keyword"
								style="width: 50%; display: inline-block;"
								value="${pageMaker.cri.keyword}"> <a href="#"
								class="button primary"
								style="width: 25%; display: inline-block;">검색</a>
						</div>
						<input type="hidden" name="pagenum"
							value="${pageMaker.cri.pagenum}"> <input type="hidden"
							name="amount" value="${pageMaker.cri.amount}">
					</form>

				</div>
			</section>
		</div>

		<!-- Footer -->
		<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	</div>
</body>
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.scrolly.min.js"></script>
<script src="/resources/assets/js/jquery.scrollex.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>
<script>
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
</script>
</html>