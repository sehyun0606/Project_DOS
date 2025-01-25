<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/brand.css" rel="stylesheet"  type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/parallex.css" rel="stylesheet"  type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/fadeIn.css" rel="stylesheet"  type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/slideIn.css" rel="stylesheet"  type="text/css">
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
    </style>
    <title>Brand Page</title>
</head>
<body>
	<header>
        <jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
    </header>
    <div class="hero">
    	<img src="${pageContext.request.contextPath}/resources/images/restaurant.jpg" alt="Background Image" class="background-image">
        <h1>DOS</h1>
    </div>

    <div class="container mt-5">
        <h2 class="text-center">Welcome to Our Brand</h2>
<!--         <p class="text-center">Explore our delicious offerings and unique experiences.</p> -->
        <p class="text-center">"우리의 맛있는 음식과 독특한 경험을 탐험해 보세요."</p>
    </div>
    <br>
    <br>
    <div class="section">
        <div class="background">
        	<img alt="brandimg" src="${pageContext.request.contextPath}/resources/images/brand_story.jpg">
        </div>
        <div class="content">
            <h1>DOS STORY</h1>
            <p style="color: white;">DOS는 <b>'diner of steak'</b> 의 약자로 <b>'오늘 저녁은 스테이크!!'</b> 라는 심플하면서도 확실한 <br>의미를 담고 있습니다. </p>
        </div>
    </div>

    <div class="fade-section">
        <div class="fade-content">
            <h1>부산 최고의 고급 레스토랑</h1>
            <p>그 누구도 따라올 수 없는 <b>퀄리티를 보장합니다.</b></p>
        </div>
        <div class="fade-background">
        	<img alt="brandimg" src="${pageContext.request.contextPath}/resources/images/tomahok.jpg">
        </div>
    </div>
    
    <div class="slide-section">
        <div class="slide-content slide-left">
            <h1>맛있는 음식</h1>
            <p>매일 신선한 재료로 조리합니다.</p>
            <p>최고의 주방장이 요리합니다.</p>
            <p>매일 새로운 감동을 드리겠습니다</p>
        </div>
        <div class="slide-content slide-center">
            <h1>DOS</h1>
            <p><b>'Diner Of Staek'</b></p>
        </div>
        <div class="slide-content slide-right">
            <h1>최고의 서비스</h1>
            <p>그저 그런 식당이 아닌 기억에 남는 식당이 되겠습니다.</p>
            <p>또 오고싶은 그런 식당이 되겠습니다.</p>
            <p>집에서 고급스런 식사를 하는 기분을 느낄 수 있습니다.</p>
        </div>
        <div class="slide-background">
        	<img alt="brandimg" src="${pageContext.request.contextPath}/resources/images/newyork.jpg">
        </div>
    </div>
    
    <script type="text/javascript">
	    document.addEventListener('DOMContentLoaded', () => {
	        const sections = document.querySelectorAll('.section');
	
	        const observer = new IntersectionObserver((entries) => {
	            entries.forEach(entry => {
	                if (entry.isIntersecting) {
	                    entry.target.querySelector('.content').classList.add('visible');
	                } else {
	                    entry.target.querySelector('.content').classList.remove('visible');
	                }
	            });
	        }, { threshold: 0.6 });
	
	        sections.forEach(section => observer.observe(section));
	    });
		
	    document.addEventListener('scroll', () => {
	        const sections = document.querySelectorAll('.parallax-section');

	        sections.forEach(section => {
	            const background = section.querySelector('.parallax-background');
	            const speed = 0.3; // 배경 이동 속도
	            const offset = window.pageYOffset - section.offsetTop;
	            background.style.transform = `translateY(${offset * speed}px)`;
	        });
	    });
	    
	    document.addEventListener('DOMContentLoaded', () => {
	        const sections = document.querySelectorAll('.fade-section');

	        const observer = new IntersectionObserver((entries) => {
	            entries.forEach(entry => {
	                if (entry.isIntersecting) {
	                    entry.target.classList.add('active');
	                } else {
	                    entry.target.classList.remove('active');
	                }
	            });
	        }, { threshold: 0.6 });

	        sections.forEach(section => observer.observe(section));
	    });

	    document.addEventListener('DOMContentLoaded', () => {
	        const sections = document.querySelectorAll('.slide-section');

	        const observer = new IntersectionObserver((entries) => {
	            entries.forEach(entry => {
	                if (entry.isIntersecting) {
	                    entry.target.classList.add('active');
	                } else {
	                    entry.target.classList.remove('active');
	                }
	            });
	        }, { threshold: 0.5 });

	        sections.forEach(section => observer.observe(section));
	    });

	    
    </script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
</body>
</html>
