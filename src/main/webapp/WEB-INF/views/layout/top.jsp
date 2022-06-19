<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1 minimum-scale=1">
        <!--
<link rel="shortcut icon" href="%PUBLIC_URL%/favicon.ico">
Notice the use of %PUBLIC_URL% in the tag above.
It will be replaced with the URL of the `public` folder during the build.
Only files inside the `public` folder can be referenced from the HTML.

Unlike "/favicon.ico" or "favicon.ico", "%PUBLIC_URL%/favicon.ico" will
work correctly both with client-side routing and a non-root public URL.
Learn how to configure a non-root public URL by running `npm run build`.
-->
        <link href="<c:url value='/resources/assets/css/freelancer.css'/>" rel="stylesheet">
        <link rel="stylesheet" href="<c:url value='/resources/assets/jquery-ui-1.12.1/jquery-ui.min.css'/>" type="text/css" />  
        
        <title>로손실</title>
        <!-- 
        <script src="https://www.gstatic.com/firebasejs/ui/4.2.0/firebase-ui-auth.js"></script>
        <link type="text/css" rel="stylesheet" href="https://www.gstatic.com/firebasejs/ui/4.2.0/firebase-ui-auth.css" />
        <script src="https://cdn.firebase.com/libs/firebaseui/4.2.0/firebaseui.js"></script>
        <link type="text/css" rel="stylesheet" href="https://cdn.firebase.com/libs/firebaseui/4.2.0/firebaseui.css" />
        <script src="https://www.gstatic.com/firebasejs/7.2.3/firebase-app.js"></script>
        <script src="https://www.gstatic.com/firebasejs/7.2.3/firebase-analytics.js"></script>
        <script src="https://www.gstatic.com/firebasejs/5.10.1/firebase-auth.js"></script>
         -->
		<style>
		html {
			width:100%;
			height:auto;
			margin:0;
		}
		body {
			width:100%;
			height:auto;
			margin:auto;
		}
		.navbar {
			max-width:100%;
			width:100%;
		}
		
		#loadSpinner {
			text-align:center;
			width: 100%; height: 100%;
			top: 0; left: 0;
			display: none;
			opacity: .6;
			background: silver;
			position: fixed;
			z-index: 99999;
		}
		#loadSpinner div {
			width: 100%; height: 100%;
		}
		#loadSpinner span {
			display: table-cell;
			text-align: center;
			vertical-align: middle;
		}
		#loadSpinner img {
			position:absolute;
			background: white;
			padding: 1em;
			border-radius: .7em;
			top:45%;
		}
		
		.search-table{
			width : 100%;
		}
		
		.search-table th{
			text-align : right;
			color : #333;
			/*
			background : #b387b8;
			*/
		}
		.search-table td{
			text-align : left;
			font-size:1.2rem;
			color : #000;
			/*
			background : #e3b7e8;
			*/
		}
		
		.search-table th, .search-table td{
			padding : .5em;
			border-radius : 1em;
			margin : 1em;
		}
		.work-table tbody td, .work-table thead th, #calcTable td {
			vertical-align:middle;
			text-align : center;
			padding : 0.1rem;
		}
		
		.work-table thead th {
			font-size : 0.6em;
		}
		.work-table tbody td {
			font-size : 0.8em;
		}
		.work-table tbody input {
			text-align : center;
			font-size : 0.8em;
		}
		.work-table tbody .btn-sm {
			margin: 0.1rem;
			font-size : 0.8em;
		}
		
		#index {
			min-height:705px;
			height:100%;
		} 
        #container span {
            font-size:28px;
            display:inline-block;
            padding:5px;
            margin:5px;
            font-family:Arial;
            width:3.5rem;
        }
        #wrap {
        	padding-top:10rem;
            width: 100%;
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
            font-weight:bold;
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
    </head>
    <body>