<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 페이지</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/css/styles_footer.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        .container {
            max-width: auto;
            margin: auto;
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

         .like-button {
            color: #000;
            margin-left: 10px;
            font-size: 1.5em;
            display: flex;
            align-items: center;
        }
        .like-button.liked i {
            color: #fff;
            background-color: #000;
            border-radius: 50%;
            padding: 5px;
            border: 2px solid #000;
        }
        .like-count {
            margin-left: 5px;
            font-size: 1em;
            color: #000;
        }
        .review-content {
            margin: 20px 0;
            display: flex;
            justify-content: space-between;
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
	<br>
	<br>
    <div class="container">
        <!-- 사용자 리뷰 -->
        <div class="review-header">
            <div class="user-info">
                <div class="username">${review.member_id}</div>
            </div>
            <div class="rating">
            	
                <div class="stars" id="review-rating${review.review_idx}"></div>
                <div class="date"><fmt:formatDate value="${review.review_date}" pattern="yyyy-MM-dd"/></div> <!-- 작성 날짜 -->
            </div>
            <div class="like-btn" id="like-btn" style="padding: 10px 30px 10px 30px;">
               <i id="${review.review_idx}" data-auto="true" class="bi bi-hand-thumbs-up" ></i>
                <span class="like-count">${review.review_like}</span>
            </div>
        </div>

        <div class="review-content">
            <p>${review.review_content}</p>
            <c:if test="${sessionScope.sId eq review.member_id}">
           		<div>
            		<input type="button" value="뒤로가기" onclick="history.back()">
            		<input type="button" value="삭제하기" style="background-color: red; color: white;" onclick="location.href='ReviewDelete?review_idx=${review.review_idx}'" >
           		</div>
           	</c:if>
        </div>
		
        <div class="dotted-divider"></div>

        <!-- 관리자 답변 -->
        <div class="admin-reply">
            <div class="admin-header">
                <div class="admin-info">
                    <div class="username">admin &nbsp;&nbsp;&nbsp;<fmt:formatDate value="${review.answer_date}" pattern="yyyy-MM-dd"/></div>
                    <div class="user-status">master 🍎</div>
                </div>
            </div>
            <div class="review-content">
                <p>${review.answer_content}</p>
            </div>
        </div>
    </div>
    <br>
    <br>
    <jsp:include page="/WEB-INF/views/inc/footer.jsp"></jsp:include>

    <script>
        function getStarRating(rating) {
            let stars = "";
            for (let i = 1; i <= 5; i++) {
                stars += i <= rating ? "★" : "☆";
                
            }
            return stars;
        }
    		document.getElementById("review-rating${review.review_idx}").textContent = getStarRating(${review.review_rating});
    </script>
</body>
</html>
