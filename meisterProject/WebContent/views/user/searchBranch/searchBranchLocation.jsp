<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.meister.branch.model.vo.Branch"%>
<%
	ArrayList<Branch> list = (ArrayList<Branch>)request.getAttribute("branchList");
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>searchBranchLocation</title>
	<%@ include file="../../common_user/menubar.jsp" %>
	<%@ include file="../../common_user/menubarMenuIMG.jsp" %>

	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resources/css/bootstrap.css">
	</head>
<style>

	 /* 서브메뉴 스타일 시작 (위에 웹폰트 링크도 복붙해주세요)*/
	div{box-sizing: border-box;}
	.outer{
	    width:1000px;
	    box-sizing: border-box;
	    margin: auto;
	    margin-top: 100px;
	    margin-bottom: 150px;
	}
	
	.outer *{
	    font-family: 'NanumSquare';
	}
	
	.outer a{text-decoration: none;}
	
	#index-area{
	   text-align: right;
	   font-size: 12px;
	}
	#index-area a{color:gray}
	
	
	.sub-menu-area *{
	    padding: 5px;
	}
	.sub-menu-area>a{
	    font-size: 17px;
	    color:black;
	    font-weight: bolder;
	}
	/* 서브메뉴 스타일 끝 */
	/* content 스타일 시작*/
	
	.content{
		height:700px;	
	}
	.content div{
		float:left;
	}

	#tableArea{width:100%; height:100%;}
	
	#branchListArea tr{
		height:130px;
		border-bottom:1px solid lightgray;
	}

	/* content 스타일 끝*/
</style>
<body>
	
	

	<div class="outer">
        <!-- 서브메뉴 타이틀 -->
        <h1 style="font-weight:bold; color:rgb(76, 60, 60);">매장위치</h1>
        <br>
        <!-- 서브메뉴 우측 인덱스 -->
        <div id="index-area"><a href="">홈 </a> &gt; 매장위치</div>
        <hr><br>
        <div style="float:left; width:300px; height:700px; overflow:auto; border:1px solid lightgray;">
        	<table id="branchListArea">
        		<% for(int i=0; i<list.size(); i++) { %>
        			<tr>
        				<td style="padding-left:20px; padding-right:20px;">
        					<b style="color:black; font-size:18px;"><%=list.get(i).getBranchName() %></b> <br>
        					<%=list.get(i).getPhone() %> <br>
        					<%=list.get(i).getAddress() %>
        				</td>
        			</tr>
        		<% } %>
        	</table>
        </div>
		<div class="content" id="map"></div>
    </div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70eee1adca78021e50b7669262f2474e&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(<%=list.get(0).getLatitude()%>, <%=list.get(0).getLongtitude()%>), // 지도의 중심좌표
	        level: 7 // 지도의 확대 레벨
	    };
	
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		
		// ** 지도에 컨트롤 올리기 **
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		
		// ** 지도에 여러 개의 마커 표시하기 **
		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
		var positions = [];
		<%for(int i=0; i<list.size();i++){%>
			positions.push({
				content: '<div><%=list.get(i).getBranchName()%><div>',
				latlng: new kakao.maps.LatLng(<%=list.get(i).getLatitude()%>, <%=list.get(i).getLongtitude()%>)
			});
		<%}%>
	
		
		for (var i = 0; i < positions.length; i ++) {
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng // 마커의 위치
		    });
		
		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용
		    });
		
		    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		}
		
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}
		
		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}

	</script>
    
    
	<%@ include file="../../common_user/footer.jsp"%>
	
</body>
</html>