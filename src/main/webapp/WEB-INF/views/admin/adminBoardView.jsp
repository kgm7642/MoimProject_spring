<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>게시글 상세보기 [admin]</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<title>Together</title>
</head>
<body>
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

		<!-- 타이틀과 글 개수 띄워주는 테이블 -->
		<div id="wrapper">
			<section id="main" class="main">
				<div class="inner">
					<table class="title">
						<tr align="center" valign="middle">
							<td><h1>${board.boardtitle}</h1></td>
						</tr>
					</table>
					<table class="board_area">
						<tr>
							<th align="center" style="text-align: center; width: 20%;">
								작성자</th>
							<td><input type="hidden" name="boardtitle" size="65"
								readonly value="${board.boardtitle}"> ${board.userid}</td>
						</tr>
						<tr>
							<th align="center" align="center"
								style="text-align: center; width: 20%;">카테고리</th>
							<td><c:choose>
									<c:when test="${board.category == 1}">여행</c:when>
									<c:when test="${board.category == 2}">스터디</c:when>
									<c:when test="${board.category == 3}">동호회</c:when>
									<c:when test="${board.category == 4}">취미</c:when>
									<c:when test="${board.category == 5}">운동</c:when>
									<c:when test="${board.category == 6}">친구</c:when>
									<c:when test="${board.category == 7}">취업</c:when>
									<c:when test="${board.category == 8}">크루</c:when>
									<c:when test="${board.category == 9}">연애</c:when>
									<c:when test="${board.category == 10}">상담</c:when>
								</c:choose></td>
						</tr>
						<tr>
							<th align="center" align="center"
								style="text-align: center; width: 20%;">내 용</th>
							<td><textarea name="contents"
									style="height: 700px; resize: none;" readonly>${board.contents}</textarea>
							</td>
						</tr>
					</table>
					<div style="text-align: center; width: 100%;">
						<a class="button small"
							style="float: left; display: inline-block;"
							href="/admin/adminBoardList${pageMaker.cri.listLink}">목록</a> <a
							class="button small"
							href="/admin/adminBoardRemove?boardnum=${board.boardnum}"
							style="float: right; margin-left: 20px;">삭제</a>
						<div
							style="float: right; display: inline-block; margin-right: 10px;">
							🚨신고 횟수🚨 : ${board.dislike} 회</div>
					</div>
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
</html>