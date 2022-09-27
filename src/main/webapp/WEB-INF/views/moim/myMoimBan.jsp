<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>나의 모임(강퇴된 모임)</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<style>
table {
	border-collapse: initial;
	width: 100%;
	border: 1px solid #8e8e8e;
	table-layout: fixed;
	text-align: center;
}

table.pagination {
	border: 0px solid;
	background-color: #ffffff;
}

.todaymoim {
	background-color: #7fa4e5;
	color: black;
	cursor: pointer;
}

.ingmoim {
	background-color: #c6e0eb;
	color: black;
	cursor: pointer;
}

.willmoim {
	background-color: #fdf8b4;
	color: black;
	cursor: pointer;
}

.endmoim {
	background-color: #c4c9d3;
	color: black;
	cursor: pointer;
}

td {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
</style>
</head>
<body class="is-preload">
	<c:if test="${session.userid == null}">
		<script>
         alert("로그인 후 이용하세요!");
         location.replace("/user/login");
      </script>
	</c:if>
	<jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

	<!-- Page Wrapper -->
	<div id="page-wrapper">

		<!-- Header -->
		<%@ include file="/WEB-INF/views/inc/header.jsp"%>

		<!-- Menu -->
		<%@ include file="/WEB-INF/views/inc/menu.jsp"%>


		<section id="banner" data-video="/resources/assets/css/images/banner">
			<div class="inner">
				<header>
					<h1>모임 강퇴 메세지</h1>
				</header>
			</div>
			<c:if test="${session.userid != null}">
				<a href="#wrapper" class="more">Learn More</a>
			</c:if>
			<video src="/resources/assets/css/images/banner.mp4" muted autoplay
				loop playsinline></video>
		</section>

		<!-- Wrapper -->
		<div id="wrapper">

			<!-- Main -->
			<section id="main" class="main"
				style="border: 0px; padding-bottom: 0px;">
				<div class="inner">
					<div style="margin: 10px;">
						<h2>${session.userid}님의 강퇴된 모임</h2>
					</div>
					<c:choose>
						<c:when test="${Firelist.size()>0 and Firelist != null}">
							<table class="fire">
								<tr align="center" valign="middle">
									<th width="20%"
										style="text-align: center; padding: 12px; background-color: #E0EDF2">모임명</th>
									<th width="60%"
										style="text-align: center; padding: 12px; background-color: #E0EDF2">강퇴메세지</th>
									<th width="20%"
										style="text-align: center; padding: 12px; background-color: #E0EDF2"></th>
								</tr>
								<c:forEach var="ban" items="${Firelist}">
									<tr>
										<td width="20%" style="text-align: center; padding: 12px;">${ban.moimname}</td>
										<td width="60%" style="text-align: center; padding: 12px;">
											<c:if test="${ban.message == null}">
												<strong>없음</strong>
											</c:if> <c:if test="${ban.message != null}">
												<strong>${ban.message}</strong>
											</c:if>
										</td>
										<td width="20%" style="text-align: center; padding: 12px;">
											<a class="button primary fit BanDelete" href="${ban.bannum}">확인(삭제)</a>
										</td>
									</tr>
								</c:forEach>
							</table>
						</c:when>
						<c:otherwise>
							<div style="text-align: center;">
								<strong>어떤 모임에서도 강퇴되지 않았습니다.</strong>
							</div>
						</c:otherwise>
					</c:choose>


					<!-- 페이징 처리 -->
					<div style="text-align: center; padding: 0px; border: 0px;">
						<c:if test="${pageMaker.prev}">
							<a href="${pageMaker.startPage-1}" class="pageChange">&lt;</a>
						</c:if>
						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="i">
							<c:choose>
								<c:when test="${pageMaker.cri.pagenum == i}">
									<code>${i}</code>
								</c:when>
								<c:otherwise>
									<a href="${i}" class="pageChange"><code>${i}</code></a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<a href="${pageMaker.endPage+1}" class="pageChange">&gt;</a>
						</c:if>
					</div>
				</div>

				<form id="pageForm" name="pageForm" method="get"
					action="/moim/myMoimBan">
					<input type="hidden" name="userid" value="${session.userid}">
					<input type="hidden" name="pagenum"
						value="${pageMaker.cri.pagenum}"> <input type="hidden"
						name="amount" value="${pageMaker.cri.amount}"> <input
						type="hidden" name="type" value="${pageMaker.cri.type}"> <input
						type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
				</form>

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
<script>
   		//페이징 처리
		let pageForm = $("#pageForm");
		$(".pageChange").on("click", function(e){
			e.preventDefault();
			
			pageForm.find("input[name='pagenum']").val($(this).attr("href"))
			pageForm.submit();
		})
		
		// 강퇴 메세지 삭제
		let BanForm = $("#BanForm");
		$(".BanDelete").on("click", function(e){
			e.preventDefault();
			
			let bannum = $(this).attr('href');
			let json = {"bannum":bannum}
			$.ajax(
					{
						type:"POST",
						url:"/moim/deleteMessage",
						data:JSON.stringify(json),
						contentType: "application/json",
						success:function(result,status,xhr){
							console.log(result);
							if(result == "success"){
								location.reload();
							}
						},
						error:function(xhr,status,e){
							alert("에러 발생");
						}
					}		
				)
		})		
		
  	</script>
</html>