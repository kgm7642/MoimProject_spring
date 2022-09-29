<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>모임 가입 신청서 작성</title>
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
						<h1>모임 가입신청</h1>
					</header>
					<div style="width: 100%; text-align: center;">
						<div style="width: 15%; display: inline-block; color: black;">모임
							이름</div>
						<div style="width: 80%; display: inline-block; text-align: left;">${moim.moimname}</div>
					</div>
					<hr>
					<div style="width: 100%; text-align: center;">
						<div style="width: 15%; display: inline-block; color: black;">모임장</div>
						<div style="width: 80%; display: inline-block; text-align: left;">${moim.userid}</div>
					</div>
					<hr>
					<form action="/moim/adMoimJoin" onsubmit="return sendit();"
						method="post">
						<input type="hidden" name="joinType" value="${joinType}">
						<input type="hidden" name="kinguserid" value="${moim.userid}">
						<input type="hidden" name="joinuserid" value="${session.userid}">
						<input type="hidden" name="moimnum" value="${moim.moimnum}">
						<div style="width: 100%; text-align: center;">
							<div style="width: 15%; display: inline-block; color: black;">내용</div>
							<div style="width: 80%; display: inline-block;">
								<textarea id="joincontents" name="joincontents"
									style="resize: none; border-color: black; height: 500px;"></textarea>
							</div>
						</div>
						<hr>
						<div style="width: 100%; text-align: center;">
							<div style="text-align: right;">
								<input type="submit" value="제출하기">
							</div>
						</div>
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
<script src="/resources/assets/js/moim/adMoimJoin.js"></script>
</html>