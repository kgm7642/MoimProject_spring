<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>게시판 관리 [admin]</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
</head>
<style>
#wrapper {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

table, tr, th, td {
	text-align: center;
	align: center;
	valign: middle;
}

td {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

table {
	table-layout: fixed;
}

.custom-btn {
	width: 240px;
	height: 40px;
	color: #fff;
	border-radius: 5px;
	padding: 10px 25px;
	font-family: 'Lato', sans-serif;
	font-weight: 500;
	background: transparent;
	cursor: pointer;
	transition: all 0.3s ease;
	position: relative;
	display: inline-block;
	box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5), 7px 7px 20px
		0px rgba(0, 0, 0, .1), 4px 4px 5px 0px rgba(0, 0, 0, .1);
	outline: none;
}
/* 12 */
.btn-12 {
	position: relative;
	right: 20px;
	bottom: 20px;
	border: none;
	box-shadow: none;
	width: 240px;
	height: 40px;
	line-height: 42px;
	-webkit-perspective: 230px;
	perspective: 230px;
}

.btn-12 span {
	background: rgb(247, 150, 192);
	background: linear-gradient(0deg, rgba(247, 150, 192, 1) 0%,
		rgba(118, 174, 241, 1) 100%);
	display: block;
	position: absolute;
	width: 240px;
	height: 40px;
	box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5), 7px 7px 20px
		0px rgba(0, 0, 0, .1), 4px 4px 5px 0px rgba(0, 0, 0, .1);
	border-radius: 5px;
	margin: 0;
	text-align: center;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all .3s;
	transition: all .3s;
}

.btn-12 span:nth-child(1) {
	box-shadow: -7px -7px 20px 0px #fff9, -4px -4px 5px 0px #fff9, 7px 7px
		20px 0px #0002, 4px 4px 5px 0px #0001;
	-webkit-transform: rotateX(90deg);
	-moz-transform: rotateX(90deg);
	transform: rotateX(90deg);
	-webkit-transform-origin: 50% 50% -20px;
	-moz-transform-origin: 50% 50% -20px;
	transform-origin: 50% 50% -20px;
}

.btn-12 span:nth-child(2) {
	-webkit-transform: rotateX(0deg);
	-moz-transform: rotateX(0deg);
	transform: rotateX(0deg);
	-webkit-transform-origin: 50% 50% -20px;
	-moz-transform-origin: 50% 50% -20px;
	transform-origin: 50% 50% -20px;
}

.btn-12:hover span:nth-child(1) {
	box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5), 7px 7px 20px
		0px rgba(0, 0, 0, .1), 4px 4px 5px 0px rgba(0, 0, 0, .1);
	-webkit-transform: rotateX(0deg);
	-moz-transform: rotateX(0deg);
	transform: rotateX(0deg);
}

.btn-12:hover span:nth-child(2) {
	box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5), 7px 7px 20px
		0px rgba(0, 0, 0, .1), 4px 4px 5px 0px rgba(0, 0, 0, .1);
	color: transparent;
	-webkit-transform: rotateX(-90deg);
	-moz-transform: rotateX(-90deg);
	transform: rotateX(-90deg);
}

.box {
	width: 100%;
	height: 300px;
	padding: 0px;
}

.todayMoimList {
	overflow-y: scroll;
}

.todayMoimListTable th {
	position: sticky;
	top: 0px;
}

.th1 {
	background-color: #E0EDF2;
}

.th2 {
	background-color: #FAE7F4;
}

.todayMoimListTR {
	border: none;
}

.board {
	cursor: pointer;
}
</style>

<body class="is-preload">
	<c:if test="${session.userid == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("/user/login");
		</script>
	</c:if>
	<c:if test="${param.removeCheck == true}">
		<script>
			alert("게시글 삭제 완료!")
		</script>
	</c:if>
	<c:if test="${param.removeCheck == false}">
		<script>
			alert("게시글 삭제 실패. 다시 시도해주세요.")
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
					<h1>게시판 관리</h1>
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
			<section id="main" class="main">
				<div class="inner">
					<table class="list" style="margin: 0px;">
						<tr align="center" valign="middle">
							<th width="10%"
								style="text-align: center; padding: 10px; background-color: #E0EDF2"><strong>번호</strong></th>
							<th width="40%"
								style="text-align: center; padding: 10px; background-color: #E0EDF2"><strong>제목</strong></th>
							<th width="10%"
								style="text-align: center; padding: 10px; background-color: #E0EDF2"><strong>작성자</strong></th>
							<th width="20%"
								style="text-align: center; padding: 10px; background-color: #E0EDF2"><strong>날짜</strong></th>
							<th width="10%"
								style="text-align: center; padding: 10px; background-color: #E0EDF2"><strong>조회수</strong></th>
							<th width="10%"
								style="text-align: center; padding: 10px; background-color: #E0EDF2"><strong>싫어요</strong></th>
						</tr>
						<c:choose>
							<c:when test="${boardList.size()>0 and boardList != null }">
								<c:forEach var="board" items="${boardList }">
									<tr class="board" id="board${board.boardnum}"
										onClick="location.href='/admin/adminBoardView${pageMaker.cri.listLink}&boardnum=${board.boardnum}'"
										onmouseover="this.style.background='#eeeeeb'"
										onmouseout="this.style.background='white'">
										<c:if test="${board.userid != 'admin'}">
											<td>${board.boardnum}</td>
											<td>${board.boardtitle}</td>
											<td>${board.userid}</td>
											<td>${board.regdate}</td>
											<td>${board.views}</td>
											<td>${board.dislike}</td>
										</c:if>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="5" style="text-align: center; font-size: 20px;">
										<strong>등록된 게시글이 없습니다</strong>
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>
					<br>

					<!-- 페이징 처리 -->
					<div style="text-align: center">
						<c:if test="${pageMaker.prev}">
							<a href="${pageMaker.startPage-1}" class="pageChange">&lt;</a>
						</c:if>
						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="i">
							<c:choose>
								<c:when test="${pageMaker.cri.pagenum == i}">
									<code>${i}</code>
								</c:when>
								<c:otherwise>
									<a href="${i}" class="pageChange"><code>${i}</code></a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<a href="${pageMaker.endPage+1}" class="pageChange">&gt;</a>
						</c:if>
					</div>
					<form id="pageForm" name="pageForm" method="get"
						action="/admin/adminBoardList">
						<input type="hidden" name="pagenum"
							value="${pageMaker.cri.pagenum}"> <input type="hidden"
							name="amount" value="${pageMaker.cri.amount}"> <input
							type="hidden" name="type" value="${pageMaker.cri.type}">
						<input type="hidden" name="keyword"
							value="${pageMaker.cri.keyword}">
					</form>

					<!-- 검색 버튼 -->
					<form action="/admin/adminBoardList" id="searchForm" method="get">
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
							</select> <input type="text" name="keyword" id="keyword"
								value="${pageMaker.cri.keyword}"
								style="width: 50%; display: inline-block;"> <a href="#"
								class="button primary icon solid fa-search"
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
	$(".pageChange").on("click", function(e) {
		e.preventDefault();

		pageForm.find("input[name='pagenum']").val($(this).attr("href"))
		pageForm.submit();
	})

	$('#searchForm a').on("click", function(e) {
		e.preventDefault();
		if (!searchForm.find("option:selected").val()) {
			alert("검색 기준을 선택하세요.");
			return false;
		}
		if (!searchForm.find("input[name='keyword']").val()) {
			alert("키워드를 입력하세요.")
			return false;
		}
		searchForm.find("input[name='pagenum']").val("1");
		searchForm.submit();
	})
</script>
</html>