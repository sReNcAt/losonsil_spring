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
                <h6 style="color:#999">NOTICE</h6>
               	아무것도 책임지지않음<br>
            </div>
            <div id="mainContent">
	            <h5 class="text-center text-uppercase mb-0">여백</h5>
	
	            <div class="divider-custom">
	                <div class="divider-custom-line"></div>
	                <div class="divider-custom-icon">
	                    <i class="fas fa-star"></i>
	                </div>
	                <div class="divider-custom-line"></div>
	            </div>
	
	            <div class="row">
	                <div class="col-md-6 col-lg-4">
	                    <div class="portfolio-item mx-auto">
	                        <p>
	                        	스팸봇 명령어<br>
	                        	%재련<br>
	                        	%마리상점<br>
	                        	%프로필 "캐릭터명"<br>
	                        	%거래소 "아이템명"<br>
	                        </p>
	                    </div>
	                </div>
	            </div>
			</div>
			<div id="searchContent" style="display:none;">
				<table class="table search-table" style="width:100%;">
					<colgroup>
						<col width="15%"><col width="35%">
						<col width="15%"><col width="35%">
					</colgroup>
					<thead>
					</thead>
					<tbody>
						<tr>
							<th class=""></th>
							<td class="search-text c_level">2</td>
							<th class=""></th>
							<td class="search-text user_name">2</td>
						</tr>
						<tr>
							<th class=""></th>
							<td class="search-text server">2</td>
							<th class=""></th>
							<td class="search-text class">2</td>
						</tr>
						<tr>
							<th class=""></th>
							<td class="search-text level">2</td>
							<th class=""></th>
							<td class="search-text w_level">2</td>
						</tr>
						<tr>
							<th class=""></th>
							<td class="search-text guild">2</td>
							<th class=""></th>
							<td class="search-text title">2</td>
						</tr>
						<tr>
							<th class=""></th>
							<td class="search-text area" colspan="3">2</td>
						</tr>
					</tbody>
				</table>
            </div>
        </div>
    </section>
</div>

<%@include file="../layout/footer.jsp" %>
<%@include file="../layout/script.jsp" %>
</html>