$(function(){
	listAjax();
	
	$('.darken-background').click(function(){
        hideFilter();
    });

    $('.popup-filter').click(function(event){
        event.stopPropagation()
    });
   
    $(".filterArea").click(function() {
    	
    	var idx = $(this).index(".filterArea");
    	$(".filterArea").removeClass("checked2");
    	$(".filterArea").addClass("order-icon");
    	
    	$(".filterArea input[name=filter1]").prop("checked", false);
    	$(".filterArea").eq(idx).removeClass("order-icon");
    	$(".filterArea").eq(idx).addClass("checked2");
    	$(".filterArea input[name=filter1]").eq(idx).prop("checked", true);
    });

    $("input:checkbox").on('click', function(){
    	if ($(this).prop('checked')) {
    		$(this).parent().addClass("checked");
    		$(this).next().children().first().css("opacity", "0");
    	}else{ 
    		$(this).parent().removeClass("checked"); 
    		$(this).next().children().first().css("opacity", "1");
    	} 
    });
});
	
	function listAjax() {
		
		$.ajax({
			type : 'get',
			url : '/honbob/listAjax.do',
			dataType : 'html',
			data : $("#searchFilter").serialize(),
			success : function(data){
				$(".container").html(data);
			},
			error : function(){
				console.log("에러")
			},
			async : true
    	});
		
		hideFilter();
	}
	
	function setPage(page) {
		$("#page").val(page);		
		listAjax();
	}
	
	
    function showFilter(){               
        $('.darken-background').show();
        $('body').css('overflow:hidden');
        
    }
    
    function hideFilter(){
        $('.darken-background').hide();
        $('body').css('overflow', '');        
       
    }   
        
    function submitAction(){
    	$("#page").val(1);
    	$("#latitude").val(0);
    	$("#longitude").val(0);
    	listAjax();
    }