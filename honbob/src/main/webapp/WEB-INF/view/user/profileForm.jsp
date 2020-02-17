<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.UserVO"%>
<%
	UserVO honbab = (UserVO) request.getAttribute("userImage");
	UserVO vo = (UserVO) request.getAttribute("vo");
	UserVO upImage = (UserVO) request.getAttribute("upImage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/honbob/css/user/myPage.css">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"> </script>
	<script type = "text/javascript">
	
	$(function() {
		$("#submits").click(function() {
			var con = true;
			if ($("#userName").val().trim() == "") {
				alert("별명 칸이 비어 있습니다.");
			} else {
				$.ajax({
					url : "/honbob/nameCheck.do",
					data : {userName:$("#userName").val(),userNo:<%=vo.getUserNo()%>},
					type : "POST",
					async : false,
					success : function(data) {
						if (data.trim() == "0") {
						} else {
							alert("이미 사용중인 별명 입니다.");
							$("#userName").focus();
							con = false;
						}
					}
				});
			} if (confirm("적용 하시겠습니까?")) {
			} else {
				alert("취소 되었습니다.");
				return false;
			}
			if (con == true) $("#frm").submit();
		});
	});
		
	
	
	
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
                        <span class = "menu-title"><a href = "userInfoDeleteForm.do"><h4>회원탈퇴</h4></a></span><hr>
                    </li>
                    <li class = "menulIST">
                        <span class = "menu-title"><a href = "myReview.do"><h4>나의 리뷰글</h4></a></span><hr>
                    </li>
                    <li class = "menulIST">
                        <span class = "menu-title"><a href = "myQnA.do"><h4>나의 QnA</h4></a></span><hr>
                    </li>

                </ul>
        </nav>
        
        <div id = "myInfo">
        	<h3> ☆ 프로필 수정 </h3>
        </div>
    
		<div id = "Info">
		<form action = "profileFormUpdate.do" method = "post" enctype = "multipart/form-data" id="frm">
		<input type = "hidden" name = "userNo" value = "<%=userNo%>">
			<table>
				<tr>
					<th> &nbsp;&nbsp; 프로필 사진 </th> 
						<% if ( sess.getUserImage() != null ) { %> 
							<td><a>&nbsp;&nbsp;&nbsp;<img width="190" id = "image" src="/honbob/images/<%=vo.getUserImage()%>"></a><br>
							<input type = "file" name = "userImage_tmp" accept=".jpg, .png" class = "files"></td>
						<% } else if ( sess.getUserImage() == null ) { %>
							<td><a>&nbsp;&nbsp;&nbsp;<img width="190" id = "image" src="/honbob/images/character.png"></a><br>
							<input type = "file" name = "userImage_tmp" accept=".jpg, .png" class = "files"></td>
						<% } %>
				</tr>
				<tr>
					<th> &nbsp;&nbsp; 별명 </th>
					<td colspan = "2"> &nbsp;&nbsp;&nbsp; <input type = "text" name = "userName" id = "userName" value = "<%=vo.getUserName()%>">
					</td><tr><td class = "sub"><input type = "button" value = "적용" id = "submits" class = "subm"/><input type = "button" value = "취소" class = "subm"></td><td class = "sub"></td>
				</tr>
			</table>
		</form>
		</div>
	</div>
	
	<script src="/honbob/js/user/myPage.js"></script> 
	<%@ include file = "../footer.jsp" %>
</body>
</html>