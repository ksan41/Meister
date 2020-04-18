<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
        <!-- 장바구니아이콘 -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!-- 장바구니 아이콘 끝 -->


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

        #orderB1 th:nth-child(1){
            text-align: left;
            font-size: large;
            padding:10px;
        }

        #orderB1{
            width:1000px;
            height:100px;
        }

        .small_btn{
            display: block;
            height:25px;
            width:60px;
            margin: 0 auto;
            font-size: 10px;
            font-weight: bolder;
            color:white;
            background-color: darkgray;
            border:0;
            border-radius: 5px;
        }

        #mbtn{
            height:30px;
            width:70px;
            font-size: 13px;
            font-weight: bolder;
            color:white;
            border:0;
            border-radius: 5px;
        }

        #orderB2{
            width:1000px;
            text-align: center;
        }


        #orderB2 th{
            text-align: center;
            font-size: large;
            padding:10px;
        }



        /* 중간버튼 스타일 */
        .middle_btn{
                display: block;
                height:40px;
                width:150px;
                margin: 0 auto;
                font-size: 15px;
                font-weight: bolder;
                color:white;
                background-color: rgb(76, 60, 60);
                border:0;
                border-radius: 5px;
            }
        /* 중간버튼 스타일 */

        #hr1{
            background-color: black;
            height: 2px;
            border:0px;
        }

        #btns{
            display: flex;
        }

        #cbtn{margin-right: 3%; box-sizing:border-box;}
        #obtn{margin-left: 3%; box-sizing:border-box;} 

        #orderB3{
            width:1000px;
            text-align: center;
        }

        



    </style>
