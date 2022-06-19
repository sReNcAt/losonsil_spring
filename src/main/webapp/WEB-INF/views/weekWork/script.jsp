<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<script>
	let currentPage = 'dashboard';
	
	let currentTear = "1";
	
	//티어표를 위한 버튼 작동 스크립트
	$('.btn-work-content').on('click',function(e){
		var tear = $(this).data('tear');
		if(currentTear==tear || !tear){
			return false;
		}
		$('.btn-work-content').removeClass('btn-secondary');
		$(this).addClass('btn-secondary');
		console.log(tear);
		
		if(tear=="1"){
			$('.work-table').hide();
			$('#tearOneTable').show();
		}else if(tear=="2"){
			$('.work-table').hide();
			$('#tearTwoTable').show();
		}else if(tear=="3"){
			$('.work-table').hide();
			$('#tearThreeTable').show();
		}else{
			return false;
		}
	});

	
	$(document).on('click','.btn-work',function(e){
		var value = $(this).data('value');
		var result = $(this).data('result');
		
		if(!value || !result || result=="y"){
			return false;
		}
		
		$(this).removeClass('btn-danger');
		$(this).addClass('btn-success');
		$(this).text("완료");
		
		$(this).data('result','y');
		
	});
	
	$('#addCharacter').on('click',function(e){
		var rtn = '';
		rtn += '<tr>';
		rtn += '<td><input type="text" class="form-control"></td>';
		rtn += '<td><buttn class="btn btn-sm btn-danger btn-work" data-result="n" data-value="kashu">미완료</td>';
		rtn += '<td><buttn class="btn btn-sm btn-danger btn-work" data-result="n" data-value="taeman">미완료</td>';
		rtn += '<td><buttn class="btn btn-sm btn-danger btn-work" data-result="n" data-value="kalko">미완료</td>';
		rtn += '<td><buttn class="btn btn-sm btn-danger btn-work" data-result="n" data-value="arkadia">미완료</td>';
		rtn += '</tr>';
		
		$('#tearTwoTable').append(rtn);
	});
</script>