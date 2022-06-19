<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<script>
	let currentPage = 'calc';

	let price;
	let person;
	let gold;
	let pack;
	let calcPrice;

	$('.input-calc').on('change',function(e){
		var index = $(this).closest('tr').data('index');

		if(!$(this).val()){
			$(this).val(0);
			$(this).trigger('change')
		}

		console.log($(this).val());
		
		if($(this).val()<=0){
			$(this).val(0);
	        $(this).css('background-color','#fff');
		}else{
	        $(this).css('background-color','#ddd');
		}

		var val = $(this).val();
		
		let value_sum = 0;
		$('tr[data-index="'+index+'"] .input-calc').each(function(index,value){
			value_sum+=parseInt($(this).val());
		});
		$('#imp_'+index+'_sum').val(value_sum);
	});
</script>