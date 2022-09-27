<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>공지사항 작성 [admin]</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
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


		<!-- Banner -->

		<!-- Wrapper -->

		<div id="wrapper">
			<section id="main" class="main">
				<div class="inner">
					<header class="major">
						<h1>공지사항 작성</h1>
						<hr>
					</header>
					<form method="post" name="noticeForm"
						action="/admin/adminNoticeWrite" onsubmit="return sendit()">
						<input type="hidden" name="userid" value="${session.userid}">
						<!-- 게시글 작성하는 인풋들 배치 테이블 -->
						<table border="1" style="border-collapse: collapse;">
							<tr height="30px">
								<th width="150px"><strong>제 목</strong></th>
								<td><input type="text" name="noticetitle" size=100
									maxlength="100" placeholder="제목을 입력하세요"></td>
							</tr>
							<tr height="30px">
								<th width="150px"><strong>작성자</strong></th>
								<td><strong>${session.userid}</strong></td>
							</tr>
							<tr height="300px">
								<th width="150px"><strong>내 용</strong></th>
								<td><textarea name="contents"
										style="height: 250px; resize: none;"></textarea></td>
							</tr>
						</table>
						<br>
						<div style="text-align: center;">
							<input type="submit" class="button primary" value="작성 완료"
								style="float: right;"> <input type="button"
								class="button primary" value="목록"
								onclick="location.href='/admin/adminNoticeList${pageMaker.cri.listLink}'"
								style="float: left;">
						</div>
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
<script src="/resources/assets/js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-1.2.1.js"></script>
<script>
	//유효성 검사
	function sendit() {
		let noticeForm = document.noticeForm;
		let noticetitle = noticeForm.noticetitle;
		let contents = noticeForm.contents;
		let dupTag = document.getElementById("result");
		if (noticetitle.value == "") {
			alert("제목을 입력하세요!");
			noticetitle.focus();
			return false;
		}
		if (contents.value == "") {
			alert("내용을 입력하세요!");
			contents.focus();
			return false;
		}
	}
</script>
</html>