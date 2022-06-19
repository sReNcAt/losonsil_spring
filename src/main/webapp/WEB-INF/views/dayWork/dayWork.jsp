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
        	<!-- 
            <div class="row" id="mainNotice">
            	<div class="col">
            		<div class="float-left">
	            		<button class="btn btn-sm btn-info" id="addCharacter" data-tear="3">캐릭터 추가</button>
            		</div>
            	</div>
            </div>
             -->
            <div class="row mb-1">
            	<div class="col">
	            	<div class="float-left">
	            		<form class="form-inline">
		            		<div class="form-group">
								<input class="form-control form-control-sm" type="text" name="nowDate" id="nowDate" placeholder="날짜선택">
								<button type="button" class="btn btn-sm btn-info" id="btnSearchDayWork">검색</button>
							</div>
						</form>
					</div>
				</div>
            </div>
			<div class="row" id="workContent" style="text-align:center;">
				<div class="col" style="text-align:center;">
					<table class="table table-bordered work-table" id="dayWorkTable" style="width:100%;">
						<colgroup>
							<col width="10%">
							<col width="30%">
							<col width="30%">
							<col width="30%">
						</colgroup>
						<thead>
							<tr>
								<th class="">#</th>
								<th class="">카오스 던전</th>
								<th class="">가디언 토벌</th>
								<th class="">에포나 의뢰</th>
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