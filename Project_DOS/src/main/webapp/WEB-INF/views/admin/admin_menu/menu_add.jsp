<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메뉴 등록</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <style>
        /* 공통 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            margin: 20px 0;
        }

        .form-container {
            width: 60%;
            margin: 0 auto;
            padding: 20px;
        }

        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .form-group label {
            flex: 1;
            font-weight: bold;
        }

        .form-group input[type="text"], 
        .form-group textarea {
            flex: 2;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-group input[type="checkbox"] {
            margin-left: 10px;
        }

        .form-group textarea {
            height: 100px;
        }

        .form-group img {
            width: 100px;
            height: 100px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-right: 15px;
        }

        .form-actions {
            text-align: center;
            margin-top: 20px;
        }

        .form-actions button {
            padding: 10px 20px;
            font-size: 16px;
            border: 1px solid #ddd;
            background-color: #f5f5f5;
            cursor: pointer;
            border-radius: 5px;
        }

        .form-actions button:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <!-- Top 메뉴 포함 -->
    <jsp:include page="/WEB-INF/views/inc/admin_top.jsp"></jsp:include>

    <!-- 본문 내용 -->
    <h1>메뉴 등록</h1>

    <div class="form-container">
        <form action="/menu/register" method="post">
            <!-- 메뉴 이름 -->
            <div class="form-group">
                <label for="menuName">메뉴 이름</label>
                <input type="text" id="menuName" name="menuName" required>
            </div>

            <!-- 가격 -->
            <div class="form-group">
                <label for="menuPrice">가격</label>
                <input type="text" id="menuPrice" name="menuPrice" required>
            </div>

            <!-- 카테고리 -->
            <div class="form-group">
                <label for="menuCategory">카테고리</label>
                <input type="text" id="menuCategory" name="menuCategory" required>
            </div>

            <!-- 이미지 업로드 -->
            <div class="form-group">
                <label for="menuImage">이미지</label>
                <img src="/images/sample-image.jpg" alt="메뉴 이미지">
                <input type="file" id="menuImage" name="menuImage" accept="image/*">
            </div>

            <!-- 키워드 표시 -->
            <div class="form-group">
                <label>키워드 표시</label>
                <div>
                    <input type="checkbox" id="newKeyword" name="newKeyword">
                    <label for="newKeyword">신메뉴 키워드 표시</label>
                    <input type="checkbox" id="popularKeyword" name="popularKeyword">
                    <label for="popularKeyword">인기메뉴 키워드 표시</label>
                </div>
            </div>

            <!-- 메뉴 소개 -->
            <div class="form-group">
                <label for="menuDescription">메뉴 소개</label>
                <textarea id="menuDescription" name="menuDescription" required>메뉴 소개 글</textarea>
            </div>

            <!-- 버튼 -->
            <div class="form-actions">
                <button type="submit">수정 완료 버튼</button>
            </div>
        </form>
    </div>
</body>
</html>
