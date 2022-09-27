<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<nav id="menu">
			<ul class="links">
				<c:if test="${session.userid != 'admin'}">
				<c:choose>
					<c:when test="${session.userid != null}">
						<li><a href="/index/index"><strong>메인화면</strong></a></li>
					</c:when>
					<c:when test="${session.userid == null}">
						<li><a href="/index"><strong>메인화면</strong></a></li>
					</c:when>
				</c:choose>
					<li><a href="/moim/createPlace">모임 생성</a></li>
					<li><a href="/moim/moimList">모임 리스트</a></li>
					<li><a href="/moim/proMoimList">홍보 게시판</a></li>
					<li><a href="/board/boardList">자유 게시판</a></li>
					<li><a href="/notice/noticeList">공지사항</a></li>						
				</c:if>
				<c:if test="${session.userid == 'admin'}">
					<li><a href="/index"><strong>메인화면</strong></a></li>
					<li><a href="/admin/adminMoimList">모임 관리</a></li>
					<li><a href="/admin/adminProMoimList">홍보 게시판 관리</a></li>
					<li><a href="/admin/adminBoardList">게시판 관리</a></li>
					<li><a href="/admin/adminNoticeList">공지사항 관리</a></li>
				</c:if>
			</ul>
			<ul class="actions stacked">
				<c:if test="${session.userid == null}">
					<li><a href="/user/join" class="button primary fit">회원가입</a></li>
					<li><a href="/user/login" class="button fit">로그인</a></li>
				</c:if>
				<c:if test="${session.userid != null }">
					<li><a href="/user/myPageIndex" class="button primary fit">마이페이지</a></li>
					<li><a href="/user/logout" class="button fit">로그아웃</a></li>
				</c:if>
			</ul>
		</nav>