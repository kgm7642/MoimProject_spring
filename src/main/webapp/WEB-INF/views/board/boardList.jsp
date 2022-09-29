<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>게시판_리스트</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/assets/css/board/boardList.css" />
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
					<h1>BOARD</h1>
				</header>
				<ul class="actions special">
				</ul>
			</div>
			<a href="#one" class="more">Learn More</a>
			<video src="/resources/assets/css/images/banner.mp4" muted autoplay	loop playsinline></video>
		</section>

		<!-- Wrapper -->

		<div id="wrapper">
			<section id="main" class="main">
				<div class="inner">
					<div style="text-align: center;">
						<div style="width: 100%; display: inline-block;">
							<div style="font-size: 20px; float: left;">
								<strong>글 개수 : ${pageMaker.total}</strong>
							</div>
							<input type="button"
								onclick="location.href='/board/boardWrite${pageMaker.cri.listLink}'"
								class="button primary" style="float: right;" value="글쓰기">
						</div>
					</div>
					<table class="list" style="margin: 0px;">
						<tr align="center" valign="middle">
							<th width="10%"
								style="text-align: center; padding: 10px; background-color: #E0EDF2"><strong>번호</strong></th>
							<th width="40%"
								style="text-align: center; padding: 10px; background-color: #E0EDF2"><strong>제목</strong></th>
							<th width="10%"
								style="text-align: center; padding: 10px; background-color: #E0EDF2"><strong>작성자</strong></th>
							<th width="10%"
								style="text-align: center; padding: 10px; background-color: #E0EDF2"><strong>카테고리</strong></th>
							<th width="20%"
								style="text-align: center; padding: 10px; background-color: #E0EDF2"><strong>날짜</strong></th>
							<th width="10%"
								style="text-align: center; padding: 10px; background-color: #E0EDF2"><strong>조회수</strong></th>
						</tr>
						<c:choose>
							<c:when test="${boardList.size()>0 and boardList != null }">
								<c:forEach var="board" items="${boardList}">
									<tr class="board" id="board${board.boardnum}"
										onClick="location.href='/board/boardView${pageMaker.cri.listLink}&boardnum=${board.boardnum}'"
										onmouseover="this.style.background='#eeeeeb'"
										onmouseout="this.style.background='white'">
										<td>${board.boardnum}</td>
										<td>${board.boardtitle}</td>
										<td>${board.userid}</td>
										<td><c:choose>
												<c:when test="${board.category == 1}">여행</c:when>
												<c:when test="${board.category == 2}">스터디</c:when>
												<c:when test="${board.category == 3}">동호회</c:when>
												<c:when test="${board.category == 4}">취미</c:when>
												<c:when test="${board.category == 5}">운동</c:when>
												<c:when test="${board.category == 6}">친구</c:when>
												<c:when test="${board.category == 7}">취업</c:when>
												<c:when test="${board.category == 8}">크루</c:when>
											</c:choose></td>
										<td>${board.regdate}</td>
										<td>${board.views}</td>
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
					<form action="/board/boardList" method="get" id="pageForm">
						<input type="hidden" name="pagenum"
							value="${pageMaker.cri.pagenum}"> <input type="hidden"
							name="amount" value="${pageMaker.cri.amount}"> <input
							type="hidden" name="type" value="${pageMaker.cri.type}">
						<input type="hidden" name="keyword"
							value="${pageMaker.cri.keyword}">
					</form>

					<!-- 검색 버튼 -->
					<form action="/board/boardList" method="get" id="searchForm">
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

<!-- Scripts -->
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.scrolly.min.js"></script>
<script src="/resources/assets/js/jquery.scrollex.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>
<script src="/resources/assets/js/board/boardList.js"></script>
</html>