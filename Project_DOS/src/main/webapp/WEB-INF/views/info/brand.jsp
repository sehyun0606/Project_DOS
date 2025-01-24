<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
		.hero {
		    position: relative;
		    height: 60vh; /* 높이 조정 */
		    align-items: center;
            justify-content: center;
            display: flex;
		}
        .background-image {
		    position: absolute;
		    top: 0;
		    left: 0;
		    width: 100%;
		    height: 100%;
		    object-fit: cover; /* 이미지 비율 유지 */
		    z-index: -1; /* 텍스트 아래로 이동 */
		}
		
		.hero h1 {
		    position: relative; /* 텍스트를 앞으로 가져옴 */
		    color: white;
		    font-size: 8rem;
		    text-align: center;
		    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
		}
		.scroll-section {
			margin: auto;
           	height: auto; /* 높이를 자동으로 설정하여 콘텐츠에 맞게 조정 */
           	width: auto;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background-color: white;
            opacity: 0;
            transition: opacity 1s;
            padding: 0px;
            position: relative;
            z-index: 1;
        }
        
		.background-image2 { 
			position: absolute;
		    width: 100%;
		    height: auto;
			z-index: -1; /* 텍스트 아래로 이동 */ 
			background-size: contain; /* 변수 사용 */
		} 
		
        .scroll-section h1 {
		    font-size: 3rem; /* 글자 크기 설정 */
		    position: relative; /* 텍스트를 앞으로 가져옴 */
		    color: white;
		    text-align: center;
		    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
		}
        .scroll-section h2 {
		    font-size: 1.5rem; /* 글자 크기 설정 */
		    position: relative; /* 텍스트를 앞으로 가져옴 */
		    color: white;
		    text-align: center;
		    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
		}
        .scroll-section h3 {
		    font-size: 1rem; /* 글자 크기 설정 */
		    position: relative; /* 텍스트를 앞으로 가져옴 */
		    color: white;
		    text-align: center;
		    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
		}
		
		.scroll-section p {
		    font-size: 1rem; /* 글자 크기 설정 */
		    position: relative; /* 텍스트를 앞으로 가져옴 */
		    color: white;
		    text-align: center;
		    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
		}

        .scroll-section.visible {
            opacity: 1;
        }


        @media (max-width: 768px) {
            .hero h1 {
                font-size: 5rem;
            }
        }
    </style>
    <title>Brand Page</title>
</head>
<body>
	<nav>
        <jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
    </nav>
    <div class="hero">
    	<img src="${pageContext.request.contextPath}/resources/images/restaurant.jpg" alt="Background Image" class="background-image">
        <h1>DOS</h1>
    </div>

    <div class="container mt-5">
        <h2 class="text-center">Welcome to Our Brand</h2>
        <p class="text-center">Explore our delicious offerings and unique experiences.</p>
    </div>
    <br>
    <br>
    <div class="scroll-section" id="scroll-section">
    	<img src="${pageContext.request.contextPath}/resources/images/brand_beef_modify.jpg" alt="Background Image" class="background-image2">
        <h1>DOS</h1>
        <br>
        <br>
        <h2>DOS는 현대적인 분위기와 함께 다양한 메뉴를 제공하는 식당입니다. 신선한 재료를 사용하여 건강하고 맛있는 음식을 제공합니다.</h2>
        <p>친구들과의 소중한 시간을 보내거나 혼자만의 여유로운 시간을 즐기기에 완벽한 장소입니다.</p>
        <br>
        <br>
        <p>
			아메리카노: 깊고 풍부한 맛의 커피<br>
			카푸치노: 부드러운 우유 거품과 함께<br>
			프렌치 토스트: 달콤하고 고소한 아침 메뉴<br>
			샐러드: 신선한 채소와 드레싱으로 건강한 선택<br>
			파스타: 다양한 소스와 함께하는 이탈리안 요리<br>
			특별 행사:
			<br>
			<br>
			<br>
			매주 수요일: '2+1' 음료 이벤트! 음료 2잔 구매 시 1잔 무료 제공.<br>
			매달 첫째 주 토요일: 'DIY 디저트 클래스' 개최! 사전 예약 필수.
		</p>
    </div>
	<script>
        window.addEventListener('scroll', function() {
            const scrollContent = document.getElementById('scroll-section');
            const scrollPosition = window.scrollY;

            // 스크롤 위치에 따라 텍스트를 보이게 함
            if (scrollPosition > 50) {
                scrollContent.classList.add('visible');
            } else {
                scrollContent.classList.remove('visible');
            }
        });
    </script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
