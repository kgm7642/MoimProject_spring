<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>회원가입</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
</head>
<style>
th, td {
	vertical-align: middle;
}
</style>
<body class="is-preload">
	<c:if test="${not empty param.join}">
		<script>
			alert("회원가입을 실패했습니다! 다시 시도해 주세요...");
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
					<h1>회원가입</h1>
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
					<form name="joinForm" method="post" action="/user/join"
						onsubmit="return sendit()" style="text-align: center;">
						<table>
							<tr>
								<td colspan="2"><span id="ResultId" style="color: red;"></span>
								</td>
							</tr>
							<tr>
								<th style="padding: 12px;"><label for="userid">아이디</label></th>
								<td style="padding: 12px;"><input type="text" name="userid"
									id="userid" class="form-control"
									style="width: 80%; float: left"> <input type="button"
									value="중복검사" class="btn btn-outline-primary"
									onclick="checkId()" style="float: right"></td>
							</tr>
							<tr>
								<td colspan="2"><span id="ResultNickname"
									style="color: red;"></span></td>
							</tr>
							<tr>
								<th style="padding: 12px;"><label for="usernickname">닉네임</label></th>
								<td style="padding: 12px;"><input type="text"
									name="usernickname" id="usernickname" class="form-control"
									style="width: 80%; float: left"> <input type="button"
									value="중복검사" class="btn btn-outline-primary"
									onclick="checkNickName()" style="float: right"></td>
							</tr>
							<tr>
								<th style="padding: 12px;"><label for="userpw">비밀번호</label></th>
								<td style="padding: 12px;"><input type="password"
									name="userpw" id="userpw"
									placeholder="대문자, 소문자, 숫자, 특수문자 모두 포함"></td>
							</tr>
							<tr>
								<th style="padding: 12px;"><label for="userpw_re">비밀번호
										확인</label></th>
								<td style="padding: 12px;"><input type="password"
									name="userpw_re" id="userpw_re"
									placeholder="비밀번호를 다시 한번 입력해주세요"></td>
							</tr>
							<tr>
								<td colspan="2"><span id="ResultEmail" style="color: red;"></span>
								</td>
							</tr>
							<tr>
								<th style="padding: 12px;"><label for="useremail">이메일주소</label></th>
								<td style="padding: 12px;"><input type="text"
									name="useremail" id="useremail" placeholder="ex) abc@gmail.com"
									style="width: 80%; float: left"> <input type="button"
									value="중복검사" class="btn btn-outline-primary"
									onclick="checkEmail()"></td>
							</tr>
							<tr>
								<th style="padding: 12px;"><label for="useremailopen">이메일
										공개여부</label></th>
								<td style="padding: 12px;">
									<div style="float: left">
										<input type="radio" id="open" name="useremailopen" value="1"
											checked> <label for="open">공개</label> <input
											type="radio" id="private" name="useremailopen" value="0">
										<label for="private">비공개</label>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2"><input type="submit"
									style="text-align: center;" value="가입 완료"></td>
							</tr>
						</table>
					</form>
				</div>
			</section>

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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/assets/js/user.js"></script>
</html>