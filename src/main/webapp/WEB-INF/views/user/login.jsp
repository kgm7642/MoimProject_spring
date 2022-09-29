<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>로그인</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
</head>
<body class="is-preload">
	<c:if test="${param.emailCheck == true}">
		<script>
			alert("이메일 인증을 완료했습니다. 로그인 해주세요.");
		</script>
	</c:if>
	<c:if test="${not empty flag}">
		<script>
			alert("아이디와 비밀번호를 다시 확인해주세요.");
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
					<h1>로그인</h1>
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
					<form name="loginForm" action="/user/login" method="post"
						onsubmit="return sendit();">
						<table>
							<tr>
								<th width="15%"><strong>아이디</strong></th>
								<td width="50%"><input type="text" name="userid"
									placeholder="아이디를 입력하세요"
									value="${param.userid!=null?param.userid:''}" tabindex="1">
								</td>
								<td width="35%" rowspan="2" style="vertical-align: bottom;">
									<div>
										<input type="submit" class="button primary large" value="로그인"
											style="height: 140px; padding: 0px;" tabindex="3">
									</div>
								</td>
							</tr>
							<tr>
								<th width="15%"><strong>비밀번호</strong></th>
								<td width="50%"><input type="password" name="userpw"
									placeholder="비밀번호를 입력하세요" tabindex="2"></td>
								<td width="35%"></td>
							</tr>
							<tr>
								<td colspan="3" style="text-align: center;"><a
									href="/user/findId" class="button large" tabindex="4">아이디
										찾기</a> <a href="/user/findPw" class="button large" tabindex="5">비밀번호
										찾기</a> <a href="/user/join" class="button large" tabindex="6">회원
										가입</a></td>
							</tr>
						</table>
					</form>
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
<script src="/resources/assets/js/user/login.js"></script>
</html>