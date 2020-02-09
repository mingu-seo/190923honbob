<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
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
<div class="searchOptionMent">
    <p>게시글을 원하는 검색어에 설정하여 많은분들께 공유해주세요.(인기게시글이 될 확률이 높습니다)</p>
</div>
<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    검색옵션 설정
</button>

<div class="btn-group">
    <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        메뉴별
    </button>
    <div class="dropdown-menu">
        <a class="dropdown-item" href="#">한식</a>
        <a class="dropdown-item" href="#">양식</a>
        <a class="dropdown-item" href="#">중식</a>
        <a class="dropdown-item" href="#">일식</a>
    </div>
</div>
<div class="local">
    <form class="form-inline">
        <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
            <option selected>지역 별</option>
            <option value="1">강서구</option>
            <option value="2">강남구</option>
            <option value="3">강동구</option>
            <option value="4">강서구</option>
            <option value="5">양천구</option>
            <option value="6">구로구</option>
            <option value="7">금천구</option>
            <option value="8">서대문구</option>
            <option value="9">중구</option>
        </select>
    </form>
</div>
<div class="restrSearch">
    <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">식당명검색</button>
    </form>
</div>

<div id="wrap">
    <!-- canvas -->
    <div id="canvas">
        <div id="container">
            <div id="content">
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

                                        <td colspan="10">
                                            <input type="text" id="title" name="title" class="w100" title="제목을 입력해주세요" />
                                        </td>
                                    </tr>
                                    <tr>

                                        <td colspan="10">
                                            <textarea id="contents" name="contents" title="내용을 입력해주세요" style="width:100%;"></textarea>
                                        </td>
                                    </tr>
                                    <tr>

                                        <td colspan="10">
                                            <input type="file" id="filename_tmp" name="filename_tmp" class="w100" title="첨부파일을 업로드 해주세요." />
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <input type="hidden" name="cmd" value="write" />
                            </form>
                            <div class="optionButtons">
                                <button type="button" class="btn btn-warning">수정</button>
                            </div>
                            <div class="optionButtons">
                                <button type="button" class="btn btn-warning">취소</button>
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


</body>
</html>