<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>게시글 수정</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/assets/css/board/boardModify.css" />
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

		<!-- Wrapper -->

		<div id="wrapper">
			<section id="main" class="main">
				<div class="inner">
					<form method="post" name="boardForm" action="/board/boardModify"
						onsubmit="return sendit()">
						<input type="hidden" value="${board.boardnum}" name="boardnum">
						<input type="hidden" value="${board.userid}" name="userid">

						<!-- 게시글 작성하는 인풋들 배치 테이블 -->
						<table border="1" style="border-collapse: collapse;">
							<tr height="30px">
								<th align="center" width="150px">수정 할 제목</th>
								<td><input type="text" value="${board.boardtitle}"
									name="boardtitle"></td>
							</tr>
							<tr height="30px">
								<th align="center" width="150px">작성자</th>
								<td>${board.userid}</td>
							</tr>
							<tr style="width: 100%; margin: 20px auto; text-align: center;">
								<th align="center" width="150px">유형선택</th>
								<td><select name="category" style="width: 100%">
										<option value="1" selected>여행</option>
										<option value="2">스터디</option>
										<option value="3">동호회</option>
										<option value="4">취미</option>
										<option value="5">운동</option>
										<option value="6">친구</option>
										<option value="7">취업</option>
										<option value="8">크루</option>
								</select></td>
							</tr>
							<tr height="300px">
								<th align="center" width="150px">내 용</th>
								<td><textarea name="contents"
										style="height: 250px; resize: none;">${board.contents}</textarea>
								</td>
							</tr>
						</table>
						<br>
						<table class="btn_area">
							<tr align="right" valign="middle">
								<td><input type="submit" class="button primary"
									value="수정완료" style="float: right;"> <a
									class="button primary" href="/board/boardList${cri.listLink}"
									style="float: left;">목록</a></td>
							</tr>
						</table>
					</form>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/assets/js/main.js"></script>
<script src="/resources/assets/js/board/boardModify.js"></script>
</html>