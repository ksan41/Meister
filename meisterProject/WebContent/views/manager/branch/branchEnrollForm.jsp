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
        
        
        #thumb{
            overflow: hidden;
			display: flex;
			align-items: center;
			justify-content: center;
        }
        
        #bImgArea{
			height: 250px;
			margin: auto;
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
									<th>매장이미지 
									<input id="branchImg" type="file" style="display: none;" onchange="loadImg(this);">
									</th>
									<td colspan="3">
										<div id="thumb"
											style="border: 1px solid lightgray; width: 250px; height: 250px;">
											<img id="bImgArea">
										</div>
									</td>
								</tr>
								<tr>
									<th>지점주소</th>
									<td colspan="3"><input style="width:350px;" name="address" type="text" id="sample5_address" placeholder="주소">
									<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색">
								</tr>
								<tr>
									<th>매장위치</th>
									<td colspan="3" rowspan="3">
										<div id="branchMap"
											style="width: 600px; height: 400px;"></div>
									</td>
								</tr>
								<tr>
									<td colspan="4"></td>
								</tr>
								<tr>
									<td colspan="4"></td>
								</tr>
								<tr>
									<th colspan="4">위도:<input name="latitude" type="text" id="latitude" readonly>
													경도:<input name="longitude" type="text" id="longitude" readonly>
									</th>
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
		$(function(){
			$("#thumb").click(function(){
		$("#branchImg").click();
			});
		});

		function loadImg(inputFile) {

			var reader = new FileReader();

			// 파일을 읽어주는 메소드 --> 해당 파일을 읽어들이는 순간 해당 파일만의 고유한 url부여
			reader.readAsDataURL(inputFile.files[0]);

			// 파일 읽기가 다 완료되었을때 실행할 메소드
			reader.onload = function(e) {//e : 이벤트객체
				// attr 해당 요소에 속성 부여
				$("#bImgArea").attr("src", e.target.result);
			};
		}
	</script>



	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70eee1adca78021e50b7669262f2474e&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('branchMap'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        $("#latitude").val(result.y);
                        $("#longitude").val(result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>

                
</body>
</html>