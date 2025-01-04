<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>FAQ 편집</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container2 {
            width: 80%;
            margin: 30px auto;
            text-align: center;
            background-color: #f4f4f4;
            padding: 20px;
            border-radius: 10px;
        }

        h1 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
            font-weight: bold;
        }

        .form-group input[type="text"],
        .form-group textarea {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 5px;
            resize: none;
        }

        .form-group textarea {
            height: 200px;
        }

        .form-group input[type="file"] {
            display: block;
            margin-top: 10px;
        }

        .action-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .action-buttons button {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            color: #fff;
        }

        .action-buttons .back {
            background-color: #555;
        }

        .action-buttons .submit {
            background-color: #000;
        }

        .action-buttons button:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <!-- Top 메뉴 포함 -->
    <jsp:include page="/WEB-INF/views/inc/admin_top.jsp"></jsp:include>

    <div class="container2">
        <h1>FAQ편집</h1>

        <form action="AdminFAQ" method="post">
            <!-- 제목 입력 -->
            <div class="form-group">
                <label for="title">제목 작성</label>
                <input type="text" id="title" name="faq_title" placeholder="제목을 입력하세요" value="${FaqList.faq_title}" required>
            </div>

            <!-- 내용 입력 -->
            <div class="form-group">
                <label for="content">FAQ 내용 작성</label>
                <textarea id="content" name="faq_content" placeholder="공지사항 내용을 입력하세요" required>${FaqList.faq_content}</textarea>
            </div>


            <!-- 버튼 -->
            <div class="action-buttons">
                <button type="button" class="back" onclick="location.href='AdminNotice'">뒤로가기</button>
                <button type="submit" class="submit">작성 완료</button>
            </div>
        </form>
    </div>
</body>
</html>
