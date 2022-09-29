<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>홍보 게시글 작성</title>
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
						<h1>홍보 글쓰기</h1>
					</header>
					<form action="/moim/proMoimWrite" onsubmit="return sendit()"
						method="post">
						<div style="width: 100%; margin: 20px auto; text-align: center;">
							<div style="width: 15%; display: inline-block; color: black;">모임
								선택</div>
							<c:choose>
								<c:when test="${myMoimList.size()>0 and myMoimList != null }">
									<select name="moimnum"
										style="width: 80%; display: inline-block; border-color: black;">
										<c:forEach var="myMoimList" items="${myMoimList}">
											<option value="${myMoimList.moimnum}" selected>${myMoimList.moimname}</option>
										</c:forEach>
									</select>
								</c:when>
								<c:otherwise>
									<select name="moimselect"
										style="width: 80%; display: inline-block; border-color: black;">
										<option value="모임 없음" selected>모임 없음</option>
									</select>
								</c:otherwise>
							</c:choose>
						</div>
						<hr>
						<div style="width: 100%; margin: 20px auto; text-align: center;">
							<div style="width: 15%; display: inline-block; color: black;">제목</div>
							<div style="width: 80%; display: inline-block;">
								<input type="text" id="recruittitle" name="recruittitle"
									style="border-color: black;">
							</div>
						</div>
						<hr>
						<div style="width: 100%; margin: 20px auto; text-align: center;">
							<div style="width: 15%; display: inline-block; color: black;">작성자</div>
							<div style="width: 80%; display: inline-block;">
								<input type="text" name="userid" style="border-color: black;"
									value="${session.userid}" readonly>
							</div>
						</div>
						<hr>
						<div style="width: 100%; margin: 20px auto; text-align: center;">
							<div style="width: 15%; display: inline-block; color: black;">내용</div>
							<div style="width: 80%; display: inline-block;">
								<textarea onkeyup="checkWord(this, 4000)" id="recruitcontents"
									name="recruitcontents"
									style="resize: none; maxlength: 1000; border-color: black; height: 500px;"></textarea>
							</div>
						</div>
						<hr>
						<div style="width: 100%; margin: 20px auto; text-align: center;">
							<div
								style="border: 2px solid deepskyblue; font-weight: bold; float: right;">
								<input type="submit" value="작성 완료">
							</div>
						</div>
					</form>
				</div>
			</section>
		</div>
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
<script src="/resources/assets/js/moim/proMoimWrite.js"></script>
</html>