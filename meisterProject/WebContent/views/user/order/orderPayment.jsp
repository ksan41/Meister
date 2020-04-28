<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.meister.order.model.vo.*" %>
<%
	int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
%>
<!DOCTYPE html>
<html>
<head>
    <!-- 결제 api -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-x.y.z.js"></script>
	<!-- 결제 api -->
	
	<%@ include file="../../common_user/menubar.jsp" %>
	<%@ include file="../../common_user/menubarMenuIMG.jsp" %>
	
	

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<!-- 결제 api -->
    <script>
		$(function() {
			var IMP = window.IMP; // 생략가능
			IMP.init('5177413542774266');
			// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
			IMP.request_pay({
				pg : 'inicis', // version 1.1.0부터 지원.
				/* 
				    'kakao':카카오페이, 
				    html5_inicis':이니시스(웹표준결제)
				        'nice':나이스페이
				        'jtnet':제이티넷
				        'uplus':LG유플러스
				        'danal':다날
				        'payco':페이코
				        'syrup':시럽페이
				        'paypal':페이팔
				 */
				pay_method : 'card',
				/* 
				    'samsung':삼성페이, 
				    'card':신용카드, 
				    'trans':실시간계좌이체,
				    'vbank':가상계좌,
				    'phone':휴대폰소액결제 
				 */
				merchant_uid : 'merchant_' + new Date().getTime(),
				/* 
				    merchant_uid에 경우 
				    https://docs.iamport.kr/implementation/payment
				    위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
				    참고하세요. 
				    나중에 포스팅 해볼게요.
				 */
				name : '마이스터피자:결제',
				//결제창에서 보여질 이름
				amount : 100,
				//가격 
				buyer_email : '<%= loginUser.getMemberEmail() %>',
				buyer_name : '<%= loginUser.getMemberName() %>',
				buyer_tel : '<%= loginUser.getMemberPhone() %>',
				buyer_addr : '서울특별시 강남구 삼성동',
				buyer_postcode : '123-456',
			}, function(rsp) {
				if ( rsp.success ) {
			    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
			    	jQuery.ajax({
			    		url: location.href="http://localhost:9911/Meister/views/user/order/orderPayment", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
			    		type: 'POST',
			    		dataType: 'json',
			    		data: {
				    		imp_uid : rsp.imp_uid,
				    		//기타 필요한 데이터가 있으면 추가 전달
				    		pay_method : "카드결제",
				    		amount : <%= totalPrice %>
			    			url: "http://localhost:9911/Meister/orderPaySuccess.or" //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
				    		
				    		// 결제 성공 시 로직,
				        	url : location.href="http://localhost:9911/Meister/views/user/order/orderPaymentSuccess.jsp";
			    		}
			    	}).done(function(data) {
			    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
			    		if ( everythings_fine ) {
			    			var msg = '결제가 완료되었습니다.';
			    			msg += '\n고유ID : ' + rsp.imp_uid;
			    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
			    			msg += '\결제 금액 : ' + rsp.paid_amount;
			    			msg += '카드 승인번호 : ' + rsp.apply_num;
	
			    			alert(msg);
			    		} else {
			    			//[3] 아직 제대로 결제가 되지 않았습니다.
			    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
			    		}
			    	});
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
	
			        alert(msg);
			    }
		});
	</script>


</body>
</html>