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
	
	$('#btnCalc').on('click',function(e){
		price = $('#price').val();
		person = $('#person').val();
		gold = $('#gold').val();
		pack = $('#pack').val();

		$('#temp1').text('');
		$('#temp2').text('');
		$('#temp3').text('');
		
		if(!price || !person || !gold || !pack){
			alert('빈값을 넣어주세요!');
			return false;
		}

		temp = price - price*0.05;
		$('#temp1').text(temp);
		temp2 = parseInt(gold/10 * pack);
		$('#temp2').text(temp2);
		temp=temp-temp2;
		$('#temp3').text(temp);
		
		temp = temp/person

		$('#calcPrice').val(temp);
	});
</script>