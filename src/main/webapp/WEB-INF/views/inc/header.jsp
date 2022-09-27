<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<header id="header">
			<c:if test="${session.userid != null}">
				<a href="/index/index" class="logo"><span>together ${session.userid}</span></a>
			</c:if>
			<c:if test="${session.userid == null}">
				<a href="/index" class="logo"><span>together ${session.userid}</span></a>
			</c:if>
			<nav>
				<ul>
					<li><a href="#menu">Menu</a></li>
				</ul>
			</nav>
		</header>