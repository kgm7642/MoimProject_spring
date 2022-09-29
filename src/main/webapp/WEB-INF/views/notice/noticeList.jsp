<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>공지사항 리스트</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/assets/css/notice/noticeList.css" />
</head>
<body class="is-preload">
	<c:if test="${session.userid == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("/user/login");
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
					<h1>공지사항</h1>
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
					<div style="text-align: center;">
						<div style="width: 100%; display: inline-block;">
							<div style="font-size: 20px; float: left;">
								<strong>글 개수 : ${pageMaker.total}</strong>
							</div>
						</div>
					</div>
					<table class="list" style="margin: 0px;">
						<tr align="center" valign="middle">
							<th width="20%"
								style="text-align: center; padding: 10px; background-color: #E0EDF2; color: black;"><strong>분류</strong></th>
							<th width="40%"
								style="text-align: center; padding: 10px; background-color: #E0EDF2; color: black;"><strong>제목</strong></th>
							<th width="10%"
								style="text-align: center; padding: 10px; background-color: #E0EDF2; color: black;"><strong>작성자</strong></th>
							<th width="20%"
								style="text-align: center; padding: 10px; background-color: #E0EDF2; color: black;"><strong>날짜</strong></th>
							<th width="10%"
								style="text-align: center; padding: 10px; background-color: #E0EDF2; color: black;"><strong>조회수</strong></th>
						</tr>
						<c:choose>
							<c:when test="${noticeList.size()>0 and noticeList != null }">
								<c:forEach var="notice" items="${noticeList}">
									<tr class="notice" id="notice${notice.noticenum}"
										onClick="location.href='/notice/noticeView${pageMaker.cri.listLink}&noticenum=${notice.noticenum}'"
										onmouseover="this.style.background='#eeeeeb'"
										onmouseout="this.style.background='white'">
										<td><span style="color: #ea5951;">★공지사항★</span></td>
										<td>${notice.noticetitle}</td>
										<td>관리자</td>
										<td>${notice.regdate}</td>
										<td>${notice.views}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="5" style="text-align: center; font-size: 20px;">
										<strong>등록된 공지사항이 없습니다.</strong>
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
					<form action="/notice/noticeList" method="get" id="pageForm">
						<input type="hidden" name="pagenum"
							value="${pageMaker.cri.pagenum}"> <input type="hidden"
							name="amount" value="${pageMaker.cri.amount}"> <input
							type="hidden" name="type" value="${pageMaker.cri.type}">
						<input type="hidden" name="keyword"
							value="${pageMaker.cri.keyword}">
					</form>

					<!-- 검색 버튼 -->
					<form action="/notice/noticeList" method="get" id="searchForm">
						<div style="text-align: center;">
							<select name="type" style="width: 20%; display: inline-block;">
								<option value="">검색</option>
								<option value="T" ${pageMaker.cri.type == "T"?"selected":""}>제목</option>
								<option value="C" ${pageMaker.cri.type == "C"?"selected":""}>내용</option>
								<option value="TC" ${pageMaker.cri.type == "TC"?"selected":""}>제목
									또는 내용</option>
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
<script src="/resources/assets/js/notice/noticeList.js"></script>
</html>