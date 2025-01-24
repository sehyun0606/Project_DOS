<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아웃백 브랜드 스토리</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/css/styles_footer.css" rel="stylesheet" type="text/css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
	<style>
	/* 기본 스타일 설정 */
	body {
	    font-family: 'Arial, sans-serif';
	    margin: 0;
	    padding: 0;
	    color: #333;
	    background-color: #f9f9f9;
	}
	
	/* 헤더 스타일 */
	header {
	    background-color: #8B4513;
	    color: white;
	    text-align: center;
	    padding: 50px 0;
	}
	
	header h1 {
	    margin: 0;
	    font-size: 3em;
	}
	
	header h2 {
	    margin-top: 10px;
	    font-size: 1.5em;
	    font-weight: normal;
	}
	
	/* 내비게이션 바 스타일 */
	nav {
	    background-color: #DEB887;
	}
	
	nav ul {
	    list-style: none;
	    display: flex;
	    justify-content: center;
	    padding: 10px 0;
	    margin: 0;
	}
	
	nav ul li {
	    margin: 0 15px;
	}
	
	nav ul li a {
	    text-decoration: none;
	    color: white;
	    font-weight: bold;
	}
	
	nav ul li a:hover {
	    text-decoration: underline;
	}
	
	/* 주요 내용 스타일 */
	main {
		text-align: center;
	    padding: 20px;
	}
	
	section {
	    margin-bottom: 40px;
	}
	
	section h2 {
	    border-bottom: 2px solid #8B4513;
	    padding-bottom: 10px;
	    margin-bottom: 20px;
	}
	
	.product {
	    display: flex;
	    align-items: center;
	    margin-bottom: 20px;
	}
	
	.product img {
	    width: 150px;
	    height: auto;
	    margin-right: 20px;
	}
	
	blockquote {
	    background-color: #fff8dc;
	    padding: 20px;
	    border-left: 5px solid #8B4513;
	    margin: 20px 0;
	}
	
	blockquote footer {
	    text-align: right;
	    font-style: italic;
	    margin-top: 10px;
	}
	
	/* 폼 스타일 */
	form {
	    display: flex;
	    flex-direction: column;
	    max-width: 500px;
	    margin: 0 auto;
	}
	
	form label {
	    margin: 10px 0 5px;
	}
	
	form input, form textarea {
	    padding: 10px;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	}
	
	form button {
	    margin-top: 15px;
	    padding: 10px;
	    background-color: #8B4513;
	    color: white;
	    border: none;
	    border-radius: 4px;
	    cursor: pointer;
	}
	
	form button:hover {
	    background-color: #a0522d;
	}
	
	/* 푸터 스타일 */
	footer {
	    background-color: #DEB887;
	    color: white;
	    text-align: center;
	    padding: 20px 0;
	}
	
	footer .social-media a {
	    margin: 0 10px;
	    color: white;
	    text-decoration: none;
	}
	
	footer .social-media a:hover {
	    text-decoration: underline;
	}
	
	/* 반응형 디자인 */
	@media (max-width: 768px) {
	    .product {
	        flex-direction: column;
	        align-items: flex-start;
	    }
	
	    nav ul {
	        flex-direction: column;
	    }
	
	    nav ul li {
	        margin: 10px 0;
	    }
	}
    </style>
</head>
<body>
    <!-- 헤더 섹션 시작 -->
    <header>
        <h1>아웃백 웨이브스</h1>
        <h2>맛과 전통의 만남</h2>
    </header>
    <!-- 헤더 섹션 끝 -->

    <!-- 내비게이션 바 시작 -->
    <nav>
        <ul>
            <li><a href="#introduction">소개</a></li>
            <li><a href="#history">역사</a></li>
            <li><a href="#values">가치</a></li>
            <li><a href="#products">제품 소개</a></li>
            <li><a href="#testimonials">고객 후기</a></li>
        </ul>
    </nav>
    <!-- 내비게이션 바 끝 -->

    <!-- 주요 내용 시작 -->
    <main>
        <!-- 소개 섹션 시작 -->
        <section id="introduction">
            <h2>아웃백 웨이브스 소개</h2>
            <p>아웃백 웨이브스는 신선한 재료와 정통 레시피로 최고의 맛을 제공합니다.</p>
        </section>
        <!-- 소개 섹션 끝 -->

        <!-- 역사 섹션 시작 -->
        <section id="history">
            <h2>우리의 역사</h2>
            <p>아웃백 웨이브스는 1990년에 설립되어, 꾸준한 성장과 함께 수많은 사랑을 받아왔습니다.</p>
        </section>
        <!-- 역사 섹션 끝 -->

        <!-- 가치 섹션 시작 -->
        <section id="values">
            <h2>우리의 가치</h2>
            <ul>
                <li>품질 우선</li>
                <li>고객 중심</li>
                <li>지속 가능성</li>
                <li>혁신</li>
            </ul>
        </section>
        <!-- 가치 섹션 끝 -->

        <!-- 제품 소개 섹션 시작 -->
        <section id="products">
            <h2>주요 제품</h2>
            <div class="product">
                <img src="steak.jpg" alt="스테이크">
                <p>신선한 스테이크와 다양한 사이드 메뉴를 제공합니다.</p>
            </div>
            <div class="product">
                <img src="salad.jpg" alt="샐러드">
                <p>건강한 샐러드로 균형 잡힌 식사를 즐기세요.</p>
            </div>
        </section>
        <!-- 제품 소개 섹션 끝 -->

        <!-- 고객 후기 섹션 시작 -->
        <section id="testimonials">
            <h2>고객 후기</h2>
            <blockquote>
                "아웃백 웨이브스의 스테이크는 정말 환상적이에요!"
                <footer>- 김민수</footer>
            </blockquote>
            <blockquote>
                "친절한 서비스와 맛있는 음식, 다시 방문하고 싶어요."
                <footer>- 이지은</footer>
            </blockquote>
        </section>
        <!-- 고객 후기 섹션 끝 -->

    </main>
    <!-- 주요 내용 끝 -->

    <!-- 푸터 섹션 시작 -->
    <footer>
        <p>© 2023 아웃백 웨이브스. 모든 권리 보유.</p>
        <div class="social-media">
            <a href="#">페이스북</a>
            <a href="#">인스타그램</a>
            <a href="#">트위터</a>
        </div>
    </footer>
    <!-- 푸터 섹션 끝 -->
</body>
</html>
