<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.UserVO"%>
<%
	UserVO search = (UserVO) request.getAttribute("search");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Ryan Login</title>
    
    <link rel="stylesheet" href="/honbob/css/user/style.css">
</head>
<script src="https://code.jquery.com/jquery-3.4.1.js"> </script>
	<script type = "text/javascript">
		function check() {
			if ($("#userName").val().trim() == "") {
				alert("이름 입력해 주세요");
				$("#userName").focus();
				return false;
			}
			if ($("#userEmail").val().trim() == "") {
				alert("이메일을 입력해 주세요");
				$("#userEmail").focus();
				return false;
			} 
			if (!CheckEmail($("#userEmail").val())) {
				alert("이메일 형식이 잘못되었습니다.");
				return false;
			}
			
			
		}
		
		function CheckEmail(str) {                                                 
			var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
			if(!reg_email.test(str)) {                            
				return false;         
			} else {                       
				return true;         
			}                            
		}                                

	</script>
<body>
		<form action = "search_id.do" method = "post" onsubmit="return check();">	
        <svg id="ryan" viewBox="0 0 120 120" xmlns="http://www.w3.org/2000/svg">
            <path d="M0,150 C0,65 120,65 120,150" fill="#e0a243" stroke="#000" stroke-width="2.5" />
            <g class="ears">
                <path d="M46,32 L46,30 C46,16 26,16 26,30 L26,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(-10,38,24)" />
                <path d="M74,32 L74,30 C74,16 94,16 94,30 L94,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(10,82,24)" />
            </g>
            <circle cx="60" cy="60" r="40" fill="#e0a243" stroke="#000" stroke-width="2.5" />
            <g class="eyes">
                <!-- left eye and eyebrow-->
                <line x1="37" x2="50" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" />
                <circle cx="44" cy="55" r="3" fill="#000" />
                <!-- right eye and eyebrow -->
                <line x1="70" x2="83" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" />
                <circle cx="76" cy="55" r="3" fill="#000" />
            </g>
            <g class="muzzle">
                <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" />
                <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" stroke="#000" stroke-width="2.5" stroke-linejoin="round" stroke-linecap="round" />
                <polygon points="59,63.5,60,63.4,61,63.5,60,65" fill="#000" stroke="#000" stroke-width="5" stroke-linejoin="round" />
            </g>
            <path d="M40,105 C10,140 110,140 80,105 L80,105 L70,111 L60,105 L50,111 L40,105" fill="#fff" />
        </svg>
        	<% if ( search == null) { %>
			<input type = "text" name = "userName" id = "userName" placeholder="NAME">
			<input type = "text" name = "userEmail" id = "userEmail" placeholder="email@domain.com" >
			<input type = "submit" value = "아이디 찾기"> <br> 
			<span><a href = "loginForm.do"> 로그인 </a> / <a href = "search_Pwd.do"> 비밀번호 찾기 </a></span>
			<% } else { %>
			아이디 : ${search.userId} 
			<a href = "loginForm.do"> 로그인 </a>
			<a href = "search_Pwd.do"> 비밀번호 찾기 </a>
			<% } %>
    <script src="/honbob/js/user/script.js"></script>
    </form>
</body>
</html>
