<%@page import="java.util.List"%> 
<%@page import="Honmuk.RestaurantVO"%>
<%@page import="Honmuk.PageInfo"%>
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
<%RestaurantVO resVO = (RestaurantVO)request.getAttribute("resVO"); %>
<%List<RestaurantVO> searchlist = (List<RestaurantVO>)request.getAttribute("searchlist");%>
<html>
<head>
    <title>밥먹자</title>
    <meta name="viewport" charset="utf-8" content="user-scalable=no, initial-scale=1, maximum-scale=1">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <!-- <link rel="stylesheet" href="css/style.css"/> -->
    <style>
        * {
            margin:0;
            padding:0;
            text-decoration:none;
        }
        .stylewrap {
            margin:0 auto;
        }
        .header {
            background-color:#273443;
            height:100px;
            width:100%;
            color:#ffffff;
            text-align:center;
            line-height:100px;
        }        
        .container {
            position: relative;
            overflow: hidden;
            width:100%;
            height:auto;
        }
        .Lcontent {
            width:75%;
            float:left;
        }
        .Lcontent > .inner{
            background-color:#ffffff;
            padding: 3% 20%;
        }
        .Lcontent > .inner > .search-info{
            margin: 10px 15px ;
        }
        .Lcontent > .inner > .search-info > h1{
            float: left;
        }
        .Lcontent > .inner > .search-info > .filter{
            float: right;
            margin-top: 10px;
            margin-right: 10px;
        }        
        .search-restaurants-list{
            width: 100%;
            overflow: hidden;
        }
        .restaurants-list{
            list-style-type: none;
            width: 900px;
        }
        .restaurants-item{
            float: left;
            display: block;
            margin: 10px 15px ;
        }
        .restaurants-thumb{
            border: 1px solid black;
            width: 385px;
            height: 250px;
        }
        .paging{
            font-size: xx-large; 
            text-align: center;       
            margin-bottom : 20px;
        }
        .paging > a{
            margin: 5px 8px;
        }
        .Rcontent {
            width:25%;
            height:1000px;
            float:right;
        }
        .Rcontent > .map{
            height: 70%;
            background-color:#a5c2a7;
            text-align:center;
            line-height:500px;
        }
        .Rcontent > .chat{
            height: 30%;
            background-color:#c2a5a5;
            text-align:center;
            line-height:200px;
        }
        .footer {
            width:100%;
            background-color:#d1c3a7;
            height:80px;
            text-align:center;
            line-height: 80px;
        }
        .darken-background{
            position: fixed;
            top: 0; left: 0; right: 0;
            height: 100%;
            display: none;
            background: rgba(0,0,0,0.9);
            z-index: 10000;
            overflow-y: scroll;
        }
        .popup-filter{
            width: 700px;
            margin: 20px auto; 
            padding: 15px;
            border: 1px solid #333333;
            border-radius: 5px;
            background: white;
            box-shadow: 0 5px 5px rgba(34, 25, 25, 0.4);
        }

        .filter-item{
            margin: 30px 15px;
            padding-bottom: 10px;
            width: auto;
            border-bottom: 1px solid rgb(185, 183, 183);
        }
        .filter-item > .filter-title{
            font-size: 25px;
            text-align: left;
        }
        .filter-item > span{
            font-size: 15px;
            float: right;
            top: 15px;
        }
        .filter-item > .category-wrap{
            margin: 15px 15px 30px 15px;
            text-align: center;
            padding-bottom: 15px;
        }
        .filter-item > .category-wrap2{
            margin: 15px;
            text-align: center;
        }
        .filter-item input{
            display: none;
        }
        .icon img{
            width: 90px;
            height: 90px;
        }        
        .icon{
            width: 18%;
            display: inline-block;
            text-align: center;
            margin-bottom: 15px;
        }
        .popup-submit{
            text-align: center;
        }
        .popup-submit > div{
            display: inline-block;
            width: 40%;
            margin: 20px auto; 
            border: 1px solid #ffffff;
            border-radius: 40px;
            padding: 20px 0px;
            color: white;
            font-size: 22px;
            cursor: pointer;
        }
        .popup-submit > .cancle{
            background-color: rgb(211, 210, 210);
        }
        .popup-submit > .submit{
            background-color: rgb(255, 174, 52);
        }
        .filter-item >.order-wrap{
            text-align: center;
            margin: 20px auto;             
        }
        .order-wrap > .order-icon{
            display: inline-block;
            width: 25%;
            margin: 0 18px;            
            border-radius: 40px;
            padding: 15px 0px;
            border: 2px solid #9b9b9b;
            color: rgb(165, 165, 165);
            font-size: 20px;
        }
        .checked{
        	color: rgb(255, 174, 52);
        }
        .checked2{
        	display: inline-block;
            width: 25%;
            margin: 0 18px;            
            border-radius: 40px;
            padding: 15px 0px;
            color: rgb(255, 174, 52);
        	border: 2px solid #ffae34;
            font-size: 20px;
        }
        .filterArea{
        	cursor: pointer;
        }
        .filterArea label{
        	cursor: pointer;
        }


    </style>
    <style>
    .wrap {
    position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;
    text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
    line-height: 1.5;
    }
    .wrap * {
    padding: 0;margin: 0;
    }
    .wrap .info {
    width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;
    border-right: 1px solid #ccc;overflow: hidden;background: #fff; z-index:99;
    }
    .wrap .info:nth-child(1) {
    border: 0;box-shadow: 0px 1px 2px #888;
    }

    .info .body {
    position: relative;overflow: hidden;
    }
    .info .desc {
    position: relative;margin: 13px 0 0 90px;height: 75px;
    }
    .desc .ellipsis {
    overflow: hidden;text-overflow: ellipsis;white-space: nowrap;
    }
    .desc .jibun {
    font-size: 11px;color: #888;margin-top: -2px;
    }
    .info .img {
    position: absolute;top: 20px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;
    color: #888;overflow: hidden;
    }
    .info:after {
    content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;
    background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
    }
    .info .link {
    color: #5085BB;
    }
    
    #img{
    	position : absolute;
    }    
    </style>
