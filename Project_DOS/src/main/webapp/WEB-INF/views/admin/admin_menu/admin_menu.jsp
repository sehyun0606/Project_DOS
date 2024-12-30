<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메뉴 관리</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <style>
        /* 공통 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        h1, h2 {
            text-align: center;
        }

        .menu-container {
            padding: 20px;
        }

        .menu-category {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .menu-category button {
            margin: 0 10px;
            padding: 10px 20px;
            background-color: #f5f5f5;
            border: 1px solid #ddd;
            cursor: pointer;
            font-size: 16px;
        }

        .menu-category button:hover {
            background-color: #ddd;
        }

        .menu-list {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
        }

        .menu-item {
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 300px;
            padding: 10px;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
        }

        .menu-item img {
            width: 100%;
            height: auto;
            border-radius: 5px;
        }

        .menu-info {
            text-align: center;
            margin-top: 10px;
        }

        .menu-info h3 {
            font-size: 18px;
            margin: 10px 0;
        }

        .menu-info p {
            color: #666;
            font-size: 14px;
        }

        .menu-info .price {
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }

        .menu-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }

        .menu-buttons button {
            flex: 1;
            margin: 0 5px;
            padding: 10px;
            font-size: 14px;
            background-color: #f5f5f5;
            border: 1px solid #ddd;
            cursor: pointer;
            border-radius: 5px;
        }

        .menu-buttons button:hover {
            background-color: #ddd;
        }
        .add{
        	width: 10%;
        	margin-left: 80%;
        }
    </style>
</head>
<body>
    <!-- Top 메뉴 포함 -->
    <jsp:include page="/WEB-INF/views/inc/admin_top.jsp"></jsp:include>

    <!-- 본문 내용 -->
    <div class="menu-container">
        <h1>메뉴 관리</h1>
        <div class="menu-buttons add">
                    <button onclick="location.href='MenuAdd'">메뉴 추가 버튼</button>
        </div>
        <div class="menu-category">
            <button>스테이크</button>
            <button>세트메뉴</button>
            <button>파스타</button>
            <button>샐러드</button>
            <button>사이드</button>
            <button>주류</button>
        </div>

        <h2>SET Menu</h2>

        <div class="menu-list">
            <!-- 메뉴 아이템 -->
            <div class="menu-item">
                <img src="/images/sample-image.jpg" alt="메뉴 이미지">
                <div class="menu-info">
                    <h3>메뉴 이름</h3>
                    <p>메뉴 소개</p>
                    <div class="price">9999원</div>
                </div>
                <div class="menu-buttons">
                    <button>메뉴 편집 버튼</button>
                    <button>메뉴 삭제 버튼</button>
                </div>
            </div>

            <!-- 복사 가능한 메뉴 블록 -->
            <div class="menu-item">
                <img src="/images/sample-image.jpg" alt="메뉴 이미지">
                <div class="menu-info">
                    <h3>메뉴 이름</h3>
                    <p>메뉴 소개</p>
                    <div class="price">9999원</div>
                </div>
                <div class="menu-buttons">
                    <button>메뉴 편집 버튼</button>
                    <button>메뉴 삭제 버튼</button>
                </div>
            </div>
            <div class="menu-item">
                <img src="/images/sample-image.jpg" alt="메뉴 이미지">
                <div class="menu-info">
                    <h3>메뉴 이름</h3>
                    <p>메뉴 소개</p>
                    <div class="price">9999원</div>
                </div>
                <div class="menu-buttons">
                    <button>메뉴 편집 버튼</button>
                    <button>메뉴 삭제 버튼</button>
                </div>
            </div>
            <div class="menu-item">
                <img src="/images/sample-image.jpg" alt="메뉴 이미지">
                <div class="menu-info">
                    <h3>메뉴 이름</h3>
                    <p>메뉴 소개</p>
                    <div class="price">9999원</div>
                </div>
                <div class="menu-buttons">
                    <button>메뉴 편집 버튼</button>
                    <button>메뉴 삭제 버튼</button>
                </div>
            </div>
            <div class="menu-item">
                <img src="/images/sample-image.jpg" alt="메뉴 이미지">
                <div class="menu-info">
                    <h3>메뉴 이름</h3>
                    <p>메뉴 소개</p>
                    <div class="price">9999원</div>
                </div>
                <div class="menu-buttons">
                    <button>메뉴 편집 버튼</button>
                    <button>메뉴 삭제 버튼</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>