<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- 모달 부트스트랩-->
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<!-- 모달 부트스트랩 -->
	    
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
	
	
	
	
	    #middleTable td{
	        margin-left: 10px;
	    }
	    
	    /* 내용 테이블 */
	
	    /* input{ border-radius: 5px; width: 150px;} */
	    th {height: 50px; width: 200px;}
	    table{
	        font-size: 18px;
	        margin: auto;
	    }
	    #doubleCheck{
	        margin-left: 20px;
	    }
	
	   
	
	     /* 작은버튼 스타일 */
	    .small_btn{
	        display: block;
	        height:20px;
	        width:80px;
	        margin: 0 auto;
	        font-size: 10px;
	        font-weight: bolder;
	        color:white;
	        background-color: rgb(76, 60, 60);
	        border:0;
	        border-radius: 5px;
	    }
	/* 작은버튼 스타일 */
	    
	    
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
	
	      /* 모달 스타일 시작*/
	      .modal-body{
	        margin:auto;
	    }
	    /* 모달 스타일 끝*/
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



                <table style="text-align: left;">
                    <tr>
                        <th>이름</th>
                        
                        <td colspan="2" style="width: 550px;">
                            <input type="text">
                        </td>
                    </tr>
                    <tr>
                        <th>아이디</th>
                        <td>
                           mesisterpizza
                        </td>
                        
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td>
                            <button class="small_btn" id="bb" style="margin: 1px;" onclick="show();">비밀번호변경</button>
                            <!--  -->
                            
                            <div id="aa" style="display: none;">
                                <table>
                                    <tr>
                                        <td style="height: 35px;">현재비밀번호</td>
                                        <td><input type="password" size="35"></td>
                                    </tr>
                                    <tr>
                                        <td style="height: 35px;">새 비밀번호</td>
                                        <td><input type="password" size="35" placeholder="8~16자 영문대소문자,숫자,특수문자 사용가능"></td>
                                    </tr>
                                    <tr>
                                        <td style="height: 35px;">새 비밀번호 확인</td>
                                        <td><input type="password" size="35" placeholder="8~16자 영문대소문자,숫자,특수문자 사용가능"></td>
                                        <td style="padding-left: 15px;"><button class="small_btn" style="margin: 1px;">수정하기</button></td>
                                    </tr>
                                </table>
                            </div>

                        </td>

                        
                           
                      

                        

                        

                       

                     
                        

                       
                       
                       
                    </tr>

                    <script>
                        function show(){
                            var aa = document.getElementById("aa");
                            
                            
                            if(aa.style.display=='none'){
                                aa.style.display = 'block'; 
                            }else{
                                aa.style.display = 'none';
                            }
                            
                            
                        }
                    </script>

                    
                    
                    <tr>
                        <th>생년월일</th>
                        <td colspan="2">
                            <input type="date" name="dateIn">
                        </td>
                    </tr>
                    
                    <tr>
                        <th>휴대전화</th>
                        <td colspan="2">

                            <select id="txtMobile1">
                                
                                <option value="010">010</option>
                                <option value="016">016</option>
                                <option value="017">017</option>
                                <option value="019">019</option>
                                <option value="011">011</option>
                            </select>
                            -
                            <input type="text" id="pel1" size="6" onkeypress="onlyNumber();"/>
                            -
                            <input type="text" id="pel2" size="6" />
                       
                        </td>

                        <!-- <td> -->
                            
                            <!-- <input type="text" id="pel2" size="4" /> -->
                        
                        <!-- </td> -->

          
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td colspan="2">
                            <input type="email">
                        </td>
                    </tr>

                    <tr>

                        <th>인증번호 발송</th>
                        <td>
                            <input type="radio">이메일 <button class="small_btn" style="display: inline-block;" id="#">인증번호 발송</button>
                        </td>
                  

                    </tr>
                    
                    <tr>
                        <td>
                        <th colspan="5px" style="font-size: 0.7em; color:gray; width: 300px; vertical-align: top;"> <label>- 휴대전화 번호 및 이메일 주소를 변경하셨을 경우에 한하여 인증절차를 거쳐야 정보수정이 완료됩니다.</label></th>

                    </tr>


                    <tr>
                        <th>인증번호 입력</th>
                        <td><input type="text"> <button class="small_btn" style="display: inline-block;" id="#">인증하기</button></td> 
                        
                    </tr>


                </table>
                <br><br><br><br>



    
         

            <div id="btns">
                <button style="background:white; color:black; border:1px solid darkgray" class="middle_btn" id="cbtn">취소</button>
                
                <button class="middle_btn" id="mbtn">수정</button>
            </div>

            



            <table>

                <tr>

                    <th style="font-size: 0.7em; color:gray; width: 330px; vertical-align: top; padding-top: 20px; padding-left: 15px;">

                        도미노피자를 더 이상 이용하지 않는다면

                        <a href=""  data-toggle="modal" data-target="#myModal" style="color: black;">
                            <span style="text-decoration: underline;">회원탈퇴 바로가기></span>
                        </a>

                    </th>

                </tr>

            </table>

            
          
            

            </div>

             <!-- 모달 시작 -->
  <div class="modal fade" id="myModal"> <!-- modal별 id 변경해주세요-->
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title" style="margin:auto;padding:0;">본인여부 확인 </h4>
          <button type="button" class="close" data-dismiss="modal" style="margin:0;padding:0;">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
            탈퇴처리를 위해 본인여부를 다시 한 번 확인해 주세요.
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer" style="margin:auto;">
            <!-- 하단버튼 영역-->
            <table>
                <tr>
                    <td>아이디</td>
                    <td style="padding: 10px;">meisterpizza</td>
                </tr>

                <tr>
                    <td>비밀번호</td>
                    <td style="padding: 10px;"><input type="text"></td>
                    <td>
                        
                        <button type="button" class="btn btn-danger" data-dismiss="modal"
                        style="width:100px; height:30px; padding: 1px;">확인</button>
                    
                    </td>
                </tr>


       </table>
        </div>
        
      </div>
    </div>
  </div>
   <!-- 모달 끝 -->	
	
    <%@ include file="../../common_user/footer.jsp"%>
</body>
</html>