<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="top.jsp" %>

<div id="loadSpinner" style="width:100%;">
	<img src="<c:url value='/resources/assets/img/loader.gif'/>">
</div>
<div id="header" style="width:100%;min-width:320px;min-height:72px;">
    <div style="width:100%;">
        <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="<c:url value='/'/>">로손실</a>
                <button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold btn bg-primary rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                   	메뉴
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                    	<!-- 
                        <li class="nav-item mx-0 mx-lg-1">
                            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="<c:url value='/characterSearch'/>">캐릭터 검색</a>
                        </li>
                         -->
                        <!--
                        <li class="nav-item mx-0 mx-lg-1">
                            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="<c:url value='/character'/>">캐릭터 관리</a>
                        </li>
                        <li class="nav-item mx-0 mx-lg-1">
                            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="<c:url value='/dayWork'/>">일일 숙제</a>
                        </li>
                        <li class="nav-item mx-0 mx-lg-1">
                            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="<c:url value='/weekWork'/>">주간 숙제</a>
                        </li>
                         -->
                        <li class="nav-item mx-0 mx-lg-1">
                            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="<c:url value='/fxxkstone'/>">스톤시뮬</a>
                        </li>
                        
                        <li class="nav-item mx-0 mx-lg-1">
                            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="<c:url value='/imprintCalc'/>">각인계산</a>
                        </li>
                        
                        <li class="nav-item mx-0 mx-lg-1">
                            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="<c:url value='/biakiss'/>">아재절단</a>
                        </li>
                        
                        <li class="nav-item mx-0 mx-lg-1">
                            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="<c:url value='/bingo'/>">쿠크빙고</a>
                        </li>
                        <!-- 
                        <li class="nav-item mx-0 mx-lg-1">
                            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="<c:url value='/calc'/>">분배계산기</a>
                        </li>
                         -->
                        <%
							if (session.getAttribute("user_name") != null) {
						%>
                        <li class="nav-item mx-0 mx-lg-1">
                            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="<c:url value='/auth/logout'/>">LOGOUT</a>
                        </li>
						<%
							} else {
						%>
                        <!-- 
                        <li class="nav-item mx-0 mx-lg-1">
                            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" id="signin" href="#">LOGIN</a>
                        </li>
                         -->
                        <%
							}
						%>
                    </ul>
                </div>
            </div>
        </nav>
        <!--
<nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
<div class="container" style="max-width:500px;">
<div class="row">
<div class="col text-center">
<a class="navbar-brand js-scroll-trigger" href="#page-top">로손실</a>
</div>
</div>
<div class="row">
<div class="col text-center">
<input class="form-control-sm" type="text" name="user_name" id="user_name" value="표스팸">
<button class="btn btn-sm btn-secondary" id="btnSearch">검색</button>
</div>
</div>
</div>
</nav>
-->
    </div>
</div>