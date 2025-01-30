<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 상세</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        /* 페이지 전체 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        /* 컨테이너 */
        .container2 {
            width: 80%;
            margin: 0 auto;
            padding-top: 20px;
        }

        /* 리뷰 박스 */
        .review-box {
            background-color: #ffffff;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .review-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        .review-header .user-info {
            display: flex;
            align-items: center;
            width: 30%;
        }

        .review-header .user-info img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .review-header .user-info .user-name {
            font-size: 16px;
            font-weight: bold;
        }

        .review-header .review-score {
            font-size: 14px;
            color: #555;
        }

        .review-content {
            font-size: 14px;
            color: #333;
            margin-bottom: 20px;
        }

        /* 답변 영역 */
        .response-section {
            display: flex;
            align-items: flex-start;
        }

        .response-section textarea {
            width: 80%;
            height: 80px;
            resize: none;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-right: 10px;
        }

        .response-section button {
            padding: 10px 20px;
            font-size: 14px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .response-section .btn-reply {
            background-color: #007bff;
            color: #ffffff;
        }

        .response-section .btn-delete {
            background-color: #d9534f;
            color: #ffffff;
        }
    </style>
</head>
<body>
    <!-- 상단 메뉴 포함 -->
    <jsp:include page="/WEB-INF/views/inc/admin_top.jsp"></jsp:include>

    <!-- 리뷰 상세 컨테이너 -->
    <div class="container2">
        <div class="review-box">
            <!-- 리뷰 상단 -->
            <div class="review-header">
                <div class="user-info">
                    <div>
                        <div class="user-name">${review.member_id}</div>
                        <div class="user-level">${member.membership}</div>
                    </div>
                    <div style="margin-left: 5%;"><p><fmt:formatDate value="${review.review_date}" pattern="yyyy-MM-dd"/></p></div>
                </div>
                <div style="margin-right: 20% ">
                	${review.review_title}
                </div>
                <div class="review-score">
                    <span >${review.review_rating}</span>
                    <span id="review-rating${review.review_idx}"></span>
                </div>
            </div>

            <!-- 리뷰 내용 -->
            <div class="review-content">
                ${review.review_content}
            </div>

            <!-- 답변 영역 -->
           	<form action="ReviewAnswer?review_idx=${review.review_idx}" method="post">
	            <div class="response-section">
	                <textarea placeholder="답변 내용을 입력하세요" name="answer_content"> ${review.answer_content }</textarea>
	                <button class="btn-reply" type="submit">답변</button>
	                <button type="button" class="btn-delete" onclick="location.href='ReviewDelete?review_idx=${review.review_idx}'">삭제</button>
	                <button type="button" class="back" onclick="location.href='AdminReview'">뒤로</button>
	            </div>
           	</form>
        </div>
    </div>
 <script type="text/javascript">

 function getStarRating(rating) {
     let stars = '';
     for (let i = 1; i <= 5; i++) {
         if (i <= rating) {
             stars += '★';
         } else {
             stars += '☆';
         }
     }
     return stars;
 }
 document.getElementById("review-rating${review.review_idx}").textContent = getStarRating(${review.review_rating});
 </script>
</body>
</html>
