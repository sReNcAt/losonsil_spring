<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<script>
	let currentPage = 'dashboard';
	
	let currentTear = "1";

	$('#nowDate').datepicker({
        changeMonth: true, 
        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    showButtonPanel: true, 
	    currentText: '오늘 날짜', 
	    closeText: '닫기', 
	    dateFormat: "yymmdd",
 	});
	$('#nowDate').datepicker().datepicker('setDate', new Date());


	$('#nowDate').on('keydown',function(e){
        if(e.keyCode==13){
        	e.preventDefault();
		}
	});

	$(document).on('click','.btn-work',function(e){
		var value = $(this).data('value');
		var result = $(this).data('result');
		var idx = $(this).closest('tr').data('character-idx');
		var thisItem = $(this);
		if(!value || !result || result=="y"){
			return false;
		}
		$.ajax({
            type: 'POST',
            url: '<c:url value="/dayWork/create"/>',
            async: false,
            dataType: 'json',
            data: {
                character_idx : idx,
                work_type : 'day',
                workGubun : value,
                workStatus : 'y',
                workDate : $('#nowDate').val(),
            },
            beforeSend : function(){
            	$('#loadSpinner').show();
            },
            success: function (res) {

				if(!res.data){
					alert('숙제등록 실패');
					return false;
				}
                thisItem.removeClass('btn-danger');
                thisItem.addClass('btn-success');
                thisItem.text("완료");
                thisItem.data('result','y');
            },
            complete : function(){
            	$('#loadSpinner').hide();
    		}
        });
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

	var showSpinner = new Promise(function(resolve, reject) {
	    $('#loadSpinner').show(function(){
		    resolve(1);
		});
	});

	showSpinner.then(function(){
		f_get_daywork();
		return true;
   	}).then(function(){
    	$('#loadSpinner').hide();
    });
    
	$('#btnSearchDayWork').on('click',function(e){
		var showSpinner = new Promise(function(resolve, reject) {
		    $('#loadSpinner').show(function(){
			    resolve(1);
			});
		});
		showSpinner.then(function(){
    		f_get_daywork();
    		return true;
       	}).then(function(){
        	$('#loadSpinner').hide();
        });
	})
	
	function f_get_daywork(){
		$.ajax({
	        type: 'GET',
	        url: '<c:url value="/character/list"/>',
	        async: false,
	        dataType: 'json',
	        data: {
	        },
	        beforeSend : function(){
	        	//$('#loadSpinner').show();
	        },
	        success: function (res) {
	            var data = res.data;
	            if(res.result!="ok"){
	                return false;
	            }

	            $('#dayWorkTable tbody').empty();
				for(var i=0; i<data.length; i++){
					var kadun = null;
					var tobaul = null;
					var epona = null;
					
		            $.ajax({
		                type: 'GET',
		                url: '<c:url value="/dayWork/list"/>',
		                async: false,
		                dataType: 'json',
		                data: {
			                work_type : 'day',
			                workDate : $('#nowDate').val(),
			                character_idx : data[i].idx,
		                },
		                success: function (res) {
			                console.log(res.data);
			                for(var j=0; j<res.data.length; j++){
				                if(res.data[j].workStatus=="y"){
					                if(res.data[j].workGubun=="kadun"){
					                	kadun='y';
						            }else if(res.data[j].workGubun=="tobaul"){
						            	tobaul='y';
						            }else if(res.data[j].workGubun=="epona"){
						            	epona='y';
						            }
				                }
				            }
		                }
		            });
		            
		            var rtn = '';
		    		rtn += '<tr data-character-idx="'+data[i].idx+'">';
		    		rtn += '<td>'+data[i].character_name+'</td>';
		    		rtn += '<td><buttn class="btn btn-sm '+(kadun?'btn-success':'btn-danger')+' btn-work" data-result="'+(kadun?'y':'n')+'" data-value="kadun">'+(kadun?'완료':'미완료')+'</td>';
		    		rtn += '<td><buttn class="btn btn-sm '+(tobaul?'btn-success':'btn-danger')+' btn-work" data-result="'+(tobaul?'y':'n')+'" data-value="tobaul">'+(tobaul?'완료':'미완료')+'</td>';
		    		rtn += '<td><buttn class="btn btn-sm '+(epona?'btn-success':'btn-danger')+' btn-work" data-result="'+(epona?'y':'n')+'" data-value="epona">'+(epona?'완료':'미완료')+'</td>';
		    		rtn += '</tr>';
		
		    		
		    		$('#dayWorkTable tbody').append(rtn);
				}
	        },
	        complete : function(){
	        	//$('#loadSpinner').hide();
			}
	    });
	}
</script>