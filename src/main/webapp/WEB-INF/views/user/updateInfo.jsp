<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>개인 정보 수정</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/assets/css/user/updateInfo.css" />
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
					<h1>개인 정보 수정</h1>
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
					<form method="post" name="joinForm" onsubmit="return sendit()"
						action="/user/updateInfo">
						<input type="hidden" value="${session.userid}" name="userid">
						<table>
							<tr>
								<td colspan="2"><span id="ResultNickname"
									style="color: red;"></span></td>
							</tr>
							<tr>
								<th style="padding: 12px;"><label for="usernickname">닉네임</label></th>
								<td style="padding: 12px;"><input type="text"
									name="usernickname" id="usernickname" class="form-control"
									style="width: 50%; float: left"> <input type="button"
									value="닉네임 변경 안함" class="btn btn-outline-primary"
									onclick="alreadyNickName()" style="width: 30%; float: right">
									<input type="button" value="중복검사" id="checkNick"
									class="btn btn-outline-primary" onclick="checkNickName()"
									style="width: 20%; float: right"></td>
							</tr>
							<tr>
								<th style="padding: 12px;"><label for="userpw">비밀번호</label></th>
								<th style="padding: 12px;"><input type="password"
									name="userpw" value="${session.userpw}"></th>
							</tr>
							<tr>
								<th style="padding: 12px;"><label for="userpw_re">비밀번호
										확인</label></th>
								<td style="padding: 12px;"><input type="password"
									name="userpw_re" id="userpw_re"
									placeholder="비밀번호를 다시 한번 입력해주세요"></td>
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
						</table>
						<div style="margin-top: 30px;">
							<input type="button" class="button primary" value="탈퇴하기"
								onclick="resign()" style="float: right; margin-left: 20px;">
							<input type="submit" class="button primary" value="수정하기"
								style="float: right;">
						</div>
					</form>
				</div>
			</section>
		</div>

		<!-- CTA -->
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
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/app/user/user.js"></script>
<script>
	function alreadyNickName(){
		let joinForm = document.joinForm;		
		let nicknameTag = joinForm.usernickname;
		let resultNicknaemTag = document.getElementById("ResultNickname");	
		let checkNick = document.getElementById("checkNick");
		
		resultNicknaemTag.innerHTML = "사용할 수 있는 닉네임입니다.";
		resultNicknaemTag.style.display = "none";
		checkNick.style.display = "none";
		nicknameTag.value = "${session.usernickname}";
		nicknameTag.readOnly = "true";
	}
	
	function sendit() {
		let joinForm = document.joinForm;
		let pwTag = joinForm.userpw;
		let pw_reTag = joinForm.userpw_re;
		if (pwTag.value == "") {
			alert("비밀번호를 입력해주세요.");
			pwTag.focus();
			return false;
		}
		//정규식 - https://developer.mozilla.org/ko/docs/Web/JavaScript/Guide/Regular_Expressions
		let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,}$/
		if (!reg.test(pwTag.value)) {
			alert("비밀번호는 8자 이상, 숫자, 대문자, 소문자, 특수문자를 모두 포함해야 합니다.");
			pwTag.focus();
			return false;
		} else if (/(\w)\1\1\1/.test(pwTag.value)) {
			alert("같은 문자를 4번 이상 사용하실 수 없습니다.")
			pwTag.focus();
			return false;
		} else if (pwTag.value.search(/\s/) != -1) {
			alert("비밀번호는 공백을 포함할 수 없습니다.");
			pwTag.focus()
			return false;
		}
		if (pw_reTag.value == "") {
			alert("비밀번호 확인을 해주세요.");
			pw_reTag.focus();
			return false;
		}
		if (pwTag.value != pw_reTag.value) {
			alert("비밀번호 확인을 다시 해주세요.");
			pwTag.focus();
			return false;
		}
		let nicknameTag = joinForm.usernickname;
		let resultNicknaemTag = document.getElementById("ResultNickname");
		if (nicknameTag.value == "") {
			alert("닉네임을 입력해주세요.");
			nicknameTag.focus();
			return false;
		}
		if (nicknameTag.value.length < 2 || nicknameTag.value.length > 10) {
			alert("닉네임은 2자 이상 6자 이하로 입력해주세요.");
			nicknameTag.focus();
			return false;
		}
		if (resultNicknaemTag.innerHTML == "") {
			alert("닉네임 중복검사를 진행해주세요.");
			nicknameTag.focus();
			return false;
		}
		if (resultNicknaemTag.innerHTML != "사용할 수 있는 닉네임입니다.") {
			alert("중복된 닉네임이 있습니다.");
			nicknameTag.focus();
			return false;
		}
		return true;
	}
	
	function checkNickName() {
		let usernickname = document.joinForm.usernickname.value;
		let nicknameTag = joinForm.usernickname;
		if (usernickname.length < 2 || usernickname.length > 10) {
			alert("닉네임은 2자 이상 6자 이하로 입력해주세요.");
			nicknameTag.focus();
			return false;
		}
		let resultNicknameTag = document.getElementById("ResultNickname");
		let json = {"usernickname":usernickname}
		$.ajax(
				{
					type:"POST",
					url:"/user/checkNick",
					data:JSON.stringify(json),
					contentType: "application/json",
					success:function(result,status,xhr){
						console.log(result);
						if(result == "fail"){						
							resultNicknameTag.innerHTML = "이미 존재하는 닉네임입니다.";
							nicknameTag.focus();
						}else{
							resultNicknameTag.innerHTML = "사용할 수 있는 닉네임입니다.";
						}
					},
					error:function(xhr,status,e){
							}
				}		
			)
	}
	
	function resign(){
		location.href="/user/resign?userid=${session.userid}";
	}
</script>
</html>