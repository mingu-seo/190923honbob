<%@page import="util.PageInfo"%>
<%@page import="java.util.List"%>
<%@page import="vo.RestaurantVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%RestaurantVO resVO = (RestaurantVO)request.getAttribute("resVO"); %>
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
        .container {
            position: relative;
            overflow: hidden;
            width:100%;
            height:auto;
        }
        .Lcontent {
            width:74%;
            float:left;
        }
        .Lcontent > .inner{
            background-color:#ffffff;
            width: 1000px;
            margin: 3% auto;
            padding: 0 0 0 120px;            
        }
        .Lcontent > .inner > .search-info{
            margin: 10px 15px ;
        }
        .Lcontent > .inner > .search-info > h1{
            float: left;
            width: 770px;
        }
        .Lcontent > .inner > .search-info > .filter{
			line-height: 3;            
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
            width: 385px;
            height: 250px;
        }
        .restaurants-info p:nth-child(3) span{
        	white-space : nowrap;
	    	overflow : hidden;
	    	text-overflow: ellipsis;
	    	display: block;
	    	width: 385px;
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
            width:26%;
            height:1000px;
            float:right;
        }
        .Rcontent > .map{
            height: 70%;
            background-color:#a5c2a7;
        }
        .locationSearch {
        	text-align:center;
        	border: 2px solid #ff792a;
            border-radius: 40px;
            padding: 10px 10px;
            color: white;
            background-color: #ff792a;
            font-size: 22px;
            cursor: pointer;
            display: inline-block;
            position: relative;
            left : 150px;
            top : 600px;
            z-index: 100;        
            width: 200px;
        }
        .Rcontent > .chat{
            height: 30%;
            background-color:#c2a5a5;
            text-align:center;
            line-height:200px;
        }        
        .darken-background{
            position: fixed;
            top: 0; left: 0; right: 0;
            height: 100%;
            display: none;
            background: rgba(0,0,0,0.9);
            z-index: 10000;
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
            width: 70px;
            height: 70px;
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
            background-color: #ff792a;
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
        	color: #ff792a;
        }
        .checked2{
        	display: inline-block;
            width: 25%;
            margin: 0 18px;            
            border-radius: 40px;
            padding: 15px 0px;
            color: #ff792a;
        	border: 2px solid #ff792a;
            font-size: 20px;
        }
        .filterArea{
        	cursor: pointer;
        }
        .filterArea label{
        	cursor: pointer;
        }
        #img{
	    	position : absolute;
	    }
	    a:link 
	    { 
	    	color: black; text-decoration: none;
	    }
	    a:visited {
		    text-decoration: none; 
		    color: #333333;
	    }
 		a:hover {
 			color: #ff792a; text-decoration: underline;
 		}
    	
</style>

<script>

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
    	$("#mapLevel").val(6);
    	$("#latitude").val(0);
    	$("#longitude").val(0);
    	listAjax();
    }
    
</script>

</head>

