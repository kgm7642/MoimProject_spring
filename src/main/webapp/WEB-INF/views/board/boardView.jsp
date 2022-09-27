<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>게시글 상세보기</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<title>Together</title>
</head>
<style>
.replyCss {
	padding: 0px;
	overflow: auto;
	white-space: pre-wrap;
	word-break: break-all;
}
</style>
<body>
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
	<c:if test="${not empty param.reply}">
		<c:set var="t" value="${param.reply}" />
		<c:choose>
			<c:when test="${t=='CT'}">
				<script>
					alert("댓글 작성 성공!");
				</script>
			</c:when>
			<c:when test="${t=='CF'}">
				<script>
					alert("댓글 작성 실패!");
				</script>
			</c:when>
			<c:when test="${t=='UT'}">
				<script>
					alert("댓글 수정 성공!");
				</script>
			</c:when>
			<c:when test="${t=='UF'}">
				<script>
					alert("댓글 수정 실패!");
				</script>
			</c:when>
			<c:when test="${t=='DT'}">
				<script>
					alert("댓글 삭제 성공!");
				</script>
			</c:when>
			<c:when test="${t=='DF'}">
				<script>
					alert("댓글 삭제 실패!");
				</script>
			</c:when>
		</c:choose>
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
							<td><h1>${board.boardtitle}</h1></td>
						</tr>
					</table>
					<table class="board_area">
						<tr>
							<th align="center" style="text-align: center; width: 20%;">
								작성자</th>
							<td><input type="hidden" name="boardtitle" size="65"
								readonly value="${board.boardtitle}"> ${board.userid}</td>
						</tr>
						<tr>
							<th align="center" align="center"
								style="text-align: center; width: 20%;">카테고리</th>
							<td><c:choose>
									<c:when test="${board.category == 1}">여행</c:when>
									<c:when test="${board.category == 2}">스터디</c:when>
									<c:when test="${board.category == 3}">동호회</c:when>
									<c:when test="${board.category == 4}">취미</c:when>
									<c:when test="${board.category == 5}">운동</c:when>
									<c:when test="${board.category == 6}">친구</c:when>
									<c:when test="${board.category == 7}">취업</c:when>
									<c:when test="${board.category == 8}">크루</c:when>
									<c:when test="${board.category == 9}">연애</c:when>
									<c:when test="${board.category == 10}">상담</c:when>
								</c:choose></td>
						</tr>
						<tr>
							<th align="center" align="center"
								style="text-align: center; width: 20%;">내 용</th>
							<td><textarea style="height: 700px; resize: none;" readonly>${board.contents}</textarea>
							</td>
						</tr>
					</table>
					<br>
					<table class="btn_area">
						<tr align="right" valign="middle">
							<td><c:if test="${board.userid == session.userid }">
									<a class="button small"
										href="/board/boardRemove?boardnum=${board.boardnum}"
										style="float: right; margin-left: 20px;">삭제</a>
									<a class="button primary small"
										href="/board/boardModify?boardnum=${board.boardnum}"
										style="float: right;">수정</a>
								</c:if> <a class="button small" href="/board/boardList${cri.listLink}"
								style="float: left;">목록</a></td>
						</tr>
					</table>

					<!-- 좋아요, 싫어요 -->
					<div style="text-align: center;">
						<a id="likeCnt" style="cursor: pointer; text-decoration: none;">💖${board.likes}</a>
						<a id="dislikeCnt" style="cursor: pointer; text-decoration: none;">💔${board.dislike}</a>
					</div>

					<div style="margin-top: 50px;"></div>
					<table style="margin: 0px;">
						<tr align="center" align="center"
							style="text-align: center; width: 20%;">
							<td style="width: 10%; vertical-align: middle;"><strong>댓글</strong>
							</td>
							<td style="width: 79%; vertical-align: middle;"><pre
									id="pre2" style="margin: 0px;">
										<textarea
										placeholder="타인의 권리를 침해하거나 명예를 훼손하는 댓글은 제재를 받을 수 있습니다."
										name="contents"
										style="resize: none; background-color: #E6E6FA; border: 1px solid #B0C4DE;"></textarea>
									</pre></td>
							<td style="width: 10%; vertical-align: middle;"><a href="#"
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
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.scrolly.min.js"></script>
<script src="/resources/assets/js/jquery.scrollex.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>
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
		let boardnum = "${board.boardnum}";

		$.ajax({
			url : "/replyB/pages/" + boardnum + "/" + pagenum,
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
			str += '<td style="width:14%;vertical-align:middle;">';
			str += '<strong class="userid'+list[i].replynum+'">'
					+ list[i].userid + '</strong>';
			str += '</td>';
			str += '<td style="width:60%;vertical-align:middle;">';
			str += '<p class="replyCss reply' + list[i].replynum
					+ '"" style="width:100%;margin:0px;hegiht:auto;">'
					+ list[i].contents + '</p>';
			str += '</td>';
			str += '<td style="width:25%;vertical-align:middle;">';
			str += '<span>' + replyTime(list[i]) + '</span>';
			if (list[i].userid == "${session.userid}") {
				str += '<table style="padding:0px;">'
				str += '<tr style="border:0px;">';
				str += '<td style="vertical-align:middle;">';
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
				url : "/replyB/" + replynum,
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
			let boardnum = "${board.boardnum}";
			let userid = $(".userid" + replynum).text();
			let contents = $("." + replynum).val();
			let data = {
				replynum : replynum,
				boardnum : boardnum,
				userid : userid,
				contents : contents
			};

			$.ajax({
				type : "PUT",
				url : "/replyB/" + data.replynum,
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

		let boardnum = "${board.boardnum}";
		let userid = "${session.userid}";
		let contents = $("textarea[name='contents']").val();
		let data = {
			boardnum : boardnum,
			userid : userid,
			contents : contents
		};

		if (contents == "") {
			alert("내용을 작성 후 등록해주세요.");
			return;
		}

		$.ajax({
			type : "post",
			url : "/replyB/regist",
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

	//좋아요
	$("#likeCnt").on("click", function(e) {
		e.preventDefault();

		let boardnum = "${board.boardnum}"
		let json = {
			"boardnum" : boardnum,
		};
		$.ajax({
			type : "POST",
			url : "/board/likeCnt",
			data : JSON.stringify(json),
			contentType : "application/json",
			success : function(result, status, xhr) {
				$("#likeCnt").html("💖" + result);
			},
			error : function(xhr, status, e) {
			}
		})
	})

	//싫어요
	$("#dislikeCnt").on("click", function(e) {
		e.preventDefault();

		let boardnum = "${board.boardnum}"
		let json = {
			"boardnum" : boardnum,
		};
		$.ajax({
			type : "POST",
			url : "/board/dislikeCnt",
			data : JSON.stringify(json),
			contentType : "application/json",
			success : function(result, status, xhr) {
				$("#dislikeCnt").html("💔" + result);
			},
			error : function(xhr, status, e) {
			}
		})
	})
</script>
</html>




