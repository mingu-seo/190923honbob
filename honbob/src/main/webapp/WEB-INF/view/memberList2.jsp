<%@page import="java.text.SimpleDateFormat"%>
<%@page import="test.TestVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
List<TestVO> list = (List<TestVO>)request.getAttribute("list");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
TestVO vo = (TestVO)request.getAttribute("vo");

TestVO sess = (TestVO)session.getAttribute("adminSession");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function(){
	$("#from").datepicker({
		dateFormat:'yy-mm-dd',
		dayNamesMin : ['일','월','화','수','목','금','토'],
		monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	});
	$("#to").datepicker({
		dateFormat:'yy-mm-dd',
		dayNamesMin : ['일','월','화','수','목','금','토'],
		monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	});
});
</script>
</head>
<body>
<%-- 
<c:if test="${empty sessionScope.adminSession}">
<a href="/sample/admin/login.do">로그인</a>
</c:if>
<c:if test="${!empty sessionScope.adminSession}">
<a href="/sample/admin/logout.do">로그아웃</a>
</c:if>
 --%>
<% if (sess == null) { %>
<a href="/sample/admin/login.do">로그인</a>
<% } else { %>
<a href="/sample/admin/logout.do">로그아웃</a>
<% } %>
<form action="memberList2.do" method="get">
<input type="text" name="from" id="from" readonly value="<%=vo.getFrom()%>">~<input type="text" name="to" id="to" readonly value="<%=vo.getTo()%>">
<input type="submit" value="날짜 검색"/>
</form>
<table border="1">
	<tr>
		<th>번호</th>
		<th>이미지</th>
		<th>이메일</th>
		<th>이름</th>
		<th>가입일</th>
	</tr>
	<%
	for (int i=0; i<list.size(); i++) {
	%>
	<tr onclick="location.href='memberDetail.do?id=<%=list.get(i).getId()%>';" style="cursor:pointer;">
		<td><%=list.get(i).getId()%></td>
		<td>
		<% if (list.get(i).getProfile() != null) { %>
		<img src="<%=request.getContextPath()%>/upload/test/<%=list.get(i).getProfile()%>" width="100">
		<% } %>
		</td>
		<td><%=list.get(i).getEmail() %></td>
		<td><%=list.get(i).getName() %></td>
		<td><%=sdf.format(list.get(i).getRegdate()) %></td>
	</tr>	
	<%
	}
	%>
</table>
<a href="memberForm.do">가입</a>
</body>
</html>

















