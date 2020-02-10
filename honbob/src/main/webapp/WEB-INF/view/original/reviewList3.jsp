<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="/css/reset.css"/>
<%--    <link rel="stylesheet" href="/css/style.css"/>--%>
    <link rel="stylesheet" href="/css/swiper.css"/>

<%--    <script src="/js/swiper.min.js"></script>--%>
<%--    <script src="/js/script.js"></script>--%>

</head>
<body>
<div class="wrap">
    <%@ include file="/WEB-INF/view/original/header.jsp" %>
    <div class="sub">
        <div class="sub_left">
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
        <div class="sub_right">
            <div class="row">
                <div class="col-sm-6 col-md-4">
                    <div class="thumbnail">
                        <img src="https://s3-ap-northeast-1.amazonaws.com/dcreviewsresized/20200105121323920_photo_.jpg" alt="금천구/한식">
                        <div class="caption">
                            <h3>가산황소곱창</h3>
                            <p>2020.01.03</p>
                            <p><a href="#" class="btn btn-primary" role="button">리뷰보기</a> <a href="#" class="btn btn-default" role="button">식당가기</a></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-md-4">
                    <div class="thumbnail">
                        <img src="https://s3-ap-northeast-1.amazonaws.com/dcreviewsresized/20200105121323920_photo_.jpg" alt="강남구/중식">
                        <div class="caption">
                            <h3>마루샤브</h3>
                            <p>2020.01.31</p>
                            <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-md-4">
                    <div class="thumbnail">
                        <img src="https://s3-ap-northeast-1.amazonaws.com/dcreviewsresized/20200105121323920_photo_.jpg" alt="양천구/양식">
                        <div class="caption">
                            <h3>먹자대게</h3>
                            <p>2020.02.01</p>
                            <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                        </div>
                    </div>
                </div>
            </div>

            <div>
            <nav>
                <ul class="pagination">
                    <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
                    <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                    ...
                </ul>
            </nav>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/view/original/footer.jsp" %>
</div>
</body>
</html>