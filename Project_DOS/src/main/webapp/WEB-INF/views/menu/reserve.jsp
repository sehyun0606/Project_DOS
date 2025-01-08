<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약 페이지</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/reserve.css'/>">
    <style>
        body {
            
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin-top: 10;
        }
        .container {
            text-align: center;
        }
        .title-container {
            display: flex;
            align-items: center;
            gap: 10px;
            justify-content: center;
        }
        .table-selection {
            margin-top: 20px;
        }
        .table-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            justify-content: center;
        }
        .table-cell {
            width: 80px;
            height: 60px;
            background-color: lightgray;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            margin: auto;
            cursor: pointer;
        }
        .table-large {
            height: 100px;
        }
        .table-cell.selected {
            background-color: dimgrey;
            color: white;
            border: 1px solid black;
        }
        button:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }
        .time-btn.selected {
            background-color: dimgrey;
            color: white;
        }
        #top-menu {
        	width:100%;
        }
    </style>
</head>
<body>
	<div id="top-menu">
		<jsp:include page="/WEB-INF/views/main.jsp"></jsp:include>
	</div>
    <div class="container">
        <div class="title-container">
            <img src="<c:url value='/resources/images/사람.jpg'/>" alt="사람", width = 40px>
            <h2 class="reservation-title">인원을 선택해 주세요</h2>
        </div>
        <p class="reservation-subtitle">x명까지 선택 가능합니다.</p>

        <div class="person-selection">
            <label class="person-box">
                <input type="radio" name="person" class="person-radio" value="1"> 1명
            </label>
            <label class="person-box">
                <input type="radio" name="person" class="person-radio" value="2"> 2명
            </label>
            <label class="person-box">
                <input type="radio" name="person" class="person-radio" value="3"> 3명
            </label>
            <label class="person-box">
                <input type="radio" name="person" class="person-radio" value="4"> 4명
            </label>
        </div>

        <div class="rating-info">
            <span class="star">★</span><span class="rating">4.9</span>
            <div class="review">방문자 리뷰: 323</div>
        </div>

        <div class="date-selection">
            <label for="reservation-date">날짜</label>
            <input type="date" id="reservation-date" class="date-input" disabled>
        </div>

        <div class="time-selection">
            <div class="time-label">오전</div>
            <div class="time-buttons">
                <button class="time-btn" disabled>10:00</button>
                <button class="time-btn" disabled>11:00</button>
            </div>

            <div class="time-label">오후</div>
            <div class="time-buttons">
                <button class="time-btn" disabled>12:00</button>
                <button class="time-btn" disabled>13:00</button>
                <button class="time-btn" disabled>14:00</button>
                <button class="time-btn" disabled>15:00</button>
                <button class="time-btn" disabled>16:00</button>
                <button class="time-btn" disabled>17:00</button>
                <button class="time-btn" disabled>18:00</button>
                <button class="time-btn" disabled>19:00</button>
                <button class="time-btn" disabled>20:00</button>
            </div>
        </div>
        

        <div class="table-selection">
            <h3>테이블 예약</h3>
            <div class="table-grid">
                <div class="table-cell" data-group="1-2">1
                    <span style="font-size: 12px; color: gray;">(1~2)</span> 
                </div>
                
                <div class="table-cell table-large" data-group="3-4">2
                    <span style="font-size: 12px; color: gray;">(3~4)</span> 
                </div>
                <div class="table-cell" data-group="1-2">3
                    <span style="font-size: 12px; color: gray;">(1~2)</span> 
                </div>
                <div class="table-cell" data-group="1-2">4
                    <span style="font-size: 12px; color: gray;">(1~2)</span> 
                </div>
                <div class="table-cell table-large" data-group="3-4">5
                    <span style="font-size: 12px; color: gray;">(3~4)</span> 
                </div>
                <div class="table-cell table-large"="3-4">6
                    <span style="font-size: 12px; color: gray;">(3~4)</span> 
                </div>
                <div class="table-cell" data-group="1-2">7
                    <span style="font-size: 12px; color: gray;">(1~2)</span> 
                </div>
                <div class="table-cell " data-group="1-2">8
                    <span style="font-size: 12px; color: gray;">(1~2)</span> 
                </div>
                <div class="table-cell" data-group="1-2">9
                    <span style="font-size: 12px; color: gray;">(1~2)</span> 
                </div>
            </div>
        </div>

        <div class="next-button-container">
            <button class="next-btn" disabled>다음</button>
        </div>
    </div>
    <script>
        const radios = document.querySelectorAll('.person-radio');
        const dateInput = document.querySelector('.date-input');
        const timeButtons = document.querySelectorAll('.time-btn');
        const tableCells = document.querySelectorAll('.table-cell');
        const nextButton = document.querySelector('.next-btn');

        let selectedPeople = 0;
        let timeSelected = false;

        radios.forEach(radio => {
            radio.addEventListener('change', () => {
                selectedPeople = parseInt(radio.value);
                dateInput.disabled = false;
            });
        });

        dateInput.addEventListener('change', () => {
            timeButtons.forEach(btn => btn.disabled = false);
        });

        timeButtons.forEach(btn => {
            btn.addEventListener('click', () => {
                timeButtons.forEach(b => b.classList.remove('selected'));
                btn.classList.add('selected');
                timeSelected = true;
            });
        });

        tableCells.forEach(cell => {
            cell.addEventListener('click', () => {
                const group = cell.getAttribute('data-group');
                if ((selectedPeople <= 2 && group === '3-4') || (selectedPeople >= 3 && group === '1-2')) {
                    alert('예약 인원에 맞는 자리를 선택해 주세요');
                } else if (timeSelected) {
                    tableCells.forEach(c => c.classList.remove('selected'));
                    cell.classList.add('selected');
                    nextButton.disabled = false;
                } else {
                    alert('먼저 시간을 선택해주세요.');
                }
            });
        });
    </script>
</body>
</html>
