<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<html>
<head>
<title>홍보 게시글 상세보기</title>
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
}
</style>
<body class="is-preload">
	<c:if test="${session.userid == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("/user/login");
		</script>
	</c:if>
	<c:if test="${param.modifyCheck == true}">
		<script>
			alert("게시글 수정 완료!");
		</script>
	</c:if>
	<c:if test="${param.modifyCheck == false}">
		<script>
			alert("게시글 수정 실패. 다시 시도해 주세요.");
		</script>
	</c:if>
	<c:if test="${param.writeCheck == true}">
		<script>
			alert("게시글 작성 완료!");
		</script>
	</c:if>
	<c:if test="${param.writeCheck == false}">
		<script>
			alert("게시글 작성 실패. 다시 시도해 주세요.");
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
										<td>💖<a href="/moim/getMoimInfo?moimnum=${moim.moimnum}">${moim.moimname}</a>💖
										</td>
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
									<input type="hidden" id="placelng" name="placelng" value="">
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
					<form action="/moim/proMoimList" method="get" id="backListPage">
						<input type="hidden" name="pagenum" value="${cri.pagenum}">
						<input type="hidden" name="amount" value="${cri.amount}">
						<input type="hidden" name="type" value="${cri.type}"> <input
							type="hidden" name="keyword" value="${cri.keyword}">
					</form>
					<div style="text-align: center;">
						<div style="text-align: left; display: inline-block; width: 49%;">
							<a href="#" id="backList" class="button">목록</a>
						</div>

						<div style="text-align: right; display: inline-block; width: 49%;">
							<c:choose>
								<c:when test="${session.userid == moimrecruit.userid}">
									<input type="button" value="게시글 수정" id="modifyboard"
										onclick="modifyboard();">
									<input type="button" value="삭제" id="removeboard"
										onclick="removeboard();">
								</c:when>
								<c:otherwise>
									<div>
										<div style="text-align: right; margin: 10px;">
											🚨신고 횟수🚨 : <span id="dislikeCnt">${moimrecruit.dislike}</span>
											회
										</div>
										<a href="#" id="cntDislike" class="button"
											style="float: right; padding-right: 10px; padding-left: 18px;">모임
											신고🚨</a>
									</div>
									<a href="#" id="joinMoim" class="button"
										style="margin-right: 10px;">가입 신청</a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div style="margin-top: 50px;"></div>
					<table style="margin: 0px;">
						<tr align="center" align="center"
							style="text-align: center; width: 20%;">
							<td style="width: 10%; vertical-align: center;"><strong>댓
									글</strong></td>
							<td style="width: 79%; vertical-align: center;"><pre
									id="pre2">
												<textarea
										placeholder="타인의 권리를 침해하거나 명예를 훼손하는 댓글은 제재를 받을 수 있습니다."
										name="contents"
										style="resize: none; background-color: #E6E6FA; border: 1px solid #B0C4DE;"></textarea>
											</pre></td>
							<td style="width: 10%; vertical-align: center;"><a href="#"
								class="button primary regist">등록</a></td>
						</tr>
					</table>

					<!-- 댓글 띄우는 div -->
					<div class="replies"></div>

					<!-- 댓글 페이징 처리할 div -->
					<div class="page" style="text-align: center;"></div>
				</div>
			</section>
		</div>

		<!-- Footer -->
		<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

	</div>
</body>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=608550f7326ed470642f95701b5d006a&libraries=services"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<script
	src="https://tistory1.daumcdn.net/tistory/2784544/skin/images/xmltojsonPast.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.dropotron.min.js"></script>
