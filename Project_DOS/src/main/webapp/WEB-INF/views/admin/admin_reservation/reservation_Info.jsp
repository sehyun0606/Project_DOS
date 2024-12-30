<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약 상세</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .main-container {
            width: 80%;
            margin: 0 auto;
        }

        .date-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .date-header h1 {
            font-size: 2rem;
            margin: 0;
        }

        .date-header p {
            font-size: 1.2rem;
            margin: 5px 0;
        }

        .box-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
            justify-content: center;
            margin: 20px 0;
        }

        .box {
            width: 100px;
            height: 100px;
            background-color: #d3d3d3;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 1.5rem;
            font-weight: bold;
            color: black;
            border: 1px solid #ccc;
        }

        .reservation-list {
            margin-top: 30px;
            border-top: 1px solid #ccc;
            padding-top: 20px;
        }

        .reservation-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 10px 0;
            padding: 10px;
            border: 1px solid #ddd;
        }

        .reservation-item button {
            padding: 5px 10px;
            margin-left: 10px;
            font-size: 0.9rem;
            cursor: pointer;
        }

        .edit-button {
            background-color: #4CAF50;
            color: white;
            border: none;
        }

        .cancel-button {
            background-color: #f44336;
            color: white;
            border: none;
        }
    </style>
</head>
<body>
    <div class="main-container">
        <div class="date-header">
            <h1>12월 1일</h1>
            <p>예약한 팀 : 0</p>
        </div>

        <div class="box-container">
            <c:forEach var="i" begin="1" end="9">
                <div class="box">${i}</div>
            </c:forEach>
        </div>

        <div class="reservation-list">
            <!-- 서버에서 전달된 시간 리스트 -->
            <c:set var="timeList" value="${'12:00,2:00,4:00,6:00,8:00'}" />
            <c:forEach var="time" items="${timeList}">
                <div class="reservation-item">
                    <span>${time} 예약자 이름</span>
                    <div>
                        <button class="edit-button" onclick="location.href='ReservationEdit'">편집</button>
                        <button class="cancel-button">예약 취소</button>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
