<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="css/header/style.css"/>
<script src="js/header/header.js"></script>
</head>
<body>
	<div class="wrap">
	 <!--Header-->
        <div class="header">            
            <div class="headerLeft">
                <div class="logo">
                	<img src="images/main/logo.png">                                   
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
                    <div class="list" style=" cursor: pointer;" onclick="location.href='';" onmouseover="this.style.color='#F5D0A9';"  onmouseout="this.style.color='#222222';">게시판</div>
                    <div class="list" style=" cursor: pointer;" onclick="location.href='';" onmouseover="this.style.color='#F5D0A9';"  onmouseout="this.style.color='#222222';">게시판</div>                                   
                </div>
            </div>            
        </div>
	
	
	</div>

</body>
</html>