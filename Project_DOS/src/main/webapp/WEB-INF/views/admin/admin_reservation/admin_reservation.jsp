<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약 관리</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <script>
	    function openPopup(url) {
	        const width = Math.min(window.innerWidth * 0.8, 1000); // 화면 너비의 80% 또는 최대 1000px
	        const height = Math.min(window.innerHeight * 0.8, 800); // 화면 높이의 80% 또는 최대 800px
	        const left = (window.innerWidth - width) / 2;
	        const top = (window.innerHeight - height) / 2;
	
	        window.open(url, "popupWindow", `width=${width},height=${height},left=${left},top=${top},resizable=yes,scrollbars=yes`);
	    }
	</script>
    
    <style>
        .calendar-container {
            width: 80%;
            margin: 0 auto;
            text-align: center;
        }

        .calendar-header {
            margin: 20px 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .calendar-header h2 {
            margin: 0;
            margin-right: 10px;
        }

        .calendar-header select {
            padding: 5px;
            font-size: 14px;
        }

        .calendar-grid {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            gap: 10px;
        }

        .calendar-cell {
            border: 1px solid #ddd;
            padding: 10px;
            background-color: #f9f9f9;
            text-align: left;
            position: relative;
        }

        .calendar-cell a {
            text-decoration: none;
            color: black;
        }

        .calendar-cell:hover {
            background-color: #e0e0e0;
        }

        .date-info {
            margin-top: 5px;
        }

        .calendar-cell h4 {
            margin: 0;
        }

        .date-picker {
            margin-top: 20px;
            text-align: right;
        }

        .date-picker input[type="date"] {
            padding: 5px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/inc/admin_top.jsp"></jsp:include>

    <div class="calendar-container">
        <div class="calendar-header">
            <h1>예약 관리</h1>
        </div>

        <!-- 헤더에서 월 선택 -->
        <div class="calendar-header">
            <h2>${param.month != null ? param.month + "월" : "12월"}</h2>
            <form action="calendar.jsp" method="get">
                <select id="month" name="month" onchange="this.form.submit()">
                    <c:forEach var="i" begin="1" end="12">
                        <option value="${i}" ${i == (param.month != null ? param.month : 12) ? 'selected' : ''}>
                            ${i}월
                        </option>
                    </c:forEach>
                </select>
            </form>
        </div>
        <a href="ReservationInfo"  onclick="openPopup(this.href); return false;">예약 상세 내역 테스트 링크</a>

        <div class="calendar-grid">
            <c:forEach var="day" begin="1" end="31">
                <div class="calendar-cell">
                    <a href="reservationDetail.jsp?date=2024-${param.month != null ? param.month : 12}-${day}" onclick="openPopup(this.href); return false;">
                        <h4>${day}</h4>
                        <div class="date-info">
                            <p>당일 상품 매출: 0</p>
                            <p>예약한 팀: 0</p>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
</body>

</html>
