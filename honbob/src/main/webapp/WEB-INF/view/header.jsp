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
        $('.headerBtn').click(function() { 
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


<link rel="stylesheet" href="css/header/style.css"/>
<script src="js/header/header.js"></script>

</head>

	
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
                <div class="headerBtn">
                </div> 
                <div onclick="history.back();" class="page_cover"></div>
                <div id="Menu">
                	<div onclick="history.back();" class="close"></div>                                    
                    <% if (session.getAttribute("Session") == null) { %>
						<div class="user" style=" cursor: pointer;" onclick='window.open("http://localhost:8080/honbob/loginForm.do","_blank","height=600,width=470, status=yes,toolbar=no,menubar=no,location=no");return false'>로그인을 해주세요.</div>
			        <% } else { %>
			        	<%=sess.getUserImage() %>
			        	<%=sess.getUserName() %>님 반갑습니다.
						<a href = "logOut.do"> 로그아웃 </a>
					<% } %>
                    <div class="list" style=" cursor: pointer;" onclick="location.href='review/reviewList.do';" onmouseover="this.style.color='#F5D0A9';"  onmouseout="this.style.color='#222222';">리뷰게시판</div>
                    <div class="list" style=" cursor: pointer;" onclick="location.href='support/supportList.do';" onmouseover="this.style.color='#F5D0A9';"  onmouseout="this.style.color='#222222';">문의하기</div>                                   
                </div>
            </div>            
        </div>       
		
	
	
	

