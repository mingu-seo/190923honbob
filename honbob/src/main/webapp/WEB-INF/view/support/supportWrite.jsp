<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


</head>
<body>
<form class="was-validated">
    <div class="mb-3">
        <label for="validationTextarea">문의제목</label>
        <textarea class="form-control is-invalid" id="validationTextarea" placeholder="제목을 입력해주세요" required></textarea>
        <div class="invalid-feedback">
            문의제목을 기재해주세요.
        </div>
    </div>
    <form class="was-validated">
        <div class="mb-3">
            <label for="validationTextarea">문의내용</label>
            <textarea class="form-control is-invalid" id="validationTextarea" placeholder="문의내용을 입력해주세요" required></textarea>
            <div class="invalid-feedback">
                문의내용을 기재해주세요.
            </div>
        </div>

    <div class="custom-file">
        <input type="file" class="custom-file-input" id="validatedCustomFile" required>
        <label class="custom-file-label" for="validatedCustomFile">파일 첨부하기</label>
        <div class="invalid-feedback">jpg / png 파일 첨부 가능</div>
    </div>
        <div>
            <p></p>
        </div>
        <div>
            <p></p>
        </div>
        <div class="custom-control custom-checkbox mb-3">
            <input type="checkbox" class="custom-control-input" id="customControlValidation1" required>
            <label class="custom-control-label" for="customControlValidation1">이메일 결과수신</label>
            <div class="invalid-feedback">이메일 수신여부를 확인해주세요.</div>
        </div>

        <div class="public">
            <p>공개여부</p>
        </div>
        <div class="custom-control custom-radio">
            <input type="radio" class="custom-control-input" id="customControlValidation2" name="radio-stacked" required>
            <label class="custom-control-label" for="customControlValidation2">공개</label>
        </div>
        <div class="custom-control custom-radio mb-3">
            <input type="radio" class="custom-control-input" id="customControlValidation3" name="radio-stacked" required>
            <label class="custom-control-label" for="customControlValidation3">비공개</label>
            <div class="invalid-feedback">공개 여부를 확인해주세요.</div>
        </div>
        <div class="optionButtons">
            <button type="button" class="btn btn-warning">등록</button>
        </div>
        <div class="optionButtons">
            <button type="button" class="btn btn-warning">취소</button>
        </div>
    </form>
</body>
</html>
