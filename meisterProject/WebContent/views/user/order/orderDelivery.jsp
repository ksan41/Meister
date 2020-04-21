<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>주문방법 선택</title>
	
	<%@ include file="../../common_user/menubar.jsp" %>
	<%@ include file="../../common_user/menubarMenuIMG.jsp" %>
	
	<!-- 주소검색 API : https://www.poesis.org/postcodify/guide/freeapi -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	
	<!-- 스타일 링크 1-->
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
	
	<!-- 모달 부트스트랩 시작-->
	<link rel="stylesheet" type="text/css"
		href="<%=contextPath %>/resources/css/bootstrap.css">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	
	<!-- 밑에 이거 삭제해주세요.(menubar에 중복) -->
	<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> -->
	
	<!-- 모달 부트스트랩 끝-->

    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
            
	 /* 서브메뉴 스타일 시작 (위에 웹폰트 링크도 복붙해주세요)*/
	 div table tr td tbody{box-sizing: border-box;}
	 .outer{
	     width:1000px;
	     box-sizing: border-box;
	     margin: auto;
	     margin-top: 100px;
	     margin-bottom: 150px;
	     height:1000px;
	 }
	 
	 .outer *{
	     font-family: 'NanumSquare';
	 }
	 
	 .outer a{text-decoration: none; height:100%; margin-top:0px;}
	 #index-area{
	    text-align: right;
	    font-size: 12px;
	 }
	 #index-area a{color:gray}
	
	 /* 주문방법 상세페이지 스타일 시작 */
	 div{
	     /* border:1px solid red; */
	     box-sizing:border-box;
	 }
	 .inner>div:nth-child(1)>div:nth-child(1){
	     background-color: rgb(76, 60, 60);
	     color:white;
	 }
	 
	 .inner a{
	     font-size:18px;
	     /* border:1px solid red; */
	     display:block;
	     margin-top: 8%;
	     font-weight:bold;
	 }
	 .inner div{
	     float:left;
	 }
	 .inner>div:nth-child(1) div{
	     border-top-left-radius: 5px;
	     border-top-right-radius: 5px;
	 }
	 .inner div:nth-child(1) div{
	     width:100px;
	     height:40px;
	     text-align: center;
	     float:left;
	 }
	 .inner div:nth-child(2){
	     width:100%;
	     height:40px;
	 }
	 .inner div:nth-child(3){
	     width:100%;
	     height:120px;
	 }
	 .inner div:nth-child(3) div{
	     width:10%;
	     height:120px;
	 }
	 .inner div:nth-child(4){
	     width:100%;
	     height:70px;
	 }
	 #content1 input {
	     margin-top:50%;
	     margin-left:50%;
	     width:20px;
	     height:20px;
	 }
	 #content1>div:nth-child(3), #content1>div:nth-child(7), #content1>div:nth-child(11){
	     width:40%;
	 }
	 #content1>div:nth-child(4), #content1>div:nth-child(8), #content1>div:nth-child(12){
	     width:40%;
	     padding-top:4.5%;
	     padding-left:35%;
	 }
	 #addDeliveryAddress button{
	     margin-top:10%;
	     margin-left:12%;
	     width:40%;
	     height:30%;
	     font-size:85%;
	     background-color:whitesmoke;
	 }
	
	 #content1>div:nth-child(15) span{
	     display:inline-block;
	     margin-top:5%;
	 }
	 .inner button{
	     border-radius: 3px;
	     box-shadow:gainsboro;
	     color:black;
	     border:gainsboro;
	     
	 }
	#bottom{
	    height:50%;
	    background-color:rgb(76, 60, 60);
	}
	#bottom div{
	    display:inline-block;
	    float:left;
	}
	 #bottomMiddle{
	     width:50%;
	     height:70px;
	 }
	 h1, h3, h4, h5, h6{
	     color:rgb(76, 60, 60);
	 }
	 #remove{
	     font-size:20px; 
	 }
	 /* 주문방법 상세페이지 스타일 끝 */   
	
	 /* 모달 스타일 시작*/
	 .modal-body{
	     margin:auto;
	 }
	 
	 .modal-content {
	  width:600px;
	  margin:auto;
	 }
	 #addPostInput{
	 	margin-bottom:2px;
	 }
	 /* 모달 스타일 끝*/
	


