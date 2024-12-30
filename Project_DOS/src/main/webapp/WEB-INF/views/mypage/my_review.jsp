<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/css/side.css" rel="stylesheet" type="text/css"/>
    <style>
        /* 리뷰 페이지를 위한 스타일 */
        .review-container {
            display: flex;

        }

        .review-sidebar {
            width: 20%;
            margin-right: 20px;
        }

        .review-content {
            flex-grow: 1;
            margin : 5%;
        }

        .review-card {
            background-color: #fdf5ff;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 10px;
        }

        .review-card .review-title {
            font-weight: bold;
            font-size: 16px;
        }

        .review-card .review-date {
            font-size: 12px;
            color: #777;
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .pagination a {
            margin: 0 5px;
            text-decoration: none;
            color: #333;
        }

        .pagination a:hover {
            text-decoration: underline;
        }

        .btn-edit {
            background-color: #e7e7e7;
            border: none;
            padding: 5px 10px;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-edit:hover {
            background-color: #ccc;
        }
    </style>
    
</head>
<body>
    <!-- 상단 네비게이션 바 포함 -->
    <jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>

    <div class="review-container">
        <!-- 사이드바 포함 -->
        <jsp:include page="/WEB-INF/views/inc/side.jsp"></jsp:include>

        <!-- 리뷰 내용 -->
        <div class="review-content">
            <h2>myReview</h2>
            <div class="review-card">
                <div class="review-title">리뷰 제목</div>
                <div class="review-date">리뷰 날짜</div>
                <button class="btn-edit">수정하기</button>
            </div>
            <div class="review-card">
                <div class="review-title">리뷰 제목</div>
                <div class="review-date">리뷰 날짜</div>
                <button class="btn-edit">수정하기</button>
            </div>
            <div class="review-card">
                <div class="review-title">리뷰 제목</div>
                <div class="review-date">리뷰 날짜</div>
                <button class="btn-edit">수정하기</button>
            </div>
            <div class="review-card">
                <div class="review-title">리뷰 제목</div>
                <div class="review-date">리뷰 날짜</div>
                <button class="btn-edit">수정하기</button>
            </div>

            <!-- 페이지네이션 -->
            <div class="pagination">
                <a href="#">&laquo;</a>
                <a href="#">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
                <a href="#">&raquo;</a>
            </div>
        </div>
    </div>
</body>
</html>
