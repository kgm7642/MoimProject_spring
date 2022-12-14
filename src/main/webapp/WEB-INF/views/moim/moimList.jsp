<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<html>
<head>
<title>모임 검색(리스트)</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/assets/css/moim/moimList.css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
</head>
<body class="is-preload">
	<c:if test="${session.userid == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("/user/login");
		</script>
	</c:if>
	<c:if test="${not empty param.join}">
		<script>
			alert("가입 신청을 완료했습니다.");
		</script>
	</c:if>

	<!-- Page Wrapper -->

	<div id="page-wrapper">


		<!-- Header -->
		<%@ include file="/WEB-INF/views/inc/header.jsp"%>

		<!-- Menu -->
		<%@ include file="/WEB-INF/views/inc/menu.jsp"%>


		<section id="banner" data-video="/resources/assets/css/images/banner">
			<div class="inner">
				<header>
					<h1>모임 리스트</h1>
				</header>
			</div>
			<c:if test="${session.userid != null}">
				<a href="#wrapper" class="more">Learn More</a>
			</c:if>
			<video src="/resources/assets/css/images/banner.mp4" muted autoplay
				loop playsinline></video>
		</section>

		<!-- Wrapper -->

		<div id="wrapper">

			<!-- Main -->

			<section id="main" class="main">
				<div class="inner">

					<!-- 게시글 리스트 띄우는 테이블 -->

					<div style="float: right; margin-bottom: 10px;">
						<strong>총 모임 : ${pageMaker.total}</strong>
					</div>
					<table class="list" style="margin: 0px;">
						<tr align="center" valign="middle">
							<th width="35%"
								style="text-align: center; padding: 12px; background-color: #E0EDF2"">모임이름</th>
							<th width="15%"
								style="text-align: center; padding: 12px; background-color: #E0EDF2"">모임장</th>
							<th width="15%"
								style="text-align: center; padding: 12px; background-color: #E0EDF2"">시작일</th>
							<th width="15%"
								style="text-align: center; padding: 12px; background-color: #E0EDF2"">종료일</th>
							<th width="15%"
								style="text-align: center; padding: 12px; background-color: #E0EDF2"">신고횟수</th>
						</tr>
						<c:choose>
							<c:when test="${moimList.size()>0 and moimList != null }">
								<c:forEach var="moim" items="${moimList}">
									<tr class="moim" id="moim${moim.moimnum}" class="myCursor"
										onmouseover="this.style.background='#eeeeeb'"
										onClick="location.href='/moim/getMoimInfo?moimnum=${moim.moimnum}'"
										onmouseout="this.style.background='white'">
										<td>${moim.moimname}</td>
										<td>${moim.userid}</td>
										<td>${fn:split(moim.startdate," ")[0]}</td>
										<td>${fn:split(moim.enddate," ")[0]}</td>
										<td>${moim.dislike}</td>
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
						action="/moim/moimList">
						<input type="hidden" name="pagenum"
							value="${pageMaker.cri.pagenum}"> <input type="hidden"
							name="amount" value="${pageMaker.cri.amount}"> <input
							type="hidden" name="type" value="${pageMaker.cri.type}">
						<input type="hidden" name="keyword"
							value="${pageMaker.cri.keyword}">
					</form>

					<!-- 검색 버튼 -->
					<form action="/moim/moimList" id="searchForm" method="get">
						<div style="text-align: center;">
							<select name="type" style="width: 20%; display: inline-block;">
								<option value="">검색</option>
								<option value="T" ${pageMaker.cri.type == "T"?"selected":""}>모임이름</option>
								<option value="W" ${pageMaker.cri.type == "W"?"selected":""}>모임장</option>
								<option value="TW" ${pageMaker.cri.type == "TW"?"selected":""}>모임이름
									또는 모임장</option>
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
<script src="/resources/assets/js/moim/moimList.js"></script>
</html>










