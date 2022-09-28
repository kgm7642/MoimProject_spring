<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>게시판 관리 [admin]</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/assets/css/admin/adminBoardList.css" />
</head>
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
							<th width="10%"	style="text-align: center; padding: 10px; background-color: #E0EDF2"><strong>번호</strong></th>
							<th width="40%"	style="text-align: center; padding: 10px; background-color: #E0EDF2"><strong>제목</strong></th>
							<th width="10%"	style="text-align: center; padding: 10px; background-color: #E0EDF2"><strong>작성자</strong></th>
							<th width="20%"	style="text-align: center; padding: 10px; background-color: #E0EDF2"><strong>날짜</strong></th>
							<th width="10%"	style="text-align: center; padding: 10px; background-color: #E0EDF2"><strong>조회수</strong></th>
							<th width="10%"	style="text-align: center; padding: 10px; background-color: #E0EDF2"><strong>싫어요</strong></th>
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
					<form id="pageForm" name="pageForm" method="get" action="/admin/adminBoardList">
						<input type="hidden" name="pagenum"
							value="${pageMaker.cri.pagenum}"> <input type="hidden"
							name="amount" value="${pageMaker.cri.amount}"> <input
							type="hidden" name="type" value="${pageMaker.cri.type}">
						<input type="hidden" name="keyword"	value="${pageMaker.cri.keyword}">
					</form>

					<!-- 검색 버튼 -->
					<form action="/admin/adminBoardList" id="searchForm" method="get">
						<div style="text-align: center;">
							<select name="type" style="width: 20%; display: inline-block;">
								<option value="">검색</option>
								<option value="T" ${pageMaker.cri.type == "T"?"selected":""}>제목</option>
								<option value="C" ${pageMaker.cri.type == "C"?"selected":""}>내용</option>
								<option value="W" ${pageMaker.cri.type == "W"?"selected":""}>작성자</option>
								<option value="TC" ${pageMaker.cri.type == "TC"?"selected":""}>제목 또는 내용</option>
								<option value="TW" ${pageMaker.cri.type == "TW"?"selected":""}>제목 또는 작성자</option>
								<option value="CW" ${pageMaker.cri.type == "CW"?"selected":""}>내용 또는 작성자</option>
								<option value="TCW" ${pageMaker.cri.type == "TCW"?"selected":""}>제목 또는 내용 또는 작성자</option>
							</select> <input type="text" name="keyword" id="keyword" value="${pageMaker.cri.keyword}"
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
<script src="/resources/assets/js/admin/adminBoardList.js"></script>
</html>