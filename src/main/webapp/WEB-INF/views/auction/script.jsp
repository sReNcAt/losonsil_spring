<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<script>
	let currentPage = 'auction';
	
	$('#btnCalc').on('click',function(e){
		$.ajax({
            url: 'https://lostark.game.onstove.com/Auction/GetAuctionList',
            type: 'POST',
            async: false,
            data: {
                'order_no' : 0,
            },
            success: function (res) {
                console.log(res)
            }
		});
	});
</script>