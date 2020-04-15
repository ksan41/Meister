<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* 배달/포장주문버튼 */
        .orderBtns{
            margin-top: 50px;
            width:750px;
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
            margin-left: 20px;
            margin-right: 10px;
            float:left;
            height: 100%;
            width:45%;
            background-color: lightgray;
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
</style>
</head>
<body>
	 <%@ include file="views/common_user/menubar.jsp" %>
	 <%@ include file="views/common_user/menubarIndexIMG.jsp"%>

    <!-- 배달/포장주문 버튼 -->
    <div class="orderBtns">
        <div id="deliveryBtn"><img src="<%=contextPath %>/resources/siteImgs/pageImg/deliveryPic.png" alt="">배달주문</div>
        <div id="takeOutBtn"><img src="<%=contextPath %>/resources/siteImgs/pageImg/takeOutPic.png" alt="">포장주문</div>
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
                        <div class="single_customer d-flex">
                            <div class="thumb">
                                <img src="views/common_user/img/testmonial/event1.png" alt="">
                            </div>
                        </div>
                        <div class="single_customer d-flex">
                            <div class="thumb">
                                <img src="views/common_user/img/testmonial/event1.png" alt="">
                            </div>
                        </div>
                        <div class="single_customer d-flex">
                            <div class="thumb">
                                <img src="views/common_user/img/testmonial/event1.png" alt="">
                            </div>
                        </div>
                        <div class="single_customer d-flex">
                            <div class="thumb">
                                <img src="views/common_user/img/testmonial/event1.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<%@ include file="views/common_user/footer.jsp"%>
</body>
</html>