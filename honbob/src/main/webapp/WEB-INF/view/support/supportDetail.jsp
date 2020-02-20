<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
</head>

<style>
    .optionButtons {
        margin: 2px;
    }
</style>


<body>
<div class="wrap">
    <%@ include file="/WEB-INF/view/header_board.jsp"%>

<div class="table">
<table class="table table-bordered">
    <thead>
    <tr>
        <th scope="col">제목</th>
        <th scope="col">${support.subject}</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row">작성일</th>
        <td>${support.registdate}</td>
    </tr>
    </tbody>
</table>
</div>
<div class="form-group">
    <label>문의내용</label>
    <textfield class="form-control" id="questionField" rows="3">
        ${support.content}
    </textfield>
</div>
<div class="form-group">
    <label>답변내용</label>
    <questionField class="form-control" id="answerField" rows="3">${adminReply.content}</questionField>
</div>

<div class="container">
    <div class="row">
        <div class="optionButtons">
            <button id="subjectListPageLinkBtn" type="button" class="btn btn-warning">목록</button>
        </div>

            <div class="optionButtons">
                <button id="editPageBtn" type="button" class="btn btn-warning">수정</button>
            </div>

        <form method="post" action="/supportDelete/${support.id}" class="was-validated">
            <div class="optionButtons">
                <button type="submit" class="btn btn-warning">삭제</button>
            </div>
        </form>
    </div>
</div>
<jsp:include page="/WEB-INF/view/footer.jsp"/>
</div>
<script>
    $(document).ready(function() {
        $('#subjectListPageLinkBtn').click(
            function(e) {
                window.location.href = "http://localhost:8080/supportList";
            }
        );

        $('#editPageBtn').click(
            function(e) {
                window.location.href = "http://localhost:8080/supportEdit/${support.id}";
            }
        );
        $('#deleteBtn').click(
            function(e) {
                if (confirm("삭제 하시겠습니까?")) {
                    // 확인 버튼 클릭 시 동작
                    alert("삭제 되었습니다.");
                } else {
                    // 취소 버튼 클릭 시 동작
                    alert("삭제가 취소되었습니다.");
                }
            }
        );
    });
</script>
</body>
</html>
