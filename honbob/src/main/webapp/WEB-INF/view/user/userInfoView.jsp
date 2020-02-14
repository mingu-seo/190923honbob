<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.UserVO"%>
<%
	UserVO vo = (UserVO) request.getAttribute("vo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/honbob/css/user/myPage.css">
<style type = "text/css">

	
</style>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"> </script>
	<script type = "text/javascript">
		function check() {
			if ($("#userPassword").val() == "") {
				alert("현재 비밀번호를 입력해 주세요. ");
				return false;
				}
			if ($("#userPassword1").val() == "") {
				alert("변경 비밀번호를 입력해 주세요. ");
				return false;
				}
			if ($("#userPassword2").val() == "") {
				alert("비밀번호 확인을 입력해 주세요. ");
				return false;
				}
			if ($("#userPassword1").val() != $("#userPassword2").val()) {
				alert("비밀번호 확인이 일치하지 않습니다. ");
				return false;
				}
		}



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
                        <span class = "menu-title"><a href = "profileForm.do"><h4>프로필 수정</h4></a></span><hr>
                    </li>
                    <li class = "menulIST">
                        <span class = "menu-title menu-title-active"><h4>회원정보</h4></span><hr>
                    </li>
                    <li class = "menulIST">
                        <span class = "menu-title"><a href = "userInfoDeleteForm.do"><h4>회원탈퇴</h4></a></span><hr>
                    </li>
                    <li class = "menulIST">
                        <span class = "menu-title"><a href = "myReview.do"><h4>나의 리뷰글</h4></a></span><hr>
                    </li>
                    <li class = "menulIST">
                        <h4><span class = "menu-title"><a href = "myQnA.do"><h4>나의 QnA</h4></a></span></h4><hr>
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
			<tr><th> &nbsp;&nbsp; 별명</th>
			<td>&nbsp;&nbsp;&nbsp;<%=sess.getUserName() %></td></tr>
			<tr><th> &nbsp;&nbsp; 아이디 </th>
			<td>&nbsp;&nbsp;&nbsp;<%=sess.getUserId() %></td></tr>
			<tr><th> &nbsp;&nbsp; 이메일 </th>
			<td>&nbsp;&nbsp;&nbsp;<%=sess.getUserEmail() %></td></tr>
			<tr><th> &nbsp;&nbsp; 비밀번호 변경 </th>
			<td>&nbsp;&nbsp;&nbsp;<input type = "button" value = "수정" class = "textbtn" ></td></tr>
			<tr class="pwdch"><th> &nbsp;&nbsp; 현재 비밀번호 </th>
			<td>&nbsp;&nbsp;&nbsp;<input type = "password" name = "userPassword" id = "userPassword" class = "pwd"></td></tr>
			<tr class="pwdch"><th> &nbsp;&nbsp; 변경 비밀번호 </th>
			<td>&nbsp;&nbsp;&nbsp;<input type = "password" name = "password1" id = "userPassword1" class = "pwd"></td></tr>
			<tr class="pwdch"><th> &nbsp;&nbsp; 비밀번호 확인 </th>
			<td>&nbsp;&nbsp;&nbsp;<input type = "password" id = "userPassword2" class = "pwd"> <input type= "submit" class = "button" value = "변경"></td></tr>
			<tr><th> &nbsp;&nbsp; 회원가입 날짜 </th>
			<td>&nbsp;&nbsp;&nbsp;<%=sess.getUserJoinDate() %></td></tr>
		</table>
		</form>
		</div>
	</div>
	<script src="/honbob/js/user/myPage.js"></script> 
	<%@ include file = "../footer.jsp" %>
</body>
</html>