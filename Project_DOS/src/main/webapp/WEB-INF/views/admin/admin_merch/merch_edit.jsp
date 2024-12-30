<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>밀키트 등록</title>
    <!-- CSS는 top.jsp에서 제외 -->
   	<link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container2 {
            width: 80%;
            margin: 0 auto;
            text-align: center;
            margin-top: 30px;
        }

        h1 {
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .form-section {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            gap: 20px;
            margin-top: 20px;
        }

        .form-section img {
            width: 150px;
            height: 150px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f4f4f4;
        }

        .form-inputs {
            text-align: left;
        }

        .form-inputs label {
            display: block;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .form-inputs input, .form-inputs select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        .button-group {
            margin-top: 20px;
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .button-group button {
            padding: 10px 20px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f4f4f4;
            cursor: pointer;
        }

        .button-group button:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <!-- Top 메뉴 포함 -->
    <jsp:include page="/WEB-INF/views/inc/admin_top.jsp"></jsp:include>

    <div class="container2">
        <h1>굿즈 등록</h1>
        <hr>

        <div class="form-section">
            <!-- 이미지 프리뷰 영역 -->
            <img src="/images/default-image.png" alt="이미지 미리보기">

            <!-- 입력 폼 영역 -->
            <div class="form-inputs">
                <form action="/mealKit/register" method="post">
                    <label for="mealKitName">굿즈 이름</label>
                    <input type="text" id="mealKitName" name="mealKitName" placeholder="밀키트 이름 입력" required>

                    <label for="price">가격</label>
                    <input type="number" id="price" name="price" placeholder="가격 입력" required>

                    <label for="category">카테고리</label>
                    <select id="category" name="category">
                        <option value="">카테고리 선택</option>
                        <option value="korean">인형</option>
                        <option value="japanese">텀블러</option>
                        <option value="western">식기</option>
                    </select>

                    <!-- 버튼 그룹 -->
                    <div class="button-group">
                        <button type="button" onclick="history.back()">뒤로가기</button>
                        <button type="submit">등록하기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