</style>
</head>
<body>

    <div class="outer">
        <!-- 서브메뉴 타이틀 -->
        <h1 style="font-weight:bold; color:rgb(76, 60, 60);">주문방법 선택</h1>
        <br>
        <!-- 서브메뉴 우측 인덱스 -->
        <div id="index-area"><a href="">홈</a> &gt; 주문방법 선택</div>

        <!-- inner영역에 콘텐츠 작성 -->
        <div class="inner">
            <div>
                <div><a id="orderDelivery">배달주문</a></div>
                <div><a id="orderTakeOut">포장주문</a></div>
            </div>
            <div style="background-color:rgb(76, 60, 60);">
                
            </div>
            <div id="content1">

                <div>
                </div>
                <div>
                    <input type="checkbox">
                </div>
                <div>
                    <br><h4 style="font-weight:bold; color:rgb(76, 60, 60);">홈스윗홈</h4>신촌지점&nbsp;&nbsp;&nbsp;031-0000-8282
                </div>
                <div>
                    <button id="remove">―</button>
                </div>

                <div>
                </div>
                <div>
                    <input type="checkbox">
                </div>
                <div><br><h4 style="font-weight:bold; color:rgb(76, 60, 60);">회사</h4>강남지점&nbsp;&nbsp;&nbsp;031-0000-8282
                </div>
                <div>
                    <button id="remove">―</button>
                </div>

                <div>
                </div>
                <div>
                    <input type="checkbox">
                </div>
                <div>
                    <br><h4 style="font-weight:bold; color:rgb(76, 60, 60);">별장1</h4>여수지점&nbsp;&nbsp;&nbsp;031-0000-8282
                </div>
                <div>
                    <button id="remove">―</button>
                </div>

                <div id="bottom">
                </div>
                <div id="bottom" style="width:50%;">
                    <button type="button" class="addDeliveryAddress" data-toggle="modal"  data-target="#myModal" style="width:120px; height:40px; font-size:14px; margin-top:10px; margin-left:10%;" >+&nbsp;&nbsp;배달주소등록</button>
                </div>
                <div id="bottom" style="width:40%; padding-left:12%; padding-top:2.2%;">
                    <h6 style="color:white;">* 배달주소는 최대 5개까지 등록 가능합니다.</h6>
                </div>
                <div style="width:100%; height:45px;">
                </div>
                <div style="width:45%; height:60px;">
                </div>
                <div style="width:35%; height:60px; padding-left:12%; padding-top:2.2%;">
                    <h6>해당 주소로 배달을 진행하시겠습니까?</h6>
                </div>
                <div style="width:20%; height:60px; padding-left:7%;">
                    <button style="width:120px; height:40px; font-size:14px; margin-top:8px; text-align:center; background-color: rgb(76, 60, 60); color:white">&nbsp;&nbsp;다음으로</button>
                </div>
            </div>
          
        </div>
		

	
    </div>
    <%@ include file="../../common_user/footer.jsp"%>
     <!-- 다른 요소에 모달 적용하고 싶으면, 속성에 data-toggle="modal" ,  data-target="#myModal" 타겟명은 따로 지정 -->
  <!--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal"><!-- modal별 id 변경해주세요
    버튼
  </button>-->
  
          <!-- 모달 시작 -->
          <div class="modal fade" id="myModal"> <!-- modal별 id 변경해주세요-->
            <div class="modal-dialog">
              <div class="modal-content">
              
                <!-- Modal Header -->
                <div class="modal-header">
                  <h4 class="modal-title" style="margin:auto;padding:0; font-family: 'NanumSquare'; font-weight:bold;">배달주소 선택</h4>
                  <button type="button" class="close" data-dismiss="modal" style="margin:0;padding:0;">&times;</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body" style="margin:auto;">
                    <form id="form" name="form" method="post" action="<%=contextPath%>/insertAddress.or">
                        <input type="hidden" id="confmKey" name="confmKey" value=""/>
                        <input type="hidden" id="returnUrl" name="returnUrl" value=""/>
                        <input type="hidden" id="resultType" name="resultType" value=""/>
                        <!-- 해당시스템의 인코딩타입이 EUC-KR일경우에만 추가 START-->
                        <!-- 
                        <input type="hidden" id="encodingType" name="encodingType" value="EUC-KR"/>
                            -->
                        <!-- 해당시스템의 인코딩타입이 EUC-KR일경우에만 추가 END-->
                        <input type="text" id="sample3_postcode" name="newPoCode" style="width:562px; height: 40px; font-size:large; margin:3px;"placeholder="건물명, 도로명, 지번으로 검색하세요" readonly >
						
						<p id="addPostInput">
						
						</p>
						<input type="button" onclick="addPostInput(); sample3_execDaumPostcode();" value="우편번호 찾기" style="border:none; border-radius:4px; width:562px; height: 40px; font-size:large; margin:3px; color:white; background-color:rgb(76, 60, 60); font-weight:bold;"><br>
						<div id="wrap" style="display:none; border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
						</div>
						<div>
							<input type="text" name='deliveryName' id="addressName" style="width:562px; height: 40px; font-size:large; margin:3px;"placeholder="배달지 이름">
						</div>
						<input type="submit" onclick="" value="등록하기" style="background-color:rgb(243, 156, 18); border:none; border-radius:4px; width:562px; height: 40px; font-size:large; margin:3px; color:white; font-weight:bold;"><br>
                    </form>
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer" style="margin:auto;">
                    <!-- 하단버튼 영역-->
                  <button type="button" class="btn btn-danger" data-dismiss="modal"
                  style="width:200px; height:50px;">Close</button>
                </div>
                
              </div>
            </div>
          </div>
           <!-- 모달 끝 -->

	<script>
	
    // 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');
    function addPostInput(){
    	document.getElementById('addPostInput').innerHTML = "<input type='text' name='newAddress1' style='width:562px; height: 40px; font-size:large; margin:3px;' id='sample3_address' placeholder='주소'><br> <input type='text' name='newAddress2' style='width:562px; height: 40px; font-size:large; margin:3px;' id='sample3_detailAddress' placeholder='상세주소'> <input type='text' name='referenceAddress' style='width:562px; height: 40px; font-size:large; margin:3px;' id='sample3_extraAddress' placeholder='참고항목'>";    	
    	document.getElementById('sample3_postcode').placeholder = "우편번호";
    	
    };
    
    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    };

    function sample3_execDaumPostcode() {
    	element_wrap.style.width="568px";
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample3_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample3_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample3_postcode').value = data.zonecode;
                document.getElementById("sample3_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample3_detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
        
        
    };
	</script>
</body>
</html>