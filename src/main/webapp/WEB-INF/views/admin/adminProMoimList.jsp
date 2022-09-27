<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>홍보 게시판 관리 [admin]</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
</head>
<style>
.recruit {
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
					<h1>홍보 게시판 관리</h1>
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
							<div style="font-size: 20px; float: left; margin-top: 40px;">
								<strong>글 개수 : ${pageMaker.total}</strong>
							</div>
						</div>
					</div>

					<!-- 게시글 리스트 띄우는 테이블 -->
					<table class="list" style="margin: 0px;">
						<tr align="center" valign="middle" bgcolor="black">
							<th width="10%"
								style="text-align: center; padding: 12px; background-color: #E0EDF2">번호</th>
							<th width="30%"
								style="text-align: center; padding: 12px; background-color: #E0EDF2">제목</th>
							<th width="20%"
								style="text-align: center; padding: 12px; background-color: #E0EDF2">작성자</th>
							<th width="20%"
								style="text-align: center; padding: 12px; background-color: #E0EDF2">날짜</th>
							<th width="10%"
								style="text-align: center; padding: 12px; background-color: #E0EDF2">조회수</th>
							<th width="10%"
								style="text-align: center; padding: 12px; background-color: #E0EDF2">신고수</th>
						</tr>
						<c:choose>
							<c:when
								test="${adminProMoimList.size()>0 and adminProMoimList != null }">
								<c:forEach var="recruit" items="${adminProMoimList}">
									<tr class="recruit" id="recruit${recruit.recruitnum}"
										onClick="location.href='/admin/adminProMoimView${pageMaker.cri.listLink}&moimnum=${recruit.moimnum}&recruitnum=${recruit.recruitnum}'"
										onmouseover="this.style.background='#eeeeeb'"
										onmouseout="this.style.background='white'">
										<td style="text-align: center;">${recruit.recruitnum}</td>
										<td style="text-align: center;">${recruit.recruittitle }</td>
										<td style="text-align: center;">${recruit.userid}</td>
										<td style="text-align: center;">${recruit.regdate}</td>
										<td style="text-align: center;">${recruit.readcnt}</td>
										<td style="text-align: center;">${recruit.dislike}</td>
									</tr>

								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="5" style="text-align: center; font-size: 20px">
										등록된 게시글이 없습니다.</td>
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
						action="/admin/adminProMoimList">
						<input type="hidden" name="pagenum"
							value="${pageMaker.cri.pagenum}"> <input type="hidden"
							name="amount" value="${pageMaker.cri.amount}"> <input
							type="hidden" name="type" value="${pageMaker.cri.type}">
						<input type="hidden" name="keyword"
							value="${pageMaker.cri.keyword}">
					</form>

					<!-- 검색 버튼 -->
					<form action="/admin/adminProMoimList" id="searchForm" method="get">
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