<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.UserVO"%>
<%@page import="util.PageInfo" %>
<%@page import="util.Page" %>
<%@page import="java.util.List"%>
<%@page import="vo.support.SupportVO"%>
<%
	UserVO vo = (UserVO) request.getAttribute("vo");
%>
<%
	List<SupportVO> list = (List<SupportVO>) request.getAttribute("myQnAList"); 
	
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
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
                        <span class = "menu-title"><a href = "profileForm.do"><h4>프로필 수정</h4></a></span><hr>
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
                        <span class = "menu-title menu-title-active"><h4>나의 QnA</h4></span><hr>
                    </li>

                </ul>
        </nav>
        
        <div id = "myInfo">
        	<h3> ☆ 나의 QnA </h3>
        </div>
        <div>
    		<table>
    			<tr class = "names">
    				<th class = "name1">글번호</th>
    				<th class = "name2">제목</th>
    				<th class = "name3">답변</th>
    				<th class = "name4">등록일</th>
    			</tr>
				<% for ( int i=0 ; i < list.size() ; i++) { %>
				<tr>
					<td class = "listCon"> <%=list.get(i).getId()%></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/honbob/supportDetail?supportDocumentId=<%=list.get(i).getId()%>"><%=list.get(i).getSubject() %></a></td>
					<td class = "listCon"><%=list.get(i).getLock() %></td>
					<td class = "listCon"><%=String.valueOf(list.get(i).getRegistdate()).substring(0,10) %></td>
				</tr>
				<% } %>
    		</table>
    	</div>
			<section id="pageList">
	    		<%if(nowPage<=1){ %>
				[이전]&nbsp;
				<%}else{ %>
				<a href="myQnA.do?page=<%=nowPage-1%>">[이전]</a>&nbsp; 
				<%} %>
		
				<%for(int a=startPage;a<=endPage;a++){
						if(a==nowPage){%>
				[<%=a %>]
				<%}else{ %>
				&nbsp;<a href="myQnA.do?page=<%=a %>">[<%=a %>]
				</a>
				<%} %>
			<%} %>
		
				<%if(nowPage>=maxPage){ %>
				[다음]
				<%}else{ %>
				&nbsp;<a href="myQnA.do?page=<%=nowPage+1%>">[다음]</a>
				<%} %>
			</section>
	</div>
	<script src="/honbob/js/user/myPage.js"></script> 
	<%@ include file = "../footer.jsp" %>
</body>
</html>