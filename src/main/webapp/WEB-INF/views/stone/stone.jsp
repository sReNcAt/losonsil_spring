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
	        <h5 class="text-center text-uppercase mb-0">분배계산기</h5>
	        <br>
	        <h6 style="font-size:0.5rem;">수수료 자동계산됩니다. 수수료 반영하지말고 판매가격 그대로 기입해주세요</h6>
	        <h6 style="font-size:0.5rem;">골드비율은 거래소에서 크리스탈 구매할때 골드 비율입니다.</h6>
	        <br>
            <div class="row mb-1">
            	<div class="col">
	            	<div class="">
	            		<form>
	            			<table class="table" id="calcTable" style="font-size:0.7rem;">
	            				<colgroup>
	            					<col width="25%">
	            					<col width="25%">
	            					<col width="25%">
	            					<col width="25%">
	            				</colgroup>
	            				<tbody>
	            					<tr>
		            					<td>판매가격</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control" id="price" style="font-size:0.7rem;" placeholder="판매가격">
							      		</td>
		            					<td>분배인원</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control" id="person" style="font-size:0.7rem;" placeholder="분배인원">
							      		</td>
						      		</tr>
	            					<tr>
		            					<td>골드비율</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control" id="gold" style="font-size:0.7rem;" placeholder="골드비율">
							      		</td>
		            					<td>리패키지</td>
		            					<td>
							      			<input type="number" class="form-control-sm form-control" id="pack" style="font-size:0.7rem;" placeholder="리패키지수">
							      		</td>
						      		</tr>
	            					<tr>
		            					<td>
		            						<label>분배골드</label>
		            					</td>
		            					<td colspan="2">
											<input class="form-control form-control-sm" type="number" id="calcPrice" style="font-size:0.7rem;" readonly placeholder="분배골드">
							      		</td>
						      			<td>
											<button type="button" class="btn btn-sm btn-info" id="btnCalc">계산</button>
						      			</td>
						      		</tr>
	            				</tbody>
							</table>
							<table class="table" id="calcTable2" style="font-size:0.7rem;">
	            				<colgroup>
	            					<col width="25%">
	            					<col width="75%">
	            				</colgroup>
	            				<tbody>
	            					<tr>
		            					<td style="text-align:center;">판매후 골드</td>
		            					<td style="text-align:left;"> 
							      			<span id="temp1"></span>
							      		</td>
						      		</tr>
	            					<tr>
		            					<td style="text-align:center;">리패키징비용</td>
		            					<td style="text-align:left;"> 
							      			<span id="temp2"></span>
							      		</td>
						      		</tr>
	            					<tr>
		            					<td style="text-align:center;">분배전 수익 골드</td>
		            					<td style="text-align:left;"> 
							      			<span id="temp3"></span>
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