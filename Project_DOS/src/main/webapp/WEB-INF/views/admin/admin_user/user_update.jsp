<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>멤버 정보 수정</title>
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

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px;
        }

        label {
            font-size: 16px;
            font-weight: bold;
            display: block;
        }

        input[type="text"], input[type="email"], input[type="date"] {
            width: 300px;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 20px;
            text-align: center;
        }

        .button-group {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }

        .button-group button {
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 20px;
            border: none;
            cursor: pointer;
        }

        .button-group .submit-button {
            background-color: #888;
            color: white;
        }

        .button-group .submit-button:hover {
            background-color: #666;
        }

        .button-group .back-button {
            background-color: #000;
            color: white;
        }

        .button-group .back-button:hover {
            background-color: #333;
        }
    </style>
</head>
<body>
    <!-- Top 메뉴 포함 -->
    <jsp:include page="/WEB-INF/views/inc/admin_top.jsp"></jsp:include>

    <div class="container2">
        <h1>멤버 정보 수정</h1>
        <hr>
        
        <!-- 멤버 정보 수정 폼 -->
        <form action="/member/update" method="post">
            <div>
                <label for="id">아이디</label>
                <input type="text" id="id" name="id" value="sehyun" readonly>
            </div>
            <div>
                <label for="name">이름</label>
                <input type="text" id="name" name="name" value="정세현">
            </div>
            <div>
                <label for="birthdate">생년월일</label>
                <input type="text" id="birthdate" name="birthdate" value="2001.06.06">
            </div>
            <div>
                <label for="email">이메일</label>
                <input type="email" id="email" name="email" value="wjwdtpgus@gmail.com">
            </div>

            <!-- 버튼 그룹 -->
            <div class="button-group">
                <button type="submit" class="submit-button">수정하기</button>
                <button type="button" class="back-button" onclick="history.back();">뒤로가기</button>
            </div>
        </form>
    </div>
</body>
</html>
