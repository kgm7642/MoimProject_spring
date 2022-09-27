<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>비밀번호 확인</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<style>
table, form {
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
					<h1>FIND TOGETHER PASSWORD</h1>
				</header>
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
						<div>
							<p>
								비밀번호는 <strong>[ ${userpw} ]</strong> 입니다
							</p>
						</div>
						<div>
							<a href="/user/login" class="button primary fit"
								style="display: inline-block; width: 50%;">로그인</a>
						</div>
					</div>
				</div>
			</section>

			<!-- CTA -->


			<!-- Footer -->
			<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
		</div>
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

</html>