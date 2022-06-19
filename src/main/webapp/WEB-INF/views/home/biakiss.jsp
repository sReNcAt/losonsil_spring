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
		<div id="wrap">
	    	<div id="container" style="background-color:#FFF;"></div>	
		</div>
    </section>
</div>

<%@include file="../layout/footer.jsp" %>
<%@include file="../layout/script.jsp" %>
<script type="text/javascript">
        let chars = "QWEASD";
        let textLeng = 0;
        let inputCnt = 0;
        let movTime = 2000;
        let arrRandText = new Array();
        let divCont = "";
        let timerFlag = false;

        let motionTime = 4000;

        $( document ).ready( function() {
            resetVal();
        });

        function resetVal() {
            textLeng = 7;
            timerFlag = false;
            inputCnt = 0;
            arrRandText = [];
            divCont = "<div style=''>";

            for(let i = 0 ; i<textLeng ; i++) {
                if(i == 0) {
                    divCont += "<span id='ranText_" + i + "' class='biakiss-span hit'></span>";
                } else {
                    divCont += "<span id='ranText_" + i + "' class='biakiss-span ready'></span>";
                }
            }
            divCont += "</div><div id='progressDiv'><div id='viewSec'></div><progress id='progressbar' value='100' max='100'></progress></div><div id='msg'></div>";
            $("#container").html( divCont );

            genText(textLeng);
            for(let i = 0 ; i<textLeng ; i++) {
                $("#ranText_"+i).text( arrRandText[i] );
            }

            timeBar();
        }

        function genText(j) {
            for(let i = 0 ; i<j ; i++) {
                var rnum = Math.floor(Math.random() * chars.length);
                arrRandText[i] = chars.substring(rnum,rnum+1);
            }
        }

        function returnResult(v) {
            if(v) {
                $("#msg").text("SUCCESS");		
                clearInterval(animate);
            } else {
                //$("#ranText_"+inputCnt).attr( "class","wrong" );
                $("#msg").text("FAILURE");
                clearInterval(animate);
            }
            timerFlag = true;
            setTimeout( resetVal, movTime);
        }

        $(document).keyup(function(event) {
            if(event.keyCode >= 65 && event.keyCode <=90 )
            if(inputCnt <= textLeng && timerFlag == false) {
                let valInput = String.fromCharCode(event.keyCode);
                if( arrRandText[inputCnt] == valInput ) {

                    $("#ranText_"+inputCnt).attr( "class","correct" );
                    $("#ranText_"+(inputCnt+1)).attr( "class","hit" );

                    if( inputCnt == (textLeng-1) ) {					
                        returnResult(true);					
                    } else {
                        ++inputCnt;
                    }				
                } else {
                    returnResult(false);
                }
            }
        });


        let animate;

        function timeBar() {
            let progressbar = $("#progressbar");
            let max = progressbar.attr("max");
            let time = motionTime/max;
            let value = progressbar.val();

            let motion = function(){
                value -= 1;
                addValue = progressbar.val(value);
                tmp = String(value*time/1000).substring(0,3);
                $("#viewSec").text( tmp + " 초");
                if(tmp <= 0) {
                    //alert(value)
                    returnResult(false)
                }
                if(value <= 0) {
                    clearInterval(animate);					
                }
            }

            animate = setInterval(function() { motion(); }, time );
        }
    </script>
</html>