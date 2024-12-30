<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>공지사항 관리</title>
   	<link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container2 {
            width: 90%;
            margin: 0 auto;
            margin-top: 30px;
            text-align: center;
        }

        h1 {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #f4f4f4;
            font-weight: bold;
        }

        .search-bar {
            display: inline-flex;
            justify-content: center;
            margin-bottom: 20px;
            gap: 10px;
            width: 90%;
        }

        .search-bar select, .search-bar input[type="text"] {
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .search-bar button {
            padding: 8px 16px;
            background-color: #000;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .search-bar button:hover {
            background-color: #333;
        }

        .action-buttons {
            gap: 5px;
            width : 20%;
        }

        .action-buttons button {
            padding: 5px 10px;
            font-size: 14px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .action-buttons .edit {
            background-color: #888;
            color: white;
        }

        .action-buttons .delete {
            background-color: #555;
            color: white;
        }

        .action-buttons .edit:hover {
            background-color: #666;
        }

        .action-buttons .delete:hover {
            background-color: #333;
        }

        .create-button {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
            background-color: #000;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .create-button:hover {
            background-color: #333;
        }

        .pagination {
            margin-top: 20px;
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .pagination a {
            text-decoration: none;
            color: #000;
            padding: 5px 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .pagination a:hover {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body>
    <!-- Top 메뉴 포함 -->
    <jsp:include page="/WEB-INF/views/inc/admin_top.jsp"></jsp:include>

    <div class="container2">
        <h1>공지사항 관리</h1>

        <!-- 검색 바 -->
        <div class="search-bar">
            <select name="searchType">
                <option value="name">name</option>
                <option value="date">date</option>
            </select>
            <input type="text" name="searchQuery" placeholder="검색어를 입력하세요" style="width : 50%;">
            <button type="button">검색</button>
        </div>
		<!-- 공지사항 작성 버튼 -->
	    <button class="create-button" onclick="location.href='NoticeForm'">작성하기</button>
        <!-- 공지사항 테이블 -->
        <table>
            <thead>
                <tr>
                    <th>제목</th>
                    <th>작성일</th>
                    <th>조회수</th>
                    <th>관리</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>공지사항 제목 1</td>
                    <td>2024.12.22</td>
                    <td>22</td>
                    <td class="action-buttons">
                        <button class="edit">수정하기</button>
                        <button class="delete">삭제하기</button>
                    </td>
                </tr>
                <tr>
                    <td>공지사항 제목 2</td>
                    <td>2024.12.22</td>
                    <td>11</td>
                    <td class="action-buttons">
                        <button class="edit">수정하기</button>
                        <button class="delete">삭제하기</button>
                    </td>
                </tr>
                <tr>
                    <td>공지사항 제목 3</td>
                    <td>2024.12.22</td>
                    <td>45</td>
                    <td class="action-buttons">
                        <button class="edit">수정하기</button>
                        <button class="delete">삭제하기</button>
                    </td>
                </tr>
            </tbody>
        </table>

       

        <!-- 페이지네이션 -->
        <div class="pagination">
            <a href="#1">1</a>
            <a href="#2">2</a>
            <a href="#3">3</a>
        </div>
    </div>
</body>
</html>
