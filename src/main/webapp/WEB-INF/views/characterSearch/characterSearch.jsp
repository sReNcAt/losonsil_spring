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
            <div class="row" id="mainNotice">
            	<div class="col">
            		<form id="searchForm" class="form-inline">
  						<div class="form-group mb-2">
	                        <input type="text" class="form-control" id="character_name" placeholder="닉네임">
	                    </div>
						<button type="button" class="btn btn-info mb-2" id="btnSearch">검색</button>
                    </form>
            	</div>
            </div>
            <div class="row mb-1">
            </div>
			<div class="row" id="searchContent" style="text-align:center;">
				<div class="col" style="text-align:center;">
					<table class="table table-bordered work-table" id="searchTable" style="width:100%;">
						<colgroup>
							<col width="20%">
							<col width="20%">
							<col width="20%">
							<col width="20%">
							<col width="20%">
						</colgroup>
						<thead>
							<tr>
								<th class="">전투레벨</th>
								<th class="">레벨</th>
								<th class="">닉네임</th>
								<th class="">직업</th>
								<th class="">서버</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
            </div>
        </div>
    </section>
</div>

<%@include file="../layout/footer.jsp" %>
<%@include file="../layout/script.jsp" %>
<%@include file="script.jsp" %>
</html>