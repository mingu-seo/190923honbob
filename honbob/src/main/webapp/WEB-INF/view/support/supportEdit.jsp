<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>

<style>
    .optionButtons {
        margin: 2px;
    }
</style>

<body>
<div class="wrap">
    <%@ include file="/WEB-INF/view/header.jsp"%>
<div class="container">
<form method="POST" action="/honbob/supportEdit" class="was-validated" id="frm">
    <input type="hidden" name="id" value="${support.id}">
    <div class="mb-3">
        <label for="questionSubject">문의제목</label>
        <textarea name="subject" class="form-control is-invalid" id="questionSubject" required>${support.subject}</textarea>
    </div>
    <div class="mb-3">
        <label for="questionField">문의내용</label>
        <textarea name="content" class="form-control is-invalid" id="questionField" required>${support.content}</textarea>
    </div>
</form>
</div>
<div class="container">
        <div class="optionButtons mt-3 text-right">
            <button id="editBtn" type="submit" class="btn btn-warning">수정완료</button>
            <button id="backBtn" type="button" class="btn btn-warning">취소</button>
        </div>
</div>
    <%@ include file="/WEB-INF/view/footer.jsp" %>
</div>
<script>
    $(document).ready(function() {
        $('#editBtn').click(function() {
            $("#frm").submit();
        });
        $('#backBtn').click(
            function(e) {
                window.location.href = "/honbob/supportList";
            }
        );
    });
</script>


</body>
</html>
