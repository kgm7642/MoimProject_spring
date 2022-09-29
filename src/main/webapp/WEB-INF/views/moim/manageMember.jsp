<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>강퇴 멤버 관리</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/assets/css/moim/manageMember.css" />
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

		<div class="wrapper">
			<section id="main" class="main">
				<div class="inner">
					<header class="major">
						<h1 class="home">멤버 관리</h1>
					</header>
					<hr>
					<!-- 게시글 띄우는 테이블 -->
					<div class="table-wrapper"
						style="width: 70%; margin-left: auto; margin-right: auto;">
						<c:if test="${session.userid == moim.userid}">
							<table>
								<tr style="text-align: center;">
									<td width="30%"><strong>닉네임(아이디)</strong></td>
									<td width="30%"><strong>전화번호</strong></td>
									<td width="25%"><strong>강퇴</strong></td>
								</tr>
								<c:forEach items="${members}" var="member">
									<tr style="text-align: center;">
										<td width="30%">${member.usernickname}(${member.userid})</td>
										<td width="30%"><c:if test="${member.useremailopen == 1}">												
														${member.useremail}
													</c:if> <c:if test="${member.useremailopen == 0}">
														비 공 개
													</c:if></td>
										<c:choose>
											<c:when test="${member.userid == moim.userid}">
												<td><span style="font-size: 2em;">👑</span></td>
											</c:when>
											<c:otherwise>
												<td width="25"><a class="fire button primary"
													href="${member.userid}">쫒아내기</a></td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
							</table>
						</c:if>
					</div>
					<div style="text-align: center;">
						<a href="/moim/getMoimInfo?moimnum=${moim.moimnum}"
							class="button primary">모임정보로 돌아가기</a>
					</div>
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
<script src="/resources/assets/js/main.js"></script>
<script>
	$(".fire").on("click", function(e) {
		e.preventDefault();
		let joindetail = window.open("/moim/fireMessage?userid="+$(this).attr('href')+"&moimnum=${moim.moimnum}",
				"fireMessage", "width=1000,height=1000,left=0,right=0")
	})
</script>
</html>