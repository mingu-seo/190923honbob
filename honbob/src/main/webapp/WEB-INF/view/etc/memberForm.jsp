<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="smarteditor/js/HuskyEZCreator.js"></script>
<script>
var oEditors = [];
$(function() {
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "introduce", // textarea ID
		sSkinURI: "smarteditor/SmartEditor2Skin.html",	
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			fOnBeforeUnload : function(){
				
			}
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["contents"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});
});
function save() {
	if ($("#email").val() == "") {
		alert("이메일을 입력해 주세요");
		return false;
	}
	oEditors.getById["introduce"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용을 textarea(id=introduce)에 적용
}
</script>
<style>
	#introduce {
		width:100%;
	}
</style>
</head>
<body>
<h2>회원등록</h2>
<form action="memberInsert.do" method="post" enctype="multipart/form-data" onsubmit="return save();">
<table border="1" style="width:800px;">
	<tr>
		<th>이메일</th>
		<td>
			<input type="text" name="email" id="email">
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>
			<input type="password" name="password">
		</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>
			<input type="text" name="name">
		</td>
	</tr>
	<tr>
		<th>이미지</th>
		<td>
			<input type="file" name="image">
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<textarea name="introduce" id="introduce"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="저장"></td>
	</tr>
</table>
</form>
</body>
</html>