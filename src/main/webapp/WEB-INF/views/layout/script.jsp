<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<c:set var="baseURL" value="${fn:replace(req.requestURL, fn:substring(req.requestURI, 0, fn:length(req.requestURI)), req.contextPath)}" />


<script src="<c:url value='/resources/assets/js/jquery.min.js'/>"></script>
<script src="<c:url value='/resources/assets/js/bootstrap.bundle.min.js'/>"></script>
<!-- Plugin JavaScript -->
<script src="<c:url value='/resources/assets/js/jquery.easing.min.js'/>"></script>
<script src="<c:url value='/resources/assets/js/contact_me.min.js'/>"></script>
<script src="<c:url value='/resources/assets/js/freelancer.min.js'/>"></script>
<script src="<c:url value='/resources/assets/js/jqBootstrapValidation.min.js'/>"></script>
<script src="<c:url value='/resources/assets/jquery-ui-1.12.1/jquery-ui.min.js'/>"></script>  
<script>
	jQuery.browser = {};
	(function () {
	    jQuery.browser.msie = false;
	    jQuery.browser.version = 0;
	    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
	        jQuery.browser.msie = true;
	        jQuery.browser.version = RegExp.$1;
	    }
	})();
</script>
<script>
    /*
        // Your web app's Firebase configuration
        var firebaseConfig = {
            apiKey: "AIzaSyAmJLJowrFkd6Et8OrUV7kY4UYL8m0BJ-o",
            authDomain: "srenren-90d3e.firebaseapp.com",
            databaseURL: "https://srenren-90d3e.firebaseio.com",
            projectId: "srenren-90d3e",
            storageBucket: "srenren-90d3e.appspot.com",
            messagingSenderId: "1047592966577",
            appId: "1:1047592966577:web:39927e5bae8d8b06fc8590",
            measurementId: "G-RP4Z9T3E56"
        };
        // Initialize Firebase
        firebase.initializeApp(firebaseConfig);
        firebase.analytics();
        // 구글 인증 기능 추가
        var provider = new firebase.auth.GoogleAuthProvider();

        // 인증하기
        firebase.auth().signInWithPopup(provider).then(function(result) {
            // This gives you a Google Access Token. You can use it to access the Google API.
            var token = result.credential.accessToken;
            // The signed-in user info.
            var user = result.user;

            console.log(user)		// 인증 후 어떤 데이터를 받아오는지 확인해보기 위함.
            // ...
        }).catch(function(error) {
            console.log(error)
            // Handle Errors here.
            var errorCode = error.code;
            var errorMessage = error.message;
            // The email of the user's account used.
            var email = error.email;
            // The firebase.auth.AuthCredential type that was used.
            var credential = error.credential;
            // ...
        });
        */
</script>
<script>
    $(document).on('click','#signin',function(e){
        $('#loginModal').modal('show')
    });

	$('#loginBtn').on('click',function(e){
    	if(!$('#username').val() || !$('#password').val()){
			alert("아이디, 비밀번호를 입력해주세요");
			return false;
		}

		$.ajax({
            type: 'POST',
            url: '<c:url value="/auth/login_ajax"/>',
            dataType: 'json',
            data: {
                user_name : $('#username').val(),
                user_pw : $('#password').val(),
            },
            beforeSend : function(){
            	$('#loadSpinner').show();
            },
            success: function (res) {
                if(res.result=="ok"){
                	location.reload(true);
                }else{
                    alert("로그인에 실패했습니다.");
                }
            },
            complete : function(){
            	$('#loadSpinner').hide();
            }
		});
    });
    
</script>