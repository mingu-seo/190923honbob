<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>관리자 메인</h2>
이메일 : ${sessionScope.adminSession.email }<br>
이름 : ${sessionScope.adminSession.name }  
</body>
</html>