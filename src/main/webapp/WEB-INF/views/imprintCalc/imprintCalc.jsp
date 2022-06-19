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
	        <h5 class="text-center text-uppercase mb-0">각인계산기</h5>
	        <br>
            <div class="row mb-1">
            	<div class="col" style="text-align:center;">
	            	<div style="text-align:center;overflow-x:auto;">
	            		<form> 
	            			<table class="table" id="calcTable" style="font-size:0.7rem;min-width:720px;max-width:720px;width:100%;margin-left:auto;margin-right:auto;">
	            				<colgroup>
	            					<col width="10%">
	            					<col width="10%">
	            					<col width="10%">
	            					<col width="10%">
	            					<col width="10%">
	            					<col width="10%">
	            					<col width="10%">
	            					<col width="10%">
	            					<col width="10%">
	            					<col width="10%">
	            					<col width="10%">
	            				</colgroup>
	            				<thead>
	            					<tr>
	            						<th>#</th>
	            						<th>목걸이</th>
	            						<th>귀걸이1</th>
	            						<th>귀걸이2</th>
	            						<th>반지1</th>
	            						<th>반지2</th>
	            						<th>각인1</th>
	            						<th>각인2</th>
	            						<th>스톤</th>
	            						<th>합계</th>
	            					</tr>
	            				</thead>
	            				<tbody>
	            					<tr data-index="1">
		            					<td>
							      			<input type="text" class="form-control-sm form-control" style="font-size:0.7rem;" placeholder="각인1">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_1_1" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_1_2" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_1_3" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_1_4" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_1_5" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_1_6" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_1_7" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_1_8" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control" id="imp_1_sum" style="font-size:0.7rem;" min="0" value="0" readonly>
							      		</td>
						      		</tr>
	            					<tr data-index="2">
		            					<td>
							      			<input type="text" class="form-control-sm form-control" style="font-size:0.7rem;" placeholder="각인2">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_2_1" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_2_2" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_2_3" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_2_4" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_2_5" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_2_6" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_2_7" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_2_8" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control" id="imp_2_sum" style="font-size:0.7rem;" min="0" value="0" readonly>
							      		</td>
						      		</tr>
	            					<tr data-index="3">
		            					<td>
							      			<input type="text" class="form-control-sm form-control" style="font-size:0.7rem;" placeholder="각인3">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_3_1" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_3_2" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_3_3" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_3_4" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_3_5" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_3_6" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_3_7" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_3_8" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control" id="imp_3_sum" style="font-size:0.7rem;" min="0" value="0" readonly>
							      		</td>
						      		</tr>
	            					<tr data-index="4">
		            					<td>
							      			<input type="text" class="form-control-sm form-control" style="font-size:0.7rem;" placeholder="각인4">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_4_1" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_4_2" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_4_3" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_4_4" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_4_5" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_4_6" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_4_7" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_4_8" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control" id="imp_4_sum" style="font-size:0.7rem;" min="0" value="0" readonly>
							      		</td>
						      		</tr>
	            					<tr data-index="5">
		            					<td>
							      			<input type="text" class="form-control-sm form-control" style="font-size:0.7rem;" placeholder="각인5">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_5_1" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_5_2" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_5_3" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_5_4" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_5_5" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_5_6" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_5_7" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_5_8" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control" id="imp_5_sum" style="font-size:0.7rem;" min="0" value="0" readonly>
							      		</td>
						      		</tr>
	            					<tr data-index="6">
		            					<td>
							      			<input type="text" class="form-control-sm form-control" style="font-size:0.7rem;" placeholder="각인6">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_6_1" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_6_2" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_6_3" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_6_4" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_6_5" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_6_6" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_6_7" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_6_8" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control" id="imp_6_sum" style="font-size:0.7rem;" min="0" value="0" readonly>
							      		</td>
						      		</tr>
	            					<tr data-index="7">
		            					<td>공격력감소</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_7_1" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_7_2" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_7_3" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_7_4" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_7_5" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_7_6" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_7_7" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_7_8" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control" id="imp_7_sum" style="font-size:0.7rem;" min="0" value="0" readonly>
							      		</td>
						      		</tr>
	            					<tr data-index="8">
		            					<td>방어력감소</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_8_1" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_8_2" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_8_3" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_8_4" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_8_5" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_8_6" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_8_7" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_8_8" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control" id="imp_8_sum" style="font-size:0.7rem;" min="0" value="0" readonly>
							      		</td>
						      		</tr>
	            					<tr data-index="9">
		            					<td>공격속도감소</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_9_1" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_9_2" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_9_3" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_9_4" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_9_5" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_9_6" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_9_7" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_9_8" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control" id="imp_9_sum" style="font-size:0.7rem;" min="0" value="0" readonly>
							      		</td>
						      		</tr>
	            					<tr data-index="10">
		            					<td>이동속도감소</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_10_1" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_10_2" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_10_3" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_10_4" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_10_5" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_10_6" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_10_7" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control input-calc" id="imp_10_8" style="font-size:0.7rem;" min="0" value="0">
							      		</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control" id="imp_10_sum" style="font-size:0.7rem;" min="0" value="0" readonly>
							      		</td>
						      		</tr>
	            				</tbody>
							</table>
						</form>
					</div>
				</div>
            </div>
        </div>
    </section>
</div>

<%@include file="../layout/footer.jsp" %>
<%@include file="../layout/script.jsp" %>
<%@include file="script.jsp" %>
</html>