<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메뉴 관리</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <style>
        /* 공통 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        h1, h2 {
            text-align: center;
        }

        .menu-container {
            padding: 20px;
        }

        .menu-category {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .menu-category button {
            margin: 0 10px;
            padding: 10px 20px;
            border: 1px solid #ddd;
            cursor: pointer;
            font-size: 16px;
        }

        .menu-category button:hover {
            background-color: #ddd;
        }

        .menu-list {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
        }

        .menu-item {
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 300px;
            padding: 10px;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
        }

        .menu-item img {
            width: 100%;
            height: auto;
            border-radius: 5px;
        }

        .menu-info {
            text-align: center;
            margin-top: 10px;
        }

        .menu-info h3 {
            font-size: 18px;
            margin: 10px 0;
        }

        .menu-info p {
            color: #666;
            font-size: 14px;
        }

        .menu-info .price {
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }

        .menu-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }

        .menu-buttons button {
            flex: 1;
            margin: 0 5px;
            padding: 10px;
            font-size: 14px;
            background-color: #f5f5f5;
            border: 1px solid #ddd;
            cursor: pointer;
            border-radius: 5px;
        }

        .menu-buttons button:hover {
            background-color: #ddd;
        }
        .add{
        	width: 10%;
        	margin-left: 80%;
        }
        .selected {
	        background-color: black; /* 선택된 상태 배경색 */
	        color: white;             /* 선택된 상태 글자색 */
	        border: 2px solid black;
   		 }
   		  /* 'best-tag' 클래스를 위한 스타일 설정 */
        .best-tag {
            background-color: gold; /* 배경색을 금색으로 설정 */
            color: black; /* 글자색을 검정색으로 설정 */
            font-weight: bold; /* 글자를 굵게 설정 */
            position: absolute; /* 부모 요소 기준으로 절대 위치 설정 */
            top: 10px; /* 상단에서 10px 떨어진 위치 */
            right: 10px; /* 오른쪽에서 10px 떨어진 위치 */
            padding: 5px 10px; /* 내부 여백 설정 (상하 5px, 좌우 10px) */
            border-radius: 5px; /* 모서리를 둥글게 설정 */
        }

        
    </style>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
    <!-- Top 메뉴 포함 -->
    <jsp:include page="/WEB-INF/views/inc/admin_top.jsp"></jsp:include>

    <!-- 본문 내용 -->
    <div class="menu-container">
        <h1>메뉴 관리</h1>
        <div class="menu-buttons add">
                    <button onclick="location.href='MenuAdd'">메뉴 추가 버튼</button>
        </div>
        <div class="menu-category">
            <button class="menu" id="set">세트메뉴</button>
            <button class="menu" id="steak">스테이크</button>
            <button class="menu" id="riz&phi">리조또&필라프</button>
            <button class="menu" id="pasta">파스타</button>
            <button class="menu" id="salad">샐러드</button>
            <button class="menu" id="side">사이드</button>
            <button class="menu" id="drink">주류</button>
        </div>


        <div class="menu-list">
        </div>
    </div>
  <script>
	 $(function () {
			// 초기화: 페이지 로드 시 특정 ID를 선택된 상태로 설정
		    const defaultID = "set"; // 기본 선택된 ID
		    $("#" + defaultID).addClass("selected"); // 해당 ID에 'selected' 클래스 추가

		    // 초기 AJAX 요청: 기본 선택된 ID로 데이터 로드
		    $.ajax({
		        type: "GET",
		        url: "AdminMenuList",
		        data: {
		            menu: defaultID,
		        },
		        success: function (response) {
		            $(".menu-list").html(response); // 성공 시 응답 내용 업데이트
		        },
		        error: function () {
		            $(".menu-list").html(defaultID); // 오류 시 기본 ID 표시
		        }
		    });
		 
			$(".menu").click(function(){
				// 기존에 선택된 클래스 제거
	            $(".menu").removeClass("selected");
	
	            // 현재 클릭된 요소에 클래스 추가
	            $(this).addClass("selected");
	            
	         	// 선택된 box의 id 값을 가져오기
	            const selectedID = $(this).attr("id"); // 클릭된 박스의 id 가져오기
	            
	             $.ajax({
					type : "GET",
					url : "AdminMenuList",
					data :{
						menu : selectedID,
						
					},
					success : function(response){
						$(".menu-list").html(response);
					},
					error : function() {
						$(".menu-list").html(selectedID)
					}
				});
	            
	            
			});
	 });
  </script>
</body>
</html>
