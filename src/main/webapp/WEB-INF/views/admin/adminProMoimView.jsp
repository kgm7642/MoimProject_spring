<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<html>
<head>
<title>홍보 게시글 상세보기 [admin]</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
</head>
<style>
#pre1 {
	padding: 0px;
	background-color: #E6E6FA;
	overflow: auto;
	white-space: pre-wrap;
	word-break: break-all;
}

#pre2 {
	padding: 10px;
	overflow: auto;
	white-space: pre-wrap;
	word-break: break-all;
}

td {
	padding: 0px;
	border-spacing: 0 0px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

table {
	table-layout: fixed;
}
</style>
<body class="is-preload">
	<c:set var="page" value="${requestScope.page}" />
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
						<h1>${moimrecruit.recruittitle}</h1>
					</header>
					<div>
						<div style="text-align: center;">
							<div style="float: right;">
								&nbsp;&nbsp;&nbsp;&nbsp;<strong>조회수 :
									${moimrecruit.readcnt}</strong>
							</div>
						</div>
					</div>
					<table style="margin: 0px;">
						<tr>
							<td style="width: 15%;"><strong>작 성 자</strong></td>
							<td style="width: 80%;"><strong>${moimrecruit.userid}</strong>
							</td>
							<td style="width: 4%;"></td>
						</tr>
						<tr>
							<td style="width: 15%;"><strong>내 용</strong></td>
							<td style="width: 80%;"><strong>${moimrecruit.recruitcontents}</strong>
							</td>
							<td style="width: 4%;"></td>
						</tr>
					</table>
					<hr>
					<table>
						<tr>
							<td style="width: 49%;">
								<h2 style="text-align: center;">INFO</h2>
								<table>
									<tr>
										<td>모임 이름</td>
										<td>💖${moim.moimname}💖</td>
									</tr>
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
								</table>
							</td>
							<td style="width: 49%;">
								<h2 style="text-align: center;">WHERE</h2>
								<div id="staticMap" style="width: 100%; height: 350px;"></div> <strong
								style="text-align: center; display: block;">${place.placename}</strong>
								<div>
									<input type="hidden" id="placenum" name="placenum" value="">
									<input type="hidden" id="placelat" name="placelat" value="">
									<input type="hidden" id="placelon" name="placelon" value="">
									<input type="hidden" id="placename" name="placename" value="">
									<input type="hidden" id="placeroadaddr" name="placeroadaddr"
										value=""> <input type="hidden" id="placeaddr"
										name="placeaddr" value=""> <input type="hidden"
										id="placecategoryname" name="placecategoryname" value="">
									<input type="hidden" id="placephone" name="placephone" value="">
									<input type="hidden" name="moimnum" value="${moim.moimnum}">
								</div>
							</td>
						</tr>
					</table>
					<div style="text-align: center; width: 100%;">
						<div style="text-align: left; display: inline-block; width: 49%;">
							<input type="button" value="목록" id="list"
								onclick="adminProMoimlist();">
						</div>
						<div style="text-align: right; display: inline-block; width: 49%;">
							<div style="display: inline-block; margin-right: 20px;">
								🚨신고 횟수🚨 : ${moimrecruit.dislike} 회</div>
							<input type="button" value="게시글 삭제" id="removeboard"
								onclick="removeboard();" style="display: inline-block;">
						</div>
					</div>
				</div>
			</section>
		</div>

		<!-- Footer -->
		<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

	</div>
</body>
<script
	src="https://tistory1.daumcdn.net/tistory/2784544/skin/images/xmltojsonPast.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=608550f7326ed470642f95701b5d006a&libraries=services"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/assets/js/createplace.js"></script>
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.scrolly.min.js"></script>
<script src="/resources/assets/js/jquery.scrollex.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>
<script>
	let placelat = "${place.placelat}"
	let placelng = "${place.placelng}"
	// 이미지 지도에서 마커가 표시될 위치입니다 
	var markerPosition = new kakao.maps.LatLng(placelat, placelng);

	// 이미지 지도에 표시할 마커입니다
	// 이미지 지도에 표시할 마커는 Object 형태입니다
	var marker = {
		position : markerPosition
	};

	var staticMapContainer = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
	staticMapOption = {
		center : new kakao.maps.LatLng(placelat, placelng), // 이미지 지도의 중심좌표
		level : 3, // 이미지 지도의 확대 레벨
		marker : marker
	// 이미지 지도에 표시할 마커 
	};

	// 이미지 지도를 생성합니다
	var staticMap = new kakao.maps.StaticMap(staticMapContainer,
			staticMapOption);

	//게시글 목록
	function adminProMoimlist() {
		location.href = "/admin/adminProMoimList${cri.listLink}";
	}

	//홍보 게시글 삭제
	function removeboard() {
		location.href = "/admin/adminRemovePro?recruitnum=${moimrecruit.recruitnum}";
	}
</script>
</html>