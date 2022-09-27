<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>모임 생성_완료</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
</head>
<style>
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>

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

		<!-- Wrapper -->
		<div id="wrapper">

			<!-- Main -->
			<section id="main" class="main">
				<div class="inner">
					<header class="major">
						<h1>welcome${placenum}</h1>
					</header>
					<div style="text-align: center;">
						<div style="width: 100%; display: inline-block;">
							<div style="font-size: 50px; float: left; margin-top: 20px;">모임
								생성</div>
							<div style="font-size: 20px; float: right; margin-top: 40px;">
								<span>① 모임 장소 설정 </span> &nbsp;&#187; <span> ② 모임 정보 입력</span>
								&nbsp;&#187; <span style="font-weight: bold; color: #579AB7">
									③ 모임 생성 완료</span>
							</div>
						</div>
					</div>
					<hr>
					<div style="text-align: center;">
						<div class="textcontainer" style="margin-top: 200px;">
							<p class="animate__heartBeat"
								style="font-size: 50px; font-weight: bold;">모임 생성을 완료했습니다!!</p>
						</div>
						<div class="textcontainer" style="margin-top: 50px;">
							<p>
								<span id="cntspan"></span><span> 초 후에 홈으로 이동합니다.</span>
							</p>
						</div>
						<div style="text-align: center;">
							<input type="button" id="gohome" class="button primary"
								value="홈으로" style="font-weight: bold; margin-top: 150px;"
								onclick="location.href='/index'">
						</div>
					</div>
				</div>
			</section>
		</div>
		<form>
			<input type="hidden" name="cnt" id="cnt" value=""> <input
				type="hidden" name="placenum" id="placenum" value="">
		</form>

		<!-- Footer -->
		<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	</div>

</body>
<script>let login_id = "${session.userid}"</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/assets/js/completemoim.js"></script>
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
</html>