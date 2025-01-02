<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main Page</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles_main.css">
    <style type="text/css">	
    	.img-link{
    		width : 100%;
    	}
    	 body {
            background-color: #f8f9fa; /* 배경색 */
        }
        .membership-card {
            background-color: #e7f1ff; /* 카드 배경색 */
            border-radius: 10px; /* 모서리 둥글게 */
            padding: 20px; /* 패딩 추가 */
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
            text-align: center; /* 텍스트 중앙 정렬 */
            margin-bottom: 20px; /* 카드 간격 */
        }
        h1 {
            text-align: center;
            margin: 30px 0; /* 제목과 카드 간격 */
            font-weight: bold;
        }
        .btn-custom {
            width: 300px; /* 버튼 너비 100% */
        }
        
        .button-container {
            display: flex;
            justify-content: center; /* 버튼을 중앙 정렬 */
            gap: 10px; /* 버튼 간격 */
            margin-top: 20px; /* 버튼 위쪽 여백 */
        }
        
         .checkbox-label {
            cursor: pointer; /* 커서를 포인터로 변경 */
        }
    </style>
</head>
<body>
    <header>
    	<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
    </header>
    <!-- 슬라이드 이미지 섹션 -->
    <div class="slider-section">
        <div class="slider">
            <div class="slides">
                <img src="resources/images/slider/restaurant01.jpg" alt="Slide 1" class="slide" onclick="alert()">
                <img src="resources/images/slider/restaurant02.jpg" alt="Slide 2" class="slide">
                <img src="resources/images/slider/restaurant03.jpeg" alt="Slide 3" class="slide">
            </div>
            <button id="prev-slide" class="slide-btn prev">❮</button>
            <button id="next-slide" class="slide-btn next">❯</button>
        </div>
        <div class="slider-buttons">
            <button data-slide="0"></button>
            <button data-slide="1"></button>
            <button data-slide="2"></button>
        </div>
    </div><br><br><br>

    <!-- 메뉴 소개 슬라이드 -->
    <div class="menu-section">
        <h2><b>Menu 소개</b></h2><br>
        <div class="menu-slider">
            <div class="menu-slides">
                <div class="menu-slide">
                    <div class="menu-info">
                        <h3><b>메뉴 이름: Pasta</b></h3>
                        <p>세상에서 제일 맛있는 파스타</p>
                    </div>
                    <img src="resources/images/menu/food01.jpg" alt="Menu 1" class="menu-image">
                </div>
                <div class="menu-slide">
                    <div class="menu-info">
                        <h3><b>메뉴 이름: Pizza</b></h3>
                        <p>진짜 이탈리안 피자</p>
                    </div>
                    <img src="resources/images/menu/food02.jpg" alt="Menu 2" class="menu-image">
                </div>
                <div class="menu-slide">
                    <div class="menu-info">
                        <h3><b>메뉴 이름: Salad</b></h3>
                        <p>신선한 샐러드</p>
                    </div>
                    <img src="resources/images/menu/food03.jpg" alt="Menu 3" class="menu-image">
                </div>
            </div>
            <button id="menu-prev" class="menu-btn prev">❮</button>
            <button id="menu-next" class="menu-btn next">❯</button>
        </div>
    </div><br><br><br>

    <!-- 멤버쉽 소개 -->
    <div class="membership-section">
        <h2><b>멤버쉽</b></h2>
        <div class="row">
	        <div class="col-md-4 membership-card">
	            <img src="${pageContext.request.contextPath}/resources/images/whiteSun.png" alt="WHITH" class="mb-3" />
	            <h3 style="color: white">WHITE</h3>
	            <hr>
	            <p><b>선정 기준</b>: 7회 이상 방문 시 자동 습득 또는,<br> 멤버쉽 바로 결제</p>
	            <p><b>혜택 내용</b>: 전체 가격에 5% 포인트 적립,<br>
									 식전빵 +1,<br>
								     연 1회 쿠폰 지급(스테이크 1개 무료)</p>
	            <p><b>혜택 기간</b>: 2025-01-01 ~ 2025-12-31</p>
	        </div>
	        <div class="col-md-4 membership-card">
	            <img src="${pageContext.request.contextPath}/resources/images/redSun.png" alt="RED" class="mb-3" />
	            <h3 style="color: red">RED</h3>
	            <hr>
	            <p><b>선정 기준</b>: 화이트 등급에서 포인트 30000점 이상<br> 적립 시 승급, 월간 1번 이상 방문</p>
	            <p><b>혜택 내용</b>: 전체 가격에 5% 포인트 적립,<br>
	            			  식전빵 +1,<br>
	                          연 1회 쿠폰 지급(스테이크 1개 무료)</p>
	            <p><b>혜택 기간</b>: 2025-01-01 ~ 2025-12-31</p>
	        </div>
	        <div class="col-md-4 membership-card">
	            <img src="${pageContext.request.contextPath}/resources/images/blackSun.png" alt="BLACK" class="mb-3" />
	            <h3>BLACK</h3>
	            <hr>
	            <p><b>선정 기준</b>: 레드 등급 1년 유지시 승급</p>
	            <p><b>혜택 내용</b>: 식전빵 무제한,<br>
									 무료음료 + 1,<br>
									 전체 가격에 7% 포인트 적립,<br>
									 매달 쿠폰 지급(스테이크 1개 무료)</p>
	            <p><b>혜택 기간</b>: 2025-01-01 ~ 2025-12-31</p>
	        </div>
	    </div>
    </div><br><br><br>

    <!-- 버튼 섹션 -->
    <div class="buttons-section">
        <button id="reserve-btn"><b>예약하기</b></button>
        <button id="store-btn"><b>STORE</b></button>
    </div><br><br><br>

    <script src="resources/js/scripts_main.js"></script>
    <jsp:include page="/WEB-INF/views/inc/footer.jsp"></jsp:include>
</body>
</html>