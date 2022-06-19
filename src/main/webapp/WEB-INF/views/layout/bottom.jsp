<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<div>
    <div class="modal" id="loginModal" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">LOGIN</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="loginForm">
                        <div class="form-group">
                            <label for="username">아이디</label>
                            <input type="text" class="form-control" id="username" placeholder="Username" />
                        </div>
                        <div class="form-group">
                            <label for="password">비밀번호</label>
                            <input type="password" class="form-control" id="password" placeholder="Password" />
                        </div>
                    </form>
                </div>
                <div class="modal-footer" style="display:block;">
                    <a href="<c:url value='/signup'/>"><button type="button" class="btn btn-success float-left" style="display:none;">회원가입</button></a>
                    <button type="button" class="btn btn-primary float-right" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-secondary float-right" id="loginBtn" >로그인</button>
                </div>
            </div>
        </div>
    </div>
</div>
<div>
    <div class="modal" id="searchModal" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">캐릭터 검색</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                	<form id="searchForm" class="form-inline">
  						<div class="form-group mb-2">
	                        <input type="text" class="form-control" id="character_name" placeholder="닉네임">
	                    </div>
						<button type="button" class="btn btn-info mb-2" id="btnSearch">검색</button>
                    </form>
                    <div class="row">
                    	<div class="col">
                    		<table class="table table-borderd work-table" id="searchTable" style="width:100%;">
                    			<thead>
                    				<tr>
                    					<th>#</th>
                    					<th>서버</th>
                    					<th>닉네임</th>
                    					<th>아이템레벨</th>
                    					<th>전투레벨</th>
                    				</tr>
                    			</thead>
                    			<tbody>
                    			</tbody>
                    		</table>
                    	</div>
                    </div>
                </div>
                <div class="modal-footer" style="display:block;">
                    <button type="button" class="btn btn-sm btn-primary float-right mr-1" data-dismiss="modal">닫기</button>
                    
					<%
						if (session.getAttribute("user_name") != null) {
					%>
                    <button type="button" class="btn btn-sm btn-secondary float-right mr-1" id="searhAddBtn" disabled>추가</button>
                    <%
						}
					%>
                </div>
            </div>
        </div>
    </div>
</div>
</body>