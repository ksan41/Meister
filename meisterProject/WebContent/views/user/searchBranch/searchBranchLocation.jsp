	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<%@ include file="../../common_user/menubar.jsp" %>
	<%@ include file="../../common_user/menubarMenuIMG.jsp" %>

	<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resources/css/bootstrap.css">
	</head>
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
	/* content 스타일 시작*/
	
	.content{
		height:1000px;	
	}
	.content div{
		float:left;
	}
	.emptyAreaLong{
		width:100%;
		height:100px;
	}
	.emptyAreaShort{
		width:100%;
		height:40px;
	}
	.leftSide{
		width:40%;
		height:1000px;
	}
	.buttonArea{
		width:50%;
		height:60px;	
	}
	.defaultColor{
		background-color:rgb(76, 60, 60);
	}
	.selectArea{
		width:100%;
		height:90px;
	}
	.showBranchArea{
		width:100%;
		height:250px;	
	}
	.rightSide{
		width:60%;
		height:1000px;
	}
	div{
		border:1px solid red;
	}
	
	/* content 스타일 끝*/
</style>
<body>
	
	

	<div class="outer">
        <!-- 서브메뉴 타이틀 -->
        <h1 style="font-weight:bold; color:rgb(76, 60, 60);">장바구니</h1>
        <br>
        <!-- 서브메뉴 우측 인덱스 -->
        <div id="index-area"><a href="">홈 </a> &gt; 매장검색</div>
        <hr>
		<div class="content">
			<div class="emptyAreaLong"></div>
			<div class="leftSide">
				<div class="buttonArea defaultColor"></div>
				<div class="buttonArea"></div>
				<div class="emptyAreaShort defaultColor"></div>
				<div class="selectArea"></div>
				<div class="showBranchArea"></div>
				<div class="showBranchArea"></div>
			</div>
			<div class="rightSide"></div>
		</div>


    </div>
	
    
        
	<%@ include file="../../common_user/footer.jsp"%>
	
</body>
</html>