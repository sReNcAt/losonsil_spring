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
    <section class="page-section">
		<%@include file="../layout/banner.jsp" %>
		<div class="row">
			<div class="col-md-3">
				<img id="source1" src="<c:url value='/resources/assets/img/bingo.png'/>" style="display:none;">
				<img id="source2" src="<c:url value='/resources/assets/img/bingo1.png'/>" style="display:none;">
				<img id="source3" src="<c:url value='/resources/assets/img/bingo_ok.png'/>" style="display:none;">
			</div>
			<div class="col-md-6">
				<div class="row">
					<div class="col-md-12">
						<button type="button" class="btn btn-sm btn-info" id="bingoClear">랜덤모드 초기화</button>
						<button type="button" class="btn btn-sm btn-success" id="bingoClear2">선택모드 초기화</button><br>
						<h2><span id="count">0</span> 번째 클릭</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12" style="margin-top:4rem;margin-bottom:8rem;">
						<table class="" style="text-align:center;margin:auto;transform:rotate( 45deg );" id="bingoTable">
							<thead>
							</thead>
							<tbody>
								<tr data-tr="0">
									<td data-td="0">&nbsp;</td><td data-td="1">&nbsp;</td><td data-td="2">&nbsp;</td><td data-td="3">&nbsp;</td><td data-td="4">&nbsp;</td>
								</tr>
								<tr data-tr="1">
									<td data-td="0">&nbsp;</td><td data-td="1">&nbsp;</td><td data-td="2">&nbsp;</td><td data-td="3">&nbsp;</td><td data-td="4">&nbsp;</td>
								</tr>
								<tr data-tr="2">
									<td data-td="0">&nbsp;</td><td data-td="1">&nbsp;</td><td data-td="2">&nbsp;</td><td data-td="3">&nbsp;</td><td data-td="4">&nbsp;</td>
								</tr>
								<tr data-tr="3">
									<td data-td="0">&nbsp;</td><td data-td="1">&nbsp;</td><td data-td="2">&nbsp;</td><td data-td="3">&nbsp;</td><td data-td="4">&nbsp;</td>
								</tr>
								<tr data-tr="4">
									<td data-td="0">&nbsp;</td><td data-td="1">&nbsp;</td><td data-td="2">&nbsp;</td><td data-td="3">&nbsp;</td><td data-td="4">&nbsp;</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-3">
			</div>
		</div>
    </section>
</div>

