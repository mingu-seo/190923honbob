<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 작성</title>
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/css/reset.css"/>
    <link rel="stylesheet" href="/css/style.css"/>
    <link rel="stylesheet" href="/css/swiper.css"/>
    <script src="http://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="/js/swiper.min.js"></script>
    <script src="/js/script.js"></script>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%@ include file="/WEB-INF/view/review/headHtml.jsp" %>
    <script>
        $(function() {
            var oEditors = [];
            nhn.husky.EZCreator.createInIFrame({
                oAppRef: oEditors,
                elPlaceHolder: "contents", // textarea ID
                sSkinURI: "<%=request.getContextPath()%>/smarteditor/SmartEditor2Skin.html",
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
    </script>
</head>
<body>
<div class="wrap">
    <%@ include file="/WEB-INF/view/original/header.jsp" %>
    <div class="sub">
        <div class="sub_left">
            <div class="list-group">
                <a href="#" class="list-group-item active">
                    장수정님,
                    환영합니다!
                </a>
                <a href="#" class="list-group-item">식당검색</a>
                <a href="#" class="list-group-item">커뮤니티</a>
                <a href="#" class="list-group-item">고객지원</a>
                <a href="#" class="list-group-item">마이페이지</a>
            </div>
        </div>
        <div class="sub_right">
            <div id="wrap">
                <!-- canvas -->
                <div id="canvas">
                    <!-- S T A R T :: headerArea-->
                    <%@ include file="/WEB-INF/view/original/top.jsp" %>
                    <!-- E N D :: headerArea-->
                    <!-- S T A R T :: containerArea-->
                    <div id="container">
                        <div id="content">
                            <div class="con_tit">
                                <h2>공지사항 - [쓰기]</h2>
                            </div>
                            <!-- //con_tit -->
                            <div class="con">
                                <!-- 내용 : s -->
                                <div id="bbs">
                                    <div id="bread">
                                        <form method="post" name="frm" id="frm" action="" enctype="multipart/form-data">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
                                                <colgroup>
                                                    <col width="10%" />
                                                    <col width="15%" />
                                                    <col width="10%" />
                                                    <col width="10%" />
                                                    <col width="10%" />
                                                    <col width="15%" />
                                                </colgroup>
                                                <tbody>
                                                <tr>
                                                    <th scope="row"><%--@declare id=""--%><label for="">제목</label></th>
                                                    <td colspan="10">
                                                        <input type="text" id="title" name="title" class="w100" title="제목을 입력해주세요" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row"><label for="">내용</label></th>
                                                    <td colspan="10">
                                                        <textarea id="contents" name="contents" title="내용을 입력해주세요" style="width:100%;"></textarea>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row"><label for="">첨부파일</label></th>
                                                    <td colspan="10">
                                                        <input type="file" id="filename_tmp" name="filename_tmp" class="w100" title="첨부파일을 업로드 해주세요." />
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            <input type="hidden" name="cmd" value="write" />
                                        </form>
                                        <div class="btn">
                                            <div class="btnLeft">
                                                <a class="btns" href="index.do"><strong>목록</strong></a>
                                            </div>
                                            <div class="btnRight">
                                                <a class="btns" style="cursor:pointer;"><strong>저장</strong></a>
                                            </div>
                                        </div>
                                        <!--//btn-->
                                    </div>
                                    <!-- //bread -->
                                </div>
                                <!-- //bbs -->
                                <!-- 내용 : e -->
                            </div>
                            <!--//con -->
                        </div>
                        <!--//content -->
                    </div>
                    <!--//container -->
                    <!-- E N D :: containerArea-->
                </div>
                <!--//canvas -->
            </div>
            <!--//wrap -->
        </div>
    </div>
    <%@ include file="/WEB-INF/view/original/footer.jsp" %>
