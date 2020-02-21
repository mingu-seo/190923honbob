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
            text-align:right;
        }
    </style>
</head>
<body>
<div class="wrap">
    <%@ include file="/WEB-INF/view/header.jsp"%>
<div class="container">
    <div class="row">
        <p></p>
    </div>

<form method="POST" action="/honbob/reviewEdit" class="was-validated" id="frm"  enctype="multipart/form-data">
    <input type="hidden" name="id" value="${review.id}">
    <div class="mb-3">
        <label for="questionSubject">제목</label>
        <textarea name="subject" class="form-control is-invalid" id="questionSubject" required>${review.subject}</textarea>
    </div>
    <div class="mb-3">
        <label for="questionField">내용</label>
        <textarea name="content" class="form-control is-invalid" id="questionField" required>${review.content}</textarea>
    </div>
    <div class="custom-file">
            <input type="file" class="custom-file-input" id="validatedCustomFile" name="filename">
            <label class="custom-file-label" for="validatedCustomFile">첨부할 파일을 업로드 해주세요.</label>
            <div class="invalid-feedback"></div>
        </div>
        <div class="optionButtons mt-3 text-right">
            <button id="editBtn" type="submit" class="btn btn-warning">수정완료</button>
            <button id="backBtn" type="button" class="btn btn-warning">취소</button>
        </div>
</form>

    <%@ include file="/WEB-INF/view/footer.jsp" %>
</div>
<script>
    $(document).ready(function() {
        $('#editBtn').click(function() {
            $("#frm").submit();
        });
        $('#backBtn').click(
            function(e) {
                window.location.href = "reviewList";
            }
        );
    });
</script>


</body>
</html>