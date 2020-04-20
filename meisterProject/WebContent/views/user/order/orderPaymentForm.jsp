<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <p >사용자입력주소(불러오기)</p>
                <span id="branchName">매장명</span><span id="branchPhone">02-2222-2222</span>
                <br><br><hr style="width: 1000px;">
                <table style="text-align: left;">

                    <tr>
                        <th>이름</th>
                        <td>
                            <input type="text" style="width: 100%;">
                        </td>
                        <td style="colspan:3;">&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" style="vertical-align:middle; width:40px;" >주문자와 동일</td>
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
            <div style="width: 1000px; height: 250px; padding-left: 50px;">
                <br>
                <h5 style="color:rgb(76, 60, 60); font-weight:bold;">30 치즈 & 뉴욕 스트립 스테이크 슈퍼시드 함유 도우 L X 1</h5>
                <hr>
                <h5 style="color:rgb(76, 60, 60); font-weight:bold;">30 치즈 & 뉴욕 스트립 스테이크 (슈퍼시드 함유 도우) L X 1 / 36,900원</h5>
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
                    <tr>
                        <th>보유쿠폰</th>
                        <td style="width: 400px;">
                            <select name="coupon" style="width:300px; height: 35px; border-radius: 5px;">
                                <option value="coupon1" selected>고객감사 피자 30% 할인쿠폰</option>
                                <option value="coupon1">고객감사 사이드디시 무료쿠폰</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>방문포장</th>
                        <td>
                            <input type="radio" style="vertical-align:middle">&nbsp; 40% 할인 (타쿠폰과 중복적용 불가)
                        </td>
                    </tr>
                </table>
            </div>
            
            <div style="background-color:rgb(76, 60, 60); width:1000px; height:50px; color: white; padding-left:50px; padding-top: 13px;">결제수단 선택</div>
            <div style="width: 1000px; height: 140px; padding-left: 50px;">
                <br>
                <input type="radio" style="vertical-align:middle">&nbsp;카드결제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" style="vertical-align:middle">&nbsp;핸드폰결제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" style="vertical-align:middle">&nbsp;카카오페이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" style="vertical-align:middle">&nbsp;무통장입금<br>
                <hr><input type="checkbox" style="vertical-align:middle; width:25px; margin-right:5px;">기본 결제 수단으로 등록
            </div>
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
                    <tr style="font-weight: bold;">
                        <td>36,900원</td>
                        <td>-</td>
                        <td style="color: red;">6,900원</td>
                        <td>-</td>
                        <td>30,000원</td>
                    </tr>
                </table>
            </div>

            <button class="big_btn" id="#">결제하기</button>
        </div>
    </div>
    <%@ include file="../../common_user/footer.jsp"%>
    
</body>
</html>