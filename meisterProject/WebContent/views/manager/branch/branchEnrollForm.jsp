<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>meister_통합 - 지점등록</title>
    <link href="../resources/admin/dist/css/styles.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet"
        crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"
        crossorigin="anonymous"></script>
    <style>
        .layoutSidenav_content {
            margin: auto;
            margin-top: 100px;
            width: 1200px;
            height: auto;

        }

        th {
            height: 80px;
            width: 130px;
        }

        table {
            font-size: 18px;
            margin: auto;
        }

        input {
            border-radius: 5px;
        }

        /*첨부파일*/
        .fileBox .fileName {
            display: inline-block;
            width: 190px;
            height: 30px;
            padding-left: 10px;
            margin-right: 5px;
            line-height: 30px;
            /* border:1px solid #aaa; */
            background-color: #fff;
            vertical-align: middle;
        }

        /* .fileBox .btn_file {
                display:inline-block;
                border:1px solid #000;
                border-radius: 5px;
                width:100px;
                height:30px;
                font-size:0.8em;
                line-height:30px;
                text-align:center;
                vertical-align:middle
            } */
        .fileBox input[type="file"] {
            position: absolute;
            width: 1px;
            height: 1px;
            padding: 0;
            margin: -1px;
            overflow: hidden;
            clip: rect(0, 0, 0, 0);
            border: 0
        }
    </style>
</head>
<body class="sb-nav-fixed">

	<div id="layoutSidenav_content">
            <main>
                <div class="container-fluid">
                    <h1 class="mt-4">지점관리</h1><!-- 제목-->
                    <br>
                    <div class="card mb-4">
                        <!-- 아이콘은 위에 메뉴에서 해당 i태그 가져오세요-->
                        <div class="card-header"><i class="fas fa-table mr-1"></i> 지점 등록</div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <div id="btn-area" align="right">
                                    <input class="button" id="modifyBtn" type="submit" value="등록하기">
                                    <input class="button" id="deleteBtn" type="submit" value="취소하기">
                                </div>
                                <form>
                                    <table style="width: 100%;">
                                        <tr>
                                            <th>지점명</th>
                                            <td colspan="3"><input type="text"></td>
                                        </tr>
                                        <tr>
                                            <th>지점번호</th>
                                            <td><input type="text"></td>
                                            <th>지점장명</th>
                                            <td><input type="text"></td>
                                        </tr>
                                        <tr>
                                            <th>영업시간</th>
                                            <td><input type="text"></td>
                                            <th>지점계정명</th>
                                            <td><input type="text"></td>
                                        </tr>
                                        <tr>
                                            <th>주차정보</th>
                                            <td><input type="text"></td>
                                            <th>지점장번호</th>
                                            <td><input type="text"></td>
                                        </tr>
                                        <tr>
                                            <th>할인율</th>
                                            <td colspan="3"><input type="text"></td>
                                        </tr>
                                        <tr>
                                            <th>개점일자</th>
                                            <td colspan="3"><input type="text"></td>
                                        </tr>
                                        <tr>
                                            <th>지점주소</th>
                                            <td colspan="3"><input type="text"></td>
                                        </tr>

                                        <tr>
                                            <th>매장이미지</th>
                                            <td>
                                                <div class="fileBox">
                                                    <input type="text" class="fileName" readonly="readonly" value="">
                                                    <label for="uploadBtn" class="button">찾아보기</label>
                                                    <input type="file" id="uploadBtn" class="uploadBtn">
                                                </div>
                                            </td>
                                            <th>매장위치</th>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><img id="titleImg" width="50%"></td>
                                            <td colspan="2" style="width: 50%; background-color: honeydew;">지도넣을곳</td>
                                        </tr>
                                    </table>
                                    <!-- <div id="fileArea">
                                        <input type="file" name="file1" id="file1" onchange="loadImg(this, 1);">
                                    </div> -->
                                    <!-- <div class="btns" align="center">
                                        <button type="submit">등록하기</button>
                                    </div> -->
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
	<script>
		var uploadFile = $('.fileBox .uploadBtn');
		uploadFile.on('change', function () {
		    if (window.FileReader) {
		        var filename = $(this)[0].files[0].name;
		    } else {
		        var filename = $(this).val().split('/').pop().split('\\').pop();
		    }
		    $(this).siblings('.fileName').val(filename);
		});
	</script>
</body>
</html>