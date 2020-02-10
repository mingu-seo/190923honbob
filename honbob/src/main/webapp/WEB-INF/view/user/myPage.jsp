<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.UserVO"%>
<%
	UserVO honbab = (UserVO) request.getAttribute("userImage");
%>
<%
	UserVO sess = (UserVO)session.getAttribute("Session");
int userNo = 0;
if (sess != null) userNo = sess.getUserNo();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/dog/css/myPage.css">
<title>Insert title here</title>
</head>
<body>   
	<div id = "container">
        <nav id = "main-navigation">
                <ul class = "menu">
                    <li class = "menulIST">
                        <h3><span class = "menu-title"><a href = "userInfoView.do">회원정보 수정</a></span></h3><hr>
                    </li>
                    <li class = "menulIST">
                        <h3><span class = "menu-title"><a href = "myWriteList.do">나의 게시글</a></span></h3><hr>
                    </li>
                    <li class = "menulIST">
                        <h3><span class = "menu-title"><a href = "myQnA.do">나의 QnA</a></span></h3><hr>
                    </li>
                    <li class = "menulIST">
                        <h3><span class = "menu-title"><a href = ""> 준비중 </a></span></h3><hr>
                    </li>
                    <li class = "menulIST">
                        <h3><span class = "menu-title"><a href = ""> 준비중 </a></span></h3><hr>
                    </li>
                </ul>
        </nav>
    </div>


	<% if ( sess.getUserImage() != null ) { %> 
	<a><img width="190" src="/dog/images/<%=sess.getUserImage()%>"></a>
	<% } else if ( sess.getUserImage() == null ) { %>
	<a><img width="190" src="/dog/images/character.png"></a>
	<% } %>
	
	<form action = "userImageUpdate.do" method = "post" enctype = "multipart/form-data">
	<input type="hidden" name = "userNo" value = "<%=userNo%>">
			<input type = "file" name = "userImage_tmp" accept=".jpg, .png">
			<input type = "submit" value = "변경"/>
	</form>
</body>
</html>