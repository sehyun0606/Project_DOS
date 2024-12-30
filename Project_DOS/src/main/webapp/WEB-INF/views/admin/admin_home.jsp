<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <style>
        .dashboard {
            width: 80%;
            margin: 0 auto;
            text-align: center;
        }

        .sales-section {
            margin-top: 20px;
        }

        .graph-container {
            display: flex;
            justify-content: space-around;
            margin-top: 30px;
        }

        .graph {
            width: 300px;
            height: 300px;
            background-color: #f0f0f0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .stats {
            margin-top: 40px;
            display: flex;
            justify-content: space-around;
        }

        .stat-item {
            text-align: center;
        }

        .stat-item h3 {
            margin: 0;
        }

        canvas {
            width: 100% !important;
            height: auto !important;
        }
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/inc/admin_top.jsp"></jsp:include>
    
    <div class="dashboard">
        <div class="sales-section">
            <h1>₩0</h1>
            <h2>오늘 하루 매출</h2>
        </div>

        <div class="graph-container">
            <!-- 첫 번째 그래프 -->
            <div class="graph">
            	<h3>멤버쉽 분포</h3>
                <canvas id="membershipGraph"></canvas>
            </div>
            <!-- 두 번째 그래프 -->
            <div class="graph">
            	<h3>상품 인기 매출</h3>
                <canvas id="popularProductsGraph"></canvas>
            </div>
        </div>

        <div class="stats">
            <div class="stat-item">
                <h3>0</h3>
                <p><a href="AdminReservation">당일 신규 예약</a></p>
            </div>
            <div class="stat-item">
                <h3>0</h3>
                <p>이번주 총 예약</p>
            </div>
            <div class="stat-item">
                <h3>0.00</h3>
                <p>총 평점</p>
            </div>
            <div class="stat-item">
                <h3>0</h3>
                <p>신규 리뷰</p>
            </div>
            <div class="stat-item">
                <h3>0</h3>
                <p>신규 문의</p>
            </div>
        </div>
    </div>

    <script>
        // 첫 번째 그래프: 등급별 멤버십 가입자
        const membershipCtx = document.getElementById('membershipGraph').getContext('2d');
        const membershipChart = new Chart(membershipCtx, {
            type: 'bar',
            data: {
                labels: ['화이트', '레드', '블랙'],
                datasets: [{
                    label: '가입자 수',
                    data: [10, 20, 30], // 초기 데이터
                    backgroundColor: ['#ffffff', '#ff0000', '#000000'],
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { display: false }
                },
                scales: {
                    y: { beginAtZero: true }
                }
            }
        });

        // 두 번째 그래프: 인기 상품
        const productsCtx = document.getElementById('popularProductsGraph').getContext('2d');
        const productsChart = new Chart(productsCtx, {
            type: 'bar',
            data: {
                labels: ['스테이크', '파스타', '리조또'],
                datasets: [{
                    label: '판매량',
                    data: [15, 25, 10], // 초기 데이터
                    backgroundColor: ['#FF6347', '#FFD700', '#7CFC00'],
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { display: false }
                },
                scales: {
                    y: { beginAtZero: true }
                }
            }
        });

        // 데이터 수치 변경 함수
        function updateChartData(chart, index, newValue) {
            chart.data.datasets[0].data[index] = newValue;
            chart.update();
        }

        // 예제: 데이터 변경
        // updateChartData(membershipChart, 0, 50); // 화이트 등급을 50으로 변경
        // updateChartData(productsChart, 1, 40);  // 파스타 판매량을 40으로 변경
    </script>
</body>
</html>
