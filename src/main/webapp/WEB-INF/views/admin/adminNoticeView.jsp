<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항 상세보기 [admin]</title>
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
	<c:if test="${param.modifyCheck == true}">
		<script>
			alert("공지사항 수정 완료!");
		</script>
	</c:if>
	<c:if test="${param.modifyCheck == false}">
		<script>
			alert("공지사항 수정 실패. 다시 시도해 주세요.");
		</script>
	</c:if>
	<c:if test="${param.writeCheck == true}">
		<script>
			alert("공지사항 작성 완료!");
		</script>
	</c:if>
	<c:if test="${param.writeCheck == false}">
		<script>
			alert("공지사항 작성 실패. 다시 시도해 주세요.");
		</script>
	</c:if>
	<c:if test="${param.removeCheck == true}">
		<script>
			alert("공지사항 삭제 완료!");
		</script>
	</c:if>
	<c:if test="${param.removeCheck == false}">
		<script>
			alert("공지사항 삭제 실패. 다시 시도해 주세요.");
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
							<td><h1>${notice.noticetitle}</h1></td>
						</tr>
					</table>
					<table class="board_area">
						<tr>
							<th align="center" style="text-align: center; width: 20%;">
								작성자</th>
							<td><input type="hidden" name="boardtitle" size="65"
								readonly value="${notice.noticetitle}"> ${notice.userid}
							</td>
						</tr>
						<tr>
							<th align="center" align="center"
								style="text-align: center; width: 20%;">카테고리</th>
							<td>공지사항</td>
						</tr>
						<tr>
							<th align="center" align="center"
								style="text-align: center; width: 20%;">내 용</th>
							<td><textarea name="contents"
									style="height: 700px; resize: none;" readonly>${notice.contents}</textarea>
							</td>
						</tr>
					</table>
					<br>
					<table class="btn_area">
						<tr align="right" valign="middle">
							<td><c:if test="${notice.userid == session.userid }">
									<a class="button small"
										href="/admin/removeAdminNotice?noticenum=${notice.noticenum}"
										style="float: right; margin-left: 20px;">삭제</a>
									<a class="button primary small"
										href="/admin/adminNoticeModify?noticenum=${notice.noticenum}"
										style="float: right;">수정</a>
								</c:if> <a class="button small"
								href="/admin/adminNoticeList${cri.listLink}"
								style="float: left;">목록</a></td>
						</tr>
					</table>
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




