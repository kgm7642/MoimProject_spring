<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>개인 정보 수정 완료</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/assets/css/user/updateFinish.css" />
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
					<h1>개인 정보 확인</h1>
				</header>
			</div>
			<a href="#wrapper" class="more">Learn More</a>
			<video src="/resources/assets/css/images/banner.mp4" muted autoplay
				loop playsinline></video>
		</section>

		<!-- Wrapper -->
		<div id="wrapper">
			<div id="inner"
				style="margin-left: auto; margin-right: auto; width: 70%;">
				<h1 style="text-align: center;">내 정보</h1>
				<hr>
				<br>
				<div>
					<table>
						<tr>
							<th width="45%" style="text-align: center;"><label
								for="userid">유저아이디</label></th>
							<th style="text-align: center;">${user.userid}</th>
						</tr>
						<tr>
							<th style="text-align: center;"><label for="usernick">닉네임</label></th>
							<th style="text-align: center;">${user.usernickname}</th>
						</tr>
						<tr>
							<th style="text-align: center;"><label for="userpw">비밀번호</label></th>
							<th style="text-align: center;">${user.userpw}</th>
						</tr>
						<tr>
							<th style="text-align: center;"><label for="useremail">이메일</label></th>
							<th style="text-align: center;">${user.useremail}</th>
						</tr>
						<tr>
							<th style="text-align: center;"><label for="useremailopen">이메일
									공개 여부</label></th>
							<th style="text-align: center;"><c:if
									test="${user.useremailopen == 1}">
								공개
							</c:if> <c:if test="${user.useremailopen == 0}">
								비공개
							</c:if></th>
						</tr>
						<tr>
							<td colspan=2><a class="button primary" href="/index">메인화면</a></td>
						</tr>
					</table>
				</div>
			</div>
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