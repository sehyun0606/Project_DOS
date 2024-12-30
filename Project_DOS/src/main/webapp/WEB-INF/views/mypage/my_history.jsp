<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>History</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/css/side.css" rel="stylesheet" type="text/css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        .main {
            display: flex;
        }

        .content {
            flex: 1;
            padding: 20px;
        }

        h2 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table th, table td {
            border-bottom: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        table th {
            font-weight: bold;
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .pagination a {
            margin: 0 5px;
            padding: 8px 12px;
            text-decoration: none;
            border: 1px solid #ccc;
            border-radius: 5px;
            color: #333;
        }

        .pagination a:hover {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
    </header>
    <div class="main">
        <!-- 사이드 메뉴 -->
        <div id="side-menu">
            <jsp:include page="/WEB-INF/views/inc/side.jsp"></jsp:include>
        </div>
        <!-- 메인 콘텐츠 -->
        <div class="content">
            <h2>History</h2>
            <table>
                <tr>
                    <th>예약</th>
                    <th>인원 수</th>
                    <th>결제 비용</th>
                    <th>결제 방식</th>
                </tr>
                <tr>
                    <td>2XXX.XX.XX</td>
                    <td>인원 수</td>
                    <td>결제 비용</td>
                    <td></td>
                </tr>
                <tr>
                    <td>기프티콘</td>
                    <td></td>
                    <td>결제 비용</td>
                    <td>결제 방식</td>
                </tr>
                <tr>
                    <td>2XXX.XX.XX</td>
                    <td>인원 수</td>
                    <td>결제 비용</td>
                    <td></td>
                </tr>
            </table>

            <!-- 페이지네이션 -->
            <div class="pagination">
                <a href="#">&laquo;</a>
                <a href="#">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
                <a href="#">6</a>
                <a href="#">7</a>
                <a href="#">8</a>
                <a href="#">9</a>
                <a href="#">10</a>
                <a href="#">&raquo;</a>
            </div>
        </div>
    </div>
</body>
</html>