<%@include file="../layout/footer.jsp" %>
<%@include file="../layout/script.jsp" %>
<script type="text/javascript">

	Array.prototype.equals = function (getArray) {
		if (this.length != getArray.length) return false;
	
		for (var i = 0; i < getArray.length; i++) {
			if (this[i] instanceof Array && getArray[i] instanceof Array) {
			if (!this[i].equals(getArray[i])) return false;
			}else if (this[i] != getArray[i]) {
				return false;
			}
		}
		return true;
	};
	
	$('#bingoTable > th, td').css('width','3rem');
	$('#bingoTable > th, td').css('height','3rem');
	$('#bingoTable > th, td').css('border','1px solid #ccc');

	//$('#bingoTable td').html('<img src="<c:url value='/resources/assets/img/bingo.png'/>" style="width:3rem;height:3rem;">');

	let arr = [
		[0,0,0,0,0],
		[0,0,0,0,0],
		[0,0,0,0,0],
		[0,0,0,0,0],
		[0,0,0,0,0]];

	let bingo_1 = '<img src="<c:url value='/resources/assets/img/bingo.png'/>" style="width:3rem;height:3rem;">';
	let bingo_2 = '<img src="<c:url value='/resources/assets/img/bingo1.png'/>" style="width:3rem;height:3rem;">';
	let bingo_ok = '<img src="<c:url value='/resources/assets/img/bingo_ok.png'/>" style="width:3rem;height:3rem;">';

	if($(window).width() >768) {
		$('#bingoTable > th, td').css('width','100px');
		$('#bingoTable > th, td').css('height','100px');
		bingo_1 = '<img src="<c:url value='/resources/assets/img/bingo.png'/>" style="width:100px;height:100px;">';
		bingo_2 = '<img src="<c:url value='/resources/assets/img/bingo1.png'/>" style="width:100px;height:100px;">';
		bingo_ok = '<img src="<c:url value='/resources/assets/img/bingo_ok.png'/>" style="width:100px;height:100px;">';
	}

	let count = 0;
	let type = 'random';
	init();

	$('#bingoClear').on('click',function(e){
		type = 'random';
		init();
	})
	
	$('#bingoClear2').on('click',function(e){
		type = 'choose';
		init();
	})
	function init(){
		$('#bingoTable > th, td').html('&nbsp');
		arr = [
			[0,0,0,0,0],
			[0,0,0,0,0],
			[0,0,0,0,0],
			[0,0,0,0,0],
			[0,0,0,0,0]];
		
		count=0;

		if(type=='random'){
			let startNum1 = [getRandomInt(1,4),getRandomInt(1,4)];
			let startNum2 = [getRandomInt(0,5),getRandomInt(0,5)];
			
			while (true){
				if(startNum2[0]>0 || startNum2[0]<4){
					if(startNum2[1]==0 || startNum2[1]==4){
						break;
					}
				}else{
					break;
				}
				startNum2 = [getRandomInt(0,5),getRandomInt(0,5)];
			}
	
			arr[startNum1[0]][startNum1[1]]=1;
			arr[startNum2[0]][startNum2[1]]=1;
		}
		
		$('#count').text(count);
		drawTable();
		return false;
	}


	$('#bingoTable td').on('click',function(e){
		var thisTr = $(this).closest('tr').data('tr');
		var thisTd = $(this).data('td');

		let up = thisTr-1;
		let down = thisTr+1;
		let left = thisTd-1;
		let right = thisTd+1;

		// 본인자리
		checkPosition(thisTr,thisTd);
		if(!(type=='choose' && count<2)){
		// 위
		checkPosition(up,thisTd);
		// 아래
		checkPosition(down,thisTd);
		// 왼쪽
		checkPosition(thisTr,left);
		// 오른쪽
		checkPosition(thisTr,right);
		}
		count++;
		$('#count').text(count);
		drawTable();
	})
	
	function drawTable(){
		checkBingo();
		
		for (var i=0; i<arr.length; i++){
			for (var j=0; j<arr[i].length; j++){
				if(arr[i][j]==2){
					$('#bingoTable tr[data-tr="'+i+'"] td[data-td="'+j+'"]').html(bingo_ok);
				}else if(arr[i][j]==1){
					$('#bingoTable tr[data-tr="'+i+'"] td[data-td="'+j+'"]').html(bingo_1);
				}else {
					$('#bingoTable tr[data-tr="'+i+'"] td[data-td="'+j+'"]').html('&nbsp');
				}
			}
		}
	}
	
	function getRandomInt(min, max) {
		min = Math.ceil(min);
		max = Math.floor(max);
		return Math.floor(Math.random() * (max - min)) + min; //최댓값은 제외, 최솟값은 포함
	}

	function checkPosition(x,y){
		if(x<0||x>4||y<0||y>4){
			return false;
		}
		if(arr[x][y]==0){
			arr[x][y]=1;
		}else if(arr[x][y]==1){
			arr[x][y]=0;
		}
	}

	function checkBingo(){
		for (var i=0; i<arr.length; i++){
			let checkX = true;
			for (var j=0; j<arr[i].length; j++){
				if(arr[i][j]==0){
					checkX = false;
					break;
				}
			}
			if(checkX){
				for (var j=0; j<arr[i].length; j++){
					arr[i][j]=2;
				}
			}
		}

		for (var i=0; i<arr.length; i++){
			let checkX = true;
			for (var j=0; j<arr[i].length; j++){
				if(arr[j][i]==0){
					checkX = false;
					break;
				}
			}
			if(checkX){
				for (var j=0; j<arr[i].length; j++){
					arr[j][i]=2;
				}
			}
		}

		if(arr[0][0]!=0 && arr[1][1]!=0 && arr[2][2]!=0 && arr[3][3]!=0 && arr[4][4]!=0){
			arr[0][0]=2;
			arr[1][1]=2;
			arr[2][2]=2;
			arr[3][3]=2;
			arr[4][4]=2;
		}

		if(arr[0][4]!=0 && arr[1][3]!=0 && arr[2][2]!=0 && arr[3][1]!=0 && arr[4][0]!=0){
			arr[0][4]=2;
			arr[1][3]=2;
			arr[2][2]=2;
			arr[3][1]=2;
			arr[4][0]=2;
		}
	}
</script>
</html>