<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
            integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
            crossorigin="anonymous"></script>

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
            integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/cssEx/style_ex.css">
    <style>

    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-3">
            <div class="optionButtons">
                <button type="button" class="btn btn-warning">리뷰 작성하기</button>
            </div>
        </div>
        <div class="col-md-1">
            <div class="btn-group">
                <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false">
                    메뉴별
                </button>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">한식</a>
                    <a class="dropdown-item" href="#">양식</a>
                    <a class="dropdown-item" href="#">중식</a>
                    <a class="dropdown-item" href="#">일식</a>
                </div>
            </div>
        </div>
        <div class="col-md-1">
            <div class="local">
                <form class="form-inline">
                    <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
                        <option selected>지역 별</option>
                        <option value="1">강서구</option>
                        <option value="2">강남구</option>
                        <option value="3">강동구</option>
                        <option value="4">강서구</option>
                        <option value="5">양천구</option>
                        <option value="6">구로구</option>
                        <option value="7">금천구</option>
                        <option value="8">서대문구</option>
                        <option value="9">중구</option>
                    </select>
                </form>
            </div>
        </div>
        <div class="col-md-5">
            <div class="restrSearch">
                <form class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default">식당명검색</button>
                </form>
            </div>
        </div>

        <div claSS="col-md-1">
            <div class="optionButtons">
                <button type="button" class="btn btn-warning">평점순</button>
            </div>
        </div>
        <div claSS="col-md-1">
            <div class="optionButtons">
                <button type="button" class="btn btn-warning">최신순</button>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">

            <c:forEach var="reviewItem" items="${reviews}" varStatus="status">
            <div class="card" style="width: 30%;float:left;padding:10px;margin:10px;">
                <img src="https://post-phinf.pstatic.net/MjAxODAxMzBfMiAg/MDAxNTE3MzA3MTE4MTE2.XGLId_RK61J74j8NuM1y7dH2ZT9EYYYiHzISxSxB3AAg.suh8hDEzMqvmvHj_dF7fVQh6Jc2jVaalM-HtDGZTrUkg.JPEG/bakeup_namyo_%EB%B2%A0%EC%9D%B4%ED%81%AC%EC%97%85.jpg?type=w1200"
                     class="card-img-top" alt="viewImage">
                <div class="card-body">
                    <h5 class="card-title">${reviewItem.subject}</h5>
                    <h8 class="card-title">4.8</h8>
                    <p class="card-text">reviewItem.local_num로 하니까 안되요</p>
                    <p class="card-text update">${reviewItem.registdate}</p>
                    <a href="#" class="btn btn-primary reviewbutton">리뷰 보기</a>
                    <a href="#" class="btn btn-primary restrnbutton">식당 가기</a>
                </div>
            </div>
            </c:forEach>

            <!-- Page Numbering -->
            <div style="clear:both;">
                <nav aria-label="...">
                    <ul class="pagination">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1" aria-disabled="true"><<</a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item active" aria-current="page">
                            <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#">>></a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>


</body>
</html>