<script>

	$(function(){
	    
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
	
    function showFilter(){               
    		    	    	
        $('.darken-background').show();
        $('.darken-background').css('top', $(window).scrollTop());

        $('body').css('overflow:hidden');        
        
    }
    
    function hideFilter(){
        $('.darken-background').hide();

        $('body').css('overflow', '');
    }   
        
    
</script>

</head>

<body>
    <div class="stylewrap">
        <div class="header">
            HEADER
        </div>        
        <div class="container">
            <div class="Lcontent">
                <div class="inner">
                    <div class="search-info">
                        <h1>검색장소 인기순 검색순위</h1>
                        <div class="filter" onclick="showFilter()" style="cursor:pointer">
                            <p>필터</p>
                        </div>
                    </div>
                    <div class="search-restaurants-list">
                        <div class="restaurants-list">
                        
                        	<c:forEach var = "res" items="${searchlist }" varStatus="status">
                            	<div class="restaurants-item">
                                   <div class="restaurants-thumb">
                                   </div>
                                   <div class="restaurants-info">
                                       <a href="#"><h2>${res.res_name }</h2></a>
                                       <strong class="grade"><img src="images/grade_icon.png" width="15" height="15">${res.grade }</strong>
                                       <p><span>지역 / 카테고리</span></p>
                                       <p>
                                           <span class="view_count"><img src="images/read_icon.png" width="15" height="15">${res.readcount }</span>
                                           <span class="review_count"><img src="images/review_icon.jpg" width="15" height="15">${res.reviewcount }</span>
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
							<a href="searchList.do?page=<%=nowPage-1 %>&koreafood=<%=resVO.getKoreafood()%>&japanfood=<%=resVO.getJapanfood()%>
							&chinafood=<%=resVO.getChinafood()%>&westernfood=<%=resVO.getWesternfood()%>&etcfood=<%=resVO.getEtcfood()%>
							&table2=<%=resVO.getTable2()%>&calculator=<%=resVO.getCalculator()%>&partition2=<%=resVO.getPartition2()%>
							&park=<%=resVO.getPark()%>&drink=<%=resVO.getDrink()%>&filter1=<% if(resVO.getGrade()==1){%>grade<%
								}else if(resVO.getReadcount()==1){%>readcount<%}else if(resVO.getReviewcount()==1){%>reviewcount<%}%>">◀</a>&nbsp;
							<%} %>
							
						<%for (int a=startPage; a<=endPage; a++){
							if(a==nowPage){%>
							<%=a %>
							<%}else{ %>
							
								<a href="searchList.do?page=<%=a %>&koreafood=<%=resVO.getKoreafood()%>&japanfood=<%=resVO.getJapanfood()%>
							&chinafood=<%=resVO.getChinafood()%>&westernfood=<%=resVO.getWesternfood()%>&etcfood=<%=resVO.getEtcfood()%>
							&table2=<%=resVO.getTable2()%>&calculator=<%=resVO.getCalculator()%>&partition2=<%=resVO.getPartition2()%>
							&park=<%=resVO.getPark()%>&drink=<%=resVO.getDrink()%>&filter1=<% if(resVO.getGrade()==1){%>grade<%
								}else if(resVO.getReadcount()==1){%>readcount<%}else if(resVO.getReviewcount()==1){%>reviewcount<%}%>"><%=a %>
								</a>&nbsp;
							<%} %>
						<%} %>
						
						<%if(nowPage>=maxPage){ %>
							▶
						<%}else{ %>
							<a href="searchList.do?page=<%=nowPage+1 %>&koreafood=<%=resVO.getKoreafood()%>&japanfood=<%=resVO.getJapanfood()%>
							&chinafood=<%=resVO.getChinafood()%>&westernfood=<%=resVO.getWesternfood()%>&etcfood=<%=resVO.getEtcfood()%>
							&table2=<%=resVO.getTable2()%>&calculator=<%=resVO.getCalculator()%>&partition2=<%=resVO.getPartition2()%>
							&park=<%=resVO.getPark()%>&drink=<%=resVO.getDrink()%>&filter1=<% if(resVO.getGrade()==1){%>grade<%
								}else if(resVO.getReadcount()==1){%>readcount<%}else if(resVO.getReviewcount()==1){%>reviewcount<%}%>">▶</a>
						<%} %>                                     
                    </p>
            </div>
            <div class="Rcontent">
	            <div class="map">
	                <div id="map" style="width:100%;height:700px;"></div>
	            </div>
	            <div class="chat">
	                    chat
	            </div>
            </div>                
        </div>
            
    </div>
        <div class="footer">
            FOOTER
        </div>
        <div class="darken-background">
        <form name="searchFilter" action="searchList.do">
             <div class="popup-filter">
                 <div class="inner">
                     <div class="filter-item">
                         <label class="filter-title">검색필터</label>
                         <div class="order-wrap">
                            <div class="filterArea <% if(resVO.getGrade()==1){%>checked2<%}else{%>order-icon<% }%>">
                                <input type="radio" name="filter1" value="grade" id="grade" <% if(resVO.getGrade()==1){%>checked="checked"<%}%>>
                                <label for="grade">별점순</label>
                            </div>
                            <div class="filterArea <% if(resVO.getReadcount()==1){%>checked2<%}else{%>order-icon<% }%>">
                                <input type="radio" name="filter1" value="readcount" id="readcount" <% if(resVO.getReadcount()==1){%>checked="checked"<%}%>>
                                <label for="readcount">조회순</label>
                            </div>
                            <div class="filterArea <% if(resVO.getReviewcount()==1){%>checked2<%}else{%>order-icon<% }%>">
                                <input type="radio" name="filter1" value="reviewcount" id="reviewcount" <% if(resVO.getReviewcount()==1){%>checked="checked"<%}%>>
                                <label for="reviewcount">리뷰순</label>
                            </div>
                         </div>                        
                     </div>
                     <div class="filter-item">
                         <label class="filter-title">음식종류</label>
                         <span class="option">중복 선택 가능</span>
                         <div class="category-wrap">
                             <div class="icon <% if(resVO.getKoreafood()==1){%>checked<%}%>">
                                <input type="checkbox" id="koreafood" name="koreafood" value="1" <% if(resVO.getKoreafood()==1){%>checked="checked"<%}%>>
                                <label for="koreafood" class="koreafood"><img id="img" src="images/koreafood.jpg" style="cursor:pointer; <% if(resVO.getKoreafood()==1){%>opacity:0<%}%>"><img src="images/koreafood_clicked.png" style="cursor:pointer"><h4>한식</h4></label>
                            </div>
                            <div class="icon <% if(resVO.getJapanfood()==1){%>checked<%}%>">
                                <input type="checkbox" id="japanfood" name="japanfood" value="1" <% if(resVO.getJapanfood()==1){%>checked="checked"<%}%>>
                                <label for="japanfood" class="japanfood"><img id="img" src="images/japanfood.jpg" style="cursor:pointer; <% if(resVO.getJapanfood()==1){%>opacity:0<%}%>"><img src="images/japanfood_clicked.png" style="cursor:pointer"><h4>일식</h4></label>
                            </div>
                            <div class="icon <% if(resVO.getChinafood()==1){%>checked<%}%>">
                                <input type="checkbox" id="chinafood" name="chinafood" value="1" <% if(resVO.getChinafood()==1){%>checked="checked"<%}%>>
                                <label for="chinafood" class="chinafood"><img id="img" src="images/chinafood.jpg" style="cursor:pointer; <% if(resVO.getChinafood()==1){%>opacity:0<%}%>"><img src="images/chinafood_clicked.png" style="cursor:pointer"><h4>중식</h4></label>
                            </div>
                            <div class="icon <% if(resVO.getWesternfood()==1){%>checked<%}%>">
                                <input type="checkbox" id="westernfood" name="westernfood" value="1" <% if(resVO.getWesternfood()==1){%>checked="checked"<%}%>>
                                <label for="westernfood" class="westernfood"><img id="img" src="images/westernfood.jpg" style="cursor:pointer; <% if(resVO.getWesternfood()==1){%>opacity:0<%}%>"><img src="images/westernfood_clicked.png" style="cursor:pointer"><h4>양식</h4></label>
                            </div>
                            <div class="icon <% if(resVO.getEtcfood()==1){%>checked<%}%>">
                                <input type="checkbox" id="etcfood" name="etcfood" value="1" <% if(resVO.getEtcfood()==1){%>checked="checked"<%}%>>
                                <label for="etcfood" class="etcfood"><img id="img" src="images/etcfood.jpg" style="cursor:pointer; <% if(resVO.getEtcfood()==1){%>opacity:0<%}%>"><img src="images/etcfood_clicked.png" style="cursor:pointer"><h4>기타</h4></label>
                            </div>                                                            
                         </div>
                         <label class="filter-title">식당옵션</label>
                         <div class="category-wrap2">
                         	<div class="icon <% if(resVO.getTable2()==1){%>checked<%}%>">
                                <input type="checkbox" id="table2" name="table2" value="1" <% if(resVO.getTable2()==1){%>checked="checked"<%}%>>
                                <label for="table2" class="table2"><img id="img" src="images/table2.png" style="cursor:pointer; <% if(resVO.getTable2()==1){%>opacity:0<%}%>"><img src="images/table2_clicked.png" style="cursor:pointer"><h4>2인테이블</h4></label>
                            </div>
                            <div class="icon <% if(resVO.getCalculator()==1){%>checked<%}%>">
                                <input type="checkbox" id="calculator" name="calculator" value="1" <% if(resVO.getCalculator()==1){%>checked="checked"<%}%>>
                                <label for="calculator" class="calculator"><img id="img" src="images/calculator.jpg" style="cursor:pointer; <% if(resVO.getCalculator()==1){%>opacity:0<%}%>"><img src="images/calculator_clicked.png" style="cursor:pointer"><h4>무인계산기</h4></label>
                            </div>
                            <div class="icon <% if(resVO.getPartition2()==1){%>checked<%}%>">
                                <input type="checkbox" id="partition2" name="partition2" value="1" <% if(resVO.getPartition2()==1){%>checked="checked"<%}%>>
                                <label for="partition2" class="partition2"><img id="img" src="images/partition2.jpg" style="cursor:pointer; <% if(resVO.getPartition2()==1){%>opacity:0<%}%>"><img src="images/partition2_clicked.png" style="cursor:pointer"><h4>칸막이</h4></label>
                            </div>
                            <div class="icon <% if(resVO.getDrink()==1){%>checked<%}%>">
                                <input type="checkbox" id="drink" name="drink" value="1" <% if(resVO.getDrink()==1){%>checked="checked"<%}%>>
                                <label for="drink" class="drink"><img id="img" src="images/drink.png" style="cursor:pointer; <% if(resVO.getDrink()==1){%>opacity:0<%}%>"><img src="images/drink_clicked.png" style="cursor:pointer"><h4>혼술가능</h4></label>
                            </div>
                            <div class="icon <% if(resVO.getPark()==1){%>checked<%}%>">
                                <input type="checkbox" id="park" name="park" value="1" <% if(resVO.getPark()==1){%>checked="checked"<%}%>>
                                <label for="park" class="park"><img id="img" src="images/park.png" style="cursor:pointer; <% if(resVO.getPark()==1){%>opacity:0<%}%>"><img src="images/park_clicked.png" style="cursor:pointer"><h4>주차가능</h4></label>
                            </div>
                         </div>                        
                     </div>
                 </div>
                 <div class="popup-submit">
                     <div class="cancle" onclick="hideFilter()">
                         취소
                     </div>
                     <div class="submit" onClick="document.forms['searchFilter'].submit();">
                         적용
                     </div>
                 </div>
             </div>
             </form>
         </div>
    </div>
    
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=968f5cb093e2b0f76e796a0721504779&libraries=services"></script>
<script>

	var mapContainer = document.getElementById('map'), // 지도의 중심좌표
		mapOption = { 
		    center: new kakao.maps.LatLng(33.451475, 126.570528), // 지도의 중심좌표
		    level: 4 // 지도의 확대 레벨
	}; 
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	var geocoder = new kakao.maps.services.Geocoder();
	
	console.log("<%=searchlist.get(0).getAddress()%>");
	
	var locations = [
		'서울특별시 금천구 가산동 가산디지털2로 115',
		'서울 금천구 가산디지털1로 168',
		'서울 금천구 가산디지털2로 108',
		'서울 금천구 가산디지털2로 98'
	]
	<%-- <% for(int i=0; i<searchlist.size(); i++){
		locations[i] = searchlist.get(i).getAddress();
	}
	%> --%>
	
	
	var content;
	
	
	locations.forEach(function(location){		
	
		geocoder.addressSearch(location, function(result, status) {			
			
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
	
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        
				//마커 위에 커스텀오버레이를 표시합니다
				//마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다\
				
				var overlay = new kakao.maps.CustomOverlay({
					content: content,
					map: map,
					position: marker.getPosition()       
				});	
				
				/* var div = document.createElement('div');
				var info = document.createElement('div');
				div.className = 'testClass';
				div.appendChild(info); */
				
				overlay.setPosition(marker.getPosition());
				overlay.setContent('<div class="wrap">' + 
				        '    <div class="info">' + 
				        '        <div class="title">' + 
				        '        </div>' + 
				        '        <div class="body">' + 
				        '            <div class="img">' +
				        '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="90" height="90">' +
				        '           </div>' + 
				        '            <div class="desc">' + 
				        '                <div class="ellipsis">식당명 </div>' + 
				        '                <div class="marker-grade">별점 </div>' + 
				        '                <div class="jibun ellipsis">지역 - 카테고리</div>' + 
				        '                <div>즐겨찾기수 + 리뷰수</div>' + 
				        '            </div>' + 
				        '        </div>' + 
				        '    </div>' +    
				        '</div>');
				
				overlay.setMap(null);
				
				
				//마커를 클릭했을 때 커스텀 오버레이를 표시합니다
			        
		    	kakao.maps.event.addListener(marker, 'click', function() {
		    		overlay.setMap(null);
		    		overlay.setMap(map);
		        });
				        
		    	kakao.maps.event.addListener(map, 'click', function() {
		    		overlay.setMap(null);
		        });
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
   
		    } 
		});  
		
	});

</script>
</body>
</html>
