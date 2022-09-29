<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<title>모임 상세 정보</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/assets/css/moim/getMoimInfo.css" />
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
									<h2 style="text-align: center;">
										INFO
										<c:if test="${session.userid == moim.userid}">
											<input type="button" value="정보 수정" id="placeUpdate"
												onclick="location.href='/moim/updateMoim?moimnum='+${moim.moimnum}">
										</c:if>
									</h2>
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
											<td>${moim.moimbudget}원</td>
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
									<h2 style="text-align: center;">
										WHERE
										<c:if test="${session.userid == moim.userid}">
											<input type="button" value="장소 수정" id="moimUpdate"
												onclick="location.href='/moim/updatePlace?moimnum='+${moim.moimnum}">
										</c:if>
									</h2>
									<div id="staticMap" style="width: 100%; height: 410px;"></div>
									<div>
										<input type="hidden" id="placenum" name="placenum" value="">
										<input type="hidden" id="placelat" name="placelat" value="">
										<input type="hidden" id="placelng" name="placelng" value="">
										<input type="hidden" id="placename" name="placename" value="">
										<input type="hidden" id="placeaddr" name="placeaddr" value="">
										<input type="hidden" id="placeroadaddr" name="placeroadaddr"
											value=""> <input type="hidden" id="name"
											name="moimnum" value="${moim.moimnum}">
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
											<td style="background-color: #E0EDF2"><strong>닉
													네 임(아 이 디)</strong></td>
											<td style="background-color: #E0EDF2"><strong>이
													메 일</strong></td>
											<td style="background-color: #E0EDF2"><strong>TOGETHER
													가 입 일</strong></td>
										</tr>
										<c:forEach items="${members}" var="member">
											<tr style="text-align: center;">
												<c:choose>
													<c:when test="${moim.userid == member.userid}">
														<td>👑${member.usernickname}(${member.userid})</td>
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
						<div style="text-align: center;">
							<c:if test="${session.userid == moim.userid}">
								<input type="button" class="button primary" value="모임 신청 관리"
									onclick="applyjoin()">
								<input type="button" value="모임 멤버 관리"
									onclick="location.href='/moim/manageMember?moimnum='+${moim.moimnum}">
								<input type="button" class="button primary" value="모임 취소"
									onclick="cancel()">
							</c:if>
							<input type="button" class="button primary" value="내 모임"
								onclick="location.href='/moim/myMoimAll?userid=${session.userid}'">
							<input type="button" value="채팅 입장" onclick="goChat()">
							<c:if test="${session.userid != moim.userid}">
								<a href="#" id="joinMoim" class="button"
									style="margin-right: 10px;">가입 신청</a>
								<input type="hidden" id="checkjoin">
							</c:if>
							<c:forEach items="${members}" var="member">
								<c:if
									test="${session.userid == member.userid && session.userid != moim.userid}">
									<input type="button" value="모임 탈퇴"
										onclick="location.href='/moim/outMoim?moimnum=${moim.moimnum}&userid=${session.userid}'">
								</c:if>
							</c:forEach>
						</div>
						<hr>
						<div>
							<div style="text-align: right; margin: 10px;">
								🚨신고 횟수🚨 : <span id="dislikeCnt">${moim.dislike}</span>
								회&nbsp;&nbsp;&nbsp;
								<c:if test="${session.userid != moim.userid}">
									<a href="#" id="cntDislike" class="button primary"
										style="float: right; padding-right: 10px; padding-left: 18px;">모임
										신고🚨</a>
								</c:if>
								<input type="button" value="목록으로"
									onclick="location.href='/moim/moimList'" style="float: left;">
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
<script	src="https://tistory1.daumcdn.net/tistory/2784544/skin/images/xmltojsonPast.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/jquery.dropotron.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$("#cntDislike").on("click", function(e) {
		e.preventDefault();

		let moimnum = "${moim.moimnum}"
		let dislikeCnt = $("#dislikeCnt");
		let json = {
			"moimnum" : moimnum
		};
		$.ajax({
			type : "POST",
			url : "/moim/cntDislike",
			data : JSON.stringify(json),
			contentType : "application/json",
			success : function(result, status, xhr) {
				console.log(result);
				dislikeCnt.html(result);
			},
			error : function(xhr, status, e) {
			}
		})
	})

	function cancel() {
		if (confirm("정말 취소하시겠습니까?")) {
			location.href = "/moim/cancelMoim?moimnum=${moim.moimnum}&placenum=${place.placenum}"
		}
	}

	//이미 모임 회원인지 확인 후 가입신청서 작성 페이지 이동
	$("#joinMoim")
			.on(
					"click",
					function(e) {
						e.preventDefault();
						let moimnum = "${moim.moimnum}"
						let userid = "${session.userid}"
						let json = {
							"userid" : userid,
							"moimnum" : moimnum
						};

						$
								.ajax({
									type : "POST",
									url : "/moim/checkAlreadyJoin",
									data : JSON.stringify(json),
									contentType : "application/json",
									success : function(result, status, xhr) {
										console.log(result);
										if (result == "success") {
											location.href = "/moim/adMoimJoin?joinType=search&moimnum="+ ${moim.moimnum};
										} else {
											alert("이미 가입되어 있는 모임입니다.");
										}
									},
									error : function(xhr, status, e) {
									}
								}

								)
					})

	//채팅방으로 이동하는 함수
	function goChat() {
		window.open("/moim/chat?moimnum=${moim.moimnum}", "chat",
				"width=700,height=900");
	}

	//가입 신청 관리 페이지 이동하는 함수
	function applyjoin() {
		window.open("/moim/applyMoimInfo?moimnum=${moim.moimnum}", "apply",
				"width=700,height=700");
	}

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
</script>
</html>