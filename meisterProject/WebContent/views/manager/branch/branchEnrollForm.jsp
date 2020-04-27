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
    
    <!-- 메뉴바 include여기에 해주세요 -->
	<%@ include file="../../common_manager/imMenubar.jsp"%>
	<!-- 메뉴바 include여기에 해주세요 -->
	

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
            background-color: #fff;
            vertical-align: middle;
        }

		.fileBox .btn_file {
                display:inline-block;
                border:1px solid #000;
                border-radius: 5px;
                width:100px;
                height:30px;
                font-size:0.8em;
                line-height:30px;
                text-align:center;
                vertical-align:middle
         }
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
<body>
	<div class="layoutSidenav_content" id="layoutSidenav_content">
		<main>
		<div class="container-fluid">
			<h1 class="mt-4">지점 관리</h1>
			<!-- 제목-->
			<br>
			<div class="card mb-4">
				<!-- 아이콘은 위에 메뉴에서 해당 i태그 가져오세요-->
				<div class="card-header">
					<i class="fas fa-table mr-1"></i>지점 등록
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<div id="btn-area" align="right">
							<input id="modifyBtn" type="submit" value="등록하기"> <input
								id="deleteBtn" type="submit" value="취소하기">
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
									<th>매장이미지 <input name="branchImg" type="file"
										style="display: none;">
									</th>
									<td colspan="3">
										<div id="thumb"
											style="border: 1px solid red; width: 250px; height: 250px;">
											<img src="" alt="">
										</div>
									</td>
								</tr>
								<tr>
									<th>지점주소</th>
									<td colspan="3"><input name="address"class="postcodify_address" type="text" />
									<button id="postcodify_search_button">검색</button></td>
										<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
										         <!-- jQuery와 Postcodify를 로딩한다 -->
								</tr>
								<tr>
									<th>매장위치</th>
									<td colspan="3" rowspan="3">
										<div id="branchMap"
											style="border: 1px solid red; width: 600px; height: 400px;"></div>
									</td>
								</tr>
								<tr>
									<td colspan="4"></td>
								</tr>
								<tr>
									<td colspan="4"></td>
								</tr>
								<tr>
									<th name="latitude" colspan="2">위도:</th>
									<th name="longitude" colspan="2">경도:</th>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
		</main>
	</div>

	<script>
		var uploadFile = $('.fileBox .uploadBtn');
		uploadFile.on('change',
				function() {
					if (window.FileReader) {
						var filename = $(this)[0].files[0].name;
					} else {
						var filename = $(this).val().split('/').pop().split(
								'\\').pop();
					}
					$(this).siblings('.fileName').val(filename);
				});
	</script>

	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70eee1adca78021e50b7669262f2474e"></script>
	<script>
		var mapContainer = document.getElementById('branchMap'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {

		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });

		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
		        });
		        infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		};
	</script>                
         <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
		<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
		<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>



                
</body>
</html>