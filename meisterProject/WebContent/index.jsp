<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,
com.meister.event.model.service.EventService,
com.meister.event.model.vo.Event,
com.meister.member.model.vo.*"%>
<%
ArrayList<Event> list = new EventService().selectList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Meister Pizza</title>
<style>
	.customer_feedback_area{
		height:350px;
	}


	/* 배달/포장주문버튼 */
        .orderBtns{
            margin-top: 50px;
            width:950px;
            height:200px;
            margin-left:auto;
            margin-right: auto;
            padding:10px;
        }

        .orderBtns img{
            width:150px;
        }

        .orderBtns>div{
            padding:10px;
            margin-left: 50px;
            margin-right: 10px;
            float:left;
            height: 100%;
            width:40%;
            background-color: /* lightgray; */
            border-radius: 20px;
            color:#5A4847;
            font-size:32px;
            font-family: 'nanumsquare';
            font-weight: bolder;
        }
        .orderBtns>div:hover{
        	cursor:pointer;
        	opacity:70%;
        }
        /* 배달/포장주문버튼 */
        
        #deliveryBtn{color:#6C98BF;}
        #takeOutBtn{color:#D18551;}
        
        .single_customer{width:500px;}
        
</style>
</head>
<body>
	 <%@ include file="views/common_user/menubar.jsp" %>
	 <%@ include file="views/common_user/menubarIndexIMG.jsp"%>

    <!-- 배달/포장주문 버튼 -->
    <div class="orderBtns">
        <div id="deliveryBtn"><img src="<%=contextPath %>/resources/siteImgs/pageImg/deliveryPic1.png" alt="">배달주문 ></div>
        <div id="takeOutBtn" onclick="orderTakeOut();"><img src="<%=contextPath %>/resources/siteImgs/pageImg/takeOutPic2.png" alt="">포장주문 ></div>
    </div>
    <!-- 배달/포장주문 버튼 -->



    <div class="customer_feedback_area">
        <div class="container">
            <div class="row justify-content-center mb-50">
                <div class="col-xl-9">
                    <div class="section_title text-center">
                        
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-12">
                    <div class="customer_active owl-carousel">
                    	<% for(Event event : list) { %>
                        <div class="single_customer d-flex">
                            <div class="thumb">
                            	<a href="<%= contextPath %>/eDetail.ev?bno=<%=event.getEventNo() %>">
                                <img src="<%= contextPath %>/resources/siteImgs/eventImg/<%=event.getEventImage1()%>" alt="">
                                </a>
                            </div>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
	<%@ include file="views/common_user/footer.jsp"%>
	
	<script>
		$(document).on("click","#deliveryBtn",function(){
			if(<%=loginUser%> != null){
				console.log("지점1");
				//location.href="<%=contextPath%>/orderDelivery.or";
			}else{
				console.log("지점2");
				//location.href="<%=contextPath%>/showLoginPage.me";
			}
		});
	
	
		
		function orderTakeOut(){
			location.href="<%=contextPath%>/orderTakeOut.or";
		}
	</script>
	
</body>
</html>