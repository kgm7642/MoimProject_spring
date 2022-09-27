<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>비밀번호 찾기</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
</head>
<body class="is-preload">
	<c:if test="${not empty ff}">
		<script>
			alert("일치하는 정보가 없습니다. 다시 시도해 주세요.");
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
					<h1>비밀번호 찾기</h1>
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
					<form name="findpwForm" action="/user/findPw" method="post"
						onsubmit="return sendit();">
						<table>
							<tr>
								<th>아이디 입력</th>
								<td><input type="text" name="userid" id="userid"
									placeholder="아이디를 입력해주세요"></td>
							</tr>
							<tr>
								<th>이메일 입력</th>
								<td><input type="text" name="useremail" id="useremail"
									placeholder="ex) asd123@gmail.com"></td>
							</tr>
							<tr>
								<th colspan="2" style="text-align: center;"><input
									type="submit" value="비밀번호찾기" style="margin-top: 10px;"></th>
							</tr>
						</table>
					</form>

					<!-- CTA -->

				</div>
			</section>
		</div>


		<!-- Footer -->
		<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

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
<script>
	function sendit() {
		if (userid != null) {
			let idTag = document.findpwForm.userid;
			if (idTag.value == "") {
				alert("아이디를 입력하세요!");
				idTag.focus();
				return false;
			}
			let emailTag = document.findpwForm.useremail;
			if (emailTag.value == "") {
				alert("이메일을 입력해주세요.");
				emailTag.focus();
				return false;
			}
			var email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
			if (!email.test(emailTag.value)) {
				alert("이메일 형식이 잘못되었습니다.");
				emailTag.focus();
				return false;
			}
		}
		return true;
	}
</script>
</html>