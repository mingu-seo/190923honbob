	$(function() {
        $('.btn').click(function() { 
            $('#menu').addClass('open'); 
        }); 
            
        $('.close').click(function() { 
            $('#menu').removeClass('open'); 
        });



        $('.btn').click(function () { 
            $('#menu,.page_cover,html').addClass('open');  
            window.location.hash = '#open';  
        }); 

        window.onhashchange = function () { 
            if (location.hash != '#open') {  
                $('#menu,.page_cover,html').removeClass('open');  
            } 
        };
 

    });
	
	
	function getLocation(){ 	
    	
	       if (navigator.geolocation) {
	           var id = navigator.geolocation.watchPosition(
	                   function(pos) {
	                	   var gps = document.gps;
	                	   var latitude = pos.coords.latitude;
	                	   var longitude = pos.coords.longitude;                	   
	                	   //alert("현재 위치는 : "+latitude + "," + longitude); 
	                	   $("#search_lat").val(latitude);
	                	   $("#search_long").val(longitude);
	                	   $("#searchForm").submit();
	                   });            
	       } else {
	           alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
	       }
	       return false;
	    }
	    
	    
	    
	    
	    function press(e){
			if(e.keyCode == 13){ //javascript에서는 13이 enter키를 의미함 
				searchList.submit(); //formname에 사용자가 지정한 form의 name입력
			} 
		}