<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/css/styles_footer.css" rel="stylesheet" type="text/css"/>
    <style>
        h2 {
            text-align: center;
            margin-bottom: 20px;
            margin-top: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .review-list-header { /*리뷰 목록 헤더 */
            display: flex;
            justify-content: space-between;
            width: 100%;
            margin-bottom: 20px;
        }
        .review-list {  /* 리뷰 카드 감싸는 네모 */
            display: flex;
            flex-direction: column;
            gap: 10px;
            justify-content: flex-start;
            align-items: center;
        }
        .review-card {   /* 각 각의 리뷰 네모 카드*/
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
        .review-image {  /* 프로필 이미지 */
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 50%;
            margin-right: 15px;
        }
        .review-content {   /* 리뷰 내용 전체 감싸는 컨테이너 ?*/
            display: flex;
            flex-direction: column;
            width: 100%;
        }
        .review-header {   /* 작성자 이름과 별점 ? */
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }
        .review-name {
            font-size: 1.1em;
            font-weight: bold;
        }
        .review-rating {   /* 별점 */
            color: #ff9f00;
            display: flex;
            align-items: center;
        }
        .like-button {   /* 좋아요*/
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
        .like-count {   /* 좋아요 개수*/
            margin-left: 5px;
            font-size: 1em;
            color: #000;
        }
        .review-text {   /* 리뷰 내용 글자 크기 , 색상 */
            color: #555;
            font-size: 0.9em;
            margin-top: 10px;
        }
        .review-footer {   /* 리뷰 날짜, 신고버튼 정렬 */
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
        .pagination {   /* 페이지 번호 칸 정렬 */
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
        }
        .sort-button button {
            background-color: #f0f0f0; /* 연한 회색 배경 */
            color: #000; /* 검은색 글자 */
            border: 1px solid #ddd; /* 경계선 */
            padding: 10px 20px;
            border-radius: 8px; /* 둥근 모서리 */
            font-weight: bold; /* 글씨 굵게 */
        }
        #reportModal .modal-title {   /* 신고 모달 제목 폰트 */
            font-size: 2rem;
            font-weight: bold;
        }
        #reportModal textarea {   /* 신고 사유 텍스트 입력창 높이, 크기 */
            height: 300px; /* 기존의 두 배 크기 */
            resize: none; /* 크기 조절 비활성화 */
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
<h2> Review </h2>
<div class="review-list-header">
    <div class="sort-button">
        <button class="btn2 btn-outline-secondary">정렬</button>
    </div>
    <div class="btn write-button">
     <a href="/review/review_write" class="btn-primary">작성하기</a>
<!--         <a href="writeReviewPage" class="btn-primary">작성하기</a> -->
    </div>
</div>
<!-- 리뷰 목록 -->

    <div class="review-list">
        <!-- 반복문을 통해 여러 리뷰 표시 -->
        <c:forEach var="review" items="${reviews}">
        <div class="review-card">
            <img src="${review.image}" class="review-image" alt="Profile Image">
            <div class="review-content">
                <div class="review-header">
                    <div class="review-name">${review.name}</div>
                    <div class="review-rating">
                         ${review.rating}
                        <span class="like-button" onclick="toggleLike(this)">
                            <i class="bi bi-hand-thumbs-up"></i>
                            <span class="like-count">+${review.likes}</span> <!-- 좋아요 갯수 표시 -->
                        </span>
                    </div>
                </div>
                <div class="review-text">${review.text}</div>
                <div class="review-footer">
                    <div class="review-date">${review.date}</div>
                    <span class="report-button" onclick="reportReview()">신고</span>
                </div>
            </div>
            </c:forEach>
        </div>

        <!-- 두 번째 리뷰 -->
        <div class="review-card">
            <img src="profile2.jpg" class="review-image" alt="Profile Image">
            <div class="review-content">
                <div class="review-header">
                    <div class="review-name">작성자 이름2</div>
                    <div class="review-rating">
                        ★★★☆☆
                        <span class="like-button" onclick="toggleLike(this)">
                            <i class="bi bi-hand-thumbs-up"></i>
                            <span class="like-count">+0</span>
                        </span>
                    </div>
                </div>
                <div class="review-text">두 번째 리뷰 내용이 여기에 표시됩니다...</div>
                <div class="review-footer">
                    <div class="review-date">2024-12-22</div>
                    <span class="report-button" onclick="reportReview()">신고</span>
                </div>
            </div>
        </div>

        <!-- 세 번째 리뷰 -->
        <div class="review-card">
            <img src="profile3.jpg" class="review-image" alt="Profile Image">
            <div class="review-content">
                <div class="review-header">
                    <div class="review-name">작성자 이름3</div>
                    <div class="review-rating">
                        ★★★☆☆
                        <span class="like-button" onclick="toggleLike(this)">
                            <i class="bi bi-hand-thumbs-up"></i>
                            <span class="like-count">+0</span>
                        </span>
                    </div>
                </div>
                <div class="review-text">세 번째 리뷰 내용이 여기에 표시됩니다...</div>
                <div class="review-footer">
                    <div class="review-date">2024-12-10</div>
                    <span class="report-button" onclick="reportReview()">신고</span>
                </div>
            </div>
        </div>

        <!-- 네 번째 리뷰 -->
        <div class="review-card">
            <img src="profile4.jpg" class="review-image" alt="Profile Image">
            <div class="review-content">
                <div class="review-header">
                    <div class="review-name">작성자 이름4</div>
                    <div class="review-rating">
                        ★★★☆☆
                        <span class="like-button" onclick="toggleLike(this)">
                            <i class="bi bi-hand-thumbs-up"></i>
                            <span class="like-count">+0</span>
                        </span>
                    </div>
                </div>
                <div class="review-text">네 번째 리뷰 내용이 여기에 표시됩니다...</div>
                <div class="review-footer">
                    <div class="review-date">2024-12-2</div>
                    <span class="report-button" onclick="reportReview()">신고</span>
                </div>
            </div>
        </div>
        
        <!-- 다섯 번째 리뷰 -->


 <!-- Pagination -->
<!--         <div class="pagination"> -->
<!--             <nav aria-label="Page navigation"> -->
<!--                 <ul class="pagination"> -->
<!--                     <li class="page-item"><a class="page-link" href="#">«</a></li> -->
<!--                     <li class="page-item"><a class="page-link" href="#">1</a></li> -->
<!--                     <li class="page-item"><a class="page-link" href="#">2</a></li> -->
<!--                     <li class="page-item"><a class="page-link" href="#">3</a></li> -->
<!--                     <li class="page-item"><a class="page-link" href="#">»</a></li> -->
<!--                 </ul> -->
<!--             </nav> -->
<!--         </div> -->
<!--     </div> -->

<div class="pagination">
    <nav aria-label="Page navigation">
        <ul class="pagination">
            <c:forEach var="page" begin="1" end="${reviewPagesTotal}">
                <li class="page-item">
                    <a class="page-link" href="?page=${reviewPage}">${reviewPage}</a>
                </li>
            </c:forEach>
        </ul>
    </nav>
</div>

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
                    <textarea class="form-control large" placeholder="추가 사유를 작성하세요" maxlength="100"></textarea>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // 신고 버튼을 눌렀을 때 모달 팝업 열리도록 하는 코드
    document.querySelector('.report-button').addEventListener('click', function() {
        new bootstrap.Modal(document.getElementById('reportModal')).show();
    });
</script>

<script>
    function toggleLike(button) {
        var likeCountElement = button.querySelector('.like-count');
        var currentCount = parseInt(likeCountElement.innerText.replace('+', ''));
        if (button.classList.contains('liked')) {
            button.classList.remove('liked');
            likeCountElement.innerText = `+${currentCount - 1}`;
        } else {
            button.classList.add('liked');
            likeCountElement.innerText = `+${currentCount + 1}`;
        }
    }
</script>
	<jsp:include page="/WEB-INF/views/inc/footer.jsp"></jsp:include>
</body>
</html>
