<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Coupon & Gift Card</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/css/side.css" rel="stylesheet" type="text/css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        .main {
            display: flex;
        }

        .content {
            flex: 1;
            padding: 20px;
        }

        h2 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .card-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .card {
            width: calc(25% - 20px);
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 10px;
            text-align: center;
            padding: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .card img {
            width: 100%;
            max-height: 150px;
            object-fit: cover;
            border-bottom: 1px solid #ddd;
            margin-bottom: 10px;
        }

        .card p {
            margin: 5px 0;
        }

        .card .price {
            font-weight: bold;
            color: #333;
        }

        .card .date {
            font-size: 0.9em;
            color: #777;
        }
    </style>
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
    </header>
    <div class="main">
        <!-- 사이드 메뉴 -->
        <div id="side-menu">
            <jsp:include page="/WEB-INF/views/inc/side.jsp"></jsp:include>
        </div>
        <!-- 메인 콘텐츠 -->
        <div class="content">
            <h2>My Coupone</h2>
            <div class="card-container">
                <div class="card">
                    <img src="/resources/images/sample_coupon.png" alt="Coupon Image">
                    <p>쿠폰 이름</p>
                    <p class="price">$0</p>
                    <p class="date">XX.XX.XX-XX.XX.XX</p>
                </div>
                <div class="card">
                    <img src="/resources/images/sample_coupon.png" alt="Coupon Image">
                    <p>쿠폰 이름</p>
                    <p class="price">$0</p>
                    <p class="date">XX.XX.XX-XX.XX.XX</p>
                </div>
                <div class="card">
                    <img src="/resources/images/sample_coupon.png" alt="Coupon Image">
                    <p>쿠폰 이름</p>
                    <p class="price">$0</p>
                    <p class="date">XX.XX.XX-XX.XX.XX</p>
                </div>
            </div>

            <h2>My Gift</h2>
            <div class="card-container">
                <div class="card">
                    <img src="/resources/images/sample_gift.png" alt="Gift Image">
                    <p>기프티콘 이름</p>
                    <p class="price">$0</p>
                    <p class="date">XX-XXXX-XXXX-XXX</p>
                </div>
                <div class="card">
                    <img src="/resources/images/sample_gift.png" alt="Gift Image">
                    <p>기프티콘 이름</p>
                    <p class="price">$0</p>
                    <p class="date">XX-XXXX-XXXX-XXX</p>
                </div>
                <div class="card">
                    <img src="/resources/images/sample_gift.png" alt="Gift Image">
                    <p>기프티콘 이름</p>
                    <p class="price">$0</p>
                    <p class="date">XX-XXXX-XXXX-XXX</p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
