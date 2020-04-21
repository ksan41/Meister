<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.meister.event.model.vo.Event,java.util.ArrayList"%>
<%
   ArrayList<Event> list = (ArrayList<Event>)request.getAttribute("list");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <%@ include file="../../common_user/menubar.jsp"%>
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


        .sub-menu-area *{
            padding: 5px;
        }
        .sub-menu-area>a{
            font-size: 17px;
            color:black;
            font-weight: bolder;
        }

        /* 서브메뉴 스타일 끝 */

        /* 이벤트 목록 스타일 시작 */
        
        #eventListTable{
            width:1000px;
            height:700px;
        }
        #eventListTable td{padding:20px;}
        #eventListTable img{
            width:100%;
            cursor:pointer;
        }
        
        /* 이벤트 목록 스타일 끝 */
        
        .colLine
{
 float:left;
 border:solid 1px #cccccc;
}

.tdFirst
{
 float:left;
 border-bottom:solid 1px #cccccc;
}

.tdLast
{
 float:left;
 border-left:solid 1px #cccccc;
 border-bottom:solid 1px #cccccc;
}


.tdBottom
{
 float:left;
 border-left:solid 1px #cccccc;
}


        
        
     
     
    </style>
    
	

</head>
<body>


   <div class="outer">
        <!-- 서브메뉴 타이틀 -->
        <h1>이벤트</h1>
        <br>
        <!-- 서브메뉴 우측 인덱스 -->
        <div id="index-area"><a href="">홈</a> &gt; 이벤트</div>
        <hr>

        <br>
        <!-- inner영역에 콘텐츠 작성 -->
        <div class="inner">
        
    
		
		
		        <!--  <table id="eventListTable" align="center">
                <tr> 
                
                    <td><img src=""></td>
                   
                    
                </tr>
                <tr>
                    <td><img src="img_meister/eventThumbnail/20200311_K62y1s4N.jpg"></td>
                    <td><img src="img_meister/eventThumbnail/20200327_4X39ZmU4.jpg"></td>
                </tr>
                <tr>
                    <td><img src="img_meister/eventThumbnail/20200331_wCMr6nqu.jpg"></td>
                    <td><img src="img_meister/eventThumbnail/20200120_ZdUq5370.jpg"></td>
                </tr>
                <tr>
                    <td><img src="img_meister/eventThumbnail/20200131_Npy27D5Z.jpg"></td>
                    <td><img src="img_meister/eventThumbnail/20200120_h72eVUM8.jpg"></td>
                </tr>
            </table>
            -->
            
           
                 
                  
              <div style="width:13%; float:left;">
              
              	<img src="<%= contextPath %>/resources/siteImgs/eventImg/20200120_ZdUq5370.jpg">
              	
              </div>
              
              <div style="width=85%; float="right;">
              	
              	<img src="<%= contextPath %>/resources/siteImgs/eventImg/20200120_ZdUq5370.jpg">
              
              	
              </div>
              
             
                 
                
            
		
 		

       
        	
            
        </div>



    </div>
    
    <%@ include file="../../common_user/footer.jsp"%>
    
    

	


</body>
</html>