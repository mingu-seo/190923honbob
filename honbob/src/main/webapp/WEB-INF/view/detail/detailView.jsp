<%@page import="vo.RestaurantVO" %>
<%@page import="vo.RestaurantImageVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>혼먹 식당 상세보기</title>
</head>
<body>
	
<h2>${restaurantDetail.res_name}의 상세정보</h2>
<section id="content_main">
	<section id="content_left">
		
	</section>
	<section id="content_right">
		<b>식당번호 : </b>${restaurantDetail.res_num}<br>
		<b>식당이름 : </b>${restaurantDetail.res_name}<br>
		<b>등급 : </b>${restaurantDetail.grade}<br>
		<b>조회수 : </b>${restaurantDetail.readcount}<br>
		<b>등급수 : </b>${restaurantDetail.gradecount}<br>
		<b>리뷰수 : </b>${restaurantDetail.reviewcount}<br>
		<b>주소 : </b>${restaurantDetail.address}<br>
		<b>위도 : </b>${restaurantDetail.latitude}<br>
		<b>경도 : </b>${restaurantDetail.longtitude}<br>
		<b>한식 : </b>${restaurantDetail.koreafood}<br>
		<b>중식 : </b>${restaurantDetail.chinafood}<br>
		<b>양식 : </b>${restaurantDetail.westernfood}<br>
		<b>일식 : </b>${restaurantDetail.japanfood}<br>
		<b>기타 : </b>${restaurantDetail.etcfood}<br>
		<b>술 : </b>${restaurantDetail.drink}<br>
		<b>칸막이 : </b>${restaurantDetail.partition2}<br>
		<b>계산 : </b>${restaurantDetail.calculator}<br>
		<b>주차 : </b>${restaurantDetail.park}<br>
		<b>2인 : </b>${restaurantDetail.table2}<br>
		<c:forEach var="food" items="${imageList }" varStatus="status">
			<b>대표 여부 : </b>${food.best_image},<b>이미지 번호 </b>: ${food.res_image_num }
			<img width="100px"src="images/food/${food.res_image_name }"><br>
			
		</c:forEach>
	</section>
	<div style = "clear:both"></div>
	<nav id = "commandList">
		<a href="dogList">계속 강아지 보기</a>
		<a href="dogCartAdd.dog?id=0">분양준비</a>
		<a href="dogDelete?id=0">지우기</a>
	</nav>
</section>
</body>
</html>