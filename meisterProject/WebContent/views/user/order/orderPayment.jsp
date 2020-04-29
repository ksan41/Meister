<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.meister.order.model.vo.*" %>

<!DOCTYPE html>
<html>
<head>
    <!-- 결제 api -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<!-- 결제 api -->
	

	
	

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../common_user/menubar.jsp" %>
	<%@ include file="../../common_user/menubarMenuIMG.jsp" %>

	<!-- 결제 api -->
    <script>
	    var IMP = window.IMP; // 생략해도 괜찮습니다.
	    IMP.init("imp93450906"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
	    
	    // IMP.request_pay(param, callback) 호출
	    IMP.request_pay({ // param
	      pg: "inicis",
	      pay_method: "card",
	      merchant_uid: "ORD20180131-0000011",
	      name: "노르웨이 회전 의자",
	      amount: 100,
	      buyer_email: "gildong@gmail.com",
	      buyer_name: "홍길동",
	      buyer_tel: "010-4242-4242",
	      buyer_addr: "서울특별시 강남구 신사동",
	      buyer_postcode: "01181"
	    }, function (rsp) { // callback
	      if (rsp.success) {
	    	  

	    	  
	    	  
	    	  
	          // 결제 성공 시 로직,
	    	  //url : 'http://localhost:9911/Meister/views/user/order/orderPaymentSuccess.jsp'
	      } else {
	          // 결제 실패 시 로직,
	      }
	    });
	    

	    
	</script>


</body>
</html>