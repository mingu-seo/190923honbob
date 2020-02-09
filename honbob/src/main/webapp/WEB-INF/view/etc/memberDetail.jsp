<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
function updateConfirm() {
	if (confirm("수정하시겠습니까?")) {
		location.href='memberUpdateForm.do?id=${vo.id}';
	}
}
function deleteConfirm() {
	if (confirm("삭제하시겠습니까?")) {
		location.href='memberDelete.do?id=${vo.id}';
	}
}
</script>
<style>
	#introduce {
		width:100%;
	}
</style>
</head>
<body>
<h2>회원상세</h2>
<form action="memberInsert.do" method="post" enctype="multipart/form-data" onsubmit="save();">
<table border="1" style="width:800px;">
	<tr>
		<th>이메일</th>
		<td>
			${vo.email }
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>
			${vo.password }
		</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>
			${vo.name }
		</td>
	</tr>
	<tr>
		<th>이미지</th>
		<td>
		<c:if test="${!empty vo.profile}">
			<img src="/sample/upload/test/${vo.profile}">
		</c:if>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			${vo.introduce}
		</td>
	</tr>
	<tr>
		<th colspan="2">
			<input type="button" value="목록" onclick="location.href='memberList2.do';">
			<input type="button" value="수정" onclick="updateConfirm();">
			<input type="button" value="삭제" onclick="deleteConfirm();">
		</th>
	</tr>
</table>
</form>
</body>
</html>