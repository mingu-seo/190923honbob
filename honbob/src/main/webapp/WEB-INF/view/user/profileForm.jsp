<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.UserVO"%>
<%
	UserVO honbab = (UserVO) request.getAttribute("userImage");
	UserVO vo = (UserVO) request.getAttribute("vo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/honbob/css/user/myPage.css">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"> </script>
	<script type = "text/javascript">

		
	
	</script>
</head>
<body>
	<%@ include file = "../header.jsp" %>
	<div id = "container">
		<div id = "myPage">
			<h2> 마이페이지 </h2>
		</div>
        <nav id = "main-navigation">
                <ul class = "menu">
                    <li class = "menulIST">
                        <span class = "menu-title menu-title-active"><h4>프로필 수정</h4></span><hr>
                    </li>
                    <li class = "menulIST">
                        <span class = "menu-title"><a href = "userInfoView.do"><h4>회원정보</h4></a></span><hr>
                    </li>
                    <li class = "menulIST">
                        <span class = "menu-title"><a href = "myReview.do"><h4>나의 리뷰글</h4></a></span><hr>
                    </li>
                    <li class = "menulIST">
                        <span class = "menu-title"><a href = "myQnA.do"><h4>나의 QnA</h4></a></span><hr>
                    </li>
                    <li class = "menulIST">
                        <h4><span class = "menu-title"><a href = ""> 준비중 </a></span></h4><hr>
                    </li>
                    <li class = "menulIST">
                        <h4><span class = "menu-title"><a href = ""> 준비중 </a></span></h4><hr>
                    </li>
                </ul>
        </nav>
        
        <div id = "myInfo">
        	<h3> ☆ 프로필 수정 </h3>
        </div>
    
		<div id = "Info">
		<form action = "profileFormUpdate.do" method = "post" enctype = "multipart/form-data">
		<input type = "hidden" name = "userNo" value = "<%=userNo%>">
			<table>
				<tr>
					<th> &nbsp;&nbsp; 프로필 사진 </th> 
					<td><% if ( sess.getUserImage() != null ) { %> 
							<a>&nbsp;&nbsp;&nbsp;<img width="190" id = "image" src="/honbob/images/<%=vo.getUserImage()%>"></a>
						<% } else if ( sess.getUserImage() == null ) { %>
							<a>&nbsp;&nbsp;&nbsp;<img width="190" id = "image" src="/honbob/images/character.png"></a>
						<% } %> </td>
					<td> 
							 <input type = "file" name = "userImage_tmp" accept=".jpg, .png"></td>
				</tr>
				<tr>
					<th> &nbsp;&nbsp; 별명 </th> 
					<td> &nbsp;&nbsp;&nbsp; <input type = "text" name = "userName" value = "<%=vo.getUserName()%>">
						 </td>
						
			</table>
			<input type = "submit" value = "적용"/>
		</form>
		</div>
	</div>
	
	<script src="/honbob/js/user/myPage.js"></script> 
	<%@ include file = "../footer.jsp" %>
</body>
</html>