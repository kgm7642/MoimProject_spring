<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Together</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
</head>
<style>
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

.th3 {
	background-color: #E0EDF2;
	padding: 12px;
}

.todayMoimListTR {
	border: none;
}

table, tr, th, td {
	text-align: center;
	align: center;
	valign: middle;
}

hr.tMyMoim {
	margin: 10px 0;
}

td.tMyMoimTable {
	background-color: white;
}

td.tMyMoimText {
	padding: 0.5em;
	background-color: white;
}

.board, .moimCursor {
	cursor: pointer;
}

.myCursor {
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
	<c:set var="boardList" value="${requestScope.boardList}" />
	<c:if test="${not empty param.resign}">
		<script>
			alert("회원탈퇴를 완료했습니다.");
		</script>
	</c:if>

	<!-- Page Wrapper -->
	<div id="page-wrapper">

		<!-- Header -->
		<header id="header">
			<c:choose>
				<c:when test="${session.userid == 'admin'}">
					<a href="/index" class="logo"><span>admin(관리자)</span></a>
				</c:when>
				<c:when test="${session.userid != null}">
					<a href="/index/index" class="logo"><span>together
							${session.userid}</span></a>
				</c:when>
				<c:when test="${session.userid == null}">
					<a href="/index" class="logo"><span>together
							${session.userid}</span></a>
				</c:when>
			</c:choose>
			<nav>
				<ul>
					<li><a href="#menu">Menu</a></li>
				</ul>
			</nav>
		</header>

		<!-- Menu -->
		<nav id="menu">
			<ul class="links">
				<c:if test="${session.userid != 'admin'}">
					<c:choose>
						<c:when test="${session.userid != null}">
							<li><a href="/index/index"><strong>메인화면</strong></a></li>
						</c:when>
						<c:when test="${session.userid == null}">
							<li><a href="/index"><strong>메인화면</strong></a></li>
						</c:when>
					</c:choose>
					<li><a href="/moim/createPlace">모임 생성</a></li>
					<li><a href="/moim/moimList">모임 리스트</a></li>
					<li><a href="/moim/proMoimList">홍보 게시판</a></li>
					<li><a href="/board/boardList">자유 게시판</a></li>
					<li><a href="/notice/noticeList">공지사항</a></li>
				</c:if>
				<c:if test="${session.userid == 'admin'}">
					<li><a href="/index"><strong>메인화면</strong></a></li>
					<li><a href="/admin/adminMoimList">모임 관리</a></li>
					<li><a href="/admin/adminProMoimList">홍보 게시판 관리</a></li>
					<li><a href="/admin/adminBoardList">게시판 관리</a></li>
					<li><a href="/admin/adminNoticeList">공지사항 관리</a></li>
				</c:if>
			</ul>
			<ul class="actions stacked">
				<c:if test="${session.userid == null}">
					<li><a href="/user/join" class="button primary fit">회원가입</a></li>
					<li><a href="/user/login" class="button fit">로그인</a></li>
				</c:if>
				<c:if test="${session.userid != null }">
					<c:if test="${session.userid != 'admin'}">
						<li><a href="/user/myPageIndex" class="button primary fit">마이페이지</a></li>
					</c:if>
					<li><a href="/user/logout" class="button fit">로그아웃</a></li>
				</c:if>
			</ul>
		</nav>



		<!-- Banner -->

		<section id="banner" data-video="/resources/assets/css/images/banner">
			<div class="inner">
				<header>
					<h1>Together</h1>
				</header>
				<div>
					<c:if test="${session.userid != 'admin'}">
						<a href="/moim/createPlace" class="custom-btn btn-12"><span>click!</span><span>모임
								생성</span></a>
					</c:if>
				</div>
			</div>
			<c:if test="${session.userid != 'admin'}">
				<c:if test="${session.userid != null}">
					<a href="#wrapper" class="more">Learn More</a>
				</c:if>
			</c:if>
			<video src="/resources/assets/css/images/mainbanner.mp4"
				autoplay="autoplay" muted="muted" loop="loop"></video>
		</section>



		<c:if test="${session.userid != 'admin'}">
			<c:if test="${session.userid != null}">

				<!-- Wrapper -->

				<div id="wrapper">

					<section id="four" class="main special">
						<div class="inner">
							<div class="features">

								<section>
									<div class="inner spotlight alt style2">
										<div class="content">
											<header>
												<div style="text-align: center; width: 100%;">
													<h2>
														<strong style="font-weight: bold;">✈️오늘 시작하는 모임✈️</strong>
													</h2>
												</div>

												<table class="todayMoimListTable" style="margin: 0px;">
													<tr class="todayMoimListTR">
														<th class="th1" style="width: 75%;">
															<div style="text-align: center; margin-top: 10px;">
																<strong>모임 이름</strong>
															</div>
														</th>
														<th class="th2" style="width: 25%;">
															<div style="text-align: center; margin-top: 10px;">
																<strong>모 임 장</strong>
															</div>
														</th>
													</tr>
												</table>
												<c:choose>
													<c:when
														test="${todayMoimList.size()>0 and todayMoimList != null }">
														<table style="margin: 0px;">
															<c:forEach var="todayMoimList" items="${todayMoimList}">
																<tr class="moimCursor"
																	onmouseover="this.style.background='#eeeeeb'"
																	onClick="location.href='/moim/getMoimInfo?moimnum=${todayMoimList.moimnum}'"
																	onmouseout="this.style.background='white'">
																	<td style="width: 75%;">
																		<div style="text-align: center;">
																			<strong>${todayMoimList.moimname}</strong>
																		</div>
																	</td>
																	<td style="width: 25%;">
																		<div style="text-align: center;">
																			<strong>${todayMoimList.userid}</strong>
																		</div>
																	</td>
																</tr>
															</c:forEach>
														</table>
													</c:when>
													<c:otherwise>
														<table>
															<tr style="border: none;">
																<td><strong style="font-size: 20px;">모임 없음</strong>
																</td>
															</tr>
														</table>
													</c:otherwise>
												</c:choose>
												<a href="/moim/moimList" class="button large"
													style="margin-top: 20px;">모임 더보기</a>
											</header>
										</div>
									</div>
								</section>

								<section style="margin-left: auto; margin-right: auto;">
									<h2>
										<strong>${session.userid}</strong>
									</h2>
									<hr>
									<a class="button fit" href="/user/myPageIndex"
										style="margin-top: 20px;">마 이 페 이 지</a> <a
										class="button primary fit" href="/notice/noticeList"
										style="margin-top: 20px;">공 지 사 항</a> <a class="button fit"
										href="/moim/proMoimList" style="margin-top: 20px;">홍 보 게 시
										판</a> <a class="button primary fit" href="/user/logout"
										style="margin-top: 20px;">로 그 아 웃</a>
								</section>

								<section>
									<h2 style="text-align: center;">
										<strong>오늘의 날씨</strong>
									</h2>
									<hr>
									<h3 class="weathericon"></h3>
									<h3 class="ctemp">현재 기온 :</h3>
									<h3 class="lowtemp">최저 기온 :</h3>
									<h3 class="hightemp">최고 기온 :</h3>
								</section>

								<section>
									<c:choose>
										<c:when test="${moimCnt==1 and moimCnt != null }">
											<h2>오늘 일정</h2>
											<hr class="tMyMoim">
											<div style="font-size: 1.0em;">
												<strong>&lt<span id="current_date"></span>&gt
													${session.userid}님의 모임
												</strong>
											</div>
											<hr class="tMyMoim">
											<table class="tmoim">
												<tr>
													<td class="tMyMoimTable"><strong>모임 이름</strong></td>
													<td class="tMyMoimText"><strong>${todayMyMoim.moimname}</strong></td>
												</tr>
												<tr>
													<td class="tMyMoimTable"><strong>종료 날짜</strong></td>
													<td class="tMyMoimText"><strong>${fn:split(todayMyMoim.enddate," ")[0]}</strong></td>
												</tr>
											</table>
											<div style="text-align: center;">
												<input type="button" class="button primary fit"
													value="자세히 보기 ▶"
													onclick="location.href='/moim/getMoimInfo?moimnum=${todayMyMoim.moimnum}'"
													style="width: 80%; height: 50px; font-size: 0.7em; margin-top: 20px;">
											</div>
										</c:when>
										<c:when test="${moimCnt>1 and moimCnt != null }">
											<h2>오늘의 일정</h2>
											<hr class="tMyMoim">
											<div style="font-size: 1.0em;">
												<strong>&lt<span id="current_date"></span>&gt
													${session.userid}님의 모임
												</strong>
											</div>
											<hr class="tMyMoim">
											<table class="tmoim todayMoimListTable">
												<tr align="center" valign="middle" class="todayMoimListTR">
													<th class="th3" width="50%"><div
															style="text-align: center;">모임 이름</div></th>
													<th class="th3" width="50%"><div
															style="text-align: center;">끝 날짜</div></th>
												</tr>
												<c:forEach var="todayMyMoimList" items="${todayMyMoimList}">
													<tr class="myCursor"
														onmouseover="this.style.background='#eeeeeb'"
														onClick="location.href='/moim/getMoimInfo.mo?moimnum=${todayMyMoimList.moimnum}'"
														onmouseout="this.style.background='white'">
														<td><strong>${todayMyMoimList.moimname}</strong></td>
														<td><strong>${fn:split(todayMyMoimList.enddate," ")[0]}</strong></td>
													</tr>
												</c:forEach>
											</table>
											<strong>※ 모임 이름을 눌러 상세 모임을 확인하세요.</strong>
										</c:when>
										<c:otherwise>
											<h2>Today's Schedule</h2>
											<hr class="tMyMoim">
											<div style="font-size: 1.0em;">
												<strong>&lt<span id="current_date"></span>&gt
													${session.userid}님의 모임
												</strong>
											</div>
											<hr class="tMyMoim">
											<div style="font-size: 1.5em; padding: 3em;">
												<strong>오늘 예정된 모임이 없습니다.</strong>
											</div>
										</c:otherwise>
									</c:choose>
								</section>

							</div>
						</div>
					</section>

					<!-- One -->

					<section id="two" class="main">
						<div class="inner spotlight style1">
							<div class="content">
								<h2 style="text-align: center;">💖 TOGETHER Top 5 💔</h2>
								<hr>
								<table class="list"
									style="margin-left: auto; margin-right: auto; text-align: center;">
									<tr align="center" valign="middle">
										<th width="40%"
											style="padding: 12px; text-align: center; background-color: #E0EDF2"><strong>제목</strong></th>
										<th width="10%"
											style="padding: 12px; text-align: center; background-color: #E0EDF2"><strong>작성자</strong></th>
										<th width="10%"
											style="padding: 12px; text-align: center; background-color: #E0EDF2"><strong>카테고리</strong></th>
										<th width="20%"
											style="padding: 12px; text-align: center; background-color: #E0EDF2"><strong>날짜</strong></th>
										<th width="10%"
											style="padding: 12px; text-align: center; background-color: #E0EDF2"><strong>💖</strong></th>
										<th width="10%"
											style="padding: 12px; text-align: center; background-color: #E0EDF2"><strong>조회수</strong></th>
									</tr>
									<c:choose>
										<c:when test="${boardList.size()>0 and boardList != null }">
											<c:forEach var="board" items="${boardList }">
												<tr class="board" id="board${board.boardnum}"
													onmouseover="this.style.background='#eeeeeb'"
													onClick="location.href='/board/boardView?boardnum=${board.boardnum}'"
													onmouseout="this.style.background='white'">
													<td><strong>${board.boardtitle}</strong></td>
													<td><strong>${board.userid}</strong></td>
													<td><strong><c:choose>
																<c:when test="${board.category == 1}">여행</c:when>
																<c:when test="${board.category == 2}">스터디</c:when>
																<c:when test="${board.category == 3}">동호회</c:when>
																<c:when test="${board.category == 4}">취미</c:when>
																<c:when test="${board.category == 5}">운동</c:when>
																<c:when test="${board.category == 6}">친구</c:when>
																<c:when test="${board.category == 7}">취업</c:when>
																<c:when test="${board.category == 8}">크루</c:when>
															</c:choose></strong></td>
													<td><strong>${board.regdate}</strong></td>
													<td><strong>${board.likes}</strong></td>
													<td><strong>${board.views}</strong></td>
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
							</div>
						</div>
					</section>
				</div>
			</c:if>
		</c:if>
	</div>
	<c:set var="boardList" value="${requestScope.boardList}" />

	<!-- CTA -->

	<c:if test="${session.userid != 'admin'}">
		<!-- Footer -->
		<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	</c:if>
</body>

<!-- Scripts -->

<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.scrolly.min.js"></script>
<script src="/resources/assets/js/jquery.scrollex.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>
<script>
	$
			.getJSON(
					'http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=dfc53b8f7036977f9583925ba206e881&units=metric',
					function(result) {
						$('.ctemp').append(result.main.temp);
						$('.lowtemp').append(result.main.temp_min);
						$('.hightemp').append(result.main.temp_max);
						// result.weather[0].icon
						var wiconUrl = '<img src="http://openweathermap.org/img/wn/'+result.weather[0].icon+'@4x.png" alt="'+result.weather[0].description+'">'

						$('.weathericon').html(wiconUrl);

					});
</script>
<script>
	date = new Date();
	year = date.getFullYear();
	month = ("0" + (1 + date.getMonth())).slice(-2);
	day = ("0" + date.getDate()).slice(-2);
	document.getElementById("current_date").innerHTML = year + "-" + month
			+ "-" + day;
</script>
</html>