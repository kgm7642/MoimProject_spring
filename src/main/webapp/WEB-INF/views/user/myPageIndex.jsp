<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지_목록</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<style>
table {
	border-collapse: initial;
	width: 70%;
	text-align: center;
	margin: 0 auto;
}

.align-center {
	text-align: center;
}
</style>
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
					<h1>마이페이지</h1>
				</header>
			</div>
			<a href="#wrapper" class="more">Learn More</a>
			<video src="/resources/assets/css/images/banner.mp4" muted autoplay
				loop playsinline></video>
		</section>


		<!-- Wrapper -->
		<div id="wrapper">
			<table>
				<tr>
					<td style="width: 33%;"><a class="button primary fit"
						href="/user/pwCheckUpdate">회원 정보 수정</a></td>
					<td style="width: 33%;"><a class="button fit"
						href="/moim/myMoimAll?userid=${session.userid}">내 모임</a></td>
					<td style="width: 33%;"><a class="button primary fit"
						href="/moim/myMoimBan?userid=${session.userid}">강퇴 메세지</a></td>
				</tr>
				<tr>
					<td style="margin: 10px;">[ ${session.userid} ] 님의 <br>개인
						정보를 수정할 수 있습니다.
					</td>
					<td style="margin: 10px;">[ ${session.userid} ] 님의 <br>모임을
						확인할 수 있습니다.
					</td>
					<td style="margin: 10px;">[ ${session.userid} ] 님의 <br>강퇴된
						모임을 확인할 수 있습니다.
					</td>
				</tr>
			</table>

			<!-- CTA -->

			<!-- Footer -->
			<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
		</div>
	</div>
</body>
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.scrolly.min.js"></script>
<script src="/resources/assets/js/jquery.scrollex.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/app/user/user.js"></script>
</html>