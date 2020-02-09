<% Object article; %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>리뷰 상세보기</title>

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
        #articleForm {
            width:500px;
            height:600px;
            border:1px solid red;
            margin:auto;
        }
        h2 {
            text-align:center;
        }
        #basicInfoArea {
            height:40px;
            text-align:center;
        }
        #articleContentArea {
            background:orange;
            margin-top:20px;
            height:350px;
            text-align:center;
            overflow:auto;
        }
        #commandList {
            margin:auto;
            width:500px;
            text-align:center;
        }
    </style>
    <script>
        function modify() {
            if(confirm('수정하시겠습니까?'))
                location.href='edit.do?board_num=<%%>&page=<%%>';
        }
    </script>
</head>
<body>
<div class="optionButtons">
    <button type="button" class="btn btn-warning">식당 보기</button>
</div>
<div class="contents">
<section id="articleForm">
    <h2>리뷰제목</h2>
    <section id="basicInfoArea">
        작성자 : <%%>
        작성일 :
        <% %>
        <a href="/webtest/fileupload/file_down.jsp?file_name=<%%>"><%%></a>
        <%%>
    </section>
    <section id="articleContentArea">
        <%%>
    </section>
</section>
</div>
<div class="optionButtons">
    <button type="button" class="btn btn-warning">목록</button>
</div>
</body>
</html>