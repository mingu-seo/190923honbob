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
	function gradeConfirm(star_count){
		var result = confirm(star_count+"개의 별점을 주시겠습니까?");
		if(result){
			ajaxView(star_count,${restaurantDetail.res_num});
		}
		
	}
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
				document.getElementById("detail_grade_count").innerHTML = data.current_grade_count;
				document.getElementById("restaurant_grade_text").innerHTML = data.current_res_grade;
			},
			error : function(data){
				console.log(data);
			}
		});
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
<%@include file="../header.jsp" %>
<div id="detail_content_body">
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
				<span class="detail_count_text" id = "detail_grade_count">${restaurantDetail.gradecount}</span>
			</div>
		</div>
		<div id="subject_right_side">
			<img id="detail_count_picture1" src="images/detail/grade_star_off.jpg" onclick="gradeConfirm(1);">
			<img id="detail_count_picture2" src="images/detail/grade_star_off.jpg" onclick="gradeConfirm(2);">
			<img id="detail_count_picture3" src="images/detail/grade_star_off.jpg" onclick="gradeConfirm(3);">
			<img id="detail_count_picture4" src="images/detail/grade_star_off.jpg" onclick="gradeConfirm(4);">
			<img id="detail_count_picture5" src="images/detail/grade_star_off.jpg" onclick="gradeConfirm(5);">
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
				
				<b>지도</b>
				
				<div id="map" style="width:100%;height:400px;"></div>
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=968f5cb093e2b0f76e796a0721504779&libraries=services"></script>
					<script>
						var container = document.getElementById('map');
						var options = {
							center: new kakao.maps.LatLng( ${restaurantDetail.latitude} , ${restaurantDetail.longitude} ),
							level: 3
						};
				
						var map = new kakao.maps.Map(container, options);
	
						// 마커가 표시될 위치입니다 
						var markerPosition  = new kakao.maps.LatLng(${restaurantDetail.latitude}, ${restaurantDetail.longitude}); 
	
						// 마커를 생성합니다
						var marker = new kakao.maps.Marker({
						    position: markerPosition,
						    clickable: false
						});
						
						// 마커가 지도 위에 표시되도록 설정합니다
						marker.setMap(map);
						
						var iwContent = '<div style="padding:5px;"></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
						    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
		
						// 인포윈도우를 생성합니다
						var infowindow = new kakao.maps.InfoWindow({
						    content : iwContent,
						    removable : iwRemoveable
						});
		
						// 마커에 클릭이벤트를 등록합니다
						kakao.maps.event.addListener(marker, 'click', function() {
						      // 마커 위에 인포윈도우를 표시합니다
						      infowindow.open(map, marker);  
						});
					</script>
					
				<b>주소 : </b>${restaurantDetail.address}<br>
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
					<div class="recom_content_txt">
						<b class="recom_grade_txt">${recomGradeList[status.index]}</b><br>
						<span class="recom_subject_txt"><b>식당 이름 : </b>${recom.res_name}<br>
						<b>음식 종류 : </b>
						<c:if test="${restaurantDetail.koreafood == 1}">한식</c:if>
						<c:if test="${restaurantDetail.chinafood == 1}">중식</c:if>
						<c:if test="${restaurantDetail.westernfood == 1}">양식</c:if>
						<c:if test="${restaurantDetail.japanfood == 1}">일식</c:if>
						<c:if test="${restaurantDetail.etcfood == 1}">중식</c:if><br></span>
					</div>
				</div>
			</a>
			</c:forEach>
		</div>
	</div>
</div>
<%@include file="../footer.jsp" %>
</body>
</html>