<%@page import="vo.RestaurantVO" %>
<%@page import="vo.RestaurantImageVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="css/detail/reset.css"/>
	<link rel="stylesheet" href="css/detail/common.css"/>
	<link rel="stylesheet" href="css/detail/content.css"/>
	<link rel="stylesheet" href="css/detail/swiper.css"/> 
	<link rel="stylesheet" href="css/detail/style.css"/> 
	<link href="https://fonts.googleapis.com/css?family=Sintony:400,700" rel="stylesheet">  
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="js/detail/swiper.min.js"></script>
	<script src="js/detail/ssss.js"></script>
	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
	var star_cnt = ${userGrade};
	function ajaxView(star_count,res_num){
    	$.ajax({
			url : 'starAjax.do',
			data :{
				'star_count' : star_count,
				'res_num' : res_num
			},
			dataType : 'JSON',
			success : function(data){
				star_cnt = data.new_star_count;
				detail_grade(data.new_star_count);
			},
			error : function(data){
				console.log(data);
			}
		});
    	showLightBox();
    }
	function load()
    {
		detail_grade(star_cnt);
    }
	$(function() {
		$('#detail_count_picture1').on('mouseenter',function() {
			detail_grade(1);
			
		}).on('mouseleave',function(){
			detail_grade(star_cnt);
		});
		$('#detail_count_picture2').on('mouseenter',function() {
			detail_grade(2);
			
		}).on('mouseleave',function(){
			detail_grade(star_cnt);
		});
		$('#detail_count_picture3').on('mouseenter',function() {
			detail_grade(3);
			
		}).on('mouseleave',function(){
			detail_grade(star_cnt);
		});
		$('#detail_count_picture4').on('mouseenter',function() {
			detail_grade(4);
			
		}).on('mouseleave',function(){
			detail_grade(star_cnt);
		});
		$('#detail_count_picture5').on('mouseenter',function() {
			detail_grade(5);
			
		}).on('mouseleave',function(){
			detail_grade(star_cnt);
		});
		
	});
	function detail_grade(star_count) {
		if(star_count==0){
			$('#detail_count_picture1').attr("src","images/detail/grade_star_off.jpg");
			$('#detail_count_picture2').attr("src","images/detail/grade_star_off.jpg");
			$('#detail_count_picture3').attr("src","images/detail/grade_star_off.jpg");
			$('#detail_count_picture4').attr("src","images/detail/grade_star_off.jpg");
			$('#detail_count_picture5').attr("src","images/detail/grade_star_off.jpg");
	   }else if(star_count==1){
			$('#detail_count_picture1').attr("src","images/detail/grade_star_on.jpg");
			$('#detail_count_picture2').attr("src","images/detail/grade_star_off.jpg");
			$('#detail_count_picture3').attr("src","images/detail/grade_star_off.jpg");
			$('#detail_count_picture4').attr("src","images/detail/grade_star_off.jpg");
			$('#detail_count_picture5').attr("src","images/detail/grade_star_off.jpg");
	   }else if(star_count==2){
			$('#detail_count_picture1').attr("src","images/detail/grade_star_on.jpg");
			$('#detail_count_picture2').attr("src","images/detail/grade_star_on.jpg");
			$('#detail_count_picture3').attr("src","images/detail/grade_star_off.jpg");
			$('#detail_count_picture4').attr("src","images/detail/grade_star_off.jpg");
			$('#detail_count_picture5').attr("src","images/detail/grade_star_off.jpg");
	   }else if(star_count==3){
			$('#detail_count_picture1').attr("src","images/detail/grade_star_on.jpg");
			$('#detail_count_picture2').attr("src","images/detail/grade_star_on.jpg");
			$('#detail_count_picture3').attr("src","images/detail/grade_star_on.jpg");
			$('#detail_count_picture4').attr("src","images/detail/grade_star_off.jpg");
			$('#detail_count_picture5').attr("src","images/detail/grade_star_off.jpg");
	   }else if(star_count==4){
			$('#detail_count_picture1').attr("src","images/detail/grade_star_on.jpg");
			$('#detail_count_picture2').attr("src","images/detail/grade_star_on.jpg");
			$('#detail_count_picture3').attr("src","images/detail/grade_star_on.jpg");
			$('#detail_count_picture4').attr("src","images/detail/grade_star_on.jpg");
			$('#detail_count_picture5').attr("src","images/detail/grade_star_off.jpg");
	   }else if(star_count==5){
			$('#detail_count_picture1').attr("src","images/detail/grade_star_on.jpg");
			$('#detail_count_picture2').attr("src","images/detail/grade_star_on.jpg");
			$('#detail_count_picture3').attr("src","images/detail/grade_star_on.jpg");
			$('#detail_count_picture4').attr("src","images/detail/grade_star_on.jpg");
			$('#detail_count_picture5').attr("src","images/detail/grade_star_on.jpg");
	   }
	}
	</script>
<style>

</style>
<meta charset="UTF-8">
<title>${restaurantDetail.res_name} 상세보기</title>
</head>
<body onload="load()">

