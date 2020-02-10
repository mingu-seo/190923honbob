<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 목록</title>
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
    <%--    <script src="http://code.jquery.com/jquery-1.12.4.js"></script>--%>
    <%--    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>--%>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<%--    <link rel="stylesheet" href="/css/reset.css"/>--%>
<%--    <link rel="stylesheet" href="/css/style.css"/>--%>
<%--    <link rel="stylesheet" href="/css/swiper.css"/>--%>

<%--    <script src="/js/swiper.min.js"></script>--%>
<%--    <script src="/js/script.js"></script>--%>
    <style>
        @media (min-width: 1070px)
            .container {
                width:1060px;
            }

        @media (min-width: 992px)
            .container {
            width: 970px;
        }
    </style>
</head>
<body>
<div class="container">
<%--    <div class="row">--%>
<%--        <div class="col-12"><%@ include file="/WEB-INF/view/mainPage/header.jsp" %></div>--%>
<%--    </div>--%>
    <div class="row" style="">
        <div class="col-md-2">
            <div class="list-group">
                <a href="#" class="list-group-item active">
                    장수정님,
                    환영합니다!
                </a>
                <a href="#" class="list-group-item">식당검색</a>
                <a href="#" class="list-group-item">커뮤니티</a>
                <a href="#" class="list-group-item">고객지원</a>
                <a href="#" class="list-group-item">마이페이지</a>
            </div>
        </div>
        <div class="col-md-10">
            <div class="row">
                <c:forEach var="i" begin="0" end="4">
                    <div class="col-md-2">
                        <div class="thumbnail">
                            <img src="" alt="금천구/한식">
                            <div class="caption">
                                <h3>가산황소곱창</h3>
                                <p>2020.01.03</p>
                                <p><a href="#" class="btn btn-primary" role="button">리뷰보기</a> <a href="#" class="btn btn-default" role="button">식당가기</a></p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="row">
                <c:forEach var="elem" items="${sampleList}" varStatus="status">
                    <div class="col-md-2">
                        <div class="thumbnail">
                            <img src="" alt="금천구/한식">
                            <div class="caption">
                                <h3>${elem}</h3>
                                <p>2020.01.03</p>
                                <p><c:if test="${status.index == 2}">Hello</c:if></p>
                                <p><a href="#" class="btn btn-primary" role="button">리뷰보기</a> <a href="#" class="btn btn-default" role="button">식당가기</a></p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
             </div>

            <div class="row">
                <c:forEach var="review" items="${reviews}" varStatus="status">
                    <div class="col-md-1">
                        <div class="thumbnail">
                            <img src="" alt="금천구/한식">
                            <div class="caption">
                                <h3>${review.subject}</h3>
                                <p>${review.registdate}</p>
                                <p><a href="#" class="btn btn-primary" role="button">리뷰보기</a> <a href="#" class="btn btn-default" role="button">식당가기</a></p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div><%@ include file="/WEB-INF/view/original/footer.jsp" %></div>
        </div>
    </div>
</div>
</body>
</html>