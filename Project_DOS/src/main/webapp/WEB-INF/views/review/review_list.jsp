<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession session2 = request.getSession();
    String memberId = (String) session.getAttribute("member_id");  // 세션에서 회원 아이디 확인
    boolean isLoggedIn = (memberId != null);  // 로그인 여부
%>
    
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
<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
<h2> Review </h2>
<div class="review-list-header">

<div class="sort-button dropdown">
    <button class="btn btn-outline-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
        정렬
    </button>
    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
        <li><a class="dropdown-item" href="#">추천 높은 순</a></li>
        <li><a class="dropdown-item" href="#">추천 낮은 순</a></li>
        <li><a class="dropdown-item" href="#">최신순</a></li>
        <li><a class="dropdown-item" href="#">오래된 순</a></li>
        <li><a class="dropdown-item" href="#">평점 높은 순</a></li>
        <li><a class="dropdown-item" href="#">평점 낮은 순</a></li>
        
    </ul>
</div>

    <div class="btn write-button">
        <!-- 로그인 여부에 따라 버튼 표시 -->
<%--         <c:if test="${isLoggedIn}"> --%>
            <!-- 로그인한 경우 작성하기 버튼 -->
            <a href="${pageContext.request.contextPath}/review_write" class="btn-primary">작성하기</a>
<%--         </c:if> --%>
<%--         <c:if test="${!isLoggedIn}"> --%>
<!--             로그인하지 않은 경우 회원가입 팝업 띄우기 -->
<!--             <a href="javascript:void(0);" class="btn-primary" data-bs-toggle="modal" data-bs-target="#signupModal">작성하기</a> -->
<%--         </c:if> --%>
<!--     </div> -->

<!--     회원가입 팝업 -->
<!--     <div class="modal fade" id="signupModal" tabindex="-1" aria-labelledby="signupModalLabel" aria-hidden="true"> -->
<!--         <div class="modal-dialog"> -->
<!--             <div class="modal-content"> -->
<!--                 <div class="modal-body"> -->
<!--                     <p>로그인 후 리뷰를 작성하실 수 있습니다. 회원가입을 하시겠어요?</p> -->
<!--                 </div> -->
<!--                 <div class="modal-footer"> -->
<!--                     <a href="#ss" class="btn btn-dark">회원가입</a> -->
<!--                     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
    </div>

<!--     <div class="btn write-button"> -->
<!-- <a href="${pageContext.request.contextPath}/review_write" class="btn-primary">작성하기</a> -->

<!--     </div> -->
    
</div>
<!-- 리뷰 목록 -->

        
<!--         다섯 번째 리뷰 -->
<!-- <div class="review-card"> -->
<!--     프로필 이미지 클릭 시 goToReviewInfo 함수 호출 -->
<%--     <img src="profile.jpg" class="review-image" alt="Profile Image" onclick="goToReviewInfo(${review.id})"> --%>
<!--     <div class="review-content"> -->
<!--         <div class="review-header"> -->
<!--             <div class="review-name">작성자 이름</div> -->
<!--             <div class="review-rating"> -->
<!--                 ★★★★☆ -->
<!--                 <span class="like-button" onclick="toggleLike(this)"> -->
<!--                     <i class="bi bi-hand-thumbs-up"></i> -->
<!--                     <span class="like-count">+</span> 좋아요 갯수 표시 -->
<!--                 </span> -->
<!--             </div> -->
<!--         </div> -->
<!--         <div class="review-text">리뷰 내용이 여기에 표시됩니다...</div> -->
<!--         <div class="review-footer"> -->
<!--             <div class="review-date">2024-12-23</div> -->
<!--             <span class="report-button" onclick="reportReview()">신고</span> -->
<!--         </div> -->
<!--     </div> -->
<!-- </div> -->

<!-- <div class="review-card"> -->
<!--     프로필 이미지 클릭 시 goToReviewInfo 함수 호출 -->
<%--     <img src="${review.profileImage}" class="review-image" alt="Profile Image" onclick="goToReviewInfo(${review.id})"> --%>
<!--     <div class="review-content"> -->
<!--         <div class="review-header"> -->
<%--             <div class="review-name">${review.writerName}</div> --%>
<!--             <div class="review-rating"> -->
<!--                 별점 표시 -->
<%--                 ${getStarRating(review.rating)}  <!-- 별점 표시 함수 --> --%>
<%--                 <span class="like-button" onclick="toggleLike(${review.id})"> --%>
<!--                     <i class="bi bi-hand-thumbs-up"></i> -->
<%--                     <span class="like-count">${review.likeCount}</span> <!-- 좋아요 갯수 표시 --> --%>
<!--                 </span> -->
<!--             </div> -->
<!--         </div> -->
<%--         <div class="review-text">${review.content}</div> --%>
<!--         <div class="review-footer"> -->
<%--             <div class="review-date">${review.date}</div> --%>
<%--             <span class="report-button" onclick="reportReview(${review.id})">신고</span> --%>
<!--         </div> -->
<!--     </div> -->
<!-- </div> -->
${revieews.review_title}
<!-- 리뷰 목록 -->
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
 <!-- Pagination -->
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
</c:forEach>
<!-- 신고 모달 -->
<div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="reportModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="reportModalLabel">리뷰 신고하기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <label for="reportReason" class="form-label">신고 사유를 선택하세요:</label>
                    <div>
                        <input type="checkbox" id="reason1" name="reason" value="매장과 관련 없는 내용"> 매장과 관련 없는 내용<br>
                        <input type="checkbox" id="reason2" name="reason" value="욕설"> 욕설<br>
                        <input type="checkbox" id="reason3" name="reason" value="허위사실"> 허위사실<br>
                        <input type="checkbox" id="reason4" name="reason" value="광고/스팸"> 광고/스팸<br>
                    </div>
                    <br>
                    <textarea class="form-control large" placeholder="추가 사유를 작성하세요" maxlength="500"></textarea>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-dark">신고</button>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // 신고 버튼을 눌렀을 때 모달 팝업 열리도록 하는 코드
    document.querySelector('.report-button').addEventListener('click', function() {
        new bootstrap.Modal(document.getElementById('reportModal')).show();
    });
</script>

<script>
// function toggleLike(button) {
//     var likeCountElement = button.querySelector('.like-count');
//     var currentCount = parseInt(likeCountElement.innerText.replace('+', ''));
    
//     // 좋아요가 눌려지지 않았으면 +1 증가
//     if (!button.classList.contains('liked')) {
//         button.classList.add('liked');
//         likeCountElement.innerText = `+${currentCount + 1}`;  // 좋아요 수 +1
//     } else {
//         button.classList.remove('liked');
//         likeCountElement.innerText = `+${currentCount}`;  // 이전 갯수 그대로
//     }
// }


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
</script>

<script >

function goToReviewInfo(reviewId) {
    window.location.href = '/review/review_info/' + reviewId;  // 리뷰 상세 페이지로 이동
}
// function goToReviewInfo(reviewId) {
//     // 해당 reviewId를 URL 파라미터로 넘겨서 리뷰 상세 페이지로 이동
//     window.location.href = `review_info?review_id=` + reviewId;
// }
// function goToReviewInfo(reviewId) {
//     window.location.href = `/review_info?review_id=` + reviewId; // 리뷰 인포 이동
// }



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
</script>


<jsp:include page="/WEB-INF/views/inc/footer.jsp"></jsp:include>
</body>
</html>
