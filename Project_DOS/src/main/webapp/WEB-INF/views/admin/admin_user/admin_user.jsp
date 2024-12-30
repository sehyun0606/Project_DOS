<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>고객 관리</title>
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

        .search-filter {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
        }

        .search-filter select, .search-filter input {
            padding: 8px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th, table td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        table th {
            background-color: #f4f4f4;
            font-weight: bold;
        }

        .membership-icon {
            font-size: 24px;
        }

        .button-group {
            margin-top: 20px;
            text-align: right;
        }

        .button-group button {
            padding: 10px 20px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f4f4f4;
            cursor: pointer;
        }

        .button-group button:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <!-- Top 메뉴 포함 -->
    <jsp:include page="/WEB-INF/views/inc/admin_top.jsp"></jsp:include>

    <div class="container2">
        <h1>고객 관리</h1>
        <hr>

        <!-- 검색 필터 -->
        <div class="search-filter">
            <label for="filter">검색 필터</label>
            <select id="filter" name="filter">
                <option value="id">ID</option>
                <option value="name">이름</option>
                <option value="birthdate">생년월일</option>
            </select>
            <input type="text" id="searchInput" name="searchInput" placeholder="검색어 입력">
        </div>

        <!-- 테이블 -->
        <table>
            <thead>
                <tr>
                    <th>이름</th>
                    <th>ID</th>
                    <th>생년월일</th>
                    <th>멤버십</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>세현</td>
                    <td>sehyun</td>
                    <td>2001.06.06</td>
                    <td><span class="membership-icon">⭐</span></td>
                </tr>
            </tbody>
        </table>

        <!-- 버튼 -->
        <div class="button-group">
            <button type="button" onclick="location.href='UserUpdate'">고객 정보 수정</button>
        </div>
    </div>
</body>
</html>
