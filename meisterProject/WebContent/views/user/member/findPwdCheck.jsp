<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <link rel="stylesheet" href="bootstrap.css">

    <%@ include file="../../common_user/menubar.jsp"%>
	<%@ include file="../../common_user/menubarMenuIMG.jsp" %>
	
    
    <!-- 모달 부트스트랩-->
    <link rel="stylesheet" type="text/css" href="<%=contextPath %>/resources/css/bootstrap.css">        
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    
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



    #account-check-area{
        margin: auto;
        margin-top: 30px;
        /* border:1px solid red; */
        width:400px;
        height:400px;
    }

    #account-check-area>div{
        width:100%;
        /* border:1px solid red; */
    }

    #img-area{height: 75%;}
    #img-area>img{
        display: block;
        margin: 0 auto;
        padding-top: 50px;
    }

    #btn-area{height:70px;}       


    #text-area{
        height:10%;
        text-align: center;
        color:gray
    }
    /* 큰버튼 스타일 */
    .big_btn{
        display: block;
        height:50px;
        width:280px;
        margin: 0 auto;
        font-size: 20px;
        font-weight: bolder;
        color:white;
        background-color: rgb(76, 60, 60);
        border:0;
        border-radius: 5px;
    }
    /* 큰버튼 스타일 */
    
    /* 모달 스타일 시작*/
    .modal-body{
        margin:auto;
    }  
    /* 모달 스타일 끝*/
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
    th{
        height: 50px;
        width: 100px;
    }
    td input{
        border-radius: 5px;
    }
    </style>


</head>
<body>

 <div class="outer">
        <!-- 서브메뉴 타이틀 -->
        <h1>아이디/비밀번호 찾기</h1>
        <br>
        <!-- 서브메뉴 우측 인덱스 -->
        <div id="index-area"><a href="">홈</a> &gt; 아이디/비밀번호 찾기</div>
        <div class="sub-menu-area">
            <!-- 현재 페이지는 orange 로 표시 -->
            <a href="<%=contextPath%>/findId.me">아이디찾기</a>
            <span style="color:lightgray; font-size: 17px;">|</span>
            <a href="" style="color:orange">비밀번호찾기</a>
        </div>
        <hr>

        <!-- inner영역에 콘텐츠 작성 -->
        <div class="inner">
            <div id="account-check-area">
            	<div id="img-area">
                    <img width="200px" src="<%=contextPath%>/resources/siteImgs/pageImg/pwd.png">
                </div>
                <div id="btn-area">
                    <!-- 다른 요소에 모달 적용하고 싶으면, 속성에 data-toggle="modal" ,  data-target="#myModal" 타겟명은 따로 지정 -->
                    <button id="findId" class="big_btn" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                        <!-- modal별 id 변경해주세요-->
                        회원정보 인증
                    </button>
                </div>

                <!-- 모달 시작 -->
                <div class="modal fade" id="myModal"> <!-- modal별 id 변경해주세요-->
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title" style="margin:auto;padding:0;">회원정보인증</h4>
                                <button type="button" class="close" data-dismiss="modal" style="margin:0;padding:0;">&times;</button>
                            </div>


							
                            <!-- Modal body -->
                            <div class="modal-body">
                            <form class="form-xorud" method="post" action="<%=contextPath%>/findPwd.me">
                                <table style="text-align: left;">
                                    <tr>
                                        <th>아이디</th>
                                        <td colspan="2">
                                            <input class="text-area" type="text" name="memberId" id="memberId" style="width: 100%;">
                                        </td>
                                    </tr>
                                 
                                    <tr>
                                        <th>이메일</th>
                                        <td colspan="2">
                                            <input class="text-area" type="email" name="email" id="email">
                                           
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <th></th>
                                        <td>
                                            <button type="button" class="middle_btn" id="xorud_send" style="width: 100%;">임시비밀번호발송</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th></th>
                                        <td>
                                            <input type="text"  id="eamailAnswer" style="width: 100%;" placeholder="임시비밀번호를 입력하세요">
                                        </td>
                                    </tr>
                                </table>
                            </div>

                            <!-- Modal footer -->
                            <div class="modal-footer" style="margin:auto;">
                                <!-- 하단버튼 영역-->
                                <button type="button" class="btn btn-danger" data-dismiss="modal" id="emailComplete"
                                style="width:200px; height:50px; background-color: orange; border-color: orange;">비밀번호 변경</button>
                            </div>
                            
                            </form>
                            
                        </div>
                    </div>
                </div>
                <!-- 모달 끝 -->


                <div id="text-area">
                    - 당사는 고객의 주민등록 번호를 저장하지 않습니다.
                </div>
            </div>
        </div>
    </div>
    
    
    
    
    <!-- 비밀번호 인증 스크립트 -->
	
	
		
	
	<script>
					
	 
      /* (이메일) 인증번호 발송 버튼 클릭시 */
      $("#xorud_send").click(function(){
        var email = document.getElementById("email"); // 이메일
        var memberId = document.getElementById("memberId"); // 아이디
        randoumkey='';
        // 6) 이메일 유효성검사
        //mail이 입력되었는지 확인하기
         var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
           if (!emailRegExp.test(email.value)) {
               alert("이메일 형식이 올바르지 않습니다!");
               form.email.value = "";
               form.email.focus();
               return false;
            }
           
       $.ajax({
          url:"MailPwd",
          data:{Email:email.value, memberId:memberId.value},
          success:function(data){
             alert("인증번호가 발송되었습니다.");
             console.log(data);
             randomKey = data;
          },error:function(){
             alert("이메일발송실패");
          }
       })    

      });   
      
      
      $(function(){
    	 $("#emailComplete"). click(function(){
    		 
    		 //console.log(randomKey);
    		 if($("#eamailAnswer").val()==randomKey){
    			 location.href="views/user/member/findPwdSuccess.jsp";
    			 
    		 }else{
    			 alert("이메일전송을 다시해주세요.!");
    		 }
    		 
    	 });
      });
    </script>

    <%@ include file="../../common_user/footer.jsp"%>

</body>
</html>