<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>공지사항 수정 [admin]</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/assets/css/admin/adminNoticeModify.css" />
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
					<form method="post" name="noticeForm"
						action="/admin/adminNoticeModify" onsubmit="return sendit()">
						<input type="hidden" value="${notice.noticenum}" name="noticenum">
						<input type="hidden" value="${notice.userid}" name="userid">
						<!-- 게시글 작성하는 인풋들 배치 테이블 -->
						<table border="1" style="border-collapse: collapse;">
							<tr height="30px">
								<th align="center" width="150px">수정 할 제목</th>
								<td><input type="text" value="${notice.noticetitle}"
									name="noticetitle"></td>
							</tr>
							<tr height="30px">
								<th align="center" width="150px">글쓴이</th>
								<td>${notice.userid}</td>
							</tr>
							<tr height="300px">
								<th align="center" width="150px">내 용</th>
								<td><textarea name="contents"
										style="height: 250px; resize: none;">${notice.contents}</textarea>
								</td>
							</tr>
						</table>
						<br>
						<table class="btn_area">
							<tr align="right" valign="middle">
								<td><input type="submit" class="button primary"
									value="수정완료" style="float: right;"> <a
									class="button primary"
									href="/admin/adminNoticeList${cri.listLink}"
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

<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.scrolly.min.js"></script>
<script src="/resources/assets/js/jquery.scrollex.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/assets/js/main.js"></script>
<script src="/resources/assets/js/admini/adminNoticeModify.js"></script>
</html>