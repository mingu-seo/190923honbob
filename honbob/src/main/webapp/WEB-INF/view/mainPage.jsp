<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.ReviewVO" %>
<%@ page import="vo.RestaurantVO"%>
<%@ page import="java.util.List"%>

<%
List<ReviewVO> reviewList = (List<ReviewVO>)request.getAttribute("reviewList");
RestaurantVO resVO = (RestaurantVO)request.getAttribute("resVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

    <script>
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
    
    $(function(){
    	$("input:checkbox").on('click', function(){
	    	if ($(this).prop('checked')) {
	    		$(this).parent().addClass("checked");
	    		$(this).next().children().first().css("opacity", "0");
	    	}else{ 
	    		$(this).parent().removeClass("checked"); 
	    		$(this).next().children().first().css("opacity", "1");
	    		} 
	    });	    
    })
    

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
    
   
    

    </script>
    
    <style>
        * {
            margin:0;
            padding:0;
        }
        .wrap {
            width: 100%;
            margin:0 auto;            
        }
        .header {			
            top: 0;            
            width:100%;            
            height: 70px;
            line-height: 73px;
            font-size: 13px;
            font-weight: 400;
            background-color: #f4f7f6;
            z-index: 302;
            margin-left: auto;
            position: relative;
            min-width:1903px;
            
        }

        .header>.headerLeft{
            position: absolute;
            width: 230px;
            height: 70px;
            cursor: pointer;
            overflow: hidden;
            border-right: 1px solid #cacaca;                         
        }

        .header>.headerLeft>.logo img{
            position: absolute;            
            top: 10px;                        
            width: 190px;
            height: 50px;            
            display: block;
            left:20px;                     
        }
        
        .header>.headerLeft>.logo{
        	position: absolute;                        
            width: 240px;
            height: 70px;            
            display: block; 
        
        }
        .header>#searchForm>.search{
            position: absolute;
            top:0;
            left:37%;            
            width:30%;            
        }

        .header>#searchForm>.search>.searchInput{
            position: absolute;            
            top:20px;
            width: 100%;
            padding-left: 45px;
            height: 40px;
            border: 0px;
            border-bottom: 1px solid #222228;
            font-size: 18px;
            color: #222222;
            background: url(https://s3-ap-northeast-1.amazonaws.com/dcicons/new/images/web/common/search@2x.png) no-repeat left;
            background-size: 40px;
        }

        .header>.headerRight{
            position: absolute;            
            width:230px;
            height:70px;
            font-size: 0px;
            right:0;
            border-left:1px solid#cacaca;               
        }

        .header>.headerRight>.mypage{
            position: absolute;
            background-image: url(https://mp-seoul-image-develop-s3.mangoplate.com/web/resources/2018022864551sprites_desktop.png?fit=around|*:*&crop=*:*;*,*&output-format=png&output-quality=80);
            background-position: -82px -919px;
            top:20px;
            width: 34px;
            height: 34px;
            display: block;
            left : 20%;
        }
        
       

        

        
        .btn { 
            width: 50px; 
            height: 50px; 
            position: absolute; 
            right: 10px; 
            top: 10px; 
            z-index: 1; 
            background-image: url("https://s1.daumcdn.net/cfs.tistory/custom/blog/204/2048858/skin/images/menu.png"); 
            background-size: 50%; 
            background-repeat: no-repeat; 
            background-position: center; 
            cursor: pointer; 
        } 
            
            
        .close { 
            width: 50px; 
            height: 50px; 
            position: absolute; 
            right: 0px; 
            top: 0px; 
            background-image: url("https://s1.daumcdn.net/cfs.tistory/custom/blog/204/2048858/skin/images/close.png"); 
            background-size: 50%; 
            background-repeat: no-repeat; 
            background-position: center; 
            cursor: pointer; 
        }  
        #menu { 
            width: 230px; 
            height: 100%; 
            position: fixed; 
            top: 0px; 
            right: -232px; 
            z-index: 10; 
            border: 1px solid #c9c9c9; 
            background-color: white; 
            text-align: center; 
            transition: All 0.2s ease; 
            -webkit-transition: All 0.2s ease; 
            -moz-transition: All 0.2s ease; 
            -o-transition: All 0.2s ease; 
        }  
        #menu.open { 
            right: 0px; 
        } 
        
        .page_cover.open { 
            display: block; 
        } 
        
        .page_cover { 
            width: 100%; 
            height: 100%; 
            position: fixed; 
            top: 0px; 
            left: 0px; 
            background-color: rgba(0,0,0,0.4); 
            z-index: 4; 
            display: none; 
        }
         .header>#searchForm>.search>.gps{
            position: absolute;
            top:20px;
            width:50px;
            height:50px;
            left:-130px;            
            font-size: 0;
            white-space: nowrap;
        }

        .header>#searchForm>.search>.gps>.gpsBtn{
            background: #fff url(https://www.yogiyo.co.kr/mobile/image/sprite-icon.png?v=60803898f15011f36386764ab7f8933c6a9b1487) no-repeat 0 0;
            background-size: 400px;
            width: 40px;
            height: 40px;
            border-radius: 4px;
            border: none;
            position:absolute;
            left:140%;
        }

        .bannerContainer{
            height: 500px;
            width: 1200px;
            text-align: center;
            margin: 0 auto;
            position: relative;
            margin-top: 5px;
            
            
                
        }
        .bannerContainer>.banner{
            position: relative;
            width: 1200px;
            height: 100%;
            z-index: 2;     
            text-align: center;
            min-width:1200px;
            display:inline-block;
            overflow:hidden;
                             
        }
        .bannerContainer>.banner img{
			width:1200px;
			height:120%;
			       
        }
        

        .select{           
            max-width: 1200px;
            margin: 0 auto;
            padding-top:10px;
            padding-bottom:10px;
            background: #fff;
            background: #fff;
            box-shadow: 1px 1px 3px #d8d8d8;
            margin-bottom: 20px;    
        }
        .select>.size{
            padding-left: 0px;
            padding-right: 0px;          
        }
        .select>.size>#search>.list{
            position: relative;
            border: none;
            padding: 0;
            margin: 5px 0;            
            border-radius: 0px;
            overflow: hidden;
            min-width:1200px;
        }
        .select>.size>#search>.list>.img {
            float: left;
            text-align: center;            
            margin:7.5px;
            width: 18%;
                       
                            
        }

        .select>.size>#search>.list>.img img{
            width: 150px;
            height: 150px;
            margin: auto;
            display: inline-block;            
        }
        .select>.size>#search>.selectBottom{
            position: relative;
            padding: 13px 15px 20px;
            width: 100%;
            height: 109px;            
            border-top: 0;
            box-sizing: border-box;
            min-width:1200px;
            
        }

        .select>.size>#search>.selectBottom>.searchBtn{
            color: #fff;
            box-shadow: 0 4px 10px rgba(0,0,0,0.36);
            border-color: #222;
            
        }

        .select>.size>#search>.selectBottom>.searchBtn>.search{
            display: inline-block;
            position: relative;
            z-index: 2;
            position: absolute;
            top: 20px;
            right: 15px;
            width: 140px;
            height: 69px;
            border: 1px solid #ddd;
            box-sizing: border-box;
            background: #222;
            font-size: 15px;
            letter-spacing: -1px;
            line-height: 65px;
            text-align: center;
            vertical-align: top;                      
            transition: all 0.2s linear;
        }

        .review{
        	max-width:1200px;
            padding: 50px 10px 0px 0px;
            background: #fff;
            box-shadow: 1px 1px 3px #d8d8d8;
            text-align: center;            
            margin:0 auto; 
            min-width:1200px;           
        }

        .subject{
            font-size: 24px;
            color: #222228;
            line-height: 120%;
            margin-bottom: 20px;
            font-weight: 600;
        }

        .review>.list{
            position: relative;
            height: 1333px;            
        }

        .review>.list>.item{
           display: inline-block;
           padding: 20px;
           border: 1px solid #e6e6eb;
           margin: 50px;                            
           text-align:center;           
           width:24.8%;
        }

        .review>.list>.item>.top{
            position: relative;
            padding-left: 80px;
            min-height: 70px;
            margin-bottom: 10px;
        }

        .review>.list>.item>.top>.img{
            position: absolute;
            top: 0px;
            left: 0px;
            width: 70px;
            height: 70px;
            overflow: hidden;
        }

        .review>.list>.item>.top>.img img{
            width:100%;
        }

        .review>.list>.item>.top>.topRight>.id{
            font-size: 13px;
            color: #222228;
            margin-bottom: 2px;
        }

        .review>.list>.item>.top>.topRight>.restaurant{
            font-size: 15px;
            color: #222228;
            font-weight: 600;
            margin-bottom: 2px;
        }
        
        .review>.list>.item>.top>.topRight>.point{
            position: relative;            
            height: 20px;            
        }

        .review>.list>.item>.comment{
            font-size: 13px;
            color: #222228;
            margin-bottom: 5px;
            max-height: 65px;
            overflow: hidden;
        }

        .review>.list>.item>.img{
            height: 130px;
            overflow: hidden;
        }

        .review>.list>.item>.bottom{
            overflow: hidden;
            margin-top: 20px;
        }

        .review>.list>.item>.bottom>.btn1{
            line-height: 30px;
            border: 1px solid #222228;
            display: block;
            font-size: 13px;
            color: #222228;
            text-align: center;
            display: inline-block;
            padding: 0px 13px;
            border-radius: 2px;
        }

        .review>.list>.item>.bottom>.btn2{
            line-height: 30px;
            border: 1px solid #222228;
            display: block;
            font-size: 13px;
            color: #222228;
            text-align: center;
            display: inline-block;
            padding: 0px 24px;
            border-radius: 2px;
        }
        
        .footer{
        	margin-top:20px;
        	margin-bottom:20px;
            position: relative;
            height: 145px;
            font-size: 13px;
            line-height: 20px;
        }        
        .footer>.size>.info{
            position: absolute;
            top: 10px;
            left: 20px;
            color: #57575c;
        }

        .footer>.size>.sns{
            position: absolute;
            top: 30px;
            right: 20px;
            font-size: 0px;
        }

        .footer>.size>.sns a{
            width: 15px;
            height: 15px;
            padding: 0px 8px;
            
        }

        #menu.open>.list{
            font-size: 15px;
            top:150px;
            margin: 15px;
            position: relative;
            text-align: center;
            width:200px;
            height:100px;
            border: 1px solid #222228;
            background-color: orange;
        }

        #menu.open>.user{
            font-size: 15px;
            top:50px;
            margin:15px;
            position: relative;
            text-align: center;
            width:200px;
            height: 100px;
            border-bottom: 1px solid #222222;
        }
         .checked{
        	color: rgb(255, 174, 52);
        }
        
         
        #img{
        	position:absolute;        	
        }
        
        
        .img input{
        	display:none;
        }

       
        
    </style>
