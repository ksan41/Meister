<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.meister.order.model.vo.*, com.meister.coupon.model.vo.*, com.meister.menu.model.vo.*, java.util.ArrayList"%>
<%
	Delivery dInfo = (Delivery)request.getAttribute("dInfo");
	Price basket = (Price)request.getAttribute("basket");
	
	String[] pizzaSize = basket.getPizzaSize().split(",");
	String[] pizzaNo = basket.getPizzaNo().split(",");
	String[] pizzaCount = basket.getPizzaCount().split(",");
	String[] doughNo = basket.getDoughNo().split(",");
	
	ArrayList<Coupon> cInfo = (ArrayList<Coupon>)request.getAttribute("cInfo");

	ArrayList<Pizza> pList = (ArrayList<Pizza>)request.getAttribute("pList");
	ArrayList<PizzaSize> sizeList = (ArrayList<PizzaSize>)request.getAttribute("sizeList");
	
	ArrayList<Side> sList = (ArrayList<Side>)request.getAttribute("sList");
	ArrayList<Etc> eList = (ArrayList<Etc>)request.getAttribute("eList");
	ArrayList<Dough> dList = (ArrayList<Dough>)request.getAttribute("dList");
	
	String pName = "";
	String pSize = "";
	int pCount = 0;
	int doughPrice = 0;
	int pPrice = 0;
	
	String sName = "";
	int sCount = 0;
	int sPrice = 0;
	
	String eName = "";
	int eCount = 0;
	int ePrice = 0;
	
	int basketPrice = 0;
	int discountPrice = 0;
	double dRate = 0;
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>orderPaymentForm</title>
        <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
        
        <%@ include file="../../common_user/menubar.jsp" %>
		<%@ include file="../../common_user/menubarMenuIMG.jsp" %>
		
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

        /* 서브메뉴 스타일 끝 */

        .step *{
            padding: 5px;

        }
        .step>a{
            font-size: 17px;
            color:black;
            font-weight: bolder;
        }

        #btn-area{height:70px;}
        #user-check{
            display: block;
            height:80%;
            width:70%;
            margin: 0 auto;
            font-size: 20px;
            font-weight: bolder;
            color:white;
            background-color: rgb(76, 60, 60);
            border:0;
            border-radius: 5px;
        }
        /* 표 스타일 */
        tr{
            height: 50px;
        }
        th{
            width: 200px;
        }
        input{
            border-radius: 5px;
            height: 25px;
        }
        /*표스타일끝*/
        .big_btn{
            display: block;
            height:50px;
            width:280px;
            margin: 0 auto;
            font-size: 20px;
            font-weight: bolder;
            color:white;
            background-color: orange;
            border:0;
            border-radius: 5px;
        }
        /* 매장명 span태그 스타일 */
        #branchName{
            background-color: rgb(185, 184, 184);
            margin: 10px;
            padding: 5px;
            border-radius: 5px;
        }
        #branchPhone{
            margin-left: 20px;
        }
    </style>
