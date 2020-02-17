<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.UserVO"%>
<%
	UserVO sess = (UserVO)session.getAttribute("Session");
int userNo = 0;
if (sess != null) userNo = sess.getUserNo();
%>
<%
	session.setMaxInactiveInterval(60*60*6);
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
        
</style>

<link rel="stylesheet" href="css/header/style.css"/>
<script src="js/header/header.js"></script>

</head>
<body>
	<div class="wrap">
	 <!--Header-->
        <div class="header">            
            <div class="headerLeft" onclick="location.href='mainPage.do'">
                <div class="logo">
                	<img src="images/main/logo.png">                                   
                </div>
            </div>
            <form action="searchList.do" method="post" name="searchword" id="searchForm" >
            <input type="hidden" name="latitude" id="search_lat" value="0">
            <input type="hidden" name="longitude" id="search_long" value="0">
            <div class="search">
	            <div class="gps">
	            	<input type="button" onclick="getLocation()" class="gpsBtn" name="gps" style="cursor:pointer;">
	            </div>
                <input class="searchInput" placeholder="음식이나 식당 검색" type="text" name="keyword" value="${param.keyword }">
                                             
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
                    <div class="user" style=" cursor: pointer;" onclick=''>로그인을 해주세요.</div>
                    <div class="list" style=" cursor: pointer;" onclick="location.href='';">게시판</div>
                    <div class="list" style=" cursor: pointer;" onclick="location.href='';">게시판</div>
                    <div class="list" style=" cursor: pointer;" onclick="location.href='';">게시판</div>
                    <div class="list" style=" cursor: pointer;" onclick="location.href='';">게시판</div>                    
                    <div class="user" style=" cursor: pointer;" onclick="location.href='';">로그인을 해주세요.</div>
                    <div class="list" style=" cursor: pointer;" onclick="location.href='';" onmouseover="this.style.color='#F5D0A9';"  onmouseout="this.style.color='#222222';">게시판</div>
                    <div class="list" style=" cursor: pointer;" onclick="location.href='';" onmouseover="this.style.color='#F5D0A9';"  onmouseout="this.style.color='#222222';">게시판</div>                                   

                </div>
            </div>            
        </div>
        
		<% if (session.getAttribute("Session") == null) { %>
			<div class="user" style=" cursor: pointer;" onclick='window.open("http://localhost:8080/honbob/loginForm.do","_blank","height=600,width=470, status=yes,toolbar=no,menubar=no,location=no");return false'>로그인을 해주세요.</div>
        <% } else { %>
			<a href = "logOut.do"> 로그아웃 </a>
		<% } %>
	
	
	</div>

</body>
</html>