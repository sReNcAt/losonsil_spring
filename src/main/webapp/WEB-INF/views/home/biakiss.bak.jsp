<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<!DOCTYPE html>
<html>
    <head>
    	<meta charset="utf-8">
        <title>비아키스 키보드 연습 - 4초 [원작 세토 키보드 연습 - 기초]</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
    <style type="text/css">
        /*
        body {
            background-image: url('https://upload3.inven.co.kr/upload/2021/02/24/bbs/i015748191006.gif');
        }
        */
        div {
            font-weight:bold;
        }
        #container span {
            font-size:28px;
            display:inline-block;
            padding:5px;
            margin:5px;
            font-family:Arial;
            width:30px;
        }
        #wrap {
            width: 100%;
            height: 100vh;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            justify-content: center;
        }
        #container {
            text-align: center;
        }
        #msg {
            font-size:30px;
            color:red;
            text-align:center;
            margin-bottom:10px;
            height:50px;
            border:0;
        }
        #progressDiv {
            position: relative;
        }
        #progressbar {
            width:300px;
            height:40px;
            z-index:999;
        }
        #viewSec {
            font-size:13px;
            font-weight:normal;
            width: 100%;
            padding-top: .6rem;
            text-align: center;
            z-index:1;
            position: absolute;
            color:#000;
            text-shadow: -1px 0 #FFF, 0 1px #FFF, 1px 0 #FFF, 0 -1px #FFF;
        }
        .hit {
            color:#ff8000;
            background-color:white;
            border:solid 4px #ff8000;
        }
        .ready {
            color:#404040;
            background-color:white;
            border:solid 4px #404040;
        }
        .correct {
            background-color:#808080;
            border:solid 4px #404040;
        }
    </style>
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
                    divCont += "<span class='biakiss-span' id='ranText_" + i + "' class='hit'></span>";
                } else {
                    divCont += "<span class='biakiss-span' id='ranText_" + i + "' class='ready'></span>";
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
                console.log(tmp);
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
    <body>
        <div id="wrap">
            <div id="container" style="background-color:#FFF;"></div>	
        </div>
    </body>
</html>