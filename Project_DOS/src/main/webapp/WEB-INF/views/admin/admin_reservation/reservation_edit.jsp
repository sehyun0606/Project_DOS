<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>날짜 수정</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .main-container {
            width: 80%;
            margin: 0 auto;
            text-align: center;
        }

        h1, h2 {
            margin: 10px 0;
        }

        .date-picker {
            margin: 20px 0;
        }

        .box-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
            justify-content: center;
            margin: 20px auto;
            width: 300px;
        }

        .box {
            width: 80px;
            height: 80px;
            background-color: #d3d3d3;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 1.5rem;
            font-weight: bold;
            color: black;
            cursor: pointer;
            border: 1px solid #ccc;
            transition: background-color 0.3s;
        }

        .box:hover {
            background-color: #b0b0b0;
        }

        .input-group {
            margin: 15px 0;
        }

        input[type="text"], input[type="password"] {
            width: 200px;
            padding: 8px;
            margin: 10px 0;
            font-size: 1rem;
        }

        .button-group button {
            padding: 10px 20px;
            font-size: 1rem;
            margin: 10px 5px;
            cursor: pointer;
        }
    </style>
    <script>
        function handleBoxClick(number) {
            alert("박스 " + number + "번을 클릭했습니다.");
        }
    </script>
</head>
<body>
    <div class="main-container">
        <h1>예약자 이름</h1>
        <h2>날짜 수정</h2>

        <!-- 날짜 선택 -->
        <div class="date-picker">
            <label for="date">Date</label>
            <input type="date" id="date" name="date">
        </div>

        <!-- 네모 박스 -->
        <div class="box-container">
            <c:forEach var="i" begin="1" end="9">
                <div class="box" onclick="handleBoxClick(${i})">${i}</div>
            </c:forEach>
        </div>

        <!-- 입력 폼 -->
        <div class="input-group">
            <label for="time">시간 입력:</label>
            <input type="text" id="time" name="time" placeholder="예: 8:00">
        </div>
        <div class="input-group">
            <label>인원 선택:</label>
            <div>
                <label><input type="checkbox" name="person" value="1"> 1인</label>
                <label><input type="checkbox" name="person" value="2"> 2인</label>
                <label><input type="checkbox" name="person" value="3"> 3인</label>
                <label><input type="checkbox" name="person" value="4"> 4인</label>
            </div>
        </div>
        <div class="input-group">
            <label for="password">비밀번호:</label>
            <input type="password" id="password" name="password">
        </div>

        <!-- 버튼 -->
        <div class="button-group">
            <button type="button" onclick="alert('수정되었습니다!')">편집</button>
        </div>
    </div>
</body>
</html>
