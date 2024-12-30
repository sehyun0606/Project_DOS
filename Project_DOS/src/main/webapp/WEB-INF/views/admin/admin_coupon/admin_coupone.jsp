<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>쿠폰 관리</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container2 {
            display: flex;
            justify-content: space-between;
            width: 80%;
            margin: 30px auto;
            margin-top: 10%;
        }

        .section {
            width: 48%;
        }

        h2 {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input[type="text"] {
            width: 100%;
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .form-group .submit-btn {
            display: block;
            width: 100%;
            padding: 10px;
            font-size: 16px;
            background-color: #000;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }

        .form-group .submit-btn:hover {
            opacity: 0.8;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table th,
        table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
            font-size: 14px;
        }

        table th {
            background-color: #f4f4f4;
            font-weight: bold;
        }

        .delete-btn {
            padding: 5px 10px;
            font-size: 12px;
            background-color: #ff4d4d;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .delete-btn:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <!-- Top 메뉴 포함 -->
    <jsp:include page="/WEB-INF/views/inc/admin_top.jsp"></jsp:include>

    <div class="container2">
        <!-- 쿠폰 발급 -->
        <div class="section">
            <h2>쿠폰 발급</h2>
            <form action="/coupon/create" method="post">
                <div class="form-group">
                    <label for="couponName">쿠폰 이름</label>
                    <input type="text" id="couponName" name="couponName" placeholder="쿠폰 이름 입력" required>
                </div>
                <div class="form-group">
                    <label for="discountValue">할인 가격</label>
                    <input type="text" id="discountValue" name="discountValue" placeholder="할인 가격 입력 (예: 30%)" required>
                </div>
                <button type="submit" class="submit-btn">등록하기</button>
            </form>
        </div>

        <!-- 쿠폰 목록 -->
        <div class="section">
            <h2>쿠폰 목록</h2>
            <table>
                <thead>
                    <tr>
                        <th>쿠폰 이름</th>
                        <th>등록 날짜</th>
                        <th>할인 가격</th>
                        <th>삭제</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- 예제 데이터 -->
                    <tr>
                        <td>30% 할인 쿠폰</td>
                        <td>2024-12-25</td>
                        <td>30%</td>
                        <td><button class="delete-btn" onclick="deleteCoupon(1)">삭제</button></td>
                    </tr>
                    <tr>
                        <td>10% 할인 쿠폰</td>
                        <td>2024-12-20</td>
                        <td>10%</td>
                        <td><button class="delete-btn" onclick="deleteCoupon(2)">삭제</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <script>
        function deleteCoupon(couponId) {
            if (confirm("정말 삭제하시겠습니까?")) {
                // 쿠폰 삭제 요청 전송
                location.href = "/coupon/delete?id=" + couponId;
            }
        }
    </script>
</body>
</html>
