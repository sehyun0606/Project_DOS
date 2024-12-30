<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>이벤트 등록</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 30px auto;
        }

        h1 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            justify-content: space-between;
        }

        .left-section,
        .right-section {
            width: 48%;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input[type="text"],
        .form-group input[type="date"],
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .form-group textarea {
            height: 120px;
            resize: none;
        }

        .checkbox-group {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .checkbox-group label {
            font-size: 14px;
            margin-left: 10px;
        }

        .file-input {
            margin-bottom: 20px;
        }

        .file-input label {
            font-size: 14px;
            margin-bottom: 5px;
            display: block;
        }

        .file-input input[type="file"] {
            font-size: 14px;
        }

        .buttons {
            display: flex;
            justify-content: space-between;
        }

        .buttons button {
            width: 48%;
            padding: 10px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .back-btn {
            background-color: #ddd;
            color: #000;
        }

        .back-btn:hover {
            opacity: 0.8;
        }

        .submit-btn {
            background-color: #000;
            color: #fff;
        }

        .submit-btn:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <!-- Top 메뉴 포함 -->
    <jsp:include page="/WEB-INF/views/inc/admin_top.jsp"></jsp:include>

    <div class="container">
        <h1>이벤트 등록</h1>
        <form action="/event/create" method="post" enctype="multipart/form-data">
            <!-- Left Section -->
            <div class="left-section">
                <div class="form-group">
                    <label for="title">제목 작성</label>
                    <input type="text" id="title" name="title" placeholder="이벤트 제목 입력" required>
                </div>
                <div class="form-group">
                    <label for="content">내용 작성</label>
                    <textarea id="content" name="content" placeholder="이벤트 내용을 입력하세요." required></textarea>
                </div>
                <div class="file-input">
                    <label for="attachment">첨부 파일</label>
                    <input type="file" id="attachment" name="attachment">
                </div>
            </div>

            <!-- Right Section -->
            <div class="right-section">
                <div class="form-group">
                    <label for="endDate">이벤트 마감 기한</label>
                    <input type="date" id="endDate" name="endDate" required>
                </div>
                <div class="checkbox-group">
                    <input type="checkbox" id="display" name="display">
                    <label for="display">상시 유무</label>
                </div>
                <div class="form-group">
                    <label for="couponSelect">쿠폰 선택</label>
                    <select id="couponSelect" name="couponId">
                        <option value="">선택하세요</option>
                        <option value="1">30% 할인 쿠폰</option>
                        <option value="2">10% 할인 쿠폰</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="couponSelect">이벤트 선택</label>
                    <select id="couponSelect" name="couponId">
                        <option value="">선택하세요</option>
                        <option value="1">일반 이벤트</option>
                        <option value="2">리뷰이벤트</option>
                        <option value="3">블랙 멤버쉽 이벤트</option>
                        <option value="4">레드 멤버쉽 이벤트</option>
                        <option value="5">화이트 멤버쉽 이벤트</option>
                    </select>
                </div>
            </div>
        </form>

        <!-- Buttons -->
        <div class="buttons">
            <button type="button" class="back-btn" onclick="history.back();">뒤로가기</button>
            <button type="submit" class="submit-btn">작성 완료</button>
        </div>
    </div>
</body>
</html>
