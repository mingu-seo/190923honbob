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
    
<link rel="stylesheet" href="css/list/style.css"/>
<script src="js/list/script.js"></script>

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
        <input type="hidden" name="keyword" id="keyword" value="<%=resVO.getKeyword()%>">
        <input type="hidden" name="latitude" id="latitude" value="0">
        <input type="hidden" name="longitude" id="longitude" value="0">
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
<script src="js/list/script2.js"></script>
</body>
</html>