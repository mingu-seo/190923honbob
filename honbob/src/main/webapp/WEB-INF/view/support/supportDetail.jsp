<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
</head>
<body>
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
    <questionField class="form-control" id="answerField" rows="3">TO BE DEVELOPED</questionField>
</div>
<div class="optionButtons">
    <button id="subjectListPageLinkBtn" type="button" class="btn btn-warning">
        목록
    </button>
</div>
<div class="optionButtons">
    <button id="editPageBtn" type="button" class="btn btn-warning">수정</button>
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

        $('#editPageBtn').click(
            function(e) {
                window.location.href = "http://localhost:8080/supportEdit/${support.id}";
            }
        );

    });

</script>
</body>


</html>
