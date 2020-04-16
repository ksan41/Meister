<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
        
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
        #order-info{
                        
            width:1000px;
            height:200px;
            border:1px solid rgb(76, 60, 60);
            background-color: rgb(76, 60, 60);
            margin-top:20px;
            color: white;
            
        }

        

        .bline {
             background-color: skyblue;
             height: 2px;
             border:0px;
             width: 300px;
             margin-left: 0;
             margin: 50px;
             margin-bottom: 12px;
         }

        /* .pagination {
            display: inline-block;
        } */
        .pagination a {
            color: black;
            padding: 5px 10px;
            text-decoration: none;
            transition: background-color .3s;
            border: 1px solid #ddd;
            margin: 0 2px;
            font-size:12px;
        }

        .pagination a.active {
            background-color: orange;
            color: white;
            border: 1px solid orange;
        }
        .pagination a:hover:not(.active) {background-color: #ddd;}

        #noticeList>tbody td{text-align: center;}
        #noticeList *{
            height:30px;
            font-size:12px;
            border-bottom:1px solid lightgray;
        }
        #noticeList{border-top:1px solid black;}
        #noticeList>thead th{
            font-size:14px;
            font-weight:750;
        }

        #noticeList>tbody :nth-child(1){cursor: pointer;}


      /* 중간버튼 스타일 */
      #btns{
          text-align: center;
      }
      .middle_btn{
                /* display: block; */
                height:40px;
                width:150px;
                margin: 0 auto;
                font-size: 15px;
                font-weight: bolder;
                color:white;
                background-color: rgb(76, 60, 60);
                border:0;
                border-radius: 5px;
                margin-left: 10px;
            }
        /* 중간버튼 스타일 */

        

        #middleTable td{
            margin-left: 10px;
        }
        
        /* 내용 테이블 */
        .aa{
            margin: auto;
            margin-left: 25px;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>

	<%@ include file="../../common_user/menubar.jsp"%>
	<%@ include file="../../common_user/menubarMenuIMG.jsp" %>
	
    <div class="outer">
        <!-- 서브메뉴 타이틀 -->
        <h1>나의 정보</h1>
        <br>
        <!-- 서브메뉴 우측 인덱스 -->
        <div id="index-area"><a href="">홈</a> &gt; <a href="">나의 정보</a> &gt; 정보수정</div>
        <div class="sub-menu-area">
            <!-- 현재 페이지는 orange 로 표시 -->
            <a href="">주문내역</a>
            <span style="color:lightgray; font-size: 17px;">|</span>
            <a href="">쿠폰함</a>
            <span style="color:lightgray; font-size: 17px;">|</span>
            <a href="" >1:1문의</a>
            <span style="color:lightgray; font-size: 17px;">|</span>
            <a href=""style="color:orange" >정보수정</a>
        </div>

    



        <!-- inner영역에 콘텐츠 작성 -->
        <div class="inner">
            
            <div id="order-info">
                
                <table style="font-size: 16px;" width="1000px" height="200px">
                    <tr>
                        <th width="495px" style="padding-left:30px;">
                            <p>
                                <b style="font-weight:bold; font-size: 1.5em; float: left; margin-left: 48px;">본인여부확인</b>
                                <hr class="bline">
                                <b style="font-size: 0.7em; color:gray; float: left; margin-left: 48px; margin-bottom: 45px;">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다.</b>
                            </p>
                        </th>
                        
                      
                    </tr>
                    
                </table>
                
            </div>

            <br> <br>
            <hr>

            

           <!--
           <div id="xo5">

           <form style="padding-left: 10px;">

            
            <label > 탈퇴사유  </label>
            <input id="reason1" type = "radio" name="group"> 
            <label for="reason1">관리자 답변 불만</label>
        
            <input id="reason2" type="radio" name="group">
            <label for="reason2">회사 서비스에 대한 불만</label>

            <input id="reason3" type="radio" name="group">
            <label for="reason3">시스템 성능 불만</label>

            

            
            <input id="reason4" type="radio" name="group" >
            <label for="reason4">사이트 정보 미흡</label>

            <input id="reason5" type="radio" name="group">
            <label for="reason5">광고 메일 수신</label>

            <input id="reason6" type="radio" name="group">
            <label for="reason6">개인정보 보호</label>

            

            <input id="reason7" type="radio" name="group">
            <label for="reason7">기타</label>




           </form>

        </div>
        -->
        <br>

        <table id="middleTable">

            <tr class="middleTable_tr">
               <th style="font-size: 20px; width: 80px;">탈퇴사유</td>
               <td style="width: 276px; padding-left: 77px;"><input id="reason1" type = "radio" name="group" style="vertical-align:text-bottom;">관리자 답변 불만</td>
               <td style="width: 276px;"><input id="reason2" type="radio" name="group"style="vertical-align:text-bottom;">회사 서비스에 대한 불만</td>
               <td style="width: 276px;"><input id="reason3" type="radio" name="group"style="vertical-align:text-bottom;">시스템 성능 불만</td>
            </tr>

            <tr class="middleTable_tr">
                <td></td>
                <td style="padding-left: 77px;"><input id="reason4" type="radio" name="group" style="vertical-align:text-bottom;" >사이트 정보 미흡</td>
                <td><input id="reason5" type="radio" name="group" style="vertical-align:text-bottom;" >광고 메일 수신</td>
                <td><input id="reason6" type="radio" name="group" style="vertical-align:text-bottom;">개인 정보 보호</td>

            </tr>

            <tr class="middleTable_tr">
                <td></td>
                <td style="padding-left: 77px;"><input id="reason7" type="radio" name="group"style="vertical-align:text-bottom;">기타</td>
                
            </tr>



            
        </table>

        <table>
            <tr>      
                <td valign="top" style="padding-top:3%; width: 80px; font-size: 20px; padding-left: 7px;"><b>내용</b></td>
                <!--  colspan="3" -->
                <td style="padding-top:3%; width: 920px; padding-right: 30px;">
                    
                    <textarea class="aa" name="" id="" cols="97" rows="30" style="margin-left: 83px;"></textarea>

                </td>

            </tr>
        </table>
        

        <div id="btns">
            <button style="background:white; color:black; border:1px solid darkgray" class="middle_btn" id="cbtn">취소</button>
            
            <button class="middle_btn" id="mbtn">수정</button>
        </div>
    </div>	
	
    <%@ include file="../../common_user/footer.jsp"%>
</body>
</html>