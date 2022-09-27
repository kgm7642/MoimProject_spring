<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버 강퇴 메세지 작성</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />

</head>
<body class="is-preload">
	<c:if test="${session.userid == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("/user/login");
		</script>
	</c:if>
	<div id="page-wrapper">

		<!-- Main -->

		<div id="main">
			<section id="main" class="main">
				<div class="wrapper">

					<div class="inner">
						<header class="major">
							<h1 class="home">방출사유</h1>
						</header>
						<div class="col-12">
							<div class="col-12" style="text-align: center;">
								<h2>강퇴 아이디</h2>
								<input name="userid" type="text"
									style="text-align: center; margin: 0px; border: 0px;"
									value="${fire.userid}" readonly>
							</div>
							<hr>
							<div class="col-12" style="text-align: center;">
								<h2>내용</h2>
								<textarea name="message" rows="10" style="resize: none;"
									placeholder="메세지 작성 안해도 전송 가능"></textarea>
							</div>
							<hr>
							<div class="col-12" style="text-align: center;">
								<input type="button" value="보내기" class="primary large send">
							</div>
							<hr>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</body>
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.dropotron.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>
<script src="/resources/assets/js/reply.js"></script>
<script>
	$(".send").on("click", function(e) {
		let moimnum = "${fire.moimnum}";
		let userid = "${fire.userid}";
		let message = $("textarea[name='message']").val();
		let json = {
			"moimnum" : moimnum,
			"userid" : userid,
			"message" : message
		}
		$.ajax({
			type : "POST",
			url : "/moim/fireMessage",
			data : JSON.stringify(json),
			contentType : "application/json",
			success : function(result, status, xhr) {
				console.log(result);
				if (result == "success") {
					opener.document.location.reload();
					window.close();
				} else {
					alert("멤버 강퇴에 실패했습니다. 다시 시도해주세요.");
					ㅣ
				}
			},
			error : function(xhr, status, e) {
				alert("에러 발생");
			}
		})
	})
</script>
</html>