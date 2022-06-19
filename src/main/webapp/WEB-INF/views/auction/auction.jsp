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
            <div class="row mb-1">
            	<div class="col">
            		<div class="category">
                <ul class="main-category">
                    <li name="category" data-value="0,0" class=""><a href="#" onclick="changeCategory(0);">전체</a></li>
                        <li name="categoryParent" class="is-active">
                            <a href="#" onclick="changeCategory(10000);">장비</a>
                            <ul class="sub-category">
                                <li name="category" data-value="10000,0" class="is-active"><a href="#">전체</a></li>
                                    <li name="category" data-value="10000,180000"><a href="#">무기</a></li>
                                    <li name="category" data-value="10000,190010"><a href="#">투구</a></li>
                                    <li name="category" data-value="10000,190020"><a href="#">상의</a></li>
                                    <li name="category" data-value="10000,190030"><a href="#">하의</a></li>
                                    <li name="category" data-value="10000,190040"><a href="#">장갑</a></li>
                                    <li name="category" data-value="10000,190050"><a href="#">어깨</a></li>
                            </ul>
                        </li>
                        <li name="categoryParent">
                            <a href="#" onclick="changeCategory(30000);">어빌리티 스톤</a>
                            <ul class="sub-category">
                                <li name="category" data-value="30000,0"><a href="#">전체</a></li>
                            </ul>
                        </li>
                        <li name="categoryParent">
                            <a href="#" onclick="changeCategory(200000);">장신구</a>
                            <ul class="sub-category">
                                <li name="category" data-value="200000,0"><a href="#">전체</a></li>
                                    <li name="category" data-value="200000,200010"><a href="#">목걸이</a></li>
                                    <li name="category" data-value="200000,200020"><a href="#">귀걸이</a></li>
                                    <li name="category" data-value="200000,200030"><a href="#">반지</a></li>
                            </ul>
                        </li>
                        <li name="categoryParent">
                            <a href="#" onclick="changeCategory(210000);">보석</a>
                            <ul class="sub-category">
                                <li name="category" data-value="210000,0"><a href="#">전체</a></li>
                            </ul>
                        </li>
                </ul>
            </div>
            		<form action="">
	                    <fieldset>
	                        <div class="form">
	                            <div class="name">
	                                <span>아이템 명</span>
	                                <input type="text" id="txtItemName" class="input input--deal-name" placeholder="아이템 명을 입력해주세요." value="" maxlength="20">
	                                <button type="button" id="btnItemNameRemove" class="button button--itemdic-delete" style="display:none;">삭제</button>
	                                <div id="itemNameWords" class="words"></div>
	                            </div>
	                            <div class="class">
	                                <span>직업</span>
	                                <div id="selClass" class="lui-select select--deal-class" data-uid="khwqde8v">
	                                    <div class="lui-select__title" tabindex="0" data-title="버서커">버서커</div>
	                                    <div class="lui-select__option" role="listbox">
	                                        <label role="option" tabindex="0" class=""><input type="radio" name="deal-classNo" value="">전체 직업</label>
	                                            <label role="option" tabindex="0" class="lui-select__label--selected"><input type="radio" name="deal-classNo" data-selected="selected" value="102" checked="">버서커</label>
	                                            <label role="option" tabindex="0"><input type="radio" name="deal-classNo" value="103" checked="">디스트로이어</label>
	                                            <label role="option" tabindex="0"><input type="radio" name="deal-classNo" value="104" checked="">워로드</label>
	                                            <label role="option" tabindex="0"><input type="radio" name="deal-classNo" value="105" checked="">홀리나이트</label>
	                                            <label role="option" tabindex="0"><input type="radio" name="deal-classNo" value="202" checked="">아르카나</label>
	                                            <label role="option" tabindex="0"><input type="radio" name="deal-classNo" value="203" checked="">서머너</label>
	                                            <label role="option" tabindex="0"><input type="radio" name="deal-classNo" value="204" checked="">바드</label>
	                                            <label role="option" tabindex="0"><input type="radio" name="deal-classNo" value="302" checked="">배틀마스터</label>
	                                            <label role="option" tabindex="0"><input type="radio" name="deal-classNo" value="303" checked="">인파이터</label>
	                                            <label role="option" tabindex="0"><input type="radio" name="deal-classNo" value="304" checked="">기공사</label>
	                                            <label role="option" tabindex="0"><input type="radio" name="deal-classNo" value="305" checked="">창술사</label>
	                                            <label role="option" tabindex="0"><input type="radio" name="deal-classNo" value="402" checked="">블레이드</label>
	                                            <label role="option" tabindex="0"><input type="radio" name="deal-classNo" value="403" checked="">데모닉</label>
	                                            <label role="option" tabindex="0"><input type="radio" name="deal-classNo" value="404" checked="">리퍼</label>
	                                            <label role="option" tabindex="0"><input type="radio" name="deal-classNo" value="502" checked="">호크아이</label>
	                                            <label role="option" tabindex="0"><input type="radio" name="deal-classNo" value="503" checked="">데빌헌터</label>
	                                            <label role="option" tabindex="0"><input type="radio" name="deal-classNo" value="504" checked="">블래스터</label>
	                                            <label role="option" tabindex="0"><input type="radio" name="deal-classNo" value="505" checked="">스카우터</label>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="grade">
	                                <span>아이템 등급</span>
	                                <div id="selItemGrade" class="lui-select select--deal-grade" data-uid="khwqde8x">
	                                    <div class="lui-select__title" tabindex="0" data-title="<span>전체 등급</span>"><span>전체 등급</span></div>
	                                    <div class="lui-select__option" role="listbox">
	                                        <label role="option" tabindex="0" class="lui-select__label--selected"><input type="radio" name="deal-grade" data-selected="selected" value=""><span>전체 등급</span></label>
	                                            <label role="option" tabindex="0"><input type="radio" name="deal-grade" value="0"><span data-grade="0">일반</span></label>
	                                            <label role="option" tabindex="0"><input type="radio" name="deal-grade" value="1"><span data-grade="1">고급</span></label>
	                                            <label role="option" tabindex="0"><input type="radio" name="deal-grade" value="2"><span data-grade="2">희귀</span></label>
	                                            <label role="option" tabindex="0"><input type="radio" name="deal-grade" value="3"><span data-grade="3">영웅</span></label>
	                                            <label role="option" tabindex="0"><input type="radio" name="deal-grade" value="4"><span data-grade="4">전설</span></label>
	                                            <label role="option" tabindex="0"><input type="radio" name="deal-grade" value="5"><span data-grade="5">유물</span></label>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="detail">
	                                <div class="item-level">
	                                    <span>아이템 레벨</span>
	                                    <input type="number" id="txtItemLevelMin" class="input input--deal-item-level-min" name="deal-itemMinLevel" min="0" max="1500" value="0">
	                                    ~
	                                    <input type="number" id="txtItemLevelMax" class="input input--deal-item-level-max" name="deal-itemMaxLevel" min="0" max="1500" value="1500">
	                                </div>
	                                <div class="itemtier">
	                                    <span>아이템 티어</span>
	                                    <div id="selItemTier" class="lui-select select--deal-itemtier" data-uid="khwqde8y">
	                                        <div class="lui-select__title" tabindex="0" data-title="<span>전체 티어</span>"><span>전체 티어</span></div>
	                                        <div class="lui-select__option" role="listbox">
	                                            <label role="option" tabindex="0" class="lui-select__label--selected"><input type="radio" name="deal-itemtier" data-selected="selected" value=""><span>전체 티어</span></label>
	                                                <label role="option" tabindex="0"><input type="radio" name="deal-itemtier" value="1"><span data-itemtier="1">티어 1</span></label>
	                                                <label role="option" tabindex="0"><input type="radio" name="deal-itemtier" value="2"><span data-itemtier="2">티어 2</span></label>
	                                                <label role="option" tabindex="0"><input type="radio" name="deal-itemtier" value="3"><span data-itemtier="3">티어 3</span></label>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="bt">
	                                <button type="button" id="btnSearch" class="button button--deal-submit">검색</button>
	                                <button type="button" class="button button--deal-detail">상세 옵션</button>
	                                <button type="button" class="button button--deal-reset">초기화</button>
	                            </div>
	                        </div>
	                    </fieldset>
	                </form>
				</div>
            </div>
        </div>
    </section>
</div>

<%@include file="../layout/footer.jsp" %>
<%@include file="../layout/script.jsp" %>
<%@include file="script.jsp" %>
<%@include file="stove_auction.jsp" %>
</html>