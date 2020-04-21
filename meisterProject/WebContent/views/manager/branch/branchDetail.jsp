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
        <title>meister_통합 - 지점상세조회</title>
        
	<!-- 메뉴바 include여기에 해주세요 -->
	<%@ include file="../../common_manager/imMenubar.jsp"%>
	<!-- 메뉴바 include여기에 해주세요 -->
	

        <style>
            .layoutSidenav_content{
                margin:auto;
                margin-top: 100px;
                width:1200px;
                height: auto;

            }
            th {height: 80px; width: 130px;}
            table{
                font-size: 18px;
                margin: auto;
            }
            input{border-radius: 5px;}
        </style>
</head>
<body>
	        <div class="layoutSidenav_content" id="layoutSidenav_content">
            <main>
                <div class="container-fluid">
                    <h1 class="mt-4">지점 관리</h1><!-- 제목-->
                    <br>
                    <div class="card mb-4">    <!-- 아이콘은 위에 메뉴에서 해당 i태그 가져오세요-->
                        <div class="card-header"><i class="fas fa-table mr-1"></i>지점 상세조회</div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <div id="btn-area" align="right">
                                    <input type="button" value="목록으로">
                                </div>
                                <form action="">
                                    <table style="width: 100%;">
                                        <tr>
                                            <th>지점명</th>
                                            <td colspan="3"><input name="branchName" type="text"></td>
                                        </tr>
                                        <tr>
                                            <th>점주명</th>
                                            <td><input name="name" type="text"></td>
                                            <th>지점계정</th>
                                            <td><input name="bmId" type="text"></td>
                                        </tr>
                                        <tr>
                                            <th>개점일자</th>
                                            <td><input name="enrollDate" type="date""></td>
                                            <th>매장전화번호</th>
                                            <td><input name="phone" type="text"></td>
                                        </tr>
                                        <tr>
                                            <th>영업시작시간</th>
                                            <td><input name="open" type="text"></td>
                                            <th>영업종료시간</th>
                                            <td><input name="close" type="text"></td>
                                        </tr>
                                        
                                        <tr>
                                            <th>매장이미지
                                                <input name="branchImg" type="file" style="display: none;">
                                            </th>
                                            <td colspan="3">
                                                <div id="thumb" style="border: 1px solid red; width:250px;height:250px;">
                                                    <img src="" alt="">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>지점주소</th>
                                            <td colspan="3"><input name="address" type="text"></td>
                                        </tr>
                                        <tr>
                                            <th>매장위치</th>
                                            <td colspan="3" rowspan="3">
                                                <div id="branchMap" style="border:1px solid red; width:600px; height:400px;"></div>
                                            </td>
                                        </tr>
                                        <tr><td colspan="4"></td></tr>
                                        <tr><td colspan="4"></td></tr>
                                        <tr>
                                            <th name="latitude" colspan="2">위도: </th>
                                            <th name="longitude" colspan="2">경도: </th> 
                                        </tr>
                                    </table>
                                    </form>
                            </div>
                        </div>
                    </div>
                </div>
            </main>                 
        </div>
</body>
</html>