<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/styles_footer.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/side2.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <title>자주 묻는 질문</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
        }
        .layout-container {
            display: flex;
            flex-direction: row;
            min-height: 100vh;
        }
        .sidebar {
			height: 100vh;
            width: auto;
            background-color: #f8f9fa;
            color: #fff;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.2);
        }
        .sidebar h5 {
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
            color: #333;
        }
        .sidebar ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .sidebar ul li {
            margin-bottom: 10px;
        }
        .sidebar ul li a {
            text-decoration: none;
            color: #333;
            font-size: 16px;
            display: block;
            padding: 10px;
            border-radius: 5px;
            transition: background 0.3s;
        }
        .sidebar ul li a:hover {
            background-color: #495057;
        }
        .main-content {
            flex-grow: 1;
            padding: 20px;
            background-color: #f9f9f9;
        }
        .table-container {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .board_title {
        cursor: pointer; /* 커서가 손가락 모양으로 변경 */
        transition: background-color 0.3s, font-weight 0.3s; /* 부드러운 전환 효과 */
  	  	}

    /* 제목에 호버 효과 */
  		.board_title:hover {
        background-color: #f0f0f0; /* 배경색 변경 */
        font-weight: bold; /* 글씨 두껍게 */
        color: #007bff; /* 글자색 변경 (파란색) */
    	}
    	.board-content-wrapper {
        padding: 20px; /* 내부 여백 */
        text-align: center; /* 텍스트 가운데 정렬 */
        background-color: #f8f9fa; /* 배경색 */
        border: 1px solid #ccc; /* 테두리 */
        border-radius: 5px; /* 모서리 둥글게 */
        min-height: 600px; /* 최소 높이 */
    	min-width: 600px; /* 최소 너비 */
   	 	}

	    /* 게시판 본문 텍스트 스타일 */
	    .board-content p {
	        height: auto; /* 텍스트 영역 높이 자동 */
	        margin-top: 15px; /* 상단 간격 */
	        font-size: 1.1rem; /* 글자 크기 */
	        line-height: 1.6; /* 줄 간격 */
	        color: #333; /* 글자 색상 */
	    }
	    .faq-title {
            cursor: pointer;
            padding: 15px;
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            border-radius: 0.25rem;
            margin-bottom: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
		h2 {
			margin-bottom: 20px;
		}
		
        .faq-content {
            display: none;
            padding: 15px;
            border: 1px solid #dee2e6;
            border-radius: 0.25rem;
            background-color: #ffffff;
            margin-bottom: 10px;
        }
        .faq-title i {
            margin-left: auto;  /* 아이콘을 오른쪽 끝으로 이동 */
        }
        hr {
            border: none; /* 기본 테두리 제거 */
            height: 2px; /* 선 두께 */
            background-color: black; /* 원하는 색상으로 변경 */
            margin: 10px 0; /* 위아래 여백 */
        }
    </style>
</head>
<body>
 <!-- 상단 네비게이션 -->
    <nav>
        <jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
    </nav>
    <!-- 사이드바와 메인 콘텐츠 레이아웃 -->
    <div class="layout-container">
        <!-- 고정 사이드바 -->
        <div id="side-menu">
			<jsp:include page="/WEB-INF/views/inc/service_side.jsp"></jsp:include>
		</div>
	    <div class="container mt-5">
	        <h2>자주 묻는 질문</h2>
	        <hr>
	        <div class="faq-item">
	            <div class="faq-title" onclick="toggleFaq(this)">
		            <b>1. 부메랑클럽 회원가입은 어떻게 하나요?</b>
	                <i class="fas fa-chevron-down"></i>
                </div>
	            <div class="faq-content">
	                홈페이지, 어플, 모바일 웹에서 회원 가입을 통해 가능합니다.<br>
	            </div>
	        </div>
	
	        <div class="faq-item">
	            <div class="faq-title" onclick="toggleFaq(this)">
		            <b>2. DOS 멤버쉽에 가입하면 제공받는 혜택이 무엇인가요?</b>
		            <i class="fas fa-chevron-down"></i>
	            </div>
	            <div class="faq-content">
	                DOS 멤버쉽에 가입하면 다양한 혜택을 제공받습니다.
	            </div>
	        </div>
	
	        <div class="faq-item">
	            <div class="faq-title" onclick="toggleFaq(this)">
		            <b>3. 2025년 RED, BLACK 혜택은 무엇이 있나요?</b>
		            <i class="fas fa-chevron-down"></i>
	            </div>
	            <div class="faq-content">
	                스테이크 무료 쿠폰 1장, 식전빵 무제한 제공, 매 분기 30% 할인 쿠폰 등 다양한 혜택이 있습니다.
	            </div>
	        </div>
	
	        <div class="faq-item">
	            <div class="faq-title" onclick="toggleFaq(this)">
		            <b>4. 2025년 RED, BLACK 기준은 무엇인가요?</b>
		            <i class="fas fa-chevron-down"></i>
	            </div>
	            <div class="faq-content">
	                RED 및 BLACK 기준은 매년 다르게 설정됩니다.
	            </div>
	        </div>
	
	        <div class="faq-item">
	            <div class="faq-title" onclick="toggleFaq(this)">
		            <b>5. 2025년 RED, BLACK 혜택은 언제부터 제공되며, 언제까지 적용받을 수 있는 혜택인가요?</b>
		            <i class="fas fa-chevron-down"></i>
	            </div>
	            <div class="faq-content">
	                혜택은 매년 1월 1일부터 제공되며, 해당 연도 동안 유효합니다.
	            </div>
	        </div>
	    </div>
	</div>
	
    <script>
        function toggleFaq(element) {
            const content = element.nextElementSibling;
            const icon = element.querySelector('i');

            if (content.style.display === "block") {
                content.style.display = "none";
                icon.classList.remove('fa-chevron-up');
                icon.classList.add('fa-chevron-down');
            } else {
                content.style.display = "block";
                icon.classList.remove('fa-chevron-down');
                icon.classList.add('fa-chevron-up');
            }
        }
    </script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
