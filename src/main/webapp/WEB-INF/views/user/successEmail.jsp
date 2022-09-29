<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 인증 완료</title>
</head>
<body>
	<a><img src="/images/ms-logo.png" style="height: 80px; margin-left: 10px;" /></a>
	<br>
	<br>
	<h3>안녕하세요, ${param.userid} 님</h3>
	<br>
	<p>환영합니다!</p>
	<br>
	<p>회원가입이 정상적으로 이루어 졌습니다.</p>
	<br>
	<p>로그인 하시면 홈페이지 내의 모든 서비스를 이용하실 수 있습니다.</p>
	<br>
	<a href="/user/login">로그인 페이지로 이동하기</a>
</body>
</html>