<body>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=968f5cb093e2b0f76e796a0721504779&libraries=services"></script>

    <div class="stylewrap">
		<jsp:include page="header.jsp"></jsp:include>
      
        <div class="container">            
            
            
        </div>            
    </div>
        <jsp:include page="footer.jsp"></jsp:include>
        <div class="darken-background">
        <form name="searchFilter" id="searchFilter" action="searchList.do">
        <input type="hidden" name="page" id="page" value="1">
        <input type="hidden" name="latitude" id="latitude" value="0">
        <input type="hidden" name="longitude" id="longitude" value="0">
        <input type="hidden" name="mapLevel" id="mapLevel" value="6">
             <div class="popup-filter">
                 <div class="inner">
                     <div class="filter-item">
                         <label class="filter-title">검색필터</label>
                         <div class="order-wrap">
                            <div class="filterArea checked2">
                                <input type="radio" name="filter1" value="grade" id="grade">
                                <label for="grade">별점순</label>
                            </div>
                            <div class="filterArea order-icon">
                                <input type="radio" name="filter1" value="readcount" id="readcount" >
                                <label for="readcount">조회순</label>
                            </div>
                            <div class="filterArea order-icon">
                                <input type="radio" name="filter1" value="reviewcount" id="reviewcount" >
                                <label for="reviewcount">리뷰순</label>
                            </div>
                         </div>                        
                     </div>
                     <div class="filter-item">
                         <label class="filter-title">음식종류</label>
                         <span class="option">중복 선택 가능</span>
                         <div class="category-wrap">
                             <div class="icon">
                                <input type="checkbox" id="koreafood" name="koreafood" value="1">
                                <label for="koreafood" class="koreafood"><img id="img" src="images/list/koreafood.jpg" style="cursor:pointer;">
                                	<img src="images/list/koreafood_clicked.png" style="cursor:pointer"><h4>한식</h4></label>
                            </div>
                            <div class="icon">
                                <input type="checkbox" id="japanfood" name="japanfood" value="1">
                                <label for="japanfood" class="japanfood"><img id="img" src="images/list/japanfood.jpg" style="cursor:pointer;">
                               		<img src="images/list/japanfood_clicked.png" style="cursor:pointer"><h4>일식</h4></label>
                            </div>
                            <div class="icon">
                                <input type="checkbox" id="chinafood" name="chinafood" value="1">
                                <label for="chinafood" class="chinafood"><img id="img" src="images/list/chinafood.jpg" style="cursor:pointer;">
                                	<img src="images/list/chinafood_clicked.png" style="cursor:pointer"><h4>중식</h4></label>
                            </div>
                            <div class="icon">
                                <input type="checkbox" id="westernfood" name="westernfood" value="1">
                                <label for="westernfood" class="westernfood"><img id="img" src="images/list/westernfood.jpeg" style="cursor:pointer;">
                                	<img src="images/list/westernfood_clicked.jpeg" style="cursor:pointer"><h4>양식</h4></label>
                            </div>
                            <div class="icon">
                                <input type="checkbox" id="etcfood" name="etcfood" value="1">
                                <label for="etcfood" class="etcfood"><img id="img" src="images/list/etcfood.jpg" style="cursor:pointer;">
                                	<img src="images/list/etcfood_clicked.png" style="cursor:pointer"><h4>기타</h4></label>
                            </div>                                                            
                         </div>
                         <label class="filter-title">식당옵션</label>
                         <div class="category-wrap2">
                         	<div class="icon">
                                <input type="checkbox" id="table2" name="table2" value="1">
                                <label for="table2" class="table2"><img id="img" src="images/list/table2.png" style="cursor:pointer;">
                                	<img src="images/list/table2_clicked.png" style="cursor:pointer"><h4>2인테이블</h4></label>
                            </div>
                            <div class="icon">
                                <input type="checkbox" id="calculator" name="calculator" value="1">
                                <label for="calculator" class="calculator"><img id="img" src="images/list/calculator.jpg" style="cursor:pointer;">
                                	<img src="images/list/calculator_clicked.png" style="cursor:pointer"><h4>무인계산기</h4></label>
                            </div>
                            <div class="icon">
                                <input type="checkbox" id="partition2" name="partition2" value="1">
                                <label for="partition2" class="partition2"><img id="img" src="images/list/partition2.jpg" style="cursor:pointer;">
                                	<img src="images/list/partition2_clicked.png" style="cursor:pointer"><h4>칸막이</h4></label>
                            </div>
                            <div class="icon">
                                <input type="checkbox" id="drink" name="drink" value="1">
                                <label for="drink" class="drink"><img id="img" src="images/list/drink.png" style="cursor:pointer;">
                                	<img src="images/list/drink_clicked.png" style="cursor:pointer"><h4>혼술가능</h4></label>
                            </div>
                            <div class="icon">
                                <input type="checkbox" id="park" name="park" value="1">
                                <label for="park" class="park"><img id="img" src="images/list/park.png" style="cursor:pointer;">
                                	<img src="images/list/park_clicked.png" style="cursor:pointer"><h4>주차가능</h4></label>
                            </div>
                         </div>                        
                     </div>
                 </div>
                 <div class="popup-submit">
                     <div class="cancle" onclick="hideFilter()">
                         취소
                     </div>
                     <div class="submit" onClick="submitAction();">
                         적용
                     </div>
                 </div>
             </div>
             </form>
         </div>
<div id="map" style="display : none;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=968f5cb093e2b0f76e796a0721504779&libraries=services"></script>
<script>
	
	
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
</script>
</body>
</html>