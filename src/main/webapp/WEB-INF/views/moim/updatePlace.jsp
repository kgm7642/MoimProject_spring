<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>모임 수정_장소</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/assets/css/moim/updatePlace.css" />
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
						<h1>MODIFY PLACE</h1>
					</header>
					<hr>
					<br>
					<div style="margin: 10px; text-align: center;">
						<h3>① 원하는 장소를 검색한 후 아래 목록에서 선택해주세요.</h3>
					</div>
					<br>
					<div class="map_wrap">
						<div id="map"
							style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

						<div id="menu_wrap" class="bg_white">
							<div class="option">
								<div>
									<form onsubmit="searchPlaces(); return false;">
										<b style="color: black; font-weight: bold;">검색어를 입력해 주세요.</b><input
											type="text" value="${place.placename}" id="keyword" size="15"
											style="color: black; font-weight: bold;">
										<button type="submit"
											style="font-weight: bold; width: 60px; margin: 5px; border: 2px solid #8ED3EF; color: deepskyblue;">검색</button>
									</form>
								</div>
							</div>
							<hr>
							<ul id="placesList"></ul>
							<div id="pagination"></div>
						</div>
					</div>
					<div>
						<hr>
						<div style="margin: 10px; text-align: center;">
							<h3>② 정확한 위치를 설정하기 위해 지도를 클릭해 좌표를 설정해 주세요.</h3>
						</div>
						<div id="clickLatlng1"
							style="display: none; margin: 20px; text-align: center; font-weight: bold; color: #6C747C;">위도
							: 선택 안함</div>
						<div id="clickLatlng2"
							style="display: none; margin: 20px; text-align: center; font-weight: bold; color: #6C747C;">경도
							: 선택 안함</div>
						<br>
					</div>
					<div style="height: 80px; text-align: center;">
						<div id="div2">
							<input id="btnr" type="button" value="현재 선택된 좌표 등록"
								onclick="savelat();"
								style="border: 2px solid #8ED3EF; font-weight: bold;">
						</div>
					</div>
					<form action="/moim/updatePlace" name="placeform" method="post"
						onsubmit="return sendPlace()">
						<input type="hidden" id="moimnum" name="moimnum"
							value="${moimnum}"> <input type="hidden" id="placenum"
							name="placenum" value="${place.placenum}"> <input
							type="hidden" id="placelat" name="placelat" value=""> <input
							type="hidden" id="placelng" name="placelng" value=""> <input
							type="hidden" id="placename" name="placename" value=""> <input
							type="hidden" id="placeroadaddr" name="placeroadaddr" value="">
						<input type="hidden" id="placeaddr" name="placeaddr" value="">
						<input type="hidden" id="placecategoryname"
							name="placecategoryname" value=""> <input type="hidden"
							id="placephone" name="placephone" value="">
						<div style="text-align: center;">
							<hr>
							<div style="width: 100%; display: inline-block;">
								<input type="submit" value="수정완료하기▶"
									style="border: 2px solid #8ED3EF; font-weight: bold;">
							</div>
						</div>
					</form>
				</div>
			</section>
		</div>

		<!-- Footer -->
		<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	</div>
</body>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=608550f7326ed470642f95701b5d006a&libraries=services"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.scrolly.min.js"></script>
<script src="/resources/assets/js/jquery.scrollex.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>
<script src="/resources/assets/js/moim/updatePlace.js"></script>
</html>