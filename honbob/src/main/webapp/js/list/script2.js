var mapContainer = document.getElementById('map'), // 지도의 중심좌표
		mapOption = { 
		    center: new kakao.maps.LatLng(33.451475, 126.570528), // 지도의 중심좌표
		    level: 6 // 지도의 확대 레벨
	}; 
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다	
	
	function locationSearch(){
		var center = map.getCenter(); 
		
		$("#latitude").val(center.getLat());
		$("#longitude").val(center.getLng());
		
		$("#mapLevel").val(2);
		listAjax();    	
    }