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
<title>개인 정보 수정 - 비밀번호 확인</title>
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
					<h1>MyPage</h1>
				</header>
			</div>
			<a href="#wrapper" class="more">Learn More</a>
			<video src="/resources/assets/css/images/banner.mp4" muted autoplay
				loop playsinline></video>
		</section>


		<!-- Wrapper -->
		<div id="wrapper">

			<form method="get" name="joinForm" action="/user/updateInfo"
				onsubmit="return sendPW()">
				<table>
					<tr>
						<th><label for="userpw"><span
								style="font-size: 1.5em;"><strong>비밀번호 확인</strong></span></label></th>
						<td><input type="password" name="userpw"></td>
						<td><input type="submit" value="확인" class="button primary"
							style="width: 150px;"></td>
					</tr>
				</table>
			</form>


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
<script src="/resources/assets/js/user.js"></script>
<script>
	function sendPW(){
		let joinForm = document.joinForm;
		let pwTag = joinForm.userpw;
		if(pwTag.value == ""){
			alert("비밀번호를 입력해주세요.");
			pwTag.focus();
			return false;
		}
		if(pwTag.value != "${session.userpw}"){
			alert("비밀번호를 확인해주세요.")
			pwTag.focus();
			return false;
		}
		return true;
	}
</script>
</html>