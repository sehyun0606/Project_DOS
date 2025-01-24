<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 작성</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/css/styles_footer.css" rel="stylesheet" type="text/css"/>
    <style>
    body {
    font-family: Arial, sans-serif;
}

.container2 {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
}

h2 {
    text-align: center;
    margin-bottom: 30px;
}

.review-form {
    display: flex;
    flex-direction: column;
    gap: 20px;
}

/* 리뷰 작성 영역 감싸는 네모칸 */
.review-box {
    border: 1px solid #ddd;
    padding: 20px;
    border-radius: 10px; /* 둥글게 */
    background-color: #f4f4f4; /* 변경된 회색 */
    display: flex;
    flex-direction: column;
    gap: 20px;
}

/* 제목 입력 칸 */
.input-title {
    border: 1px solid #ddd;
    padding: 10px;
    font-size: 1.1em;
    color: #999;
    width: 100%;
    margin-bottom: 20px;
    border-radius: 10px; /* 둥글게 */
}

.input-title::placeholder {
    color: #999;
}

/* 별 모양을 위한 하얀 네모 칸 */
.star-container {
    width: 100%; /* 제목의 가로 길이에 맞게 */
    height: 40px; /* 세로 크기 */
    background-color: white; /* 하얀색 배경 */
    border: 1px solid #ddd;
    display: flex;
    justify-content: space-between; /* 왼쪽 텍스트와 오른쪽 별 배치 */
    align-items: center; /* 세로 중앙 정렬 */
    padding: 0 10px; /* 좌우 여백 */
    border-radius: 10px; /* 둥글게 */
}

/* 별점 클릭을 유도하는 텍스트 */
.star-text {
    color: #999;
    font-size: 14px;
}

/* 별 모양 */
.star {
    font-size: 30px;
    color: #ddd;
    cursor: pointer;
}

.star.filled {
    color: #ff9f00;
}

/* 리뷰 입력 칸 */
.input-review {
    border: 1px solid #ddd;
    padding: 10px;
    font-size: 1.1em;
    color: #999;
    width: 100%;
    margin-bottom: 10px;
    height: 200px; /* 높이를 2배로 키움 */
    resize: none; /* 크기 조절 비활성화 */
    overflow-y: auto; /* 텍스트가 넘칠 경우 스크롤 가능 */
    white-space: pre-wrap; /* 줄 바꿈을 자동으로 함 */
    border-radius: 10px; /* 둥글게 */
}

.input-review::placeholder {
    color: #999;
}

/* 글자수 카운트 */
.char-count {
    position: absolute;
    bottom: 10px;       /* 하단에 위치 */
    right: 10px;        /* 오른쪽 끝에 위치 */
    color: #ccc;
    font-size: 0.9em;
}

/* 첨부파일 섹션 */
.attachment {
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.attachment-item {
    display: flex;
    align-items: center;
    justify-content: space-between;
    font-size: 0.9em;
    border-bottom: 1px solid #ddd;
    padding-bottom: 5px;
}

.attachment-item .remove-btn {
    width: 20px;
    height: 20px;
    background-color: #ddd;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 14px;
    cursor: pointer;
}

.attachment-item .remove-btn:hover {
    background-color: #ff6f61;
    color: white;
}

.attachment-item .file-name {
    text-decoration: underline;
    color: #333;
    width: 50%;
    display: inline-block;
}

/* 버튼 섹션 */
.buttons {
    display: flex;
    justify-content: flex-end;
    gap: 10px;
}

.buttons button {
    background-color: #000;
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 1em;
    cursor: pointer;
    border-radius: 10px; /* 둥글게 */
}

.buttons button:hover {
    background-color: #333;
}

/* 글자 수가 1000자 초과 시 카운트 글자 빨간색으로 변경 */
.char-count.warning {
    color: red;
}

    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
<div class="container2">
    <h2>리뷰 작성</h2>

    <div class="review-form">

        <!-- 리뷰 작성 영역 -->
        <div class="review-box">
            <!-- 별점 -->
            <form action="ReviewSubmit" method="post">
				 <div class="star-container">
				        <span class="star-text">별점을 클릭해주세요</span> <!-- 왼쪽에 텍스트 -->
				    <div class="star-rating">
				        <span class="star" data-index="1">&#9733;</span>
				        <span class="star" data-index="2">&#9733;</span>
				        <span class="star" data-index="3">&#9733;</span>
				        <span class="star" data-index="4">&#9733;</span>
				        <span class="star" data-index="5">&#9733;</span>
				    </div>
				</div>
	            <!-- 제목 입력 칸 -->
	            <input name="review_title" type="text" class="input-title" placeholder="제목을 입력해주세요" required="required">
	
	            <!-- 리뷰 입력 칸 -->
	            <textarea name="review_content" class="input-review" id="review-text" placeholder="리뷰를 작성해주세요" required="required"></textarea>
	
	
	            <input type="hidden" id="stars" name="reviewRating">
	
	            <!-- 버튼 -->
	            <div class="buttons">
	                <button onclick="history.back()">취소</button>
	                <button type="submit">작성 완료</button>
	            </div>
            </form>
        </div>
    </div>

</div>

<script>
    // 별점 기능
    const stars = document.querySelectorAll('.star');
    stars.forEach(star => {
        star.addEventListener('click', () => {
            const index = parseInt(star.dataset.index);
            updateStars(index);
        });
    });

    function updateStars(rating) {
        stars.forEach(star => {
            const starIndex = parseInt(star.dataset.index);
            if (starIndex <= rating) {
                star.classList.add('filled');
            } else {
                star.classList.remove('filled');
            }
	        
        });
            $('#stars').val($(".filled").length); 
    }
    

</script>
	<jsp:include page="/WEB-INF/views/inc/footer.jsp"></jsp:include>
</body>
</html>
