<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.meister.branch.model.vo.*,com.meister.member.model.vo.*"%>
<%
	Branch b = (Branch)request.getAttribute("b");
	Manager m = (Manager)request.getAttribute("m");
%>    
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
            
            #thumb{
            overflow: hidden;
			display: flex;
			align-items: center;
			justify-content: center;
        }
        
        #thumb>img{
			height: 250px;
			margin: auto;
        }
        
        
        #menuInsertBtns{
          margin-left: 500px;
        }
        
        /* 중간버튼 스타일 */
         .middle_btn{
            display: block;
            height:40px;
            width:150px;
            margin: 0 auto;
            font-size: 15px;
            font-weight: bolder;
            color:white;
            background-color: rgb(76, 60, 60);
            border:0;
            border-radius: 5px;
            margin: 10px;
            float: left;
        }
         /* 중간버튼 스타일 */
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
                                <form action="">
                                    <table id="branchDetailTable" style="width: 100%;">
                                        <tr>
                                            <th>지점명</th>
                                            <td colspan="3"><input name="branchName" type="text" readonly value="<%=b.getBranchName()%>"></td>
                                        </tr>
                                        <tr>
                                            <th>점주명</th>
                                            <td><input name="name" type="text" readonly value="<%=m.getName()%>"></td>
                                            <th>지점계정</th>
                                            <td><input name="bmId" type="text" readonly value="<%=m.getManagerId()%>"></td>
                                        </tr>
                                        <tr>
                                            <th>개점일자</th>
                                            <td><input name="enrollDate" type="date" readonly value="<%=b.getOpeningDate()%>"></td>
                                            <th>매장전화번호</th>
                                            <td><input name="phone" type="text" readonly value="<%=b.getPhone()%>"></td>
                                        </tr>
                                        <tr>
                                            <th>영업시작시간</th>
                                            <td><input name="open" type="text" readonly value="<%=b.getOpenTime()%>"></td>
                                            <th>영업종료시간</th>
                                            <td><input name="close" type="text" readonly value="<%=b.getCloseTime()%>"></td>
                                        </tr>
                                        
                                        <tr>
                                            <th>매장이미지
                                            </th>
                                            <td colspan="3">
                                                <div id="thumb" style="border: 1px solid lightgray; width:250px;height:250px;">
                                                    <img src="<%=contextPath %>/resources/siteImgs/pageImg/<%=b.getBranchImg() %>" alt="">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>지점주소</th>
                                            <td colspan="3"><input name="address" type="text" readonly value="<%=b.getAddress()%>"></td>
                                        </tr>
                                        <tr>
                                            <th>매장위치</th>
                                            <td colspan="3" rowspan="3">
                                                <div id="branchMap" style=" width:600px; height:400px;"></div>
                                            </td>
                                        </tr>
                                        <tr><td colspan="4"></td></tr>
                                        <tr><td colspan="4"></td></tr>
                                        <tr>
	                                      	<th colspan="4">위도:<input name="latitude" type="text" id="latitude" readonly  required value="<%=b.getLatitude()%>">
														경도:<input name="longitude" type="text" id="longitude" readonly  required value="<%=b.getLongtitude()%>">
											</th>
										</tr>	
                                    </table>
                                    </form>
                                    <div id="menuInsertBtns">
									<button type="button" class="middle_btn" onclick="location.href='<%=contextPath%>/branchList.br';">목록으로</button>
									</div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>                 
        </div>
        
        
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70eee1adca78021e50b7669262f2474e&libraries=services"></script>
<script>
	var container = document.getElementById('branchMap'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(<%=b.getLatitude()%>,<%=b.getLongtitude()%>), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(<%=b.getLatitude()%>, <%=b.getLongtitude()%>),
        map: map
    });
</script>        
</body>
</html>