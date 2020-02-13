<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
         .optionButtons {
             margin: 2px;
         }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <p></p>
    </div>
    <div class="row">
        <p>게시글을 원하는 검색어에 설정하여 많은분들께 공유해주세요! 인기 게시글이 될 확률이 높습니다.</p>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-2  pl-1">
                    <div class="btn-group myBtnGroup">
                        <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                <div class="col-md-2  pl-2">
                    <div class="local myBtnGroup">
                        <form class="form-inline">
                            <select class="custom-select" id="inlineFormCustomSelectPref" style="width: -webkit-fill-available;">
                                <option selected="">지역 별</option>
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
                <div class="col-md-3  pl-2">
                    <div class="restrSearch" style="width:183px;">
                        <form class="navbar-form navbar-left" role="search">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Search">
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-2  pl-2">
                    <div class="optionButtons ">
                        <button type="button" class="btn btn-warning myBtnGroup">평점순</button>
                    </div>

                </div>
                <div class="col-md-2 pl-2">
                    <div class="optionButtons">
                        <button type="button" class="btn btn-warning myBtnGroup">최신순</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<form method="POST" action="/reviewWrite" class="was-validated">
    <div class="mb-3">
        <label for="reviewSubject">제목</label>
        <textarea name="subject" class="form-control is-invalid" id="reviewSubject" placeholder="제목을 입력해주세요" required></textarea>
    </div>
    <div class="mb-3">
        <label for="reviewField">내용</label>
        <textarea name="content" class="form-control is-invalid" id="reviewField" placeholder="내용을 입력해주세요" required></textarea>
    </div>
    <div class="custom-file">
        <input type="file" class="custom-file-input" id="validatedCustomFile" required>
        <label class="custom-file-label" for="validatedCustomFile">첨부할 파일을 업로드 해주세요.</label>
        <div class="invalid-feedback"></div>
    </div>
</form>

    <div class="container">
        <div class="row">
            <div class="optionButtons">
                <button id="saveBtn" type="submit" class="btn btn-warning">등록</button>
            </div>
            <div class="optionButtons">
                <button id="backBtn" type="button" class="btn btn-warning">취소</button>
            </div>
        </div>
    </div>

<script>
    $(document).ready(function() {
        $('#saveBtn').click(
            function(e) {
                if (confirm("등록하시겠습니까?")) {
                    // 확인 버튼 클릭 시 동작
                    alert("등록되었습니다.");
                } else {
                    // 취소 버튼 클릭 시 동작
                    alert("등록이 취소되었습니다.");
                }
                window.location.href = "http://localhost:8080/reviewList";
            }
        );
        $('#backBtn').click(
            function(e) {
                window.location.href = "http://localhost:8080/reviewList";
            }
        );
    });
</script>
</body>
</html>