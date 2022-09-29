<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>모임 생성_모임 설정</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/assets/css/moim/createMoim.css" />
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
						<h1>Welcome</h1>
					</header>
					<div style="text-align: center;">
						<div style="width: 100%; display: inline-block;">
							<div style="font-size: 50px; float: left; margin-top: 20px;">모임
								생성</div>
							<div style="font-size: 20px; float: right; margin-top: 40px;">
								<span>① 모임 장소 설정 </span> &nbsp;&#187; <span
									style="font-weight: bold; color: #579AB7"> ② 모임 정보 입력</span>
								&nbsp;&#187; <span> ③ 모임 생성 완료</span>
							</div>
						</div>
					</div>
					<div>
						<form action="/moim/completeMoim" method="post" name="moimform"
							onsubmit="return sendmoim()">
							<input type="hidden" id="placenum" name="placenum"
								value="${placenum}">
							<hr>

							<div style="width: 100%; margin: 20px auto; text-align: center;">
								<div style="width: 15%; display: inline-block; color: black;">모임
									이름</div>
								<div style="width: 80%; display: inline-block;">
									<input type="text" name="moimname" style="border-color: black;">
								</div>
							</div>
							<hr>

							<div style="width: 100%; margin: 20px auto; text-align: center;">
								<div style="width: 15%; display: inline-block; color: black;">모임
									유형</div>
								<select name="moimtypefirst"
									style="width: 80%; display: inline-block; border-color: black;">
									<option value="1" selected>여행</option>
									<option value="2">스터디</option>
									<option value="3">동호회</option>
									<option value="4">취미</option>
									<option value="5">운동</option>
									<option value="6">친구</option>
									<option value="7">취업</option>
									<option value="8">크루</option>
									<option value="9">연애</option>
									<option value="10">상담</option>
								</select>
							</div>
							<hr>

							<div style="width: 100%; margin: 20px auto; text-align: center;">
								<div style="width: 15%; display: inline-block; color: black;">모임
									예산</div>
								<div style="width: 80%; display: inline-block;">
									<input type="text" name="moimbudget"
										style="border-color: black;">
								</div>
							</div>
							<hr>

							<div style="width: 100%; margin: 20px auto; text-align: center;">
								<div style="width: 15%; display: inline-block; color: black;">모임장
								</div>
								<div style="width: 80%; display: inline-block;">
									<input type="text" name="userid" value="${session.userid}"
										readonly style="border-color: black;">
								</div>
							</div>
							<hr>

							<div style="width: 100%; margin: 20px auto; text-align: center;">
								<div
									style="width: 20%; display: inline-block; color: black; float: left; margin-top: 20px;">모임
									기간</div>
								<div style="width: 35%; display: inline-block;">
									<div
										style="width: 25%; display: inline-block; margin-top: 20px;">시작
										날짜</div>
									<div
										style="width: 55%; display: inline-block; margin-top: 20px;">
										<input type="date" name="startdate">
									</div>
								</div>
								<div style="width: 35%; display: inline-block;">
									<div
										style="width: 25%; display: inline-block; margin-top: 20px;">종료
										날짜</div>
									<div style="width: 55%; display: inline-block;">
										<input type="date" name="enddate">
									</div>
								</div>
							</div>
							<hr>

							<div style="text-align: center;">
								<div style="width: 100%; display: inline-block;">
									<input type="button" id="gohome" value="이전 페이지"
										style="float: left; margin-top: 40px;" class="button primary"
										onclick="location.href='/moim/createPlace'"> <input
										type="submit" value="모임 생성"
										style="float: right; margin-top: 40px;" class="button primary">
								</div>
							</div>
						</form>
					</div>
				</div>
			</section>
		</div>

		<!-- Footer -->
		<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

	</div>

</body>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.scrolly.min.js"></script>
<script src="/resources/assets/js/jquery.scrollex.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/assets/js/moim/createMoim.js"></script>
</html>