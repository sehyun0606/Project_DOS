<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <!-- 부트스트랩 CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/styles_footer.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/side2.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
        }
        .layout-container {
            display: flex;
            flex-direction: row;
            min-height: 100vh;
        }
        .sidebar {
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
    </style>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
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
        <!-- 메인 콘텐츠 -->
        <div class="main-content">
            <article class="content">
                <div class="container">
                    <div class="table-container">
                        <h2 class="text-center mb-4">FAQ</h2>
                        <div class="board-content-wrapper">
				            <div class="board-content">
			                	${faqList.faq_title}<br>
			                	${faqList.faq_content }
				            </div>
				        </div>
                    </div>
                </div>
            </article>
        </div>
    </div>
	<footer>
		<jsp:include page="/WEB-INF/views/inc/footer.jsp"></jsp:include>
	</footer>
    <!-- 부트스트랩 JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
    <script src="resources/js/scripts_main.js"></script>
    <script type="text/javascript">
		// 게시물 제목열 클릭 이벤트 핸들링
		$(".board_title").on("click", function(event) {
// 			console.log(event.target);
			
			// [ 클릭된 제목에 해당하는 게시물의 글 번호 가져오기 ]
			// 1) 클릭 대상 요소의 부모 탐색하여 해당 부모의 자식들 중 
			//    클래스 선택자가 "board_num" 인 요소 탐색
// 			let parent = $(event.target).parent(); // 클릭 대상 요소의 부모 요소 탐색
// 			console.log(parent.html());
			
			// 부모 요소의 내부 요소(자식)들 중에서 클래스 선택자 "board_num" 탐색 = find()
// 			let board_num = $(parent).find(".board_num").text(); // 요소내의 텍스트 노드만 가져오기
// 			console.log(board_num); // 클릭된 게시물의 글번호 출력됨
			// -----------------------------------
			// 2) 클릭 대상 요소의 형제 노드 탐색
			let board_num = $(event.target).siblings(".board_num").text();
// 			console.log("siblings : " + board_num); // 클릭된 게시물의 글번호 출력됨
			// -----------------------------------
			
			// "BoardDetail" 서블릿 주소 요청
			// => 파라미터 : 글번호(위에서 탐색한 번호), 페이지번호(PageInfo 객체의 pageNum 속성값)
			location.href = "BoardDetail?board_num=" + board_num + "&pageNum=${pageInfo.pageNum}";
		});
		
	</script>
</body>
</html>
