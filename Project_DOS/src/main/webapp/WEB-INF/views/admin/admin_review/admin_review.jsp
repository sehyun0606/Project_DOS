<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 관리</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
     <style>
        h2 {
            text-align: center;
            margin-bottom: 20px;
            margin-top: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .review-list-header {
            display: flex;
            justify-content: space-between;
            width: 100%;
            margin-bottom: 20px;
        }
        .review-list {
            display: flex;
            flex-direction: column;
            gap: 10px;
            justify-content: flex-start;
            align-items: center;
        }
        .review-card {
            display: flex;
            flex-direction: row;
            width: 800px;
            max-width: 1000px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 8px;
            position: relative;
        }
        .review-image {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 50%;
            margin-right: 15px;
        }
        .review-content {
            display: flex;
            flex-direction: column;
            width: 100%;
        }
        .review-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }
        .review-name {
            font-size: 1.1em;
            font-weight: bold;
        }
        .review-rating {
            color: #ff9f00;
            display: flex;
            align-items: center;
        }
        .like-button {
            color: #000;
            cursor: pointer;
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
        .review-text {
            color: #555;
            font-size: 0.9em;
            margin-top: 10px;
        }
        .review-footer {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-top: 10px;
            font-size: 0.9em;
            color: #888;
        }
        .review-footer .review-date {
            margin-right: 5px;
        }
        .pagination {
            justify-content: center;
        }
        .review-list-header {
            margin-top: 20px;
        }
        .sort-button, .write-button {
            display: inline-block;
            
        }
        .review-list-header .sort-button {
            margin-left: 35em;
        }
        .review-list-header .write-button {
            margin-right: 34em;
        }
        .write-button a {
            display: inline-block;
            background-color: #000; /* 검은색 배경 */
            color: #fff; /* 흰색 글자 */
            padding: 10px 20px; /* 버튼 내부 여백 */
            border-radius: 8px; /* 둥근 모서리 */
            text-align: center; /* 글자 가운데 정렬 */
            text-decoration: none; /* 링크 밑줄 제거 */
            font-weight: bold; /* 글씨 굵게 */
             right: 0; /* 오른쪽 고정 */
        }
        .sort-button button {
            background-color: #f0f0f0; /* 연한 회색 배경 */
            color: #000; /* 검은색 글자 */
            border: 1px solid #ddd; /* 경계선 */
            padding: 10px 20px;
            border-radius: 8px; /* 둥근 모서리 */
            font-weight: bold; /* 글씨 굵게 */
            left: 0; /* 왼쪽 고정 */
        }
        #reportModal .modal-title {
            font-size: 2rem;
            font-weight: bold;
        }
        #reportModal textarea {
            height: 300px; /* 기존의 두 배 크기 */
            resize: none; /* 크기 조절 비활성화 */
        }
        
        .sort-button .dropdown-menu { /* 정렬 */
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}
    </style>
</head>
<body>
    <!-- Top 메뉴 포함 -->
    <jsp:include page="/WEB-INF/views/inc/admin_top.jsp"></jsp:include>

   

    <div class="container">
  
        <div class="review-list">
           <h1>리뷰 관리</h1>
        <div class="review-card">
		        <!-- 프로필 이미지 클릭 시 goToReviewInfo 함수 호출 -->
		        <img class="review-image" alt="Profile Image" onclick="goToReviewInfo(${review.review_idx})">
		        
		        <div class="review-content">
		            <div class="review-header">
		                <div class="review-name">${review.member_id}</div> <!-- 작성자 이름 -->
		                
		                <div class="review-rating">
		                    <!-- 별점 표시 -->
		                   <span> ${stars.stars}  </span>
		                    <span class="like-button" onclick="toggleLike(${review.review_idx})">
		                        <i class="bi bi-hand-thumbs-up"></i>
		                        <span class="like-count">${review.review_like}</span> <!-- 좋아요 갯수 -->
		                    </span>
		                </div>
		            </div>
		
		            <div class="review-text">${review.review_content}</div> <!-- 리뷰 내용 -->
		            
		            <div class="review-footer">
		                <div class="review-date">${review.review_date}</div> <!-- 리뷰 작성 날짜 -->
		                
		                <span class="report-button" onclick="reportReview(${review.review_idx})">신고</span> <!-- 신고 버튼 -->
		            </div>
		        </div>
		    </div>
        
		<c:forEach var="review" items="${reviews}">
		    <div class="review-card">
		        <!-- 프로필 이미지 클릭 시 goToReviewInfo 함수 호출 -->
		        <img class="review-image" alt="Profile Image" onclick="goToReviewInfo(${review.review_idx})">
		        
		        <div class="review-content">
		            <div class="review-header">
		                <div class="review-name">${review.member_id}</div> <!-- 작성자 이름 -->
		                
		                <div class="review-rating">
		                    <!-- 별점 표시 -->
		                    ${getStarRating(review.review_rating)}  
		                    <span class="like-button" onclick="toggleLike(${review.review_idx})">
		                        <i class="bi bi-hand-thumbs-up"></i>
		                        <span class="like-count">${review.review_like}</span> <!-- 좋아요 갯수 -->
		                    </span>
		                </div>
		            </div>
		
		            <div class="review-text">${review.review_content}</div> <!-- 리뷰 내용 -->
		            
		            <div class="review-footer">
		                <div class="review-date">${review.review_date}</div> <!-- 리뷰 작성 날짜 -->
		                
		                <span class="report-button" onclick="reportReview(${review.review_idx})">신고</span> <!-- 신고 버튼 -->
		            </div>
		        </div>
		    </div>
	</c:forEach>
		 <!-- Pagination -->
		    </div>
		     <div class="pagination">
		         <nav aria-label="Page navigation">
		             <ul class="pagination">
		                 <li class="page-item"><a class="page-link" href="#">«</a></li>
		                 <li class="page-item"><a class="page-link" href="#">1</a></li>
		                 <li class="page-item"><a class="page-link" href="#">2</a></li>
		                 <li class="page-item"><a class="page-link" href="#">3</a></li>
		                 <li class="page-item"><a class="page-link" href="#">»</a></li>
		             </ul>
		         </nav>
		    </div>
        </div>
<script>
function toggleLike(reviewId) {
    // 서버와 통신하여 좋아요 처리
    $.ajax({
        url: '/review/like/' + reviewId,
        type: 'POST',
        success: function(response) {
            // 서버에서 받은 새로운 좋아요 수
            const likeCount = response.likeCount;
            // 해당 review-card 내의 like-count를 업데이트
            document.querySelector(`.like-count[data-id="${reviewId}"]`).textContent = likeCount;
        },
        error: function(error) {
            console.error("좋아요 처리 실패", error);
        }
    });
}
function goToReviewInfo(reviewId) {
    window.location.href = '/review/review_info/' + reviewId;  // 리뷰 상세 페이지로 이동
}


</script>
	


</body>
</html>
