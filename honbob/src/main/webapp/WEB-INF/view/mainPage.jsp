<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.RestaurantVO"%>
<%@ page import="java.util.List"%>

<%
List<RestaurantVO> mainList = (List<RestaurantVO>)request.getAttribute("mainList");
RestaurantVO resVO = (RestaurantVO)request.getAttribute("resVO");

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Honmuk</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="css/header/style.css"/>
<script src="js/header/header.js"></script>
<link rel="stylesheet" href="css/footer/style.css"/>

    <script>    
    
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
            height:100%;
        }

        .review>.list>.item>.top>.topRight>.id{ 
            
             font-size: 15px;
            color: #222228;
            font-weight: 600;
            margin-bottom: 2px;
        }

        .review>.list>.item>.top>.topRight>.restaurant{
            font-size: 13px;
            color: #222228;
            margin-bottom: 2px;
        }
        
        .review>.list>.item>.top>.topRight>.point{
            position: relative;            
            height: 20px;            
        }

        .review>.list>.item>.comment{
            font-size: 12px;
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
    	 <%@include file="header.jsp" %>
       
        <!--Banner-->
        <div class="bannerContainer">
            <div class="banner">
            	<img src="images/main/banner.png">
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
            <p class="subject">추천 식당</p>                      
            <div class="list">            
            <%
            for(int i=0; i<mainList.size(); i++){
            	String img = mainList.get(i).getRes_image_name();
            	String[] imgArr = img.split(",");
            %>                
                <div class="item">
                    <div class="top"> <!--리뷰 상단-->
                        <div class="img"> <!--썸네일-->                        	                          
								<% if (imgArr.length > 0) { %>
								<img src="images/food/<%=imgArr[0] %>">
								<% }else %><img src="images/food/noimage.jpg">
                        </div>
                        <div class="topRight"><!--상단 우측-->
                            <p class="id"><%=mainList.get(i).getRes_name() %></p>
                            <p class="restaurant">조회수 : <%=mainList.get(i).getReadcount()%></p>
                            <p class="point"><img src="images/list/grade_icon.png" width="15" height="15"><%=mainList.get(i).getGrade() %></p>                            
                        </div>
                    </div>                    
                    <div class="comment"><!--음식 종류-->
                        <p><%=mainList.get(i).getAddress() %></p>                        
                    </div>
                    <p class="img" style="height:130px;overflow:hidden;"><!--메인 이미지-->
                    <% if (imgArr.length > 1) { %>
                        <img src="images/food/<%=imgArr[1] %>" style="width: 48%;margin-top:-35px; float:left; height:200%;">
                    <% }else %><img src="images/food/noimage.jpg" style="width: 48%;margin-top:-35px; float:left; height:150%;">
                    <% if (imgArr.length > 2) { %>
                        <img src="images/food/<%=imgArr[2] %>" style="width: 48%;margin-top:-35px; float:right; height:200%">
                    <% }else %><img src="images/food/noimage.jpg" style="width: 48%;margin-top:-35px; float:left; height:150%;">
                    </p>
                    <div class="bottom"><!--리뷰 하단-->                        
                        <div class="btn2" style="cursor: pointer; float: right;" onclick="location.href='DetailView.do?res_num=<%=mainList.get(i).getRes_num() %>';" onmouseover="this.style.color='#F5D0A9';"  onmouseout="this.style.color='#222222';">나도 평가하기</div>
                    </div>
                </div>
			<%}%>                
            </div>             
        </div>
        <%@include file="footer.jsp" %>
        

    </div>
</body>
</html>