<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="vo.UserVO"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" href="/honbob/css/user/Join.css">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"> </script>
	<script type = "text/javascript">

</script>
<script>
	function join() {

		if ($("#id").val().trim() == "") {
			alert("아이디을 입력해 주세요");
			$("#id").focus();
			return false;
			}
		var con = true;
		$.ajax({
			url : "/honbob/idCheck.do",
			data : {userId:$("#id").val()},
			type : "POST",
			async : false,
			success : function(data) {
				if (data.trim() == "0") {
				} else {
					alert("중복된 아이디입니다.");
					$("#id").val("");
					$("#id").focus();
					con = false;
				}
			}
		});
		if (con == false) return false;
		
		if ($("#password").val().trim() == "") {
			alert("비밀번호를 입력해 주세요");
			$("#password").focus();
			return false;
			}
		if ($("#password1").val().trim() == "") {
			alert("비밀번호를 확인해 주세요");
			$("#password1").focus();
			return false;
			}
		if ($("#password").val().trim() != $("#password1").val().trim()) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#password1").val("");
			$("#password").focus();
			return false;
			}
		if ($("#name").val().trim() == "") {
			alert("별명을 입력해 주세요");
			$("#name").focus();
			return false;
			}
		if ($("#email").val().trim() == "") {
			alert("이메일을 입력해 주세요");
			$("#email").focus();
			return false;
			}
		/*
		if (!CheckEmail($("#email").val())) {
			alert("이메일 형식이 잘못되었습니다.");
			return false;
		}
		*/		
		
		if ($("#emailPwdNumber").val().trim() == "") {
			alert("인증번호를 입력해 주세요");
			$("#emailPwdNumber").focus();
			return false;
			} else { 
			var con = true;
			$.ajax({
				url : "/honbob/emailPwdCheck.do",
				data : {emailPwdNumber:$("#emailPwdNumber").val()},
				type : "POST",
				async : false,
				success : function(data) {
					if (data.trim() == "1") {
					} else {
						alert("인증번호가 일치하지 않습니다.");
						$("#emailPwdNumber").val("");
						$("#emailPwdNumber").focus();
						con = false;
						}
					}
				});
			};
		if (con == false) return false;
		if ($("#qwdQuestion").val() == 0) {
			alert("질문을 선택해 주세요");
			$("#qwdQuestion").focus();
			return false;
			}
		if ($("#qwdAnswer").val().trim() == "") {
			alert("질문에 대한 답변을 입력해 주세요");
			$("#qwdAnswer").focus();
			return false;
			}
		$("#joinform").submit();
	}
	
	$(function() {
		$("#duplicateCheck").click(function() {
			if ($("#id").val().trim() == "") {
				alert("아이디를 입력해 주세요");
			} else {
				$.ajax({
					url : "/honbob/idCheck.do",
					data : {userId:$("#id").val()},
					type : "POST",
					async : false,
					success : function(data) {
						if (data.trim() == "0") {
							alert("사용 가능합니다.");
						} else {
							alert("중복된 아이디입니다.");
							$("#id").val("");
							$("#id").focus();
							con = false;
						}
					}
				});
			}
		});
	});
	
	$(function() {
		$("#emailCheck").click(function() {
			if ($("#email").val().trim() == "") {
				alert("이메일을 입력해 주세요");
			} else {
				$.ajax({
					url : "/honbob/emailCheck.do",
					data : {userEmail:$("#email").val()},
					type : "POST",
					async : true,
					success : function(data) {
						if (data.trim() == "0") {
							// 이메일로 인증번호 전송
							$('#emailChecking').show(); 
							alert("입력한 이메일로 인증번호가 전송되었습니다.");
							return false;
						} else {
							alert("이미 등록된 이메일입니다.");
							$("#email").focus();
							con = false;
						}
					}
				});
			} 
			if (con == false) return false;
		});
	});

	$(function() {
		$("#emailChecking").hide();
	});


	
	
	
</script>
<style type="text/css">

</style>
</head>
<body>
	<%@ include file = "../header.jsp" %>
	<div id = "container">
	<div id = "momtong">
	<div class = "bab">
	<h1> 밥먹자! </h1>
	</div>
	<form action = "userJoin.do" id = "joinform" method = "post" enctype = "multipart/form-data"> 
	<div class = "input">
		<h4><label for = "id"> 아이디 </label></h4>
		<input type = "text" name = "userId" id = "id" minlength="8" maxlength="25" placeholder="아이디를 입력해 주세요."><input type = "button" class = "button" id = "duplicateCheck" value = "중복체크">
	</div>
	<div class = "input">
		<h4><label for = "password"> 비밀번호 </label></h4>
		<input type = "password" name = "userPassword" id = "password" minlength="10" maxlength="30" class = "input1" placeholder="비밀번호를 입력해 주세요.">
	</div>
	<div class = "input">
		<h4><label for = "password1"> 비밀번호 확인 </label></h4>
		<input type = "password" name = "password1" id = "password1" minlength="10" maxlength="30" class = "input1" placeholder="비밀번호 확인.">
	</div>
	<div class = "input">
		<h4><label for = "name"> 별명 </label></h4>
		<input type = "text" name = "userName" id = "name" minlength="2" maxlength="5" class = "input1" placeholder="닉네임을 입력해 주세요.">
	</div>
	<div class = "input">
		<h4><label for = "email"> 이메일 </label></h4>
		<input type = "text" name = "userEmail" id = "email" maxlength="40" class = "input2" placeholder="이메일을 입력해 주세요.">
		<input type = "button" class = "button" id = "emailCheck" value = "인증번호">
	</div>
	<div class = "input" id = "emailChecking">
		<h4><label for = "emailCheck"> 인증번호 확인 </label></h4>
		<input type = "text" name = "emailPwdNumber" id = "emailPwdNumber" maxlength="30" class = "input1" placeholder="인증번호 확인">
	</div>
	<div class = "input">
		<h4><label for = "pwdQuestion"> 비밀번호 찾기 질문 </label></h4>
				<select name = "pwdQuestion" id = "qwdQuestion"  class = "input1">
					<option value="0">질문을 선택해 주세요</option>							
					<option value="1">키우는 애완동물 이름은?</option>
					<option value="2">어릴적 별명은?</option>
					<option value="3">가장 친한 친구 이름은?</option>
				</select>
	</div>
	<div class = "input">
		<h4><label for = "pwdAnswer"> 비밀번호 찾기 답변 </label></h4>
		<input type = "text" name = "pwdAnswer" id = "qwdAnswer" maxlength="15" class = "input1">
	</div>
			<a href="javascript:join();" id = "join"> <input type = "button" id = "join" class = "subm" value = "가입"> </a> <input type = "button" id = "join" class = "subm" value = "취소">
	</form>
	</div>
	</div>
		<%@ include file = "../footer.jsp" %>
</body>
</html>