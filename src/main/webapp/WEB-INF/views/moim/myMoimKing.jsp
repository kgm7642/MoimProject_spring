<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>나의 모임(방장인 모임)</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
</head>
<body class="is-preload">
	<c:if test="${session.userid == null}">
		<script>
         alert("로그인 후 이용하세요!");
         location.replace("/user/login");
      </script>
	</c:if>
	<c:set var="myMoimList1" value="${requestScope.myMoimList1}" />
	<c:set var="page" value="${requestScope.page}" />
	<c:set var="startPage" value="${requestScope.startPage }" />
	<c:set var="endPage" value="${requestScope.endPage }" />
	<c:set var="totalCnt" value="${requestScope.totalCnt }" />
	<c:set var="totalPage" value="${requestScope.totalPage }" />
	<jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

	<!-- Page Wrapper -->
	<div id="page-wrapper">

		<!-- Header -->
		<%@ include file="/WEB-INF/views/inc/header.jsp"%>

		<!-- Menu -->
		<%@ include file="/WEB-INF/views/inc/menu.jsp"%>


		<section id="banner" data-video="/resources/assets/css/images/banner">
			<div class="inner">
				<header>
					<h1>내가 방장인 모임</h1>
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
					<br>
					<div style="margin: 10px;">
						<span style="font-size: 2em;"><strong>&lt
								${session.userid} : 방장인 모임 &gt</strong></span> <span style="float: right;">
							오늘 시작 : <span style="color: #7fa4e5; font-size: 2em;">■ </span>
							진행중 : <span style="color: #c6e0eb; font-size: 2em;">■ </span> 진행
							예정 : <span style="color: #fdf8b4; font-size: 2em;">■ </span> 종료 :
							<span style="color: #c4c9d3; font-size: 2em;">■ </span>
						</span>
					</div>
					<table class="mymoimlist">
						<tr>
							<td width="15%">번호</td>
							<td width="25%">모임 이름</td>
							<td width="15%">모임장</td>
							<td width="15%">시작일</td>
							<td width="15%">종료일</td>
							<td width="15%">진행 여부</td>
						</tr>
						<c:choose>
							<c:when test="${moimList.size()>0 and moimList != null }">
								<c:forEach var="moim" items="${moimList}">
									<c:choose>
										<c:when test="${moim.startdate == today}">
											<tr class="todaymoim"
												onmouseover="this.style.background='#eeeeeb'"
												onClick="location.href='/moim/getMoimInfo?moimnum=${moim.moimnum}'"
												onmouseout="this.style.background='#7fa4e5'">
												<td class="mytable">${moim.moimnum}</td>
												<td class="mytable">${moim.moimname}</td>
												<td class="mytable">${moim.userid}</td>
												<td class="mytable">${moim.startdate}</td>
												<td class="mytable">${moim.enddate}</td>
												<td>오늘 시작</td>
											</tr>
										</c:when>
										<c:when
											test="${moim.startdate < today && moim.enddate > today}">
											<tr class="ingmoim"
												onmouseover="this.style.background='#eeeeeb'"
												onClick="location.href='/moim/getMoimInfo?moimnum=${moim.moimnum}'"
												onmouseout="this.style.background='#c6e0eb'">
												<td class="mytable">${moim.moimnum}</td>
												<td class="mytable">${moim.moimname}</td>
												<td class="mytable">${moim.userid}</td>
												<td class="mytable">${moim.startdate}</td>
												<td class="mytable">${moim.enddate}</td>
												<td>진행중</td>
											</tr>
										</c:when>
										<c:when test="${moim.startdate > today}">
											<tr class="willmoim"
												onmouseover="this.style.background='#eeeeeb'"
												onClick="location.href='/moim/getMoimInfo?moimnum=${moim.moimnum}'"
												onmouseout="this.style.background='#fdf8b4'">
												<td class="mytable">${moim.moimnum}</td>
												<td class="mytable">${moim.moimname}</td>
												<td class="mytable">${moim.userid}</td>
												<td class="mytable">${moim.startdate}</td>
												<td class="mytable">${moim.enddate}</td>
												<td>진행 예정</td>
											</tr>
										</c:when>
										<c:otherwise>
											<tr class="endmoim"
												onmouseover="this.style.background='#eeeeeb'"
												onClick="location.href='/moim/getMoimInfo?moimnum=${moim.moimnum}'"
												onmouseout="this.style.background='#c4c9d3'">
												<td class="mytable" style="text-decoration: line-through">${moim.moimnum}</td>
												<td class="mytable" style="text-decoration: line-through">${moim.moimname}</td>
												<td class="mytable" style="text-decoration: line-through">${moim.userid}</td>
												<td class="mytable" style="text-decoration: line-through">${moim.startdate}</td>
												<td class="mytable" style="text-decoration: line-through">
													${moim.enddate}</td>
												<td style="text-decoration: line-through">종료</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="5" style="text-align: center; font-size: 20px">
										모임이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>
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
						action="/moim/myMoimKing">
						<input type="hidden" name="userid" value="${session.userid}">
						<input type="hidden" name="pagenum"
							value="${pageMaker.cri.pagenum}"> <input type="hidden"
							name="amount" value="${pageMaker.cri.amount}"> <input
							type="hidden" name="type" value="${pageMaker.cri.type}">
						<input type="hidden" name="keyword"
							value="${pageMaker.cri.keyword}">
					</form>
					<hr>
					<a href="/moim/createPlace" class="button primary fit"
						style="width: 30%; display: inline-block;"> 모임 생성하러 가기</a> <a
						href="/moim/myMoimAll?userid=${session.userid}" class="button fit"
						style="width: 30%; display: inline-block; float: right;">참여중인
						모든 모임 보기</a>
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
<script src="/resources/assets/js/moim/myMoimKing.js"></script>
</html>