<script src="/resources/assets/js/jquery.scrolly.min.js"></script>
<script src="/resources/assets/js/jquery.scrollex.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	//댓글

	$(document).ready(function() {
		getList(1);
	});

	let check = false;
	let replies = $(".replies");
	let page = $(".page");
	let pagenum = 1;

	function getList(pagenum) {
		let recruitnum = "${moimrecruit.recruitnum}";

		$.ajax({
			url : "/replyP/pages/" + recruitnum + "/" + pagenum,
			type : "GET",
			dataType : "json",
			contentType : "application/json; charset=utf-8",
			success : showList
		});
	}

	function showList(data) {
		//댓글 총 개수
		let replyCnt = data.replyCnt;
		//댓글 리스트
		let list = data.list;
		let str = "";

		for (let i = 0, len = list.length; i < len; i++) {
			str += "<table style='padding:0px;margin:0px;'>";
			str += '<tr>';
			str += '<td style="width:14%;">';
			str += '<strong class="userid'+list[i].replynum+'">'
					+ list[i].userid + '</strong>';
			str += '</td>';
			str += '<td style="width:60%;">';
			str += '<p class="reply'+ list[i].replynum +'">' + list[i].contents
					+ '</p>';
			str += '</td>';
			str += '<td style="width:25%;">';
			str += replyTime(list[i]);
			if (list[i].userid == "${session.userid}") {
				str += '<table style="padding:0px;">'
				str += '<tr style="border:0px;">';
				str += '<td>';
				str += '<a href="'+list[i].replynum+'" class="modify">수정</a>';
				str += '<a href="'+list[i].replynum+'" class="mfinish" style="display:none;">수정완료</a>&nbsp;&nbsp;';
				str += '<a href="'+list[i].replynum+'" class="remove">삭제</a></div>';
				str += '</td>';
				str += '</tr>';
				str += '</table>';
			}
			str += '</td>';
			str += '<tr>';
			str += '</table>';
		}

		//댓글 시간
		function replyTime(reply) {
			let regdate = reply.regdate;
			let updatedate = reply.updatedate;
			let now = new Date();
			let dateObj = new Date(check ? regdate : updatedate);

			//true면 수정 안한거
			let checkUpdate = regdate == updatedate;
			let gap = now.getTime() - dateObj.getTime();

			let str = "";
			if (gap < 1000 * 60 * 60 * 24) {
				let hh = dateObj.getHours();
				let mi = dateObj.getMinutes();
				let ss = dateObj.getSeconds();

				str = (hh > 9 ? '' : '0') + hh + ":" + (mi > 9 ? '' : '0') + mi
						+ ":" + (ss > 9 ? '' : '0') + ss;
			} else {
				let yy = dateObj.getFullYear();
				let mm = dateObj.getMonth() + 1;
				let dd = dateObj.getDate();

				str = yy + '/' + (mm > 9 ? '' : '0') + mm + '/'
						+ (dd > 9 ? '' : '0') + dd;
			}
			return (checkUpdate ? '' : '(수정됨)') + str;
		}

		//댓글 페이징 처리
		showReplyPage(replyCnt);

		replies.html(str);

		//댓글 삭제
		$(".remove").on("click", function(e) {
			e.preventDefault();
			let replynum = $(this).attr("href");
			$.ajax({
				type : "DELETE",
				url : "/replyP/" + replynum,
				success : function(result, status, xhr) {
					alert(replynum + "번 댓글 삭제 완료!");
				},
				error : function(xhr, status, e) {
					alert("댓글 삭제 실패");
				}
			})
			check = false;
			getList(pagenum)
		})

		$(".modify")
				.on(
						"click",
						function(e) {
							e.preventDefault();

							if (!check) {
								let replynum = $(this).attr("href");
								let replytag = $(".reply" + replynum);

								replytag
										.html('<textarea class="'+replynum+' mdf" style="resize:none;">'
												+ replytag.text()
												+ '</textarea>')

								$(this).hide();
								$(this).next().show();

								check = true;
							} else {
								alert("이미 수정중인 댓글이 있습니다!");
							}
						})

		$(".mfinish").on("click", function(e) {
			e.preventDefault();

			let replynum = $(this).attr("href");
			let recruitnum = "${moimrecruit.recruitnum}";
			let userid = $(".userid" + replynum).text();
			let contents = $("." + replynum).val();
			let data = {
				replynum : replynum,
				recruitnum : recruitnum,
				userid : userid,
				contents : contents
			};

			$.ajax({
				type : "PUT",
				url : "/replyP/" + data.replynum,
				data : JSON.stringify(data),
				contentType : "application/json; charset=utf-8",
				success : function(result, status, xhr) {
					alert("댓글 수정 완료");
				},
				error : function(xhr, status, e) {
					alert("댓글 수정 실패");
				}
			})
			check = false;
			getList(pagenum);
		})

		function showReplyPage(replyCnt) {
			let endPage = Math.ceil(pagenum / 5.0) * 5;
			let startPage = endPage - 4;

			let prev = startPage != 1;
			let next = false;

			if (endPage * 5 >= replyCnt) {
				endPage = Math.ceil(replyCnt / 5);
			}
			if (endPage * 5 < replyCnt) {
				next = true;
			}

			let str = "";
			if (prev) {
				str += "<a class='changePage' href='" + (startPage - 1)
						+ "'><code>&lt;</code></a>";
			}
			for (let i = startPage; i <= endPage; i++) {
				if (i == pagenum) {
					str += "<code>" + i + "</code>";
				} else {
					str += "<a class='changePage' href='"+i+"'><code>" + i
							+ "</code></a>"
				}
			}
			if (next) {
				str += "<a class='changePage' href='" + (endPage + 1)
						+ "'><code>&gt;</code></a>";
			}
			page.html(str);

			$(".changePage").on("click", function(e) {
				e.preventDefault();
				let goPage = $(this).attr("href");
				pagenum = parseInt(goPage);
				getList(pagenum);
			})
		}
	}

	//댓글 등록
	$(".regist").on("click", function(e) {

		let recruitnum = "${moimrecruit.recruitnum}";
		let userid = "${session.userid}";
		let contents = $("textarea[name='contents']").val();
		let data = {
			recruitnum : recruitnum,
			userid : userid,
			contents : contents
		};

		if (contents == "") {
			alert("내용을 작성 후 등록해주세요.");
			return;
		}

		$.ajax({
			type : "post",
			url : "/replyP/regist",
			data : JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				alert("댓글 등록 완료");
			},
			error : function(xhr, status, e) {
				alert("댓글 등록 실패");
			}
		})
		$("textarea[name='contents']").val("");
		getList(pagenum);
	})

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
		level : 6, // 이미지 지도의 확대 레벨
		marker : marker
	// 이미지 지도에 표시할 마커 
	};

	// 이미지 지도를 생성합니다
	var staticMap = new kakao.maps.StaticMap(staticMapContainer,
			staticMapOption);

	//목록으로 이동
	let backListPage = $("#backListPage");
	$("#backList").on("click", function(e) {
		e.preventDefault();
		backListPage.submit();
	})

	//홍보 게시글 수정
	function modifyboard() {
		location.href = "/moim/proMoimModify?recruitnum=${moimrecruit.recruitnum}";
	}

	//홍보 게시글 삭제
	function removeboard() {
		location.href = "/moim/proMoimRemove?recruitnum=${moimrecruit.recruitnum}";
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
											location.href = "/moim/adMoimJoin?joinType=pro&moimnum="
													+ $
											{
												moim.moimnum
											}
											;
										} else {
											alert("이미 가입되어 있는 모임입니다.");
										}
									},
									error : function(xhr, status, e) {
									}
								})
					})

	//싫어요 1 증가
	$("#cntDislike").on("click", function(e) {
		e.preventDefault();

		let recruitnum = "${moimrecruit.recruitnum}"
		let dislikeCnt = $("#dislikeCnt");
		let json = {
			"recruitnum" : recruitnum
		};
		$.ajax({
			type : "POST",
			url : "/moim/cntDislike",
			data : JSON.stringify(json),
			contentType : "application/json",
			success : function(result, status, xhr) {
				dislikeCnt.html(result);
			},
			error : function(xhr, status, e) {
			}
		})
	})
</script>
</html>