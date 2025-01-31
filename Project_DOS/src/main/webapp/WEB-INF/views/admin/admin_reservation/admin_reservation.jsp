<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>달력</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        #main {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .calendar-container {
            width: 100%;
            max-width: 600px;
            background: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        .controls {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
        }

        .controls button {
            background: white;
            border: none;
            padding: 5px 10px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            color: #007bff;
            border-radius: 4px;
            transition: background 0.3s;
        }

        .controls button:hover {
            background: #e0e0e0;
        }

        .controls .current-month {
            font-size: 18px;
            font-weight: bold;
        }

        .calendar-header {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            background-color: #f4f4f4;
            text-align: center;
            padding: 10px 0;
            font-weight: bold;
        }

        .calendar-body {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            gap: 1px;
        }

        .calendar-cell {
            width: 100%;
            height: 80px;
            display: flex;
            justify-content: center;
            align-items: center;
            background: white;
            border: 1px solid #ddd;
            cursor: pointer;
            transition: background 0.3s;
        }

        .calendar-cell:hover {
            background: #f0f8ff;
        }

        .calendar-cell.disabled {
            background: #f9f9f9;
            color: #ccc;
            cursor: not-allowed;
        }

        .calendar-cell.today {
            border: 2px solid #007bff;
            font-weight: bold;
            color: #007bff;
        }
        .title{
        	margin-top: 2%;
        	margin-left: 45%;
        }
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/inc/admin_top.jsp"></jsp:include>
    <div class="title">
		 <h1>예약 관리</h1>
    </div>
    <div id="main">
        <div class="calendar-container">
            <div class="controls">
                <button id="prev-month">이전</button>
                <span class="current-month" id="current-month"></span>
                <button id="next-month">다음</button>
            </div>

            <div class="calendar-header">
                <div>일</div>
                <div>월</div>
                <div>화</div>
                <div>수</div>
                <div>목</div>
                <div>금</div>
                <div>토</div>
            </div>

            <div class="calendar-body" id="calendar-body">
                <!-- 날짜가 동적으로 추가될 영역 -->
            </div>
        </div>
    </div>
    <script>
        const calendarBody = document.getElementById('calendar-body');
        const currentMonthLabel = document.getElementById('current-month');
        const prevMonthButton = document.getElementById('prev-month');
        const nextMonthButton = document.getElementById('next-month');

        let today = new Date(); // 현재 날짜
        let currentYear = today.getFullYear(); // 현재 연도
        let currentMonth = today.getMonth(); // 현재 월 (0 = 1월)

        function renderCalendar(year, month) {
            calendarBody.innerHTML = '';
            const firstDay = new Date(year, month, 1).getDay();
            const lastDate = new Date(year, month + 1, 0).getDate();

            // 이전 달의 날짜 계산
            const prevLastDate = new Date(year, month, 0).getDate();

            // 헤더 업데이트
            currentMonthLabel.textContent = `\${year}년 \${month + 1}월`;

            // 빈 칸 추가 (이전 달의 날짜들)
            for (let i = firstDay; i > 0; i--) {
                const cell = document.createElement('div');
                cell.classList.add('calendar-cell', 'disabled');
                cell.textContent = prevLastDate - i + 1;
                calendarBody.appendChild(cell);
            }

            // 이번 달의 날짜들 추가
            for (let date = 1; date <= lastDate; date++) {
                const cell = document.createElement('div');
                cell.classList.add('calendar-cell');
                cell.innerHTML = `\${date}`;

                if (
                    year === today.getFullYear() &&
                    month === today.getMonth() &&
                    date === today.getDate()
                ) {
                    cell.classList.add('today');
                }

                cell.addEventListener('click', () => {
                	 const popupURL = 'ReservationInfo?year='+ year +'&month='+(month+1)+'&date='+date;

                	window.open(popupURL, '_blank', 'width=600,height=800');
                });

                calendarBody.appendChild(cell);
            }

            // 다음 달의 날짜 계산 (빈 칸 채우기)
            const totalCells = calendarBody.childNodes.length;
            const remainingCells = 7 - (totalCells % 7);

            if (remainingCells < 7) {
                for (let i = 1; i <= remainingCells; i++) {
                    const cell = document.createElement('div');
                    cell.classList.add('calendar-cell', 'disabled');
                    cell.textContent = i;
                    calendarBody.appendChild(cell);
                }
            }
        }

        function changeMonth(offset) {
            currentMonth += offset;
            if (currentMonth < 0) {
                currentMonth = 11;
                currentYear--;
            } else if (currentMonth > 11) {
                currentMonth = 0;
                currentYear++;
            }
            renderCalendar(currentYear, currentMonth);
        }

        prevMonthButton.addEventListener('click', () => changeMonth(-1));
        nextMonthButton.addEventListener('click', () => changeMonth(1));

        // 초기 렌더링
        renderCalendar(currentYear, currentMonth);
    </script>
</body>
</html>
