<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약 확인</title>
    <style>
        /* 전체 페이지 기본 설정 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }


		/* 예약 페이지 전용 컨테이너 */
		.reservation-container { /* 새로운 클래스명 적용 */
		    display: flex;
		    justify-content: space-between;
		    align-items: flex-start;
		    max-width: 800px;
		    margin: 50px auto;
		    padding: 20px;
		    background-color: #fff;
		    border-radius: 8px;
		    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
		}


        /* 예약 확인 섹션 */
        .confirmation-section {
            width: 45%;
            text-align: center;
        }

        .reservation-card {
            background-color: #eaeaea;
            padding: 20px;
            border-radius: 8px;
            margin-top: 15px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .reservation-title {
            font-size: 1.5rem;
            margin-bottom: 15px;
        }

        .reservation-details {
            font-size: 1rem;
            color: #777;
            line-height: 1.8;
        }

        /* 예약자 정보 섹션 */
        .info-section {
            width: 45%;
        }

        .info-title {
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .info-details {
            font-size: 1rem;
            color: #333;
            line-height: 1.8;
        }

        .my-page-btn {
            margin-top: 20px;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            background-color: black;
            color: white;
            font-size: 1rem;
            cursor: pointer;
        }

        .my-page-btn:hover {
            background-color: #555;
        }

        /* 하단 예약 버튼 */
        .confirm-btn {
            display: block;
            margin: 30px auto;
            padding: 15px 30px;
            background-color: black;
            color: white;
            font-size: 1.2rem;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }

        .confirm-btn:hover {
            background-color: gray;
        }

        /* 세로 구분선 */
        .divider {
            width: 1px;
            background-color: #ccc;
            height: 300px;
        }
    </style>
</head>
<body>
    <!-- 예약 확인 페이지 -->
 <div class="reservation-container"> <!-- 고유 클래스명 사용 -->
        <!-- 왼쪽 예약 확인 섹션 -->
        <div class="confirmation-section">
            <h2>예약 확인</h2>
            <p class="subtitle">아래 내용이 맞는지 확인해주세요.</p>
            <div class="reservation-card">
                <h3 class="reservation-title">Dinner of Steak</h3>
                <p class="reservation-details">
                    일정: 12.19(목) 오후8시<br>
                    2번 테이블<br>
                    인원: 2명
                </p>
            </div>
        </div>

        <!-- 세로 구분선 -->
        <div class="divider"></div>

        <!-- 오른쪽 예약자 정보 섹션 -->
        <div class="info-section">
            <h2 class="info-title">예약자 정보</h2>
            <p class="info-details">
                이름: 박애진<br>
                전화번호: 010-7920-8014
            </p>
            <button class="my-page-btn">마이페이지</button>
        </div>
    </div>

    <!-- 하단 예약 버튼 -->
    <button class="confirm-btn">예약</button>
    
    
</body>
</html>
