<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review List</title>
</head>
<body>
${dataSample}
<c:forEach var="sample" items="${samples}">
    ${sample.subject} ${sample.content}
</c:forEach>
</body>
</html>