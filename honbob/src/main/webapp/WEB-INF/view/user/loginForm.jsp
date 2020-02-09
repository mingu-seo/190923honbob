<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Login</title>
    
    <link rel="stylesheet" href="/dog/css/style.css">
</head>
<script src="https://code.jquery.com/jquery-3.4.1.js"> </script>
	<script type = "text/javascript">
		function check() {
			if ($("#id").val().trim() == "") {
				alert("아이디를 입력해 주세요");
				$("#id").focus();
				return false;
			}
			if ($("#password").val().trim() == "") {
				alert("비밀번호를 입력해 주세요");
				$("#password").focus();
				return false;
			}
		}

	</script>
<body>
		<form action = "login.do" method = "post" onsubmit="return check();">
        <svg id="ryan" viewBox="0 0 120 120" xmlns="http://www.w3.org/2000/svg">
            <path d="M0,150 C0,65 120,65 120,150" fill="#e0a243" stroke="#000" stroke-width="2.5" />
            <g class="ears">
                <path d="M46,32 L46,30 C46,16 26,16 26,30 L26,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(-10,38,24)" />
                <path d="M74,32 L74,30 C74,16 94,16 94,30 L94,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(10,82,24)" />
            </g> <a href = "adminLoginForm.do">
            <circle cx="60" cy="60" r="40" fill="#e0a243" stroke="#000" stroke-width="2.5" />
            <g class="eyes">
                <!-- left eye and eyebrow-->
                <line x1="37" x2="50" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" />
                <circle cx="44" cy="55" r="3" fill="#000" />
                <!-- right eye and eyebrow -->
                <line x1="70" x2="83" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" />
                <circle cx="76" cy="55" r="3" fill="#000" /> 
            </g> </a>
            <g class="muzzle">
                <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" />
                <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" stroke="#000" stroke-width="2.5" stroke-linejoin="round" stroke-linecap="round" />
                <polygon points="59,63.5,60,63.4,61,63.5,60,65" fill="#000" stroke="#000" stroke-width="5" stroke-linejoin="round" />
            </g>
            <path d="M40,105 C10,140 110,140 80,105 L80,105 L70,111 L60,105 L50,111 L40,105" fill="#fff" />
        </svg>
        <% if (session.getAttribute("Session") == null) { %>
	 			<input type = "text" name = "userId" id="id" maxlength="25" placeholder="ID">
	 			<input type = "password" name = "userPassword" id="password" maxlength="30" placeholder="Password">
	 			<input type = "submit" value = "Login">
	 		<br>
	 			<span><a href = "search_Id.do">아이디 찾기</a> / <a href = "search_Pwd.do"> 비밀번호 찾기</a> 
	 			<a href="" onclick='window.open("http://localhost:8080/dog/honbab/userJoinForm.do");return false'>회원가입</a></span>
 		</form>
 		<% } else if ((session.getAttribute("Session") != null)) { %>
 		<script language="javascript" type="text/javascript">
   			setTimeout(function() {
    		opener.location.reload();
   			self.close();
    		}, 1000);
		</script>
 		<% } %>
    <script src="/dog/js/script.js"></script>
</body>
</html>