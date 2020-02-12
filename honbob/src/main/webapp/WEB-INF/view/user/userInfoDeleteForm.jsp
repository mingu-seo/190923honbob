<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.UserVO" %>
<%
	UserVO sess = (UserVO)session.getAttribute("Session");
int userNo = 0;
if (sess != null) userNo = sess.getUserNo();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action = "userInfoDelete.do" method = "post">
	<input type = "hidden" name = "userNo" value = "<%=userNo%>">
	<table>
		<tr>
			<th> 이름 </th>
			<td><input type = "text" name = "userName"></td>
		</tr>
		<tr>
			<th> 아이디 </th>
			<td><input type = "text" name = "userId"></td>
		</tr>
		<tr>
			<th> 비밀번호 </th>
			<td><input type = "password" name = "userPassword"></td>
		</tr>
	</table>
			<input type = "submit" value = "탈퇴">
	</form> 
</body>
</html>