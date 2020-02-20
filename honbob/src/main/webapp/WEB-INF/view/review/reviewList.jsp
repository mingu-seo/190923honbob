<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html><head>
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/cssEx/style_ex.css">

    <style>
        .myBtnGroup {
            width: 142px;
        }
    </style>
</head>
<body>
<div class="wrap">
    <%@ include file="/WEB-INF/view/header.jsp"%>
    <div class="container">

        <div class="row">
            <div class="col-md-3" style="
    max-width: 157px;
">
                <div class="optionButtons WriteForm">
                    <button id="writePageBtn" type="button" class="btn btn-warning">리뷰 작성</button>
                </div>

            </div>
            <div class="col-md-9">
                <div class="row">
                    <div class="col-md-1  pl-1">
                    </div>

                    <div class="col-md-3  pl-2">
                        <div class="restrSearch" style="width:183px;">
                            <form class="navbar-form navbar-left" role="search">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Search">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
       
    <div class="row">
        <div class="col-md-12">
            <c:forEach var="reviewItem" items="${reviews}" varStatus="status">
                <div class="card" style="width: 30%;float:left;padding:10px;margin:10px;">
                    <img src="https://post-phinf.pstatic.net/MjAxODAxMzBfMiAg/MDAxNTE3MzA3MTE4MTE2.XGLId_RK61J74j8NuM1y7dH2ZT9EYYYiHzISxSxB3AAg.suh8hDEzMqvmvHj_dF7fVQh6Jc2jVaalM-HtDGZTrUkg.JPEG/bakeup_namyo_%EB%B2%A0%EC%9D%B4%ED%81%AC%EC%97%85.jpg?type=w1200" class="card-img-top" alt="viewImage">
                    <div class="card-body">
                        <h5 class="card-title">${reviewItem.subject}</h5>
                        <h8 class="card-title">4.8</h8>
                        <p class="card-text">${reviewItem.subject} / ${reviewItem.subject}</p>
                        <p class="card-text update">${reviewItem.registdate}</p>

<<<<<<< HEAD
                            <a href="/reviewDetail?reviewDocumentId=${reviewItem.id}" id="viewPageBtn" class="btn btn-primary reviewbutton">리뷰 보기</a>
                        </div>
=======
                        <a href="reviewDetail/${reviewItem.id}" id="viewPageBtn" class="btn btn-primary reviewbutton">리뷰 보기</a>
>>>>>>> branch 'master' of https://github.com/mingu-seo/190923honbob.git
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="row pt-5">
            <div class="col-md-12">
                <!-- Page Numbering -->
                <div style="/* clear:both; */" class="">
                    <nav aria-label="...">
                        <ul class="pagination justify-content-center">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">&lt;&lt;</a>
                            </li>

                        <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                            <c:if test="${loop.index eq currentPage}">
                                <li class="page-item active"><a class="page-link" href="reviewList?page=${loop.index}">${loop.index}</a></li>
                            </c:if>
                            <c:if test="${loop.index ne currentPage}">
                                <li class="page-item"><a class="page-link" href="reviewList?page=${loop.index}">${loop.index}</a></li>
                            </c:if>
                        </c:forEach>
                        <li class="page-item">
                            <a class="page-link" href="#">&gt;&gt;</a>
                        </li>
                    </ul>
                </nav>
            </div>

        </div>
    </div>
    <%@ include file="/WEB-INF/view/footer.jsp" %>
</div>
<script>
    $(document).ready(function() {
        $('#writePageBtn').click(
            function(e) {
                window.location.href = "reviewWrite";
            }
        );

    });

</script>
</body>
</html>