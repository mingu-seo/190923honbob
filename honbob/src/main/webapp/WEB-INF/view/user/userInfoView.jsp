<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.UserVO"%>
<%
	UserVO vo = (UserVO) request.getAttribute("vo");
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
<link rel="stylesheet" href="/honbob/css/user/myPage.css">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"> </script>
	<script type = "text/javascript">
		function check() {
			if ($("#userPassword").val() == "") {
				alert("현재 비밀번호를 입력해 주세요. ");
				return false;
				}
			if ($("#password1").val() == "") {
				alert("변경 비밀번호를 입력해 주세요. ");
				return false;
				}
			if ($("#password2").val() == "") {
				alert("비밀번호 확인을 입력해 주세요. ");
				return false;
				}
			if ($("#password1").val() != $("#password2").val()) {
				alert("비밀번호 확인이 일치하지 않습니다. ");
				return false;
				}
		}
		
	
	</script>
</head>
<body>
	
	<div id = "container">
		<div id = "myPage">
			<h2> 마이페이지 </h2>
		</div>
        <nav id = "main-navigation">
                <ul class = "menu">
                    <li class = "menulIST">
                        <h4><span class = "menu-title"><a href = "userInfoView.do">회원정보 수정</a></span></h4><hr>
                    </li>
                    <li class = "menulIST">
                        <h4><span class = "menu-title"><a href = "myWriteList.do">나의 게시글</a></span></h4><hr>
                    </li>
                    <li class = "menulIST">
                        <h4><span class = "menu-title"><a href = "myQnA.do">나의 QnA</a></span></h4><hr>
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
        	<h3> ☆ 내 정보 </h3>
        </div>
    
		<div id = "Info">
		<form action = "pwdChange.do" method = "post" onsubmit="return check();">
		<table>
			<input type = "hidden" name = "userNo" value = "<%=userNo%>">
			<tr><th> 이름 </th>
			<td><%=sess.getUserName() %></td></tr>
			<tr><th> 아이디 </th>
			<td><%=sess.getUserId() %></td></tr>
			<tr><th> 이메일 </th>
			<td><%=sess.getUserEmail() %></td></tr>
			<tr><th> 현재 비밀번호 </th>
			<td><input type = "password" name = "userPassword" id = "userPassword" class = "pwd"></td></tr>
			<tr><th> 변경 비밀번호 </th>
			<td><input type = "password" name = "userPassword1" id = "userPassword1" class = "pwd"></td></tr>
			<tr><th> 비밀번호 확인 </th>
			<td><input type = "password" name = "userPassword2" id = "userPassword2" class = "pwd"> <input type= "submit" class = "button" value = "변경"></td></tr>
			<tr><th> 회원가입 날짜 </th>
			<td><%=sess.getUserJoinDate() %></td></tr>
		</table>
		</form>
		</div>
	</div>
	<script src="/honbob/js/user/myPage.js"></script> 
</body>
</html>