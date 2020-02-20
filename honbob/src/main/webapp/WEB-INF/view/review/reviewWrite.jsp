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
         .optionButtons {
             margin: 2px;
         }
    </style>
</head>
<body>

<div class="wrap">
    <%@ include file="/WEB-INF/view/header_board.jsp"%>

<div class="container">
    <div class="col-md-9">
        <div class="row">
            <div class="col-md-1  pl-1">
            </div>
        </div>
    </div>
    <form method="POST" action="/honbob/reviewWrite" class="was-validated">
        <input type="hidden" name="res_num" value="${restaurantId}">
        <div class="mb-3">
            <label for="reviewSubject">제목1</label>
            <textarea name="subject" class="form-control is-invalid" id="reviewSubject" placeholder="제목을 입력해주세요" required></textarea>
        </div>
        <div class="mb-3">
            <label for="reviewField">내용</label>
            <textarea name="content" class="form-control is-invalid" id="reviewField" placeholder="내용을 입력해주세요" required></textarea>
        </div>
        <div class="custom-file">
            <input type="file" class="custom-file-input" id="validatedCustomFile">
            <label class="custom-file-label" for="validatedCustomFile">첨부할 파일을 업로드 해주세요.</label>
            <div class="invalid-feedback"></div>
        </div>
        <div class="optionButtons">

            <button id="saveBtn" type="submit" class="btn btn-warning">등록</button>
        </div>
        <div class="optionButtons">
            <button id="backBtn" type="button" class="btn btn-warning">취소</button>
        </div>
    </form>
</div>
    <jsp:include page="/WEB-INF/view/footer.jsp"/>
</div>
<script>
    $(document).ready(function() {
        // $('#saveBtn').click(
        //     function(e) {
        //         if (confirm("등록하시겠습니까?")) {
        //             // 확인 버튼 클릭 시 동작
        //             alert("등록되었습니다.");
        //         } else {
        //             // 취소 버튼 클릭 시 동작
        //             alert("등록이 취소되었습니다.");
        //         }
        //         window.location.href = "http://localhost:8080/reviewList?page=1";
        //     }
        // );
        $('#backBtn').click(
            function(e) {
                window.location.href = "reviewList?page=1";
            }
        );
    });
</script>
</body>
</html>