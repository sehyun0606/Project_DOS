<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Question</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/css/side.css" rel="stylesheet" type="text/css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .main {
            display: flex;
            flex: 1;
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
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        table th {
            background-color: #f4f4f4;
            font-weight: bold;
        }
		.actions{
			width : 10%;
		}
        table td.action-buttons {
            text-align: center;
            width: 200px; /* Actions 셀의 최대 너비를 제한 */
        }

        .action-buttons {
            display: flex;
            justify-content: center; /* 버튼을 가운데 정렬 */
            gap: 10px; /* 버튼 간의 간격을 10px로 설정 */
        }

        .action-buttons button {
            padding: 5px 10px;
            border: 1px solid #ccc;
            background-color: white;
            border-radius: 5px;
            cursor: pointer;
        }

        .action-buttons button:hover {
            background-color: #007bff;
            color: white;
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
            <h2>My Question</h2>
            <table>
                <thead>
                    <tr>
                        <th>제목</th>
                        <th>날짜</th>
                        <th class="actions">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>제목</td>
                        <td>2XXX.XX.XX</td>
                        <td class="action-buttons">
                            <button>수정하기</button>
                            <button>삭제하기</button>
                        </td>
                    </tr>
                    <tr>
                        <td>제목</td>
                        <td>2XXX.XX.XX</td>
                        <td class="action-buttons">
                            <button>수정하기</button>
                            <button>삭제하기</button>
                        </td>
                    </tr>
                    <tr>
                        <td>제목</td>
                        <td>2XXX.XX.XX</td>
                        <td class="action-buttons">
                            <button>수정하기</button>
                            <button>삭제하기</button>
                        </td>
                    </tr>
                    <tr>
                        <td>제목[답변완료!]</td>
                        <td>2XXX.XX.XX</td>
                        <td class="action-buttons">
                            <button>수정하기</button>
                            <button>삭제하기</button>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="pagination">
                <a href="#">&#8592;</a>
                <a href="#">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
                <a href="#">&#8594;</a>
            </div>
        </div>
    </div>
</body>
</html>
