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
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"> </script>
	<script type = "text/javascript">


		function check() {
			if ($("#userPassword").val() != $("#pssword1").val()) {
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
                        <span class = "menu-title"><a href = "userInfoView.do"><h4>회원정보</h4></a></span><hr>
                    </li>
                    <li class = "menulIST">
                        <span class = "menu-title menu-title-active"><a href = "userInfoDeleteForm.do"><h4>회원탈퇴</h4></a></span><hr>
                    </li>
                    <li class = "menulIST">
                        <span class = "menu-title"><a href = "myReview.do"><h4>나의 리뷰글</h4></a></span><hr>
                    </li>
                    <li class = "menulIST">
                        <span class = "menu-title"><h4>나의 QnA</h4></span><hr>
                    </li>

                </ul>
        </nav>
        
        <div id = "myInfo">
        	<h3> ☆ 회원탈퇴 </h3>
        </div>
        <div>
        	<h5 class = "delete"> 안녕하세요 ^^. <a>"<%=sess.getUserName()%>"</a>님! <br>
        	탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다. <br>
			뉴스, 카페, 지식iN 등에 올린 게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다. <br>
			<b>삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.</b> <br>
			탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.<br>

			탈퇴 후에는 아이디 <a>"<%=sess.getUserId()%>"</a> 로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.<br>
			게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.</h5>
        </div>

		<div id = "Info">
	<form action = "userInfoDelete.do" method = "post" onsubmit="return check();">
	<input type = "hidden" name = "userNo" value = "<%=userNo%>">
	<table>
		<tr>
			<th class = "idn"> &nbsp;&nbsp;&nbsp;아이디 </th>
			<td class = "idn">&nbsp;&nbsp;&nbsp;&nbsp;<input type = "text" name = "userId"></td>
		</tr>
		<tr>
			<th> &nbsp;&nbsp;&nbsp;비밀번호 </th>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type = "password" name = "userPassword"></td>
		</tr>
		<tr>
			<th> &nbsp;&nbsp;&nbsp;비밀번호 확인 </th>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type = "password" name = "password1"></td>
		</tr>
		<tr>
			<td class ="sub"><input type = "submit" value = "탈퇴하기" class ="subm"><input type = "submit" value = "취소" class ="subm"></td>
		</tr>
	</table>
			
	</form> 
		</div>
	</div>
	<script src="/honbob/js/user/myPage.js"></script> 
	<%@ include file = "../footer.jsp" %>
</body>
</html>