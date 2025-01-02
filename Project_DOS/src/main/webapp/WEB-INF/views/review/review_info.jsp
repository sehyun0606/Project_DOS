<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 페이지</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/css/styles_footer.css" rel="stylesheet" type="text/css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .review-header, .admin-header {
            display: flex;
            align-items: center;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
            position: relative;
        }

        .user-avatar, .admin-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: #ccc;
            margin-right: 10px;
        }

        .user-info, .admin-info {
            flex: 1;
        }

        .user-info .username, .admin-info .username {
            font-size: 1.2em;
            font-weight: bold;
        }

        .user-info .user-status, .admin-info .user-status {
            font-size: 0.9em;
            color: #777;
        }

        .rating {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        .rating .stars {
            font-size: 1.2em;
            font-weight: bold;
        }

        .rating .date {
            font-size: 0.9em;
            color: #777;
        }

        .like-btn {
            margin-left: 15px;
            display: flex;
            align-items: center;
            gap: 5px;
            font-size: 1em;
            color: #007bff;
            cursor: pointer;
        }

        .like-btn:hover {
            text-decoration: underline;
        }

        .review-content {
            margin: 20px 0;
        }

        .review-content p {
            line-height: 1.6;
        }

        .review-images {
            display: flex;
            gap: 10px;
            margin: 10px 0;
        }

        .review-images img {
            width: 60px;
            height: 60px;
            border-radius: 4px;
            object-fit: cover;
        }

        .admin-reply {
            margin-top: 20px;
        }

	.dotted-divider {
            border-top: 3px dotted  #ddd;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <!-- Top 메뉴 포함 -->
<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>

    <div class="container">
        <!-- 사용자 리뷰 -->
        <div class="review-header">
            <div class="user-avatar"></div>
            <div class="user-info">
                <div class="username">길레기</div>
                <div class="user-status">black 🍓</div>
            </div>
            <div class="rating">
                <div class="stars">5.0 ★★★★★</div>
                <div class="date">2024-12-23</div> <!-- 작성 날짜 -->
            </div>
            <div class="like-btn" onclick="toggleLike()" id="like-btn">
                👍 <span id="like-count">0</span> <!-- 좋아요 버튼 -->
            </div>
        </div>

        <div class="review-content">
            <div class="review-images">
                <img src="img1.jpg" alt="Image 1">
                <img src="img2.jpg" alt="Image 2">
                <img src="img3.jpg" alt="Image 3">
                <img src="img4.jpg" alt="Image 4">
            </div>
            <p>두 번째 방문했어요! 또 올게요. 너무 너무 맛있어요. 완전 맛있어요. 최고!</p>
        </div>

        <div class="dotted-divider"></div>

        <!-- 관리자 답변 -->
        <div class="admin-reply">
            <div class="admin-header">
                <div class="admin-avatar"></div>
                <div class="admin-info">
                    <div class="username">admin</div>
                    <div class="user-status">master 🍎</div>
                </div>
            </div>
            <div class="review-content">
                <p>찾아주셔서 감사합니다 ^^ 열심히 영차...</p>
            </div>
        </div>
    </div>

    <script>
        let isLiked = false;
        let likeCount = 0;

        function toggleLike() {
            const likeBtn = document.getElementById("like-btn");
            const likeCountElem = document.getElementById("like-count");

            if (isLiked) {
                likeCount--;
                likeBtn.style.color = "#007bff"; // 기본 색상
            } else {
                likeCount++;
                likeBtn.style.color = "#ff4500"; // 따봉 눌렀을 때 색상
            }

            isLiked = !isLiked;
            likeCountElem.textContent = likeCount;
        }
    </script>
    <jsp:include page="/WEB-INF/views/inc/footer.jsp"></jsp:include>
</body>
</html>
