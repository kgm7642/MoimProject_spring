<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<title>모임 관리 [admin]</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/assets/css/admin/adminGetMoimInfo.css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
</head>
<body class="is-preload">
	<c:set var="appkey" value="08d5f583f36357f829d2651be810df95"></c:set>
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
						<h1>${moim.moimname}</h1>
					</header>

					<!-- 모임 정보 띄우는 테이블-->
					<div id="container">
						<table>
							<tr>
								<td style="width: 49%;">
									<h2 style="text-align: center;">INFO</h2>
									<table>
										<tr>
											<td>모임장</td>
											<td>${moim.userid}</td>
										</tr>
										<tr>
											<td>분류</td>
											<td><c:choose>
													<c:when test="${moim.moimtype == 1}">여행</c:when>
													<c:when test="${moim.moimtype == 2}">스터디</c:when>
													<c:when test="${moim.moimtype == 3}">동호회</c:when>
													<c:when test="${moim.moimtype == 4}">취미</c:when>
													<c:when test="${moim.moimtype == 5}">운동</c:when>
													<c:when test="${moim.moimtype == 6}">친구</c:when>
													<c:when test="${moim.moimtype == 7}">취업</c:when>
													<c:when test="${moim.moimtype == 8}">크루</c:when>
													<c:when test="${moim.moimtype == 9}">연애</c:when>
													<c:when test="${moim.moimtype == 10}">상담</c:when>
												</c:choose></td>
										</tr>
										<tr>
											<td>경비</td>
											<td>${moim.moimbudget}</td>
										</tr>
										<tr>
											<td>출발날짜</td>
											<td>${fn:split(moim.startdate," ")[0]}</td>
										</tr>
										<tr>
											<td>끝날짜</td>
											<td>${fn:split(moim.enddate," ")[0]}</td>
										</tr>
										<tr>
											<td>모임 장소</td>
											<td>${place.placename}</td>
										</tr>
									</table>
								</td>
								<td style="width: 49%;">
									<h2 style="text-align: center;">WHERE</h2>
									<div id="staticMap" style="width: 100%; height: 350px;"></div>
									<div>
										<input type="hidden" id="placenum" name="placenum" value="">
										<input type="hidden" id="placelat" name="placelat" value="">
										<input type="hidden" id="placelon" name="placelon" value="">
										<input type="hidden" id="placename" name="placename" value="">
										<input type="hidden" id="placeroadaddr" name="placeroadaddr"
											value=""> <input type="hidden" id="placeaddr"
											name="placeaddr" value=""> <input type="hidden"
											id="placecategoryname" name="placecategoryname" value="">
										<input type="hidden" id="placephone" name="placephone"
											value=""> <input type="hidden" name="moimnum"
											value="${moim.moimnum}">
									</div>
								</td>
							</tr>
						</table>
						<table>
							<tr>
								<td colspan="2">
									<h2 style="text-align: center;">
										<span style="color: #62b2d4;">${moim.moimname}</span> <span
											style="font-size: 0.8em;">MEMBER</span>
									</h2>
									<table>
										<tr style="text-align: center;">
											<td style="background-color: #E0EDF2"><strong>닉	네 임(아 이 디)</strong></td>
											<td style="background-color: #E0EDF2"><strong>전	화 번 호</strong></td>
											<td style="background-color: #E0EDF2"><strong>TOGETHER 가 입 일</strong></td>
										</tr>
										<c:forEach items="${members}" var="member">
											<tr style="text-align: center;">
												<c:choose>
													<c:when test="${moim.userid == member.userid}">
														<td>👑 ${member.userid}</td>
													</c:when>
													<c:otherwise>
														<td>&nbsp;&nbsp;&nbsp;${member.usernickname}(${member.userid})</td>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${member.useremailopen == 1}">
														<td>${member.useremail}</td>
													</c:when>
													<c:otherwise>
														<td>비 공 개</td>
													</c:otherwise>
												</c:choose>
												<td>${member.regdate}</td>
											</tr>
										</c:forEach>
									</table>
								</td>
							</tr>
						</table>
						<div style="text-align: center; margin-top: 20px;">
							<div style="display: inline-block; float: right;">
								<span style="margin-right: 20px;">신고 횟수 : ${moim.dislike}</span>
								<input type="button" class="button primary" value="모임 취소" onclick="cancel()" style="display: inline-block;">
							</div>
							<div style="display: inline-block; float: left">
								<input type="button" value="목록으로"	onclick="location.href='/admin/adminMoimList'">
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>

		<!-- Footer -->
		<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	</div>
</body>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${appkey}&libraries=services,clusterer,drawing"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<script src="https://tistory1.daumcdn.net/tistory/2784544/skin/images/xmltojsonPast.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/jquery.dropotron.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	let placelat = "${place.placelat}"
	let placelng = "${place.placelng}"
</script>
<script src=/resources/assets/js/admin/adminGetMoimInfo.js></script>
</html>