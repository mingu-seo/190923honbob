<%@page import="java.util.List"%>
<%@page import="vo.RestaurantVO"%>
<%@page import="util.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	PageInfo pageInfo=(PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();	
%>
<meta name="viewport" charset="utf-8" content="user-scalable=no, initial-scale=1, maximum-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="js/list/ajaxScript.js"></script>
<link rel="stylesheet" href="css/list/ajaxStyle.css"/>

	<div class="Lcontent">
    	<div class="inner">
            <div class="search-info">
                <h1>밥먹자 맛집 검색순위</h1>
                <div class="filter" onclick="showFilter()" style="cursor:pointer">
                    <p>필터</p>
                </div>
            </div>
            <div class="search-restaurants-list">
                <div class="restaurants-list">
                	<c:forEach var = "res" items="${searchlist }" varStatus="status">
						<div class="restaurants-item">
						   <div class="restaurants-thumb" onclick="location.href='DetailView.do?res_num=${res.res_num }'" style="cursor:pointer">
						   	<img src="images/food/${res.res_image_name }" width="385px" height="250px">
						   </div>
						   <div class="restaurants-info">
						       <a href="DetailView.do?res_num=${res.res_num }"><h2>${res.res_name }</h2></a>
						       <strong class="grade"><img src="images/list/grade_icon.png" width="15" height="15">${res.grade }</strong>
						       <p><span>${res.addressCut } - ${res.category }${res.option }</span></p>
						       <p>
						           <span class="view_count"><img src="images/list/read_icon.png" width="15" height="15">${res.readcount }</span>
						           <span class="review_count"><img src="images/list/review_icon.jpg" width="15" height="15">${res.reviewcount }</span>
						       </p>                                        
						   </div>
						</div>   
					</c:forEach>
				</div>
			</div>
		</div>
		<p class="paging">
			<%if(nowPage<=1){ %>
				◀&nbsp;
			<%}else{ %>
				<a href="javascript:setPage('<%=nowPage-1 %>');">◀</a>&nbsp;
			<%} %>
		
			<%for(int a=startPage; a<=endPage; a++){
				if(a==nowPage){%>
					<a href="javascript:setPage('<%=a %>');" class="pagePointer"><%=a %></a>&nbsp;
				<%}else{ %>
					<a href="javascript:setPage('<%=a %>');"><%=a %></a>&nbsp;
				<%} %>
			<%} %>
			
			<%if(nowPage>=maxPage){ %>
				▶
			<%}else{ %>
				<a href="javascript:setPage('<%=nowPage+1 %>');">▶</a>
			<%} %>
        </p>
	</div>
    <div class="Rcontent">
    	<div class="map">    		
         	<div id="map" style="width:100%;height:700px;"><div class="locationSearch" onclick="locationSearch()">이 위치로 검색</div></div>	                
     	</div>
    	<div class="visit_res">
             chat
    	</div>
    </div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=968f5cb093e2b0f76e796a0721504779&libraries=services"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도의 중심좌표
		mapOption = { 
		    center: new kakao.maps.LatLng(37.497928, 127.027583), // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
		}; 
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다	
	
	
	var latitude = [];
	var longitude = [];
	var res_name = [];
	var res_num = [];
	var grade = [];
	var addressCut = [];
	var category = [];
	var readcount = [];
	var reviewcount = [];	
	var markericon = [];
	var thumbnail = [];
	
	<c:forEach items="${searchlist}" var="list">		
		latitude.push("${list.latitude}");
		longitude.push("${list.longitude}");
		res_name.push("${list.res_name}");
		res_num.push("${list.res_num}");
		grade.push("${list.grade}");
		addressCut.push("${list.addressCut}");
		category.push("${list.category}");
		readcount.push("${list.readcount}");
		reviewcount.push("${list.reviewcount}");
		thumbnail.push("${list.res_image_name}")
		
		<c:if test="${list.koreafood==1}">markericon.push("images/list/koreafood_border.png")</c:if>
		<c:if test="${list.japanfood==1}">markericon.push("images/list/japanfood_border.png")</c:if>
		<c:if test="${list.chinafood==1}">markericon.push("images/list/chinafood_border.png")</c:if>
		<c:if test="${list.westernfood==1}">markericon.push("images/list/westernfood_border.png")</c:if>
		<c:if test="${list.etcfood==1}">markericon.push("images/list/etcfood_border.png")</c:if>
		
	</c:forEach>
	
	var markers = [];
	var overlays = [];
	var arrIdx = 0;
	
	var points = [];
	var bounds = new kakao.maps.LatLngBounds();
	
	latitude.forEach(function(element){
		
		var icon = new kakao.maps.MarkerImage(markericon[arrIdx],
		        new kakao.maps.Size(42, 42));        
	    
	    var markerPosition = new kakao.maps.LatLng(element, longitude[arrIdx]);	
	    
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: markerPosition,
	        image : icon
	    });		
	    
		var overlay = new kakao.maps.CustomOverlay({
			content: "",
			map: map,
			position: ""
		});	
		
		overlay.setPosition(new kakao.maps.LatLng(element, longitude[arrIdx]));
		overlay.setContent('<div class="mapwrap">' + 
		        '    <div class="info">' + 
		        '        <div class="title">' + 
	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
		        '        </div>' + 
		        '        <div class="body">' + 
		        '            <div class="img">' +
		        '                <img src="images/food/'+thumbnail[arrIdx]+'" width="75" height="73">' +
		        '           </div>' + 
		        '            <div class="desc">' + 
		        '                <div class="ellipsis"><a href="DetailView.do?res_num='+res_num[arrIdx]+'">'+res_name[arrIdx]+'</a></div>' + 
		        '                <div class="marker-grade"><img src="images/list/grade_icon.png" width="15" height="15">'+grade[arrIdx]+' </div>' + 
		        '                <div class="jibun ellipsis">'+addressCut[arrIdx]+' - '+category[arrIdx]+'</div>' + 
		        '                <div><img src="images/list/read_icon.png" width="15" height="15">'+readcount[arrIdx]+
		        '					  <img src="images/list/review_icon.jpg" width="15" height="15"> '+reviewcount[arrIdx]+
		        '				 </div>' + 
		        '            </div>' + 
		        '        </div>' + 
		        '    </div>' +    
		        '</div>');
		
		points[arrIdx] = markerPosition;
		bounds.extend(points[arrIdx]);		
		
		overlay.setMap(null);		
		
		markers.push(marker);
		overlays.push(overlay);
		
		arrIdx++;
		
		map.setBounds(bounds, 0,0,0,0);
	});
	
	function closeOverlay() {
	    overlay.setMap(null);     
	}
	
	
	function getClickHandler(seq) {
	    return function(e) {
	    	
	        for(var i=0; i<markers.length; i++){
	        	overlays[i].setMap(null);
	        }
	        
	        overlay = overlays[seq];
	        overlay.setMap(map)
	    };
	};
	
	for(var i=0, ii=markers.length; i<ii; i++) {
		kakao.maps.event.addListener(markers[i], 'click', getClickHandler(i)); 
	}

</script>