<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 관리</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <style>
        /* 공통 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            margin: 20px 0;
        }

        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin: 0 auto;
            width: 90%;
        }

        .section {
            width: fit-content;
            margin-bottom: 20px;
            justify-content: center;
        }

        .section h2 {
            text-align: center;
            margin-bottom: 15px;
        }

        .table {
            width: 100%;
            table-layout: auto; /* 테이블 셀 크기 자동 조정 */
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .table th, .table td {
            border: 1px solid #ddd;
            text-align: center;
            padding: 10px;
            word-break: break-word; /* 긴 텍스트가 셀을 벗어나지 않도록 줄바꿈 */
        }

        .table th {
            background-color: #f9f9f9;
        }

        .table td {
            background-color: #fffafc;
        }

        .table td .stars {
            color: gold;
        }

        .table td .actions button {
            margin: 5px;
            padding: 5px 10px;
            border: 1px solid #ddd;
            background-color: #f5f5f5;
            cursor: pointer;
            border-radius: 5px;
        }

        .table td .actions button:hover {
            background-color: #ddd;
        }

        .pagination {
		    display: inline-block; /* 가운데 정렬을 위해 inline-block 설정 */
		    margin-top: 10px;
		}
		
		.section .pagination {
		    text-align: center; /* 부모 요소에서 가운데 정렬 */
		    width: 100%; /* 부모 컨테이너에 맞게 확장 */
		}

        .pagination span, .pagination button {
            cursor: pointer;
            border: 1px solid #ccc;
            padding: 5px 10px;
            border-radius: 5px;
        }

        .pagination button:hover {
            background-color: #ddd;
        }

        /* 신고 목록 스타일 */
        .report-section {
            width: 100%;
            margin-top: 40px;
        }
        .list{
        	margin-right: 10%;
        }
    </style>
</head>
<body>
    <!-- Top 메뉴 포함 -->
    <jsp:include page="/WEB-INF/views/inc/admin_top.jsp"></jsp:include>

    <!-- 본문 내용 -->
    <h1>리뷰 관리</h1>

    <div class="container">
        <!-- 리뷰 목록 -->
        <div class="section list">
            <h2>리뷰 목록</h2>
            <table class="table">
                <thead>
                    <tr>
                        <th>리뷰 제목</th>
                        <th>별점</th>
                        <th>리뷰 날짜</th>
                        <th>관리</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>리뷰 제목~~~~</td>
                        <td class="stars">★★★★★</td>
                        <td>2024-12-24</td>
                        <td class="actions">
                            <button>답변 수정</button>
                        </td>
                    </tr>
                    <!-- 반복 -->
                </tbody>
            </table>
            <div class="pagination">
                <button>&lt;</button>
                <span>1</span>
                <span>2</span>
                <span>3</span>
                <span>4</span>
                <span>5</span>
                <button>&gt;</button>
            </div>
        </div>

        <!-- 신규 리뷰 -->
        <div class="section">
            <h2>신규 리뷰</h2>
            <table class="table">
                <thead>
                    <tr>
                        <th>리뷰 제목</th>
                        <th>별점</th>
                        <th>리뷰 날짜</th>
                        <th>관리</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>리뷰 제목이 굉장히 .</td>
                        <td class="stars">★★★★☆</td>
                        <td>2024-12-24</td>
                        <td class="actions">
                            <button onclick="location.href='ReviewAnswer'">답변 하기</button>
                        </td>
                    </tr>
                    <!-- 반복 -->
                </tbody>
            </table>
            <div class="pagination">
                <button>&lt;</button>
                <span>1</span>
                <span>2</span>
                <span>3</span>
                <button>&gt;</button>
            </div>
        </div>
    </div>

    <!-- 신고 목록 -->
    <div class="container report-section">
        <div class="section">
            <h2>신고 목록</h2>
            <table class="table">
                <thead>
                    <tr>
                        <th>리뷰 제목</th>
                        <th>신고 사유</th>
                        <th>리뷰 날짜</th>
                        <th>관리</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>리뷰 제목</td>
                        <td>부적절한 내용</td>
                        <td>2024-12-24</td>
                        <td class="actions">
                            <button>삭제하기</button>
                        </td>
                    </tr>
                    <!-- 반복 -->
                </tbody>
            </table>
            <div class="pagination">
                <button>&lt;</button>
                <span>1</span>
                <span>2</span>
                <span>3</span>
                <button>&gt;</button>
            </div>
        </div>
    </div>
</body>
</html>