<div id="content_subject">
	<div id="subject_left_side">
		<span id = "subject_text">${restaurantDetail.res_name}&nbsp&nbsp</span> <span id="restaurant_grade_text">${res_grade}</span><br>
		<div id="detail_count">
			&nbsp &nbsp &nbsp &nbsp
			<img class="detail_count_picture" src="images/detail/picture_read.jpg"> &nbsp
			<span class="detail_count_text">${restaurantDetail.readcount}</span> &nbsp &nbsp
			<img class="detail_count_picture" src="images/detail/picture_review.jpg"> &nbsp
			<span class="detail_count_text">${restaurantDetail.reviewcount}</span> &nbsp &nbsp
			<img class="detail_count_picture" src="images/detail/picture_like.jpg"> &nbsp
			<span class="detail_count_text">${restaurantDetail.gradecount}</span>
		</div>
	</div>
	<div id="subject_right_side">
		<img id="detail_count_picture1" src="images/detail/grade_star_off.jpg" onclick="ajaxView(1,${restaurantDetail.res_num});">
		<img id="detail_count_picture2" src="images/detail/grade_star_off.jpg" onclick="ajaxView(2,${restaurantDetail.res_num});">
		<img id="detail_count_picture3" src="images/detail/grade_star_off.jpg" onclick="ajaxView(3,${restaurantDetail.res_num});">
		<img id="detail_count_picture4" src="images/detail/grade_star_off.jpg" onclick="ajaxView(4,${restaurantDetail.res_num});">
		<img id="detail_count_picture5" src="images/detail/grade_star_off.jpg" onclick="ajaxView(5,${restaurantDetail.res_num});">
	</div>
</div>
<div id="content_main">
	<div id="content_left">
		<div id="clear"></div>
	    <div class="visual">
		    <div class="swiper swiper-container">
		    	<div class="swiper-wrapper">
		    		<c:forEach var="food" items="${imageList }" varStatus="status">
						<div class="swiper-slide" style="background-image:url('images/food/${food.res_image_name }')"></div>
					</c:forEach>
		       	</div>
		    </div>
			<div class="swiper-pagination"></div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
	   	</div>
	   	<section id="content_info">
	   	
			<b>주소 : </b>${restaurantDetail.address}<br>
			
			<b>음식 종류 : </b>
			<c:if test="${restaurantDetail.koreafood == 1}">한식</c:if>
			<c:if test="${restaurantDetail.chinafood == 1}">중식</c:if>
			<c:if test="${restaurantDetail.westernfood == 1}">양식</c:if>
			<c:if test="${restaurantDetail.japanfood == 1}">일식</c:if>
			<c:if test="${restaurantDetail.etcfood == 1}">중식</c:if><br>
			<b>편의 시설 : </b>
			<c:if test="${restaurantDetail.drink == 1}"> 혼술 가능 </c:if>
			<c:if test="${restaurantDetail.partition2 == 1}"> 칸막이 </c:if>
			<c:if test="${restaurantDetail.calculator == 1}"> 현금계산 </c:if>
			<c:if test="${restaurantDetail.park == 1}"> 주차가능 </c:if>
			<c:if test="${restaurantDetail.table2 == 1}"> 2인테이블 </c:if><br>
			
			<b>위도 : </b>${restaurantDetail.latitude}<br>
			<b>경도 : </b>${restaurantDetail.longtitude}<br>
		</section>
		<p class="middleSizeText">리뷰(${reviewcount })</p>
		<hr id = "reviewTophr">
		<c:if test="${reviewList==null}">
			<p>아직 리뷰가 작성되지 않았습니다.</p>
		</c:if>
	</div>
	<div id="content_right">
		<p id = "recom_subject">추천 식당 리스트</p>
		<c:forEach var="recom" items="${recomList }" varStatus="status">
		<a href="DetailView.do?res_num=${recom.res_num }">
			<div class="recom_res">
				<img class="recom_image" src="images/food/${recomImageList[status.index].res_image_name }"><br>
				<b>식당이름 : </b>${recom.res_name}<br>
				<b>음식 종류 : </b>
				<c:if test="${restaurantDetail.koreafood == 1}">한식</c:if>
				<c:if test="${restaurantDetail.chinafood == 1}">중식</c:if>
				<c:if test="${restaurantDetail.westernfood == 1}">양식</c:if>
				<c:if test="${restaurantDetail.japanfood == 1}">일식</c:if>
				<c:if test="${restaurantDetail.etcfood == 1}">중식</c:if><br>
				<b>편의 시설 : </b>
				<c:if test="${restaurantDetail.drink == 1}"> 혼술 가능 </c:if>
				<c:if test="${restaurantDetail.partition2 == 1}"> 칸막이 </c:if>
				<c:if test="${restaurantDetail.calculator == 1}"> 현금계산 </c:if>
				<c:if test="${restaurantDetail.park == 1}"> 주차가능 </c:if>
				<c:if test="${restaurantDetail.table2 == 1}"> 2인테이블 </c:if><br>
				
			</div>
		</a>
		</c:forEach>
	</div>
</div>
</body>
</html>