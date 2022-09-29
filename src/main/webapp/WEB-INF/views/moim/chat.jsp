<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>모임 TALK</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
</head>
<style>
.chattr {
	border: 0;
}
</style>
<body>
	<c:if test="${session.userid == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("/user/login");
		</script>
	</c:if>

	<!-- Page Wrapper -->
	<div id="page-wrapper" style="padding: 0px;">

		<!-- Wrapper -->
		<div id="wrapper">
			<section id="main" class="main">
				<div class="inner">
					<div>
						<div>
							<div style="text-align: center;">
								<h1>
									<strong>${moim.moimname}</strong><span
										style="color: #57B1B7; font-size: 0.5em;"> TALK</span>
								</h1>
							</div>
							<div>
								<input type="button" id="reStartChat" value="채팅 나가기"
									onclick="window.close();"
									style="width: 100%; padding: 0 7px; margin-bottom: 5px; border: 1px solid #8C8D84;">
							</div>
						</div>
						<div
							style="overflow: scroll; overflow-x: hidden; width: 100%; height: 530px; border: 1px solid #8C8D84;"
							id="chatting"></div>
						<table>
							<tr>
								<td
									style="vertical-align: middle; width: 80%; border-right: 1px solid #8C8D84; border-left: 2px solid #8C8D84; border-bottom: 1px solid #8C8D84;">
									<textarea placeholder="Contents" rows="3" id="moimchatcontents"
										style="resize: none; width: 100%; display: inline-block; height: 100px;"></textarea>
								</td>
								<td
									style="vertical-align: middle; width: 15%; border-right: 1px solid #8C8D84; border-bottom: 1px solid #8C8D84;">
									<input type="button" class="button primary" value="보내기"
									onclick="sendMessage();" style="width: 100%; font-size: 1.5em;" />
								</td>
							</tr>
						</table>
					</div>
				</div>
			</section>
		</div>
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
<script	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script>
	//채팅 리스트
	let chatList;

	$(document).ready(function() {
		getChat();
	});

	//채팅 리스트를 모두 불러오는 함수
	function getChat() {
		let moimnum = "${moim.moimnum}";
		$.ajax({
			url : "/moim/getChatList/" + moimnum,
			type : "Get",
			dataType : "json",
			contentType : "application/json; charset=utf-8",
			success : showList
		});
	}
	function showList(chats) {
		console.log(chats);
		let useridChat = "${session.userid}";
		let str = "";
		chatList = chats.list;
		console.log(chatList);
		if (chatList != null && chatList.length != 0) {
			$
					.each(
							chatList,
							function(index, chat) {
								if (chat.userid == useridChat) {
									str += "<table style='margin:0;border:none;'>";
									str += "	<tr class='chattr'>";
									str += "		<td style='width:30%;padding-top:0px;padding-bottom:0px;'>";
									str += "		</td>";
									str += "		<td style='width:70%;padding-top:0px;padding-bottom:0px;'>";
									str += "			<table bgcolor='white'>";
									str += "				<tr class='chattr'>";
									str += "					<td style='width:75%;padding-top:0px;padding-bottom:0px;'>";
									str += "						<div style='float:right;'>";
									str += "							<div style='color:black;background-color:#F6F99B;border-radius:8px;padding:10px;word-break:break-all;'>";
									str += chat.moimchatcontents;
									str += "							</div>";
									str += "						</div>";
									str += "					</td>";
									str += "					<td style='width:25%;vertical-align:bottom;text-align:left;padding-top:0px;padding-bottom:0px;padding-right:0px;'>";
									str += "						<table>";
									str += "							<tr>";
									str += "								<div style='text-align:left;color:black;font-size:0.7em;'>";
									str += chat.moimchatdate;
									str += "								</div>";
									str += "							</tr>";
									str += "						</table>";
									str += "					</td>";
									str += "				</tr>";
									str += "			</table>";
									str += "		</td>";
									str += "	</tr>";
									str += "</table>";
								} else {
									str += "<table style='margin:0;border:none;'>";
									str += "	<tr class='chattr'>";
									str += "		<td style='width:70%;padding-top:0px;padding-bottom:0px;padding-left:0px;'>";
									str += "			<table bgcolor='white'>";
									str += "				<tr class='chattr'>";
									str += "					<td style='width:19%;vertical-align:bottom;text-align:right;padding-top:0px;padding-bottom:0px;'>";
									str += "						<table style='margin:0px;'>";
									str += "							<tr>";
									str += "								<div style='color:black;font-weight:400;'>";
									str += chat.userid;
									str += "								</div>";
									str += "							</tr>";
									str += "							<tr>";
									str += "								<div style='color:black;font-size:0.7em;'>";
									str += chat.moimchatdate;
									str += "								</div>";
									str += "							</tr>";
									str += "						</table>";
									str += "					</td>";
									str += "					<td style='width:71%;padding-top:0px;padding-bottom:0px;'>";
									str += "						<div style='float:left;'>";
									str += "							<div style='text-align:left;color:black;background-color:#E2E7F0;border-radius:8px;padding:10px;word-break:break-all;'>";
									str += chat.moimchatcontents;
									str += "							</div>";
									str += "						</div>";
									str += "					</td>";
									str += "				</tr>";
									str += "			</table>";
									str += "		</td>";
									str += "		<td style='width:30%;padding-top:0px;padding-bottom:0px;'>";
									str += "		</td>";
									str += "	</tr>";
									str += "</tabel>";
								}
							});
		} else {
			str = "";
		}
		$("#chatting").html(str);
		scrollMove();
	}

	let sock = new SockJS("http://localhost:9090/socket/");
	sock.onopen = onOpen;
	sock.onmessage = onMessage;
	sock.onclose = onClose;

	// 메시지 전송
	function sendMessage() {

		let moimnum = "${moim.moimnum}";
		let moimchatcontents = $("#moimchatcontents").val();
		let userid = "${session.userid}";
		let data = {
			"moimnum" : moimnum,
			"moimchatcontents" : moimchatcontents,
			"userid" : userid
		};

		sock.send(JSON.stringify(data));
		$('#moimchatcontents').val('');

	}

	// 서버로부터 메시지를 받았을 때
	// msg는 소켓에게 받은 메세지 데이터임
	function onMessage(msg) {

		let beforeJson = msg.data;
		let data = JSON.parse(beforeJson);
//		console.log(msg);
//		console.log(data);

		let useridChat = "${session.userid}";

		str = "";

		if (data.userid == useridChat) {
			str += "<table style='margin:0;border:none;'>";
			str += "	<tr class='chattr'>";
			str += "		<td style='width:30%;padding-top:0px;padding-bottom:0px;'>";
			str += "		</td>";
			str += "		<td style='width:70%;padding-top:0px;padding-bottom:0px;'>";
			str += "			<table bgcolor='white'>";
			str += "				<tr class='chattr'>";
			str += "					<td style='width:75%;padding-top:0px;padding-bottom:0px;'>";
			str += "						<div style='float:right;'>";
			str += "							<div style='color:black;background-color:#F6F99B;border-radius:8px;padding:10px;'>";
			str += data.moimchatcontents;
			str += "							</div>";
			str += "						</div>";
			str += "					</td>";
			str += "					<td style='width:25%;vertical-align:bottom;text-align:left;padding-top:0px;padding-bottom:0px;padding-right:0px;'>";
			str += "						<table>";
			str += "							<tr>";
			str += "								<div style='text-align:left;color:black;font-size:0.7em;'>";
			str += data.moimchatdate;
			str += "								</div>";
			str += "							</tr>";
			str += "						</table>";
			str += "					</td>";
			str += "				</tr>";
			str += "			</table>";
			str += "		</td>";
			str += "	</tr>";
			str += "</table>";
		} else {
			str += "<table style='margin:0;border:none;'>";
			str += "	<tr class='chattr'>";
			str += "		<td style='width:70%;padding-top:0px;padding-bottom:0px;padding-left:0px;'>";
			str += "			<table bgcolor='white'>";
			str += "				<tr class='chattr'>";
			str += "					<td style='width:19%;vertical-align:bottom;text-align:right;padding-top:0px;padding-bottom:0px;'>";
			str += "						<table style='margin:0px;'>";
			str += "							<tr>";
			str += "								<div style='color:black;font-weight:400;'>";
			str += data.userid;
			str += "								</div>";
			str += "							</tr>";
			str += "							<tr>";
			str += "								<div style='color:black;font-size:0.7em;'>";
			str += data.moimchatdate;
			str += "								</div>";
			str += "							</tr>";
			str += "						</table>";
			str += "					</td>";
			str += "					<td style='width:71%;padding-top:0px;padding-bottom:0px;'>";
			str += "						<div style='float:left;'>";
			str += "							<div style='text-align:left;color:black;background-color:#E2E7F0;border-radius:8px;padding:10px;'>";
			str += data.moimchatcontents;
			str += "							</div>";
			str += "						</div>";
			str += "					</td>";
			str += "				</tr>";
			str += "			</table>";
			str += "		</td>";
			str += "		<td style='width:30%;padding-top:0px;padding-bottom:0px;'>";
			str += "		</td>";
			str += "	</tr>";
			str += "</tabel>";
		}

		$("#chatting").append(str);
		scrollMove();
	}

	//채팅창에 들어왔을 때(서버와 연결을 시작했을 때)
	function onOpen(evt) {
		scrollMove();
	}

	//채팅창에서 나갈때(서버와 연결을 끊었을 때)
	function onClose(evt) {
		scrollMove();
	}

	// 채팅 스크롤바 최 하단으로 위치시키는 함수
	function scrollMove() {
		$("#chatting").scrollTop($('#chatting')[0].scrollHeight);
	}
</script>
</html>