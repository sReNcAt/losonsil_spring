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
            <div id="mainNotice">
                <span style="color:#999"><h6>NOTICE</h6></span>
                Last commit : 2020-10-29<br>
            </div>
            <div id="mainContent">
			</div>
        </div>
    </section>
</div>

<%@include file="../layout/footer.jsp" %>