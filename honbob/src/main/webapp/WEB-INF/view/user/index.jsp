<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.UserVO"%>
<%
	UserVO sess = (UserVO)session.getAttribute("Session");
int userNo = 0;
if (sess != null) userNo = sess.getUserNo();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 메인 페이지 </title>
</head>
<body>
<% if (session.getAttribute("Session") == null) { %>
<a href="" onclick='window.open("http://localhost:8080/honbob/loginForm.do","_blank","height=547,width=470, status=yes,toolbar=no,menubar=no,location=no");return false'>로그인</a>


<% } else { %>
<a href = "logOut.do?url=<%=request.getAttribute("javax.servlet.forward.request_uri")%>"> 로그아웃 </a><br>
<a href = "userInfoView.do"> 회원정보 </a><br>
<a href = "userInfoDeleteForm.do"> 회원탈퇴 </a><br>
<a href = "">내 글 리스트</a><br>
<a href = "myPage.do"> 마이페이지 </a>

<% } %>
</body>
</html>