</head>
<body onload="init();">
	<%@ include file="../../common_user/menubar.jsp" %>
	<%@ include file="../../common_user/menubarIndexIMG.jsp" %>
    <div class="outer">
        <!-- 서브메뉴 타이틀 -->
        <h1 style="font-weight:bold; color:rgb(76, 60, 60);">장바구니</h1>
        <br>
        <!-- 서브메뉴 우측 인덱스 -->
        <div id="index-area"><a href="">홈 </a> &gt; 장바구니</div>
        <hr>



        <!-- inner영역에 콘텐츠 작성 -->
        <div class="inner">
            <table id="orderB1" border="0px;">
                <tr>
                    <th colspan="2" style="color:white; background-color: rgb(76, 60, 60);">배달주문</th>
                </tr>
                <tr style="height:15px;"></tr>
                <tr>
                    <th height="50px;" style="color:black">주소주소주소주소</th>
                    <!-- <th rowspan="2"><button class="small_btn" id="#">수정</button></th> -->
                </tr>
                <tr>
                    <th style="color:gray;"><button style="background:white; color:darkgray; border:1px solid darkgray" id="mbtn">역삼점</button>&nbsp;&nbsp;&nbsp; 02-1111-1111</th>
                </tr>
                
            </table>
            <br>
            <hr id="hr1">

            <table id="orderB2" border="0px;" align="center">
                <tr>
                    <th width="90%" colspan="5" style="text-align:left; color:white; background-color: rgb(76, 60, 60);">주문내역</th>
                    <td width="10%" style=" color:white; background-color: rgb(76, 60, 60);"><button class="small_btn" id="#" style="background: rgb(243, 156, 18);">전체 삭제</button></td>
                </tr>
                <tr style="border-bottom:1px solid;">
                    <th></th>
                    <th>상품정보</th>
                    <th>추가토핑</th>
                    <th colspan="2">수량 / 금액</th>
                    <th></th>
                </tr>
                <tr style="border-bottom:1px solid;">
                    <th>피자이미지</th>
                    <th>
                        <p>
                            30치즈&뉴욕 스트립 스테이크 더블치즈엣지<br>
                            오리지널/L <br>
                            39,900원
                        </p>
                    </th>
                    <th></th>
                    <th colspan="2">
                        <form name="form" method="get">
                            <input type=hidden name="sell_price" value="39900">
                            <input type="text" name="amount" value="1" size="3" onchange="change();">
                            <input type="button" value=" + " onclick="add();"><input type="button" value=" - " onclick="del();">
                            <input type="text" name="sum" size="11" readonly>원
                        </form>
                    </th>
                    <th><button class="small_btn" onclick="deleteLine(this);">삭제</button></th>
                </tr>

                <!-- <tr style="border-bottom:1px solid;">
                    <th>피자이미지</th>
                    <th>
                        <p>
                            30치즈&뉴욕 스트립 스테이크 더블치즈엣지<br>
                            오리지널/L <br>
                            39,900원
                        </p>
                    </th>
                    <th></th>
                    <th colspan="2">
                        <form name="form2" method="get">
                            <input type=hidden name="sell_price" value="39900">
                            <input type="text" name="amount" value="1" size="3" onchange="change();">
                            <input type="button" value=" + " onclick="add();"><input type="button" value=" - " onclick="del();">
                            <input type="text" name="sum" size="11" readonly>원
                        </form>
                    </th>
                    <th></th>
                </tr> -->
              
                <tr style="border-bottom:1px solid;">
                    <th>사이드이미지</th>
                    <th>
                        <p>
                            한돈 빠에야<br>
                            8,800원
                        </p>
                    </th>
                    <th></th>
                    <th colspan="2">
                        <form name="form2" method="get">
                            <input type=hidden name="sell_price" value="39900">
                            <input type="text" name="amount" value="1" size="3" onchange="change();">
                            <input type="button" value=" + " onclick="add();"><input type="button" value=" - " onclick="del();">
                            <input type="text" name="sum" size="11" readonly>원
                        </form>
                    </th>
                    <th><button class="small_btn" onclick="deleteLine(this);">삭제</button></th>
                </tr>

                <tr style="border-bottom:1px solid;">
                    <th>기타이미지</th>
                    <th>
                        <p>
                            코카콜라 1.25L<br>
                            2,000원
                        </p>
                    </th>
                    <th></th>
                    <th colspan="2">
                        <form name="form3" method="get">
                            <input type=hidden name="sell_price" value="39900">
                            <input type="text" name="amount" value="1" size="3" onchange="change();">
                            <input type="button" value=" + " onclick="add();"><input type="button" value=" - " onclick="del();">
                            <input type="text" name="sum" size="11" readonly>원
                        </form>
                    </th>
                    <th><button class="small_btn" onclick="deleteLine(this);">삭제</button></th>
                </tr>

               
            </table>
            <hr id="hr1">

            <table id="orderB3" border="0px">
                <tr>
                    <th>
                        <p style="text-align:left;">
                        * 할인 적용은 다음 단계에서 가능합니다.<br>
                        * 피클&소스 기본 제공 안내 <br>
                        - L : 피클 L(120g) 1개 / 핫소스 2개 / 갈릭디핑소스 15g 2개, M : 피클 M (75g) 1개 / 핫소스 1개 / 갈릭디핑소스 15g 1개<br>
                        - 씬 도우, 더블크러스트 이베리코, 치즈케이크 블랙타이거 피자는 갈릭디핑소스 미 제공<br>
                        - 메뉴 > 음료&기타 추가 구매 가능
                        </p>
                    </th>
                    <th>
                        총금액 <b style="font-size: 3.0em;">72,300</b>
                    </th>
                </tr>
            </table>

            <hr>
            <br><br>
            <div id="btns"> 
                <button style="background:white; color:black; border:1px solid darkgray" class="middle_btn" id="cbtn">+ 메뉴 추가하기</button>
                <br>
                <button style="background:red; color:white; border:1px solid darkgray" class="middle_btn" id="obtn">주문하기</button>
            </div>
            

            
        </div>


    </div>
	
	<%@ include file="../../common_user/footer.jsp"%>
	
    <script language="JavaScript">
        
        var sell_price;
        var amount;
        
        function init () {
            sell_price = document.form.sell_price.value;
            amount = document.form.amount.value;
            document.form.sum.value = sell_price;
            change();
        }
        
        function add () {
            hm = document.form.amount;
            sum = document.form.sum;
            hm.value ++ ;
        
            sum.value = parseInt(hm.value) * sell_price;
        }
        
        function del () {
            hm = document.form.amount;
            sum = document.form.sum;
                if (hm.value > 1) {
                    hm.value -- ;
                    sum.value = parseInt(hm.value) * sell_price;
                }
        }
        
        function change () {
            hm = document.form.amount;
            sum = document.form.sum;
        
                if (hm.value < 0) {
                    hm.value = 0;
                }
            sum.value = parseInt(hm.value) * sell_price;
        } 

        
        </script>


<!-- <form name="form" method="get">
    수량 : <input type=hidden name="sell_price" value="5500">
<input type="text" name="amount" value="1" size="3" onchange="change();">
<input type="button" value=" + " onclick="add();"><input type="button" value=" - " onclick="del();"><br>

금액 : <input type="text" name="sum" size="11" readonly>원
</form> -->

    <script type="text/javascript">
        function deleteLine(obj) {
            var tr = $(obj).parent().parent();
        
            //라인 삭제
            tr.remove();
        }
    </script>
     

    
    




</body>
</html>