<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<c:set var="today" value="<%=new Date()%>"/>
<fmt:formatDate value="${today}" type="DATE" pattern="yyyy-MM-dd" var="today" />
<c:set var="tomorrow" value="<%=new Date(new Date().getTime() + 60*60*24*1000)%>"/>
<fmt:formatDate value="${tomorrow}" type="DATE" pattern="yyyy-MM-dd" var="tomorrow" />
<c:set var="yesterday" value="<%=new Date(new Date().getTime() - 60*60*24*1000)%>"/>
<fmt:formatDate value="${yesterday}" type="DATE" pattern="yyyy-MM-dd" var="yesterday" />
<c:set var="sevenDaysAgo" value="<%=new Date(new Date().getTime() - 60*60*24*7*1000)%>"/>
<fmt:formatDate value="${sevenDaysAgo}" type="DATE" pattern="yyyy-MM-dd" var="sevenDaysAgo" />

<%@include file="../layout/header.jsp" %>
<div id="index">
    <section class="page-section portfolio" id="picture">
		<%@include file="../layout/banner.jsp" %>
		<div class="container">
		    <div id="mainContent">
		        <h5 class="text-center text-uppercase mb-0">회원가입</h5>
		
		        <div class="divider-custom">
		            <div class="divider-custom-line"></div>
		            <div class="divider-custom-icon">
		                <i class="fas fa-star"></i>
		            </div>
		            <div class="divider-custom-line"></div>
		        </div>
		    </div>
		    <form id="form">
		        <div id="signupContent" style="">
		            <div class="form-group">
		                <label for="user_name">아이디</label>
		                <input type="text" class="form-control" name="user_name" id="user_name">
		            </div>
		            <div class="form-group">
		                <label for="user_pw">비밀번호</label>
		                <input type="password" class="form-control" name="user_pw" id="user_pw">
		            </div>
		            <button type="button" class="btn btn-secondary float-right" id="signupBtn">가입</button>
		        </div>
                <h6>비밀번호는 SHA로 암호화됩니다.</h6>
		    </form>
		</div>
    </section>
</div>

<%@include file="../layout/footer.jsp" %>
<%@include file="../layout/script.jsp" %>
<%@include file="script.jsp" %>
</html>