</head>
<body>
    <div class="outer">
        <!-- 서브메뉴 타이틀 -->
        <h1 style="font-weight:bold; color:rgb(76, 60, 60);">결제하기</h1>
        <br>
        <!-- 서브메뉴 우측 인덱스 -->
        <div id="index-area"><a href="">홈</a> &gt; 장바구니 &gt; 결제하기</div>
        <br><hr>
        <br>
        <!-- <div class="sub-menu-area"> -->
        <!-- inner영역에 콘텐츠 작성 -->
        <div class="inner" style="font-size: 20px;">
            
            <div style="width:1000px; height:50px; color: white; padding-left:50px; padding-top: 13px; background-color:rgb(76, 60, 60);">
                수령인정보
            </div>

            <div style="width:1000px; height:auto; padding-left: 50px; padding-bottom: 20px; ">
                <br>
                <div style="font-size:18px; height:40px; color:gray;"><%=dInfo.getMemPoCode()%> <%=dInfo.getMemAddress1()%> <%=dInfo.getMemAddress2()%></div>
                <span id="branchName">
                	<%=dInfo.getBranchName()%>
                </span>
                <span id="branchPhone">
                	<%=dInfo.getBranchPhone()%>
                </span>
                <br><br><hr style="width: 1000px;">
                
                <table style="text-align: left;">
                    <tr>
                        <th>이름</th>
                        <td>
                            <input type="text" style="width: 100%;">
                        </td>
                        <td style="colspan:3;"></td>
                    </tr>
                    <tr>
                        <th>연락처</th>
                        <td>
                            <select id="txtMobile1" style="width: 60px; height: 30px; border-radius: 5px;">
                                <option value="010">010</option>
                                <option value="016">016</option>
                                <option value="017">017</option>
                                <option value="019">019</option>
                                <option value="011">011</option>
                            </select>
                            
                            &nbsp;&nbsp;-&nbsp;&nbsp;
                            <input type="tel" size="6">
                            &nbsp;&nbsp;-&nbsp;&nbsp;
                            <input type="tel" size="6">
                        </td>
                    </tr>
                    <tr>
                        <th>요청사항</th>
                        <td>
                            <form>
                                <input type="text" name="requirements" list="requirements" style="width: 100%;">
                                <datalist id="requirements">
                                    <option value="nopickle">피클은 빼주세요</option>
                                    <option value="atthedoor">문앞에 놓아주세요</option>
                                </datalist>
                            </form>
                        </td>
                    </tr>
                </table>
            </div>
            <div style="background-color:rgb(76, 60, 60); width:1000px; height:50px; color: white; padding-left:50px; padding-top: 13px;">
                주문내역
            </div>
            <div style="width: 1000px; height: auto; padding-left: 50px;">
                <br>
                <h4 style="color:rgb(76, 60, 60); line-height:40px;">
		           	<% for(int i=0; i<pizzaSize.length; i++){ // 주문한 피자 내용 %>
						<% for(int j=0; j<pList.size(); j++){ %>
							<% if(pList.get(j).getPizzaNo() == Integer.parseInt(pizzaNo[i])){ %>
								<% pName = pList.get(j).getPizzaName(); %>
							<% } %>
						<% } %>
						<% for(int j=0; j<sizeList.size(); j++){ %>
							<% if(sizeList.get(j).getSizeNo() == Integer.parseInt(pizzaSize[i])){ %>
								<% pSize = sizeList.get(j).getPizzaSize(); %>
								<% pPrice = sizeList.get(j).getPizzaPrice(); %>
							<% } %>
						<% } %>
						<% for(int j=0; j<dList.size(); j++){ %>
							<% if(dList.get(j).getDoughNo() == Integer.parseInt(doughNo[i])){ %>
								<% if(dList.get(j).getDoughAddPrice()+"" != null) {%>
									<% doughPrice = dList.get(j).getDoughAddPrice(); %>
								<% } %>
							<% } %>
						<% } %>
						<% pCount = Integer.parseInt(pizzaCount[i]); %>
						<% pPrice = (pPrice + doughPrice) * pCount; %>
						
						<%=pName%> <%=pSize%> x <%=pCount%> / <%=pPrice %>원<br>
						<%basketPrice += pPrice; %>
					<% } %>
					
					<% if(basket.getSideNo() != null && basket.getSideCount() != null) { // 주문한 사이드 내용 %>
						<% String[] sideNo = basket.getSideNo().split(","); %>
						<% String[] sideCount = basket.getSideCount().split(","); %>
						
						<% for(int i=0; i<sideNo.length; i++) { %>
							<% for(int j=0; j<sList.size(); j++){ %>
								<% if(sList.get(j).getSideNo() == Integer.parseInt(sideNo[i])){ %>
									<% sName = sList.get(j).getSideName(); %>
									<% sPrice = sList.get(j).getSidePrice(); %>
								<% } %>
							<% } %>
							
							<% sCount = Integer.parseInt(sideCount[i]); %>
							<% sPrice = sPrice * sCount; %>
							
							<%=sName %> x <%=sCount %> / <%=sPrice %>원<br>
							<%basketPrice += sPrice; %>
						<% } %>
					<% } %>
					
					<% if(basket.getEtcNo() != null && basket.getEtcCount() != null) { // 주문한 기타상품 내용 %>
						<% String[] etcNo = basket.getEtcNo().split(","); %>
						<% String[] etcCount = basket.getEtcCount().split(","); %>
						
						<% for(int i=0; i<etcNo.length; i++) { %>
							<% for(int j=0; j<eList.size(); j++){ %>
								<% if(eList.get(j).getEtcNo() == Integer.parseInt(etcNo[i])){ %>
									<% eName = eList.get(j).getEtcName(); %>
									<% ePrice = eList.get(j).getEtcPrice(); %>
								<% } %>
							<% } %>
							
							<% eCount = Integer.parseInt(etcCount[i]); %>
							<% ePrice = ePrice * eCount; %>
							
							<%=eName %> x <%=eCount %> / <%=ePrice %>원<br>
							<%basketPrice += ePrice; %>									
						<% } %>
					<% } %>
                </h4>
                <br>
            </div>
            <div style="background-color:rgb(76, 60, 60); width:1000px; height:50px; color: white; padding-left:50px; padding-top: 13px;">
                할인적용
            </div>
            <div style="height:15px;"></div>
            <h5 style="font-size: smaller; color: rgb(230, 145, 19);">* 모든 할인은 중복적용 불가합니다.</h5>
            <div style="width:1000px; height:auto; padding-left: 50px; padding-bottom: 20px;">
                <table>
                    <tr>
                        <td></td>
                    </tr>
                    	<% if(dInfo.getDeliveryMethod().equals("D")){ //배달 %>
	                    <tr>
	                        <th>보유쿠폰</th>
	                        <td style="width: 400px;">
	                            <select name="coupon" style="width:300px; height: 35px; border-radius: 5px;">
	                            	<% if(cInfo != null){ %>
	                            		<% for(int i=0; i<cInfo.size(); i++){ %>
	                            			<option value="coupon1"><%=cInfo.get(i).getCouponName()%></option>
	                            		<% } %>
	                            	<% }else { %>
	                            		<option>보유중인 쿠폰이 없습니다.</option>
	                            	<% } %>
	                            </select>
	                        </td>
	                    </tr>
                    	
                    	<% }else { // 포장 %>
	                    <tr>
	                        <th>방문포장</th>
	                        <td>
	                            <input type="radio" style="vertical-align:middle">&nbsp; 40% 할인 (타쿠폰과 중복적용 불가)
	                        </td>
	                    </tr>
                    	
                    	<% } %>
                </table>
            </div>
            <br>
            <!-- 
            <div style="background-color:rgb(76, 60, 60); width:1000px; height:50px; color: white; padding-left:50px; padding-top: 13px;">결제수단 선택</div>
            <div style="width: 1000px; height: 140px; padding-left: 50px;">
                <br>
                <input type="radio" style="vertical-align:middle">&nbsp;카드결제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" style="vertical-align:middle">&nbsp;핸드폰결제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" style="vertical-align:middle">&nbsp;카카오페이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" style="vertical-align:middle">&nbsp;무통장입금<br>
                <hr><input type="checkbox" style="vertical-align:middle; width:25px; margin-right:5px;">기본 결제 수단으로 등록
            </div>
             -->
            <div style="background-color:rgb(76, 60, 60); width:1000px; height:50px; color: white; padding-left:50px; padding-top: 13px;">
                최종결제금액
            </div>
            <div style="width: 1000px; height: 300px; padding-left: 50px; text-align: center;">
                <br><br>
                <table style="width: 100%;">
                    <tr>
                        <td>총 상품 금액</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>총 할인 금액</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>총 할인 금액</td>
                    </tr>
                    <% if(cInfo != null){ %>
						<% dRate = cInfo.getCouponDiscount() * 0.01; %>
					<% } %>
					<%discountPrice = ((int)(basketPrice * dRate)); %>
                    <tr style="font-weight: bold;">
                        <td><%=basketPrice %> 원</td>
                        <td>-</td>
                        <td style="color: red;"><%=discountPrice %> 원</td>
                        <td>-</td>
                        <td><%=basketPrice-discountPrice%> 원</td>
                    </tr>
                </table>
            </div>

            <button class="big_btn" id="#">결제하기</button>
        </div>
    </div>
    <%@ include file="../../common_user/footer.jsp"%>
    
</body>
</html>