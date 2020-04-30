<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.meister.order.model.vo.*" %>
<%
 	int totalPrice = Integer.parseInt((request.getAttribute("totalPrice").toString()));
%>
<!DOCTYPE html>
<html>
<head>

  <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


    <%@ include file="../../common_user/menubar.jsp" %>
	<%@ include file="../../common_user/menubarMenuIMG.jsp" %>	
	

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<!-- 결제 api -->
    <script>
    	var totalPrice = <%=totalPrice%>;
	    $(function() {
		    var IMP = window.IMP; // 생략해도 괜찮습니다.
		    IMP.init("imp93450906"); 
	    	
		    IMP.request_pay({
		        pg : 'inicis',
		        pay_method : 'card',
		        merchant_uid : 'merchant_' + new Date().getTime(),
		        name : '마이스터 피자 결제',
		        amount : 100,
		        buyer_email : '<%=loginUser.getMemberEmail()%>',
		        buyer_name : '<%=loginUser.getMemberName()%>',
		        buyer_tel : '<%=loginUser.getMemberPhone()%>',
		    }, function(rsp) {
		        if ( rsp.success ) {
		        	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		        	$.ajax({
		        		//url: "http://localhost:9911/Meister/orderPayInsert.or", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
		        		url: "http://172.30.1.48:9911/Meister/orderPayInsert.or", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
		        		type: "POST",
		        		data: {
		        			totalPrice : totalPrice
		    	    		//기타 필요한 데이터가 있으면 추가 전달
		        		}
		        	}).done(function(data) {
		        		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
		        		//if ( everythings_fine ) {
		        			var msg = '결제가 완료되었습니다.';
		        			msg += '\n고유ID : ' + rsp.imp_uid;
		        			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		        			msg += '\결제 금액 : ' + rsp.paid_amount;
		        			msg += '카드 승인번호 : ' + rsp.apply_num;

		        			alert(msg);
		        			
		        			location.href='http://172.30.1.48:9911/Meister/paymentSuccess.or';
		        		//} else {
		        			
		        			//[3] 아직 제대로 결제가 되지 않았습니다.
		        			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
		        		//}
		        	});
		        } else {
		            var msg = '결제에 실패하였습니다.';
		            msg += '에러내용 : ' + rsp.error_msg;

		            alert(msg);
		        }
		    });
	    });
		    
	</script>


</body>
</html>