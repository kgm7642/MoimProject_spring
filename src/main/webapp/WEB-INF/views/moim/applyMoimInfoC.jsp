<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>모임 신청 관리</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
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
		<header id="header"> </header>

		<!-- Wrapper -->
		<div id="wrapper">

			<!-- Main -->
			<section id="main" class="main">
				<div class="inner">

					<header class="major">
						<h1>모임 신청 관리</h1>
					</header>
					<div style="width: 100%; margin: 20px auto; text-align: center;">
						<table>
							<tr>
								<th style="width: 20%;">모임 이름 :</th>
								<td style="width: 79%; text-align: left;">${moim.moimname}
								</td>
							</tr>
							<tr>
								<th style="width: 20%;">신청자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :
								</th>
								<td style="width: 79%; text-align: left;">
									${moimJoin.joinuserid}</td>
							</tr>
							<tr>
								<th style="width: 20%;">
									내용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</th>
								<td style="width: 79%; text-align: left;">
									${moimJoin.joincontents}</td>
							</tr>
						</table>
						<div style="text-align: center;">
							<div style="width: 100%; display: inline-block;">
								<div style="font-size: 20px; float: right;">
									<input type="button" value="거절" onclick="noApply();">&nbsp;
								</div>
								<div style="font-size: 20px; float: right;">
									<input type="button" value="수락" onclick="yesApply();">&nbsp;
								</div>
								<div style="font-size: 20px; float: left;">
									<input type="button" value="신청자 명단" onclick="applyList();">
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>

		<!-- Footer -->
		<footer id="footer">
			<p class="copyright">&copy; Untitled. All rights reserved.</p>
		</footer>
	</div>
</body>
<script>
	// 가입 거절
	function noApply() {
		location.href = "/moim/manageApply?join=false&moimnum=${moim.moimnum}&joinuserid=${moimJoin.joinuserid}";
		opener.document.location.reload();
	}
	// 가입 수락
	function yesApply() {
		location.href = "/moim/manageApply?join=true&moimnum=${moim.moimnum}&joinuserid=${moimJoin.joinuserid}";
		opener.document.location.reload();
	}
	//신청자 리스트로 이동
	function applyList() {
		location.href = "/moim/applyMoimInfo?moimnum=${moim.moimnum}";
	}
</script>
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.scrolly.min.js"></script>
<script src="/resources/assets/js/jquery.scrollex.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>
</html>