<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<script>
	let currentPage = 'character';

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
				var rtn = '<tr>';
				rtn += '<td>'+res.c_level+'</td>';
				rtn += '<td>'+res.level+'</td>';
				rtn += '<td>'+res.user_name+'</td>';
				rtn += '<td>'+res.class+'</td>';
				rtn += '<td>'+res.server+'</td>';
				rtn += '</tr>';

				$('#searchTable tbody').empty();
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
</script>