</head>
<body>
    <div class="wrap">
        <!--Header-->
        <div class="header">            
            <div class="headerLeft">
                <div class="logo">
                	<img src="images/logo.png">                                   
                </div>
            </div>
            <form action="searchList.do" method="post" name="searchword" id="searchForm" >
            <input type="hidden" name="latitude" id="search_lat" value="">
            <input type="hidden" name="longitude" id="search_long" value="">
            <div class="search">
	            <div class="gps">
	            	<input type="button" onclick="getLocation()" class="gpsBtn" name="gps" style="cursor:pointer;">
	            </div>
                <input class="searchInput" placeholder="음식이나 식당 검색" type="text" name="sword">
                                             
            </div>
            </form>
            <div class="headerRight">
                <div class="mypage" style=" cursor: pointer;" onclick="location.href='';">                    
                </div>                                                                          
                <div class="btn">
                </div> 
                <div onclick="history.back();" class="page_cover"></div>
                <div id="menu">
                    <div onclick="history.back();" class="close"></div>
                    <div class="user" style=" cursor: pointer;" onclick="location.href='';">로그인을 해주세요.</div>
                    <div class="list" style=" cursor: pointer;" onclick="location.href='';">게시판</div>
                    <div class="list" style=" cursor: pointer;" onclick="location.href='';">게시판</div>
                    <div class="list" style=" cursor: pointer;" onclick="location.href='';">게시판</div>
                    <div class="list" style=" cursor: pointer;" onclick="location.href='';">게시판</div>                    
                </div>
            </div>            
        </div>
        <!--Banner-->
        <div class="bannerContainer">
            <div class="banner">
            	<img src="images/banner.png">
            </div>
        </div>
        <!--Select-->
        <div class="select">
            <div class="size">
            <form name="search" action="searchList.do" id="search" method="get">
                <div class="list">
					
                    <div class="img">                    
                        <input type="checkbox" id="koreafood" name="koreafood" value="1" >
                        <label for="koreafood" class="koreafood"><img id="img" src="images/list/koreafood.jpg" style="cursor:pointer; "><img src="images/list/koreafood_clicked.png" style="cursor:pointer"><h4>한식</h4></label>
                    </div>
        
                    <div class="img">                    
                        <input type="checkbox" id="japanfood" name="japanfood" value="1" >
                        <label for="japanfood" class="japanfood"><img id="img" src="images/list/japanfood.jpg" style="cursor:pointer; "><img src="images/list/japanfood_clicked.png" style="cursor:pointer"><h4>일식</h4></label>
                    </div>
                
                
                    <div class="img">                    
                        <input type="checkbox" id="chinafood" name="chinafood" value="1" >
                        <label for="chinafood" class="chinafood"><img id="img" src="images/list/chinafood.jpg" style="cursor:pointer; "><img src="images/list/chinafood_clicked.png" style="cursor:pointer"><h4>중식</h4></label>
                    </div>
                    
                
                     <div class="img">                    
                        <input type="checkbox" id="westernfood" name="westernfood" value="1" >
                        <label for="westernfood" class="westernfood"><img id="img" src="images/list/westernfood.jpeg" style="cursor:pointer; "><img src="images/list/westernfood_clicked.jpeg" style="cursor:pointer"><h4>양식</h4></label>
                    </div>
                    
                    <div class="img">                    
                        <input type="checkbox" id="etcfood" name="etcfood" value="1" >
                        <label for="etcfood" class="etcfood"><img id="img" src="images/list/etcfood.jpg" style="cursor:pointer; "><img src="images/list/etcfood_clicked.png" style="cursor:pointer"><h4>기타</h4></label>
                    </div>

                     <div class="img">                    
                        <input type="checkbox" id="table2" name="table2" value="1" >
                        <label for="table2" class="table2"><img id="img" src="images/list/table2.png" style="cursor:pointer; "><img src="images/list/table2_clicked.png" style="cursor:pointer"><h4>2인테이블</h4></label>
                    </div>
                
                
                     <div class="img">                    
                        <input type="checkbox" id="calculator" name="calculator" value="1" >
                        <label for="calculator" class="calculator"><img id="img" src="images/list/calculator.jpg" style="cursor:pointer; "><img src="images/list/calculator_clicked.png" style="cursor:pointer"><h4>무인계산기</h4></label>
                    </div>
                
                     <div class="img">                    
                        <input type="checkbox" id="partition2" name="partition2" value="1" >
                        <label for="partition2" class="partition2"><img id="img" src="images/list/partition2.jpg" style="cursor:pointer; "><img src="images/list/partition2_clicked.png" style="cursor:pointer"><h4>칸막이</h4></label>
                    </div>
        
                     <div class="img">                    
                        <input type="checkbox" id="drink" name="drink" value="1" >
                        <label for="drink" class="drink"><img id="img" src="images/list/drink.png" style="cursor:pointer; "><img src="images/list/drink_clicked.png" style="cursor:pointer"><h4>혼술가능</h4></label>
                    </div>
            
                
                     <div class="img">                    
                        <input type="checkbox" id="park" name="park" value="1" >
                        <label for="park" class="park"><img id="img" src="images/list/park.png" style="cursor:pointer; "><img src="images/list/park_clicked.png" style="cursor:pointer"><h4>주차가능</h4></label>
                    </div>                                      
                </div>
                <div class="selectBottom">
                    <div class="address">

                    </div>
                    <div class="searchBtn" style=" cursor: pointer;" onclick="document.forms['search'].submit();">
                        <span class="search">선택한 결과로 검색</span>
                    </div>
                </div>
            </form>
            </div>
        </div> 
        <!--Review-->
        <div class="review">
            <p class="subject">실시간 리뷰</p>                      
            <div class="list">
            <%
            for(int i=0; i<reviewList.size(); i++){
            %>                
                <div class="item">
                    <div class="top"> <!--리뷰 상단-->
                        <div class="img"> <!--썸네일-->                            
								<img src="https://s3-ap-northeast-1.amazonaws.com/dcreviewsresized/300_300_20200121083816_photo1_6b93810357a8.jpg">
                        </div>
                        <div class="topRight"><!--상단 우측-->
                            <p class="id"><%=reviewList.get(i).getId() %></p>
                            <p class="restaurant"><%=reviewList.get(i).getSubject() %></p>
                            <p class="point">평점</p>                            
                        </div>
                    </div>                    
                    <div class="comment"><!--한줄소개-->
                        <p><%=reviewList.get(i).getContent() %></p>                        
                    </div>
                    <p class="img" style="height:130px;overflow:hidden;"><!--메인 이미지-->
                        <img src="https://s3-ap-northeast-1.amazonaws.com/dcreviewsresized/300_300_20200121083816_photo1_6b93810357a8.jpg" style="width: 48%;margin-top:-35px; float:left; height:200%;">
                        <img src="https://s3-ap-northeast-1.amazonaws.com/dcreviewsresized/300_300_20200121083816_photo1_6b93810357a8.jpg" style="width: 48%;margin-top:-35px; float:right; height:200%">
                    </p>
                    <div class="bottom"><!--리뷰 하단-->
                        <div class="btn1" style="cursor: pointer; float: left;">공감</div>
                        <div class="btn2" style="cursor: pointer; float: right;">나도 평가하기</div>
                    </div>
                </div>
			<%}%>
                
            </div>
        </div>
        <!--Footer-->
        <div class="footer">
            <div class="size">
                <div class="info">
                    <p>구디아카데미</p>
            		<p>서울시 금천구 가산0로 대륭포스코 800호</p>
            		<p>02-1234-5678 | 02-5678-1234</p>
            		<p>대표자 홍길동 | 개인정보책임자 김길도</p>
            		<p>사업자등록번호 111-00-22222</p>
                </div>
                <div class="sns">
            		<a href="https://www.instagram.com/?hl=ko"><img src="https://s3-ap-northeast-1.amazonaws.com/dcicons/new/images/web/common/ic-main-btm-instagram@2x.png"></a>
            		<a href="https://www.facebook.com/"><img src="https://s3-ap-northeast-1.amazonaws.com/dcicons/new/images/web/common/ic-main-btm-facebook@2x.png"></a>
            		<a href="https://twitter.com/"><img src="https://s3-ap-northeast-1.amazonaws.com/dcicons/new/images/web/common/ic-main-btm-twitter@2x.png"></a>
            	</div>
            </div>
        </div>

    </div>
</body>
</html>