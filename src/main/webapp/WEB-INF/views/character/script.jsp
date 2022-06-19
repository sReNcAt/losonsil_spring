<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<script>
	let currentPage = 'character';

	loadCharacter();
	
    $(document).on('click','#addCharacter',function(e){
        $('#searchModal').modal('show')
    });

    $(document).on('keydown','#character_name',function(e){
        if(e.keyCode==13){
        	e.preventDefault();
            $('#btnSearch').trigger('click');
		}
	});	
    
    $(document).on('click','#btnSearch',function(e){
		if(!$('#character_name').val()){
			return false;
		}

		$.ajax({
            type: 'GET',
            url: 'https://api.losonsil.com/search/'+$('#character_name').val(),
            dataType: 'json',
            data: {
            },
            beforeSend : function(){
            	$('#loadSpinner').show();
            },
            success: function (res) {
                $('.search-table .search-text').text('');
                
                if(!res.code){
                    return false;
                }
                if(res.code=="error"){
                    return false;
                }
				var rtn = '<tr data-name="'+res.user_name+'" data-level="'+res.level+'" data-c-level="'+res.c_level+'" data-server="'+res.server+'" data-class="'+res.class+'">';
				rtn += '<td><input type="checkbox" name="searchCheck" value="'+res.user_name+'"></td>';
				rtn += '<td>'+res.server+'</td>';
				rtn += '<td>'+res.user_name+'</td>';
				rtn += '<td>'+res.level+'</td>';
				rtn += '<td>'+res.c_level+'</td>';
				rtn += '</tr>';
				
                $('#searchTable tbody').append(rtn);
                $('#character_name').val('');

                $('#searhAddBtn').prop('disabled',false);
            },
            complete : function(){
            	$('#loadSpinner').hide();
            	//$('#mainContent').hide();
            	//$('#searchContent').show();
			}
		});
    });

    $('#searhAddBtn').on('click',function(e){
        if($('#searchTable input[name="searchCheck"]:checked').length==0){
            alert("선택된 캐릭터가 없습니다.");
            return false;
        }

        $('#searchTable input[name="searchCheck"]:checked').each(function(index,value){
            var c_level = $(this).closest('tr').data('c-level');
            var level = $(this).closest('tr').data('level');
            var user_name = $(this).closest('tr').data('name');
            var class_ = $(this).closest('tr').data('class');
            var server = $(this).closest('tr').data('server');
            
            var rtn = '<tr data-name="'+user_name+'" data-level="'+level+'" data-c-level="'+c_level+'" data-server="'+server+'" data-class="'+class_+'">';
            rtn += '<td>'+c_level+'</td>';
            rtn += '<td>'+level+'</td>';
            rtn += '<td>'+user_name+'</td>';
            rtn += '<td>'+class_+'</td>';
            rtn += '<td>'+server+'</td>';
            rtn += '<td>';
            rtn += '<button type="button" class="btn btn-sm btn-success mr-1">업데이트</button>';
            rtn += '<button type="button" class="btn btn-sm btn-danger mr-1">삭제</button>';
            rtn += '</td>';
            rtn += '</tr>';
            $.ajax({
                type: 'GET',
                url: '<c:url value="/character/list"/>',
                async: false,
                dataType: 'json',
                data: {
                	character_name : user_name,
                },
                beforeSend : function(){
                	$('#loadSpinner').show();
                },
                success: function (res) {
                    var data = res.data;
                    if(res.result!="ok"){
                        return false;
                    }
                    var url = '<c:url value="/character/create"/>';
                    var idx = null;
                    if(res.data){
                        idx = res.data[0].idx;
                        url = '<c:url value="/character/update"/>';
                    }

                    $.ajax({
                        type: 'POST',
                        url: url,
                        async: false,
                        dataType: 'json',
                        data: {
                            idx : idx,
                        	character_name : user_name,
                        	level : level,
                        	c_level : c_level,
                        	server : server,
                        	class_ : class_,
                        },
                        beforeSend : function(){
                        	$('#loadSpinner').show();
                        },
                        success: function (res) {
                            if(res.result=="ok"){
                            }
                        },
                        complete : function(){
                        	$('#loadSpinner').hide();
            			}
                    });
                },
                complete : function(){
                	$('#loadSpinner').hide();
    			}
            });
            $('#characterTable tbody').append(rtn);
        });



        $('#searchTable tbody').empty();
        $('#searchModal').modal('hide');
    });



	function loadCharacter(){
		$.ajax({
	        type: 'GET',
	        url: '<c:url value="/character/list"/>',
	        dataType: 'json',
	        async : false,
	        data: {
	        },
	        beforeSend : function(){
	        	$('#loadSpinner').show();
	        },
	        success: function (res) {
	            var data = res.data;
	            
	            if(!res.result){
	                return false;
	            }
	            if(res.code=="error"){
	                return false;
	            }
	            
                $('#characterTable tbody').empty();
	            
	            $(data).each(function(index,value){
	                var idx = value.idx;
	                var c_level = value.c_level;
	                var level = value.level;
	                var user_name = value.character_name;
	                var class_ = value.class_;
	                var server = value.server;
	                
	                var rtn = '<tr data-idx="'+idx+'" data-name="'+user_name+'" data-level="'+level+'" data-c-level="'+c_level+'" data-server="'+server+'" data-class="'+class_+'">';
	                rtn += '<td>'+c_level+'</td>';
	                rtn += '<td>'+level+'</td>';
	                rtn += '<td>'+user_name+'</td>';
	                rtn += '<td>'+class_+'</td>';
	                rtn += '<td>'+server+'</td>';
	                rtn += '<td>';
	                rtn += '<button type="button" class="btn btn-sm btn-success mr-1">업데이트</button>';
	                rtn += '<button type="button" class="btn btn-sm btn-danger mr-1 btn-delete-character">삭제</button>';
	                rtn += '</td>';
	                rtn += '</tr>';
	                $('#characterTable tbody').append(rtn);
	                console.log(rtn);
	            });
	        },
	        complete : function(){
	        	$('#loadSpinner').hide();
	        	//$('#mainContent').hide();
	        	//$('#searchContent').show();
			}
		});
	}

    $('.btn-delete-character').on('click',function(e){
        loadCharacter();
    });
</script>