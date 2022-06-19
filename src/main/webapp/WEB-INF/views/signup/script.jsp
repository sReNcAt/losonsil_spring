<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<script>
	let currentPage = 'signup';
		
	//회원가입버튼
	$('#signupBtn').on('click',function(e){
		if(!$('#user_name').val() || !$('#user_pw').val()){
			alert("아이디, 비밀번호를 입력해주세요")
			return false;
		}

		$.ajax({
            type: 'POST',
            url: '<c:url value="/user/create"/>',
            dataType: 'json',
            data: {
                user_name : $('#user_name').val(),
                user_pw : $('#user_pw').val(),
            },
            beforeSend : function(){
            	$('#loadSpinner').show();
            },
            success: function (res) {
                if(res.result=="ok"){
                    alert("회원가입이 완료되었습니다. 로그인해주세요");
                }else{
                    alert("회원가입에 실패했습니다.");
                }
            },
            complete : function(){
            	$('#loadSpinner').hide();
            }
		});
	});
	
</script>