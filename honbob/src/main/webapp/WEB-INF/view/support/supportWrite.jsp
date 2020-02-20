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
    <%@ include file="/WEB-INF/view/header_board.jsp"%>

<form method="POST" action="/supportWrite" class="was-validated">
    <div class="mb-3">
        <label for="questionSubject">문의제목</label>
        <textarea name="subject" class="form-control is-invalid" id="questionSubject" placeholder="제목을 입력해주세요" required></textarea>
    </div>
    <div class="mb-3">
        <label for="questionField">문의내용</label>
        <textarea name="content" class="form-control is-invalid" id="questionField" placeholder="문의내용을 입력해주세요" required></textarea>
    </div>

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
</form>
    <jsp:include page="/footer.do"/>
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
                window.location.href = "http://localhost:8080/supportList";
            }
        );
        $('#backBtn').click(
            function(e) {
                window.location.href = "http://localhost:8080/supportList";
            }
        );
    });
</script>

</body>